# resume-rolepack-mcp

The **capability layer** of [resume-rolepack](../README.md).

This server deliberately contains no candidate facts and no resume knowledge.
It only exposes the three scripts in `scripts/` as MCP tools, so an agent can call
them without guessing CLI syntax. The knowledge stays in the repo's markdown.

> Do not build MCP without the kernel first. Tools without the fact-source
> contract governing them will just be called at random.

## Install

```bash
cd mcp-server
npm install
npm run build
```

## Tools

| Tool | Wraps | Purpose |
|---|---|---|
| `extract_resume_text` | `scripts/extract_docx.py` | Read a protected original into text, bullets preserved |
| `normalize_docx_numbering` | `scripts/normalize-numbering.py` | Force numbering.xml into the §9 shape |
| `qa_resume_docx` | `scripts/qa-resume.ps1` | Geometry + ATS checks, renders a temp PDF, reports paging |

Typical order: generate DOCX → `normalize_docx_numbering` → `qa_resume_docx`.

## Configure

Claude Desktop (`claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "resume-rolepack": {
      "command": "node",
      "args": ["<repo>/mcp-server/dist/index.js"]
    }
  }
}
```

Cursor / Windsurf use the same shape under their own MCP settings.

## Environment variables

All optional — the defaults work for a standard checkout.

| Variable | Default | Use when |
|---|---|---|
| `RESUME_ROLEPACK_TOOLS_DIR` | `<repo>/scripts` | Server installed outside the repo |
| `RESUME_ROLEPACK_PYTHON` | `python` | System python is not on PATH |
| `RESUME_ROLEPACK_PWSH` | `pwsh`, falls back to `powershell` | Pin a specific PowerShell |

## External dependencies

The wrapped scripts need these on the machine:

- **Python 3** — for `extract_docx.py` and `normalize-numbering.py` (standard library only, no pip install)
- **Node 18+** and `docx` — only for *generating* a resume (the generator script, not these tools)
- **PowerShell** and **LibreOffice** — for `qa-resume.ps1` (renders a temp PDF to check paging)

> `normalize-numbering.py` was ported from `.mjs` because an installed skill has no
> `node_modules`, and ESM bare imports resolve from the script's own directory upward —
> so the JS version could not run once the skill lived outside a checkout with deps vendored.

If LibreOffice is unavailable, `qa_resume_docx` will fail on the render step.
Everything else still runs, but a document that was not rendered cannot be
described as visually verified.
