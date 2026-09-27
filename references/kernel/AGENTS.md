# Kernel — 简历任务执行内核

> 本文件是**框架的产品内核**：给 Agent 执行简历任务时读的。
> 由 `SKILL.md` 在路由之后按需加载，**不要整体常驻上下文**。
> 如果你是要**开发本仓库本身**（改内核、加方向包），本文件不适用——那是仓库 `README.md` 的范围。

## Two Roots: 知识根 vs 工作区根 【先读这一节】

装成 Skill 之后，知识本体和候选人资料**不再在同一个目录**。本文件所有路径都按下面的约定写：

| 名称 | 含义 | 内容 |
|---|---|---|
| **知识根** `SKILL_DIR` | 本 skill 的安装目录 | `SKILL.md`、`references/`、`scripts/`、`profile.example.md` |
| **工作区根** `WORKSPACE` | 用户当前工作目录（cwd） | `profile.md`、`简历原件/`、`经历库/`、`生成简历/` |

**路径书写约定（全仓库统一）**

- 写成 `references/…`、`scripts/…` → 一律相对**知识根**。
- 写成 `profile.md`、`简历原件/`、`经历库/`、`生成简历/` → 一律相对**工作区根**。

两种用法都要能跑：

- **用法 A（模板仓库）**：用户 clone 到自己的目录，两个根**是同一个目录**，约定依旧自洽。
- **用法 B（安装为 skill）**：知识在 skills 目录、工作区在别处，按上表分别解析。

`profile.md` **永远从工作区根读**。知识根下的 `profile.example.md` 只是模板，不是档案。

## Project Scope

- Candidate facts and outputs live in the **workspace root** (`WORKSPACE`): `profile.md`, `简历原件/`, `经历库/`, `生成简历/`. There is no fixed folder name for the workspace — it is wherever the user is working.
- Read workspace files plus this skill's knowledge files (`references/`, `scripts/`) only.
- Before reading a parent directory, sibling folder, or any external project source, explain why it is needed and obtain explicit user confirmation.
- Installed tool and skill runtime files are not project sources and are exempt from the project-source restriction above.

## Operating Contract

- This project has four separate delivery modes: job picking, resume strategy, DOCX generation, and DOCX QA. Project initialization is a separate setup action, not a delivery mode, and is triggered only when the current action needs persistent project settings. It runs from `references/kernel/init-instruction.md`: ask the minimum necessary questions, read employers / titles / dates out of the protected originals rather than asking the user to list them, then write `<WORKSPACE>/profile.md`. Route the request before reading source files or taking action.
- Two or more job descriptions, or one job description with evaluation intent such as 评估/比较/挑选/适不适合/概率/深挖/哪个岗位, enters job-picking mode.
- An explicit 改简历/重写/定制/生成 request for one specific position enters resume mode. A recommendation to use a resume version does not by itself authorize file generation.
- Questions limited to rendering, page count, fonts, layout, or DOCX defects enter DOCX QA mode.
- Job-picking mode must not create, modify, rename, or re-layout any resume file.
- Resume mode must present the content strategy and wait for explicit approval before creating a DOCX, unless the user has already approved both file creation and the specific strategy in the current request.
- DOCX generation is allowed only after the required format checks and visual QA plan are known. A document that was not rendered and inspected may not be described as visually verified or fully compliant.
- **Fact-source closure.** The only authoritative candidate-fact sources are the four protected original resumes and the experience library `经历库/` (routed through `经历索引.md`). Nothing else may be cited for any statement about the candidate — not files under `生成简历/`, not earlier job analyses, tables, probabilities or Before/After suggestions, not conversation summaries, and not role-guideline sample lists. A new factual source may enter the current task only when the user explicitly names and confirms it.
- **Employer attribution** follows the same rule: a company may be described as the candidate's employer only if it is named as an employer in those sources. Target employers, postings being evaluated, and company names appearing in `生成简历/` filenames are never the candidate's experience, in any mode.
- **`生成简历/` is off-limits during job picking (including deep dive), resume strategy, rewriting, generation, and QA.** Do not read, open, or cite any pre-existing file in that directory; listing it to determine the next version number is allowed. `其他经历.md` has been retired: do not read or cite it, and treat any reference to it as a reference to `经历库/`.
- Read source files on demand by mode. Do not automatically read every project file at the start of every conversation.
- Do not read parent directories, sibling folders, or external project sources to solve an environment problem without the user's explicit confirmation. This does not prohibit read-only public web research requested for employer or role research.
- Conversation summaries, job-picking tables, probability estimates, recommended resume versions, and Before/After suggestions are planning outputs only. They are never candidate facts and must not replace source-file reading.
- When a conversation switches from job picking to resume strategy or generation, start a fresh resume-source pass from the protected original resume(s) and `经历库/`, even if the same position was just analyzed in the same conversation.
- A resume rewrite must not proceed from a job-analysis summary alone. If the source pass was not completed, stop and report the missing source pass instead of drafting a resume.

## Protected Originals

- The protected original resumes are listed in `profile.md` → `protected_originals`. **The kernel never hardcodes filenames.** Do not modify, rewrite, rename, move, overwrite, or delete any file listed there.
- **Profile gate (mandatory).** At the start of any task that touches candidate facts, read `<WORKSPACE>/profile.md` first. If it is missing, or a required field is empty, stop and tell the user to run setup (`cp <SKILL_DIR>/profile.example.md <WORKSPACE>/profile.md`). Do not guess, do not fall back to example values, and do not infer employers from output filenames, JDs, or target companies.
- **Employer whitelist is the single source of truth for employment.** A company may be written as the candidate's employer only if it appears in `profile.md` → `employer_whitelist`. Target employers, postings under evaluation, and company names appearing in `生成简历/` filenames are never the candidate's experience, in any mode.
- Use `经历库/` as the supplementary career-material source. It is the split, current version of the retired `其他经历.md`.
- `经历库/经历索引.md` is the routing table for the library (experience | tags | strongest evidence | file). Enter the library through it, then read the experience files the task actually needs. There is **no cap on the number of files read** — read as many as the target job genuinely requires; some roles need the whole library.
- `经历库/` was split from `其他经历.md` and is therefore **not a superset of the four protected originals**. The two sources are complementary: evidence that exists only in an original resume (for example certain competitor counts, dashboard volumes, and supplier/event counts) must still be sourced from that original.
- **Internship retention is a strategy decision, not an absolute keep-everything rule.** In the strategy, mark every internship 保留 (kept — detailed with two or more bullets, or brief with one condensed bullet; both must carry at least one traceable responsibility/result) or 删除 (removed entirely; the default is keep). Use these Chinese tier names in all user-facing output. Shell entries containing only company + title + dates with zero bullets are forbidden — a kept internship always carries evidence. Removing an internship requires all three conditions: (1) no direct link to the JD and no transferable bridge stronger than the evidence it would displace; (2) not the sole evidence of any capability claimed elsewhere; (3) the strategy names the specific entry that receives the freed space. Guards: the most recent internship may never be removed; at most one internship may be removed per resume unless the user sets an explicit page target; at least two internships must remain. Internship timelines do not need to be continuous — a gap created by a removal is not a defect and requires no risk note. Every removal must be declared in the strategy and approved at the gate before generation; an undeclared removal is a release-gate failure.

## Output Separation

- Store every newly generated or tailored resume in `生成简历/`.
- Never create a generated resume in the workspace root or overwrite an original resume.
- Name new files as `简历_<公司名>_<岗位名>_v<版本号>.docx`; increment the version instead of overwriting an earlier output.
- New final DOCX files should be placed in `生成简历/`. Existing historical files in that directory are not automatically moved or deleted.
- QA renders, temporary scripts, intermediate DOCX/PDF files, and validation reports should be created in a per-run system temporary directory and deleted after the run by default.
- Keep QA artifacts under `生成简历/.qa/` only when the user explicitly asks to retain them or when a debugging run explicitly enables artifact retention. A retained QA directory must never be treated as source material.
- Do not create a nested `生成简历/生成简历/` directory.

## File Creation Policy

- Do not create, modify, move, or delete local files unless the user explicitly asks for that action or has approved the specific file change.
- When a task would benefit from a new file, first explain what file is needed, why it is needed, where it would be created, and what it would contain. Wait for the user's decision before creating it.
- Prefer reading existing files and using in-memory or non-project temporary operations for inspection and verification.
- Do not create helper scripts or duplicate outputs merely to explore an option.

## Source and Environment Boundaries

- Do not treat generated DOCX/PDF files, rendered PNGs, old scripts, or QA reports as evidence of candidate facts.
- If a generation or validation tool depends on an unavailable runtime or package, report the blocker and inspect the available environment before attempting an alternative. Do not silently switch output paths or invent a dependency.
- The preferred DOCX path is Node.js `docx` for generation and LibreOffice `soffice` for rendering. The exact installed package/runtime must be checked before generation.
- A successful script exit is not proof of format compliance; the resulting DOCX must be read back and checked against `docx_format_spec.md`.

## Environment Notes

Verified on the author's machine. **Concrete paths below are intentionally generic — they will differ on yours.** Resolve them at runtime (`where node` / `where python` on Windows, `which` elsewhere) rather than copying values out of this file. Only re-probe when a command below actually fails.

- **Runtime paths**: prefer managed runtimes over system ones. Locate them per machine; do not hardcode absolute paths into any committed file.
- **DOCX generation**: the `docx` package may live outside the project's own `node_modules` (e.g. in a shared managed workspace). A `.mjs` generator (ESM) **must be copied into the directory that contains it and run from there** — `NODE_PATH` has no effect on ESM bare imports, so running it from elsewhere fails with `ERR_MODULE_NOT_FOUND`. **Prefer stdlib-only tooling** (see `scripts/normalize-numbering.py`) to sidestep this failure mode entirely.
- **npm**: the default registry may be unreachable depending on network. If install stalls, retry against a reachable mirror registry.
- **LibreOffice**: `soffice` may not be on PATH. Locate the executable once per machine, then invoke it as `Start-Process -FilePath ... -ArgumentList "--headless --nologo --convert-to pdf --outdir <dir> <file>" -Wait -WindowStyle Hidden`. `--convert-to png` yields a full-page bitmap suitable for visual QA.
- **PowerShell execution policy is Restricted**: `scripts/qa-resume.ps1` cannot be invoked directly. Use the fallback QA path instead — validate OOXML by reading `word/document.xml` with Python, then render PDF/PNG with `soffice` and inspect visually.
- **Reading rendered output**: the Read tool cannot open PDF/PNG files with Chinese filenames. After rendering, `Copy-Item -LiteralPath` to an ASCII name such as `preview.pdf` / `preview.png` before reading.
- **Diagnostic output**: do not rely on console stdout for Chinese text (encoding is mangled). Have scripts write results to a file, then read that file.

## Job Picking Workflow

- Route a message to job picking when it contains two or more job descriptions, or one job description with an evaluation intent such as 评估/比较/挑选/适不适合/概率/深挖/哪个岗位. Use the Skill's job-picking reference as the workflow specification. Read `job-pick-instruction.md` after routing only for this project's candidate preferences, red lines, resume-version context, and compatible output preferences; it must not replace the Skill's mode router, initialization rules, search-tool discovery rules, source-ledger requirements, or refusal behavior. Default to the Skill's quick-assessment mode for one JD and comparison mode for multiple JDs; use deep dive only when the user asks for it.
- A job description with no explicit resume action verb is a job evaluation request, not a resume rewrite request.
- In job-picking mode, do not create, modify, or re-layout any resume file. Outputs such as "推荐简历版本" and Before/After wording suggestions are chat recommendations only.
- The resume rewrite workflow has a single entry point: an explicit 改简历/重写/定制/生成 request targeting one specific position. If a message mixes multiple JDs with a rewrite request, finish job picking first, then ask which single position and version to proceed with before entering the resume workflow.
- Candidate facts for job picking come only from `经历库/` and the four protected original resumes (read-only).
- Job-picking outputs describe the JD, fit, risks, and suggested direction only. They are not an extracted resume database and must not be reused as the factual input for a later rewrite.
- Job-picking results stay in chat by default; create report files only if the user explicitly asks, following the File Creation Policy.

## Resume Workflow

- On entry to the resume workflow, run the mandatory multi-round employer and role research defined in `RESUME_OPTIMIZATION_INSTRUCTIONS.md`. Candidate-source reading may run **in parallel** with research and reference loading, but all three must finish before any strategy output. Issue independent search queries in parallel batches; reuse research already completed in the same session for the same company and posting instead of re-searching. Research output is working context for this run only: do not write it to any project file, and never let it enter the source ledger or be treated as a candidate fact.
- After research, load the role-writing reference for the target role type through `references/packs/索引.md`, and follow its tiering: load the execution layer for the matched role family whenever one exists; load the evidence layer on demand for evidence selection and overclaim checks. If the index is missing or the role family has no entry, state that explicitly and fall back to the general workflow in `RESUME_OPTIMIZATION_INSTRUCTIONS.md`; do not invent a reference.
- Use the most relevant source files for the target job; do not read every project file by default. Within `经历库/`, however, there is no fixed read cap: route through `经历索引.md` and read as many experience files as the target job requires.
- On entry from job-picking mode, re-read the selected protected original resume and the relevant files of `经历库/` (routed through `经历库/经历索引.md`); do not rely on the preceding analysis message, chat summary, or recommended-version table.
- **Mode-switch guard (job picking → resume).** When a 改简历/重写/定制/生成 request arrives after any job-picking output (quick assessment, comparison, or deep dive), the preceding analysis is planning output only and may not be reused as the resume strategy. Explicitly discard the deep-dive's 6.9 修改方案, probability estimates, recommended versions, and Before/After suggestions, then re-run `RESUME_OPTIMIZATION_INSTRUCTIONS.md` Step 0–5 from a freshly rebuilt source ledger whose claims trace only to the protected originals and `经历库/`. Treat "改 X 份简历" / "帮我改出来" / "改一份出来" as file-generation intent **only — never as approval of the specific content strategy**. No generator may be written and no DOCX created until the Step 5 strategy has been presented and explicitly approved. A dual-target request (e.g. two volunteer preferences served by one resume) is itself a new synthesis problem the deep dive never solved and must be decomposed fresh in Step 3–5, never by merging two separate 6.9s. Step 5 approval only unlocks the build; the run must still complete Step 6 (execution under the fact-completeness and consistency-with-approved-list gates), Step 7 (pre-generation self-check), and Step 8 (Word generation + DOCX structure validation + per-page render QA). Treating "重新生成 / regenerate" as a casual one-step redo that skips Step 6–8 is a release-gate failure.
- Before drafting, build a source ledger covering education, every internship, relevant projects, skills, and quantitative results. Each factual claim in the draft must be traceable to that ledger.
- If `RESUME_OPTIMIZATION_INSTRUCTIONS.md` is present in the workspace root, read and apply it only after routing into resume strategy, resume rewriting, or DOCX generation. Otherwise use the kernel copy at `references/kernel/RESUME_OPTIMIZATION_INSTRUCTIONS.md`. Do not let it preempt job picking, role-guideline research, format inspection, Skill-guide requests, or one-off DOCX QA. Its content is project-specific detail and must not replace the Skill's mode router, initialization rules, search-tool discovery rules, or source-ledger gates.
- Before any resume edit, re-layout, rewrite, or DOCX generation, resolve the active format contract in this order: a format explicitly specified by the user for this deliverable; an approved `.givemejob/formats/` contract and machine-readable profile; the workspace-root `docx_format_spec.md`; then the Skill's built-in format at `references/kernel/docx_format_spec.md`. Do not rely on memory, a prior generated resume, an older script, or a previous conversation.
- Before authoring, extract the applicable constants from the active format contract into the working plan: page size, margins, font family, font sizes, spacing, color rules, heading borders, date and education Tab Stops, native bullet requirements, ATS restrictions, and the required output/QA locations. For this project's current root format, these include A4 page size, `9638` DXA date Tab Stop, and `3600 / 9638` DXA education Tab Stops.
- Use a format-aware generator whose API is verified for the installed library version. After generation, read the resulting DOCX back with OOXML inspection; use `python-docx` only when that package is actually available. A script that merely runs successfully is not evidence of format compliance.
- Treat the following as a release gate: a generated resume may not be delivered until every applicable item in `docx_format_spec.md` has been checked, including page geometry, margins, fonts, sizes, colors, paragraph spacing, heading borders, Tab Stops, bullet definitions, absence of tables/text boxes for resume content, every internship matching its approved keep/remove decision (no undeclared removal, no shell entries), versioned filename, and output separation.
- Perform the required DOCX render-to-PNG workflow and inspect every rendered page at 100% zoom for clipping, overlap, broken glyphs, incorrect wrapping, date alignment, excessive whitespace, unexpected page breaks, and split sections. On this machine `scripts/qa-resume.ps1` cannot run (see Environment Notes); use the documented fallback QA path. If the renderer is unavailable, explicitly report the environment blocker and do not describe the document as visually verified or fully compliant.
- If any format check or visual inspection fails, keep the output in the per-run temporary QA directory while diagnosing it, fix the generator or document, regenerate with the next version number, and repeat the checks. Retain it under `生成简历/.qa/` only when debugging retention is explicitly requested. Never patch only the final DOCX by hand without updating the generation path when the defect is systematic.
- Before delivery, record the actual output path, version, rendered page count, and any unverified checks. If a required check remains unverified, stop at the blocker instead of presenting the file as finished.
- If the workspace-root `docx_format_spec.md` is absent and no approved project format exists, use the Skill's built-in format at `references/kernel/docx_format_spec.md`. Ask the user for a project-specific format only when the task requires a custom format; do not require a workspace file merely to use the Skill.
- Preserve factual accuracy: do not invent employers, titles, dates, tools, responsibilities, or quantitative results.
- Minimum content gate: every kept internship carries company, title, dates and at least one source-backed responsibility or result (shell entries with zero bullets are forbidden); removed internships appear nowhere and match the approved list. Include the relevant projects, skills, and quantitative evidence from the source ledger. If the proposed rewrite is materially shorter because the source ledger was not reconstructed, do not generate it.
- Report the rendered page count as-is. Do not pre-emptively cut content to reach one page; only adjust length when the user asks or when the second page is nearly empty (see `docx_format_spec.md` section 16).
- When a draft blends more than one protected original resume, record the source file for every factual claim in the source ledger; a claim with no traceable source file is not usable.
- When adjusting length or layout, size the edit to the actual gap and make it in one pass. Do not iterate one bullet at a time across repeated generations.
- If the target posting is submit-once (no edits after submission), state this explicitly at delivery and flag that the delivered file must be final.
- Before generating a resume or cover letter, present the proposed content strategy and obtain the user's explicit approval when the user has not already approved file creation and the specific approach.

## Length Policy

- Page count is the user's decision, never a default. Do not treat one page as the target: the reference originals happen to be one page, which reflects their content density, not a constraint.
- Two pages is an acceptable, normal outcome. Wording quality and factual completeness outrank page count.
- Never delete source-backed content — an internship bullet, a project that is the sole evidence of a capability, or proof of a hard JD requirement — solely to fit a page count.
- When cuts are unavoidable, follow the compression order in `RESUME_OPTIMIZATION_INSTRUCTIONS.md` and list every cut in the delivery summary.
- Internship retention follows the keep/remove policy under Protected Originals, not a keep-everything rule. Length pressure alone is never a valid reason to remove an internship.

## External Services

- Do not modify external services, including Feishu/Lark documents, unless the required connector is available and the user has clearly authorized the specific action. Read-only public web search or URL fetching for employer research and role-guideline research is allowed when that research is part of the user's request.
- For read-only public research, first inspect the search, browser, URL-fetch, or public-research tools already available. If none is preloaded, use the host's tool-discovery mechanism when available, such as `tool_search`, and actually call the discovered tool. Do not report search as unavailable until both direct tools and the discovery path have been attempted.
- Before making changes to an external document, state what will be changed and where, then request confirmation when the action is consequential or irreversible.
