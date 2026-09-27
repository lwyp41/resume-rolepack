[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$InputDocx,

    [switch]$KeepQa
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$inputPath = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $InputDocx))

if (-not (Test-Path -LiteralPath $inputPath -PathType Leaf)) {
    throw "DOCX not found: $inputPath"
}
if ([System.IO.Path]::GetExtension($inputPath).ToLowerInvariant() -ne '.docx') {
    throw "Input must be a .docx file: $inputPath"
}

$soffice = Get-Command soffice -ErrorAction SilentlyContinue
if (-not $soffice) {
    # Author-machine paths are intentionally not hardcoded here; probe common install locations instead.
    $fallback = @(
        (Join-Path $env:ProgramFiles 'LibreOffice\program\soffice.com'),
        (Join-Path ${env:ProgramFiles(x86)} 'LibreOffice\program\soffice.com'),
        'C:\Program Files\LibreOffice\program\soffice.com'
    ) | Where-Object { $_ -and (Test-Path -LiteralPath $_) } | Select-Object -First 1
    if ($fallback) {
        $sofficePath = $fallback
    } else {
        throw 'LibreOffice soffice was not found; DOCX render QA cannot run.'
    }
} else {
    $sofficePath = $soffice.Source
}

$qaRoot = Join-Path ([System.IO.Path]::GetTempPath()) ('resume-qa-' + [guid]::NewGuid().ToString('N'))
$renderRoot = Join-Path $qaRoot 'render'
$profileRoot = Join-Path $qaRoot 'profile'
$reportPath = Join-Path $qaRoot 'validation.json'
$passed = $false

function Get-ZipXml {
    param(
        [System.IO.Compression.ZipArchive]$Archive,
        [string]$EntryName
    )
    $entry = $Archive.GetEntry($EntryName)
    if ($null -eq $entry) { throw "DOCX entry missing: $EntryName" }
    $reader = [System.IO.StreamReader]::new($entry.Open())
    try { return [xml]$reader.ReadToEnd() } finally { $reader.Dispose() }
}

function Get-AttributeValue {
    param([System.Xml.XmlElement]$Node, [string]$LocalName)
    $attribute = $Node.Attributes | Where-Object { $_.LocalName -eq $LocalName } | Select-Object -First 1
    if ($attribute) { return $attribute.Value }
    return $null
}

New-Item -ItemType Directory -Path $renderRoot -Force | Out-Null

try {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($inputPath)
    try {
        $document = Get-ZipXml -Archive $archive -EntryName 'word/document.xml'
        $ns = [System.Xml.XmlNamespaceManager]::new($document.NameTable)
        $ns.AddNamespace('w', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')

        $section = $document.SelectSingleNode('//w:sectPr', $ns)
        if ($null -eq $section) { throw 'DOCX section properties are missing.' }
        $pageSize = $section.SelectSingleNode('./w:pgSz', $ns)
        $margins = $section.SelectSingleNode('./w:pgMar', $ns)
        if ($null -eq $pageSize -or $null -eq $margins) { throw 'DOCX page geometry is incomplete.' }

        $checks = [ordered]@{
            file = $inputPath
            pageSize = @{
                width = Get-AttributeValue $pageSize 'w'
                height = Get-AttributeValue $pageSize 'h'
                expected = '11906 x 16838'
            }
            margins = @{
                top = Get-AttributeValue $margins 'top'
                right = Get-AttributeValue $margins 'right'
                bottom = Get-AttributeValue $margins 'bottom'
                left = Get-AttributeValue $margins 'left'
                expected = '1080 / 1134 / 1080 / 1134'
            }
            tab9638 = @($document.SelectNodes('//w:tabs/w:tab', $ns) | Where-Object { (Get-AttributeValue $_ 'pos') -eq '9638' }).Count
            tab3600 = @($document.SelectNodes('//w:tabs/w:tab', $ns) | Where-Object { (Get-AttributeValue $_ 'pos') -eq '3600' }).Count
            tables = @($document.SelectNodes('//w:tbl', $ns)).Count
            textChars = (($document.SelectNodes('//w:t', $ns) | ForEach-Object { $_.'#text' }) -join '').Length
        }

        $checks.geometryPassed = (
            $checks.pageSize.width -eq '11906' -and
            $checks.pageSize.height -eq '16838' -and
            $checks.margins.top -eq '1080' -and
            $checks.margins.right -eq '1134' -and
            $checks.margins.bottom -eq '1080' -and
            $checks.margins.left -eq '1134'
        )
        $checks.atsWarnings = @()
        if ($checks.tables -gt 0) { $checks.atsWarnings += "Document contains $($checks.tables) table(s); resume content should use paragraphs and tab stops." }
        if ($checks.tab9638 -eq 0) { $checks.atsWarnings += 'No 9638 DXA right tab stop found.' }
        $checks.validationPassed = $checks.geometryPassed -and $checks.textChars -gt 0
        $checks | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $reportPath -Encoding UTF8
        if (-not $checks.validationPassed) {
            throw 'DOCX OOXML validation failed; see validation.json when QA artifacts are retained.'
        }
    } finally {
        $archive.Dispose()
    }

    $profileUri = ([System.Uri]$profileRoot).AbsoluteUri
    $arguments = "--headless --nologo --nodefault --nofirststartwizard `"-env:UserInstallation=$profileUri`" --convert-to pdf --outdir `"$renderRoot`" `"$inputPath`""
    $renderProcess = Start-Process -FilePath $sofficePath -ArgumentList $arguments -PassThru -WindowStyle Hidden
    if (-not $renderProcess.WaitForExit(60000)) {
        Stop-Process -Id $renderProcess.Id -Force -ErrorAction SilentlyContinue
        throw 'LibreOffice render timed out after 60 seconds.'
    }
    $pdfPath = Join-Path $renderRoot (([System.IO.Path]::GetFileNameWithoutExtension($inputPath)) + '.pdf')
    if (-not (Test-Path -LiteralPath $pdfPath)) { throw 'LibreOffice did not produce a PDF render.' }

    $passed = $true
    $result = [ordered]@{
        file = $inputPath
        validationReport = $reportPath
        renderedPdf = $pdfPath
        qaPassed = $true
        qaArtifacts = if ($KeepQa) { $qaRoot } else { 'cleaned after completion' }
    }
    $result | ConvertTo-Json -Depth 5
} catch {
    $result = [ordered]@{
        file = $inputPath
        qaPassed = $false
        error = $_.Exception.Message
        qaArtifacts = if ($KeepQa) { $qaRoot } else { 'cleaned after failure' }
    }
    $result | ConvertTo-Json -Depth 5
    exit 1
} finally {
    if (-not $KeepQa -and (Test-Path -LiteralPath $qaRoot)) {
        Remove-Item -LiteralPath $qaRoot -Recurse -Force
    }
}
