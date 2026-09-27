# Resume Tools

## DOCX QA

Run QA against a generated resume from the workspace root:

```powershell
pwsh -File <SKILL_DIR>\scripts\qa-resume.ps1 -InputDocx '.\生成简历\简历_公司_岗位_v1.docx'
```

The runner validates basic OOXML geometry and ATS-sensitive structure, renders a temporary PDF with LibreOffice, and deletes the per-run temporary directory in both success and failure cases.

Use `-KeepQa` only when debugging a failed run. Retained artifacts are written outside the project under the system temp directory and are not source material.
