#!/usr/bin/env node
/**
 * resume-rolepack MCP server
 *
 * Capability layer only. This server holds no candidate facts and no resume
 * knowledge — it just exposes the three scripts in `scripts/` as MCP tools so an
 * agent can call them without guessing CLI syntax.
 *
 * The knowledge lives in the repo's markdown (references/kernel/AGENTS.md,
 * references/packs/).
 * Keep this file thin on purpose.
 */

import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { CallToolRequestSchema, ListToolsRequestSchema } from "@modelcontextprotocol/sdk/types.js";
import { execFile } from "node:child_process";
import { promisify } from "node:util";
import { existsSync } from "node:fs";
import os from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";

const run = promisify(execFile);
const HERE = path.dirname(fileURLToPath(import.meta.url));

/** scripts/ location. Overridable so the server also works as a published package. */
function toolsDir(): string {
  return process.env.RESUME_ROLEPACK_TOOLS_DIR ?? path.join(path.resolve(HERE, "..", ".."), "scripts");
}

function script(name: string): string {
  const p = path.join(toolsDir(), name);
  if (!existsSync(p)) {
    throw new Error(`Script not found: ${p}. Set RESUME_ROLEPACK_TOOLS_DIR to the directory containing it.`);
  }
  return p;
}

/** Prefer pwsh, fall back to Windows PowerShell. */
async function powerShell(): Promise<string> {
  const configured = process.env.RESUME_ROLEPACK_PWSH;
  if (configured) return configured;
  try {
    await run("pwsh", ["-NoProfile", "-Command", "$PSVersionTable.PSVersion.Major"]);
    return "pwsh";
  } catch {
    return "powershell";
  }
}

function text(content: string) {
  return { content: [{ type: "text" as const, text: content }] };
}

const server = new Server(
  { name: "resume-rolepack", version: "0.1.0" },
  { capabilities: { tools: {} } }
);

server.setRequestHandler(ListToolsRequestSchema, async () => ({
  tools: [
    {
      name: "extract_resume_text",
      description:
        "Extract plain text from a .docx, preserving bullet markers. Use to read a protected original resume before building the fact ledger.",
      inputSchema: {
        type: "object",
        properties: {
          docxPath: { type: "string", description: "Absolute path to the .docx" },
          outputPath: {
            type: "string",
            description: "Optional. Write extracted text here instead of returning it inline.",
          },
        },
        required: ["docxPath"],
      },
    },
    {
      name: "normalize_docx_numbering",
      description:
        "Rewrite numbering.xml into the single-abstractNum / numId=1 shape required by docx_format_spec.md §9. Run after generating a DOCX, before QA.",
      inputSchema: {
        type: "object",
        properties: {
          inputPath: { type: "string", description: "Absolute path to the generated .docx" },
          outputPath: { type: "string", description: "Absolute path for the normalized .docx" },
        },
        required: ["inputPath", "outputPath"],
      },
    },
    {
      name: "qa_resume_docx",
      description:
        "Validate OOXML geometry and ATS-sensitive structure, render a temporary PDF, and report paging/overflow findings. A document that has not passed this must not be described as verified.",
      inputSchema: {
        type: "object",
        properties: {
          docxPath: { type: "string", description: "Absolute path to the .docx to check" },
          keepQa: {
            type: "boolean",
            description: "Retain QA artifacts for debugging. Default false (artifacts are always cleaned up).",
          },
        },
        required: ["docxPath"],
      },
    },
  ],
}));

server.setRequestHandler(CallToolRequestSchema, async (req) => {
  const args = (req.params.arguments ?? {}) as Record<string, unknown>;
  const name = req.params.name;

  try {
    if (name === "extract_resume_text") {
      const docxPath = String(args.docxPath);
      const outputPath = args.outputPath ? String(args.outputPath) : null;
      const target = outputPath ?? path.join(os.tmpdir(), `rp-extract-${Date.now()}.txt`);
      await run(process.env.RESUME_ROLEPACK_PYTHON ?? "python", [script("extract_docx.py"), docxPath, target]);
      const { readFile } = await import("node:fs/promises");
      const body = await readFile(target, "utf8");
      return text(outputPath ? `Extracted text written to ${target}` : body);
    }

    if (name === "normalize_docx_numbering") {
      const { stdout } = await run(process.env.RESUME_ROLEPACK_PYTHON ?? "python", [
        script("normalize-numbering.py"),
        String(args.inputPath),
        String(args.outputPath),
      ]);
      return text(stdout.trim() || "Numbering normalized.");
    }

    if (name === "qa_resume_docx") {
      const ps = await powerShell();
      const psArgs = [
        "-NoProfile",
        "-ExecutionPolicy",
        "Bypass",
        "-File",
        script("qa-resume.ps1"),
        "-InputDocx",
        String(args.docxPath),
      ];
      if (args.keepQa === true) psArgs.push("-KeepQa");
      const { stdout, stderr } = await run(ps, psArgs);
      return text([stdout, stderr].filter(Boolean).join("\n").trim() || "QA passed with no findings.");
    }

    throw new Error(`Unknown tool: ${name}`);
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    return { content: [{ type: "text", text: `Error: ${message}` }], isError: true };
  }
});

const transport = new StdioServerTransport();
await server.connect(transport);
