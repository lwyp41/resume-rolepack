---
name: resume-rolepack
description: 按岗位方向定制简历、且每一句话都能追到来源文件的 Agent 框架。触发场景：评估/比较/挑选多个 JD 或判断某个岗位适不适合（job picking）；为一个具体岗位改简历/重写/定制/生成简历（resume strategy）；生成 DOCX 简历文件；检查简历 DOCX 的排版、页数、字体、分页等缺陷（DOCX QA）；首次使用、工作区还没有 profile.md 时的初始化配置（initialization，逐条提问后生成它）。Use for job evaluation and comparison, resume tailoring for one specific position, DOCX resume generation, resume layout QA, and first-time initialization that builds profile.md from the protected originals. Hard rules: every claim written into a resume must trace to a source file, and a company may be called the candidate's employer only if it is in profile.md's employer whitelist.
---

# resume-rolepack

让 Agent 按岗位方向定制简历，同时保证**写进去的每句话都能指到来源文件**。

三条底线（详见 `references/kernel/AGENTS.md`）：
1. **事实源封闭** — 事实只能来自 `profile.md` 登记的受保护原件和 `经历库/`（经 `经历索引.md` 路由）。
2. **雇主白名单** — 只有 `profile.md` → `employer_whitelist` 里的公司能被写成「我的雇主」。投递目标、JD 里的公司、输出文件名里的公司名**永远不是**经历。
3. **未渲染不声称** — 没有逐页渲染检查过的 DOCX，不得说「已验证」「完全合规」。

---

## 两个根：知识根 vs 工作区根（最容易踩的坑）

装成 Skill 后，知识本体和用户资料**不在同一个目录**。所有内核文档按下面的约定写路径：

| 名称 | 含义 | 典型内容 |
|---|---|---|
| **知识根**（`SKILL_DIR`） | 本 skill 的安装目录 | 上面这些目录、`profile.example.md` |
| **工作区根**（`WORKSPACE`） | 用户当前工作目录（cwd） | `profile.md`、`经历库/`、`简历原件/`、`生成简历/` |

**书写约定（全仓库统一）**

- 以 `references/` 或 `scripts/` 开头的路径 → 一律相对**知识根**。
- 写成 `profile.md`、`经历库/`、`简历原件/`、`生成简历/` → 一律相对**工作区根**。

两种用法都成立：

- **用法 A（模板仓库）**：用户 clone 到自己的目录，知识根与工作区根**是同一个目录**，约定仍然自洽。
- **用法 B（安装为 skill）**：知识跟在 skills 目录、工作区在别处，按上表分别解析。

`profile.md` **永远从工作区根读**，知识根下的 `profile.example.md` 只是模板。

---

## Profile gate（强制，第一步）

任何触及候选人事实的任务，第一步读 `<WORKSPACE>/profile.md`。

- 读不到，或 `identity` / `employer_whitelist` / `protected_originals` 任一为空 →
  进入**初始化**（这是 setup action，不是四模式之一）：加载 `references/kernel/init-instruction.md`，
  从原件抽姓名与雇主清单，再问求职偏好（行业 / 薪资底线 / 不接受项 / 城市），生成 `profile.md`。
- **偏好缺失同等待遇**：`preferences` 段不存在，或 `salary.floor` 为空，且当前任务要做岗位评估 →
  进初始化补齐。岗位挑选的红线过滤依赖它，**不做降级评估**（不设底线就写「不限」）。
  只做简历改写、不涉及岗位评估时，偏好缺失不阻塞。
- 用户拒绝初始化时，退回手动方式并给出这一句：
  `cp <SKILL_DIR>/profile.example.md <WORKSPACE>/profile.md`
- **不得猜测、不得沿用示例值、不得从输出文件名 / JD / 目标公司反推雇主。**
- 初始化结束后重跑 gate；通过后回到本文件的正常四模式路由。

---

## 四模式路由（先路由，再读文件，再动手）

先过上面的 profile gate：**首次使用（还没有 `profile.md`）走初始化，不进这四模式。**
下表是四模式，初始化不在其中。

| 模式 | 触发信号 | 能否产出文件 | 路由后读什么 |
|---|---|---|---|
| **岗位挑选** | ≥2 个 JD；或 1 个 JD 带 评估/比较/挑选/适不适合/概率/深挖 意图 | **否** — 不得创建、修改、重排任何简历文件 | `references/kernel/job-pick-instruction.md` |
| **简历策略** | 明确 改简历/重写/定制/生成，且指向**一个**具体岗位 | 只出策略；**等用户显式批准**才可生成 | `references/kernel/RESUME_OPTIMIZATION_INSTRUCTIONS.md` + `references/packs/索引.md` |
| **DOCX 生成** | 策略已获批准 | 是 → 写入 `生成简历/` | `references/kernel/docx_format_spec.md` + `scripts/` |
| **DOCX QA** | 只问渲染 / 页数 / 字体 / 版式 / DOCX 缺陷 | 否 | `docx_format_spec.md` 第十四节 |

守门规则：

- 「帮我改出来」是**产出文件的意图**，**不是**对具体策略的批准。
- 从岗位挑选切到简历改写，**必须重跑一次事实源**，不得沿用上一阶段的分析结论、概率表、推荐版本、Before/After。
- 一次请求混入多个 JD + 改写，先做完岗位挑选，再问清「哪一个岗位、哪一版」。

---

## 分级加载（progressive disclosure）

常驻上下文**只有本文件**。其余按需加载，不要一次性读完 kernel 五份（约 87KB，会撑爆上下文）。

- **路由后**才读 `references/kernel/` 下对应的那一份。
- **初始化**路由自 profile gate，读完 `init-instruction.md` 执行即可，不要顺带读其他内核文件。
- **方向包**先读 `references/packs/索引.md` 查路由表，按命中行加载：执行层**必读**，依据层按需（索引列了强制加载门）。未进索引的文件不会被加载。
- **脚本**在 `scripts/`；可选由 `mcp-server/` 承担。
- **`经历库/` 不设读取上限**：按 `经历索引.md` 路由，需要几份就读几份。

---

## 产出纪律

- 新简历一律进 `生成简历/`，命名 `简历_<公司>_<岗位>_v<n>.docx`，**递增版本号，不覆盖**。
- 受保护原件**永不修改 / 覆盖 / 重命名 / 移动**。
- QA 渲染、临时脚本、中间产物放每轮临时目录，跑完删除；用户明确要求才保留到 `生成简历/.qa/`。
- 未经用户明确要求或批准，不新建 / 修改 / 删除任何本地文件。
