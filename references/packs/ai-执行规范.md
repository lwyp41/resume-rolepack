---
document_type: resume_editing_skill_reference
version: "1.0"
research_cutoff: "2026-09-22"
language: "zh-CN"
primary_use: "供下游简历修改/生成 Skill 进行目标岗位判断、证据选择、内容改写与真实性校验"
target_roles:
  - "A: AI Application / Agent PM"
  - "B: AI Solution / Implementation"
  - "C: AI Operations / Growth / Enablement"
  - "D: AI Strategy / Business"
evidence_scope: "中国头部互联网与科技公司近期 AI 相关岗位招聘研究"
---

# AI PM 简历修改 Skill 参考规范

> 本文件是 AI 类岗位的 **执行层**：判断岗位子族、选择证据、改写、真实性校验。
>
> **2026-09-23 拆分说明**：原文末的“研究事实存档”已移至依据层 `ai-证据依据.md` §8；两份海外样本文件合并删减后同在该依据层 §1–§7。
>
> 用法：先用本文件的结构化规则做判断，再按需查 `ai-证据依据.md`（证据强度、过度声称边界、措辞与动词、国内样本结论）。

---

## 0. 文档用途与使用边界

### 0.1 这份文档用于什么

本文件用于帮助简历修改/生成 Skill 完成以下任务：

1. 判断目标 JD 更接近 A/B/C/D 中哪一类 AI PM 相关岗位；
2. 判断该岗位最需要哪些 Hiring Signals；
3. 从候选人真实经历中寻找对应 Evidence；
4. 决定哪些项目和事实应优先展示、弱化或保留；
5. 在不虚构候选人经历的前提下，把事实改写成更符合目标岗位的简历表达；
6. 校验 AI/技术表述是否与候选人真实技术深度匹配。

### 0.2 这份文档不用于什么

本文件不是候选人的事实来源，不得用市场研究内容替代候选人真实经历。

不得因为市场上常见某项能力，就自动给候选人补写：
- Agent
- RAG
- MCP
- Eval
- Python
- SQL
- API
- 0→1
- Revenue / ROI
- 用户规模
- 上线结果
- Ownership

### 0.3 信息优先级

当信息冲突时，Skill 按以下优先级处理：

**P0 候选人明确提供的事实与原始简历**  
↓  
**P1 用户提供的目标 JD**  
↓  
**P2 本文档的岗位级规则与市场研究结论**  
↓  
**P3 通用简历写作常识**

说明：

- 候选人事实决定“能不能写”；
- 目标 JD 决定“优先写什么”；
- 本文档决定“哪些事实通常构成有效招聘信号”；
- 本文档不能授权 Skill 创造候选人没有提供的事实。

---

# 1. 核心执行原则

## HARD-001｜事实不可扩写成不存在的能力

候选人没有明确提供的事实，不得自动升级。

例如：

- “使用 ChatGPT 做分析” ≠ “具备 AI Product Ownership”
- “了解 RAG” ≠ “设计过 RAG 产品”
- “搭过 Agent Demo” ≠ “上线过 AI 产品”
- “做过测试” ≠ “建立过 Eval 体系”
- “参与项目” ≠ “主导项目”
- “提升效率” ≠ “有可验证 ROI”

如果某个高价值事实缺失，应优先追问，而不是补写。

---

## HARD-002｜技能声明不能当作项目证据

以下内容默认只属于 **Skill Claim**：

- 熟悉 Agent
- 熟悉 RAG
- 熟悉 Prompt Engineering
- 会使用 ChatGPT / Claude
- 熟悉大模型
- 熟悉 SQL / Python

只有当候选人提供了具体行为、项目、结果或验证方式后，才可升级为 **Proven Capability**。

---

## HARD-003｜技术名词必须服务于真实产品事实

技术名词只有在回答以下问题时才值得进入项目 bullet：

- 为什么采用这个机制？
- 它解决了哪个用户/业务问题？
- 候选人本人做了什么？
- 如何验证是否有效？
- 最终改变了什么结果？

若技术名词只是关键词堆砌，应降低权重。

---

## HARD-004｜不强迫所有 AI PM 展示 Coding

本研究不支持“AI PM 普遍必须会 Python / 工程开发”的规则。

Skill 应根据目标岗位判断：

- A/C/D：优先看 AI Product Fluency、Workflow、Prototype、Eval、数据与结果；
- B：在复杂企业 Solution 中可进一步强调 API、系统集成、架构理解；
- 技术平台/模型/Infra 类 JD：只有在 JD 明确要求时，才显著提高 Coding/工程权重。

---

## HARD-005｜项目价值由完整证据链决定，不由“AI 感”决定

优先寻找：

**真实问题 → Workflow/产品方案 → 候选人动作 → AI 机制 → 验证/Eval → 用户采用或业务结果**

而不是：

**大量 AI 名词 → 无用户 → 无验证 → 无结果**

---

# 2. 目标岗位分类器

下游 Skill 不应仅根据岗位标题分类，应优先判断：

**工作对象 + 核心交付物 + KPI**

| Role ID | 目标岗位 | 主要工作对象 | 主要交付物 | 常见结果对象 |
|---|---|---|---|---|
| A | AI Application / Agent PM | 用户任务、Agent、AI 功能、工作流 | AI 产品、Agent、Workflow、Prototype | 任务完成、体验、Adoption、留存、质量 |
| B | AI Solution / Implementation | 企业客户、业务流程、系统环境 | Solution、PoC/Pilot、集成、部署方案 | 上线、客户采用、交付效率、ROI、复制 |
| C | AI Operations / Growth / Enablement | AI 产品用户、内部员工、商家/客户 | 运营机制、Enablement、Workflow 模板、增长方案 | Activation、Adoption、Retention、渗透、人效 |
| D | AI Strategy / Business | 业务经营问题、策略、数据、决策流程 | 策略方案、AI-enabled decision、实验 | 转化、效率、Revenue/GMV、ROI、经营指标 |

### ROLE-CLASSIFY-01

若 JD 直接负责 Agent / AI 助手 / AI 功能体验，优先归 A。

### ROLE-CLASSIFY-02

若 JD 高频出现客户、行业、PoC、部署、交付、解决方案、系统集成，优先归 B。

### ROLE-CLASSIFY-03

若 JD 高频出现用户教育、Activation、Adoption、Retention、增长、渗透、运营策略，优先归 C。

### ROLE-CLASSIFY-04

若 JD 的最终 KPI 是搜索/推荐/广告、经营效率、转化、收入、ROI，而 AI 是实现手段，优先归 D。

### ROLE-CLASSIFY-05

“Agent”不是充分分类条件。  
同样是 Agent：
- Agent 产品 owner 可以属于 A；
- 客户侧 Agent 交付可以属于 B；
- 推动员工使用 Agent 可以属于 C；
- 用 Agent 改善经营指标可以属于 D。

---

# 3. 四类岗位的简历修改目标

## A｜AI Application / Agent PM

### 优先寻找的 Hiring Signals

1. 用户/任务问题识别
2. Workflow abstraction
3. Agent / AI 产品设计
4. AI Product Fluency
5. Prototype / 0→1
6. Eval / Bad Case
7. Product Sense
8. Ownership
9. Adoption / 使用结果
10. 数据驱动

### 优先展示的 Evidence

- 真实 AI 产品或 Agent 项目
- 有用户场景的 Workflow
- 可运行 Prototype / Demo
- Prompt / Context / Knowledge / Tool 的产品设计
- Eval、测试集、Bad Case 分析与迭代
- 从问题定义到 Pilot/上线的完整闭环
- 真实用户使用、Adoption 或任务结果

### 不应强行补的内容

- Python
- 模型训练
- Vector DB
- MCP
- Multi-Agent
- RAG

除非候选人真实使用过，且与项目结果相关。

---

## B｜AI Solution / Implementation

### 优先寻找的 Hiring Signals

1. 行业/客户理解
2. 业务流程诊断
3. Requirement → Solution 转换
4. AI/技术方案理解
5. PoC / Pilot
6. 系统集成 / Deployment
7. 项目推进
8. 客户沟通
9. Adoption
10. ROI / 可复制性

### 优先展示的 Evidence

- 模糊客户问题被拆成可执行方案
- 真实业务流程改造
- PoC/Pilot
- 与研发/架构/客户 IT 协同
- 系统接入或上线
- 客户采用
- 交付周期改善
- Cost Saving / ROI
- 方案标准化和多客户复制

### 传统咨询经历的处理

仅有行业研究/PPT：弱证据。  
若包含以下事实，应提高权重：

**流程诊断 → 方案设计 → Pilot → 技术协同 → 客户采用/ROI**

---

## C｜AI Operations / Growth / Enablement

### 优先寻找的 Hiring Signals

1. 用户洞察
2. AI 产品深度使用
3. Workflow automation
4. Activation
5. Adoption
6. Retention / 使用深度
7. Funnel / 数据分析
8. 用户教育 / Change Management
9. 人效 / 时间节省
10. 跨团队迭代

### 优先展示的 Evidence

- 将 AI 工具嵌入真实工作流
- 用户教育和首次成功机制
- Prompt/模板/Workflow 标准化
- Adoption/Retention 漏斗
- 自动化率
- 人效、时间节省
- 用户反馈推动产品迭代

### 应弱化

- 纯活动场次
- 纯内容发布量
- 无法连接到 AI 产品使用或业务结果的过程指标

---

## D｜AI Strategy / Business

### 优先寻找的 Hiring Signals

1. 业务理解
2. 场景判断
3. 数据分析
4. 策略设计
5. AI-enabled decision
6. 实验
7. ROI
8. Revenue / GMV / Conversion
9. 项目推进
10. Structured Thinking

### 优先展示的 Evidence

- 业务问题定义
- 数据诊断
- 决策/策略设计
- AI 或模型能力如何改变流程/决策
- 实验与验证
- 收入、转化、成本、效率或 ROI

### 传统战略/商业分析经历的处理

若只有行业研究：AI PM 信号较弱。  
若包含：

**业务流程拆解 → 量化决策 → AI/自动化机会 → Pilot/实验 → 经营结果**

则显著提高权重。

---

# 4. AI 技术深度校准

> 本模型用于简历内容校准，不是公司官方职级。

| Level | 定义 | 可观察证据 | Skill 处理方式 |
|---|---|---|---|
| T0 AI User | 熟练使用主流 AI 工具 | 用 AI 完成写作、研究、分析 | 只能证明 AI fluency，不能写成 AI PM 能力 |
| T1 AI Product Fluent | 理解 LLM、Prompt、Context、Agent、RAG/Tool 基础与限制 | 能解释产品方案为什么这样设计 | 可作为多数应用型 AI 岗的基础技术信号 |
| T2 AI Builder | 能独立搭 Agent/Workflow/Prototype，并进行基础验证 | 可运行 Demo + Workflow + case/Eval | 对 A、C Enablement、部分 B 是强差异化证据 |
| T3 Technical Product | 理解 API、RAG/KB、Tool/MCP、数据流、Eval/Guardrail，可处理一定集成/脚本 | 系统方案、集成、质量/成本/延迟权衡 | 对复杂 B、技术型 A 提高权重 |
| T4 Engineering-adjacent | 能实际编码、架构、部署或理解模型/平台工程 | 代码、架构、部署、工程指标 | 仅在技术型 JD 明确需要时重点突出 |

### TECH-01

不要因为候选人不会 Python 而自动降低 A/C/D 的整体匹配判断。

### TECH-02

不要因为候选人会 Python 而自动判断其具备 AI Product 能力。

### TECH-03

对非技术候选人，优先寻找：

**真实 AI Workflow → 可运行 Prototype → Eval → 实际用户 → Adoption / ROI**

而不是通过堆砌技术名词制造技术感。

---

# 5. Hiring Signal → Evidence 解释规则

| Signal | 弱证据 | 中等证据 | 强证据 |
|---|---|---|---|
| AI Hands-on | “熟悉 ChatGPT/Claude” | 搭过 Prompt/Agent Demo | 独立构建真实 Workflow/Agent，接 Tool/Knowledge/API，有真实 case 和用户 |
| 0→1 | “参与 AI 项目” | 负责某模块 MVP | 从问题定义、方案、构建/Pilot 到上线及结果全链路 owner |
| Ownership | “协助”“参与” | 独立负责功能 | 主动识别问题、做关键取舍、协调多团队并承担结果 |
| Product Sense | “产品感觉好” | 做需求分析/竞品 | 从用户行为发现高价值问题，改变方案优先级并产生用户结果 |
| Eval | “了解大模型评测” | 做人工测试/Bad Case | 定义成功标准、评测集、失败 taxonomy、基线和迭代闭环 |
| Data Driven | “熟悉数据分析” | 做 Dashboard/SQL | 数据发现问题 → 假设 → 实验 → 决策 → 结果 |
| Business Impact | “提升效率” | 有明确业务指标 | Revenue/ROI/Cost Saving/Conversion 等有基线、结果和业务范围 |
| User Insight | “做过访谈” | 访谈后形成需求 | 多源用户证据改变产品判断，并由行为/指标验证 |
| Technical Fluency | 罗列 LLM/RAG/Agent | 能解释组件 | 能解释选型、失败模式及质量/延迟/成本/安全权衡 |
| Adoption / Growth | “负责运营推广” | 活动带来试用 | 激活→首次成功→重复使用→留存完整漏斗改善 |
| Workflow Abstraction | “了解业务流程” | 画流程图 | 把复杂流程拆成 AI/Rule/Human/Tool 节点并实际运行 |
| Scale | 一次性 Demo | 小组试点 | 从 Pilot 复制到多部门/多客户/大量用户并形成标准化机制 |

### EVIDENCE-01

Skill 改写时应优先提高 **强证据** 的信息密度，而不是通过形容词强化弱证据。

### EVIDENCE-02

如果只有弱证据，应保守表达；不要把语气升级成“主导”“构建体系”“显著提升”。

---

# 6. 候选人事实提取 Schema

Skill 在改写任何项目之前，优先从原始材料中提取以下字段。

```yaml
project:
  context: ""
  target_user_or_customer: ""
  problem: ""
  old_workflow: ""
  candidate_role: ""
  ownership_scope: ""
  key_decisions: []
  actions: []
  ai_mechanism:
    llm: null
    prompt_context: null
    agent: null
    workflow: null
    rag_kb: null
    tool_api: null
    other: []
  prototype_or_build: ""
  evaluation:
    success_definition: ""
    test_set: ""
    bad_cases: ""
    iteration: ""
  data_and_metrics:
    baseline: ""
    result: ""
    scale: ""
  adoption: ""
  business_impact: ""
  collaboration: []
  constraints: []
  evidence_status:
    explicit_facts: []
    missing_facts: []
```

### EXTRACT-01

`explicit_facts` 中的信息才允许直接进入最终简历。

### EXTRACT-02

`missing_facts` 中如果包含高价值信息，应优先生成追问，而不是自动补齐。

典型追问包括：

- 这个 Agent 是否真的上线？
- 有多少真实用户/客户使用？
- 你本人负责到哪一步？
- 是否建立测试集或成功标准？
- 有无 Bad Case 和迭代？
- 项目前后指标分别是多少？
- 是 Demo、Pilot 还是 Production？
- RAG/Tool/API 是否真实使用？
- 业务价值有没有可验证口径？

---

# 7. 项目选择与排序规则

## SELECT-01｜目标岗位优先

项目优先级由目标岗位决定，不存在统一的“AI 项目一定排第一”。

### Target A

优先顺序：

**真实 AI 产品 > Agent/Workflow Prototype > 有 Eval 的 Side Project > 强传统 PM 项目 > 纯分析项目**

### Target B

优先顺序：

**真实客户/流程 + Solution + PoC/Pilot + 上线/ROI > ToB/SaaS/咨询落地项目 > 普通产品项目**

### Target C

优先顺序：

**AI Adoption/Growth/Enablement > AI Workflow 自动化 > 强增长/运营项目 > 纯活动/内容运营**

### Target D

优先顺序：

**业务策略 + 数据 + AI/自动化 + 经营结果 > 强商业分析/策略项目 > 仅行业研究**

---

## SELECT-02｜传统项目不因“没有 AI”自动删除

若传统项目能够证明：

- 用户洞察
- Workflow abstraction
- 0→1
- 数据驱动
- 商业结果
- 复杂项目推进
- Ownership

则仍可作为 AI PM 的基础能力证据。

---

## SELECT-03｜小规模 AI Side Project 可以高价值

当 Side Project 具备：

**真实问题 + Build + Eval + 迭代 + 用户/结果**

即使规模不大，也可在 A/B 匹配时提高优先级。

---

# 8. Bullet 改写规则

## EDIT-01｜优先写“证据链”，不要求每条塞满所有元素

> **改写前硬门**：进入 Step 5/6 改写前，必须先读本族「改写措辞透镜」专节（位于 EDIT-05 之后），以其中动词表 / 装饰性标签规则 / 叙事链为唯一措辞依据；不得仅凭本 EDIT 规则或凭经验措辞。

推荐信息顺序：

**业务/用户问题 → 候选人动作/关键决策 → AI/产品机制 → 验证 → 结果/规模**

根据事实完整度选择 3–5 个最强元素，不需要机械套模板。

---

## EDIT-02｜结果优于职责罗列

弱：

> 负责 AI Agent 产品设计，与研发协作推进功能上线。

强：

> 针对 XX 用户的 XX 任务，主导 XX Agent 从需求拆解到 Pilot，设计 XX Workflow，并基于 XX 类真实 Case 迭代失败路径，最终实现 XX 使用/效率/质量结果。

只有原始材料支持的字段才能填入。

---

## EDIT-03｜AI 机制必须具体但不过度技术化

好的技术表达应回答“为什么”和“如何影响产品”。

例如：

- “设计知识库检索 + Tool 调用流程以支持……”
- “针对 XX Bad Case 调整 Context/Prompt……”
- “将人工流程拆为 AI / Rule / Human Review 三类节点……”

而不是：

- “使用先进大模型技术”
- “融合 RAG、MCP、Multi-Agent、Vector DB”
- “基于 AI 赋能业务”

---

## EDIT-04｜Ownership 动词必须与事实匹配

可使用：

- 参与：候选人只是协作成员
- 负责：有明确责任范围
- 独立负责：有明确独立范围
- 主导：拥有关键决策与推进责任
- 从 0→1：从问题定义/方案到 MVP/Pilot/上线确有完整参与

若原材料无法证明，不得升级动词。

---

## EDIT-05｜指标使用真实口径

若有基线和结果，优先写：

**from X → Y / +X% / -X% / 覆盖 N 用户 / N 客户 / N 场景**

若没有数字，可使用可验证的非数字结果：

- 上线
- 完成 Pilot
- 被业务团队采用
- 覆盖多个流程
- 建立评测标准
- 形成标准化方案

不得生成“显著提升”“大幅增长”等无法验证的结果。

---

# 9. 非技术 / 商科候选人校准

## 改写措辞透镜（写作透镜·上提必读）

> 本族写作透镜核心已从依据层（`ai-证据依据.md` §3 装饰性标签 / §5 叙事链 / §6 动词表）上提至此处。进入 Step 5/6 改写前**必须**以本节为唯一措辞依据，不再回查依据层；完整示例与低价值表达清单见依据层 §3/§5/§6/§7。

### 有含义表述 vs 装饰性标签
- **可写（仅当能解释底层工作时）**：agentic workflow（与 agent 区别）、retrieval/RAG、工具调用与 API 集成、模型或 prompt 评估、质量/任务成功率/错误率/回归测试、人在回路与升级、护栏与策略控制、监控/可观测/告警、部署/生产化/灰度/回滚、数据质量/隐私/权限/治理、时延/成本/吞吐/可靠性、采纳/赋能/上线周期/工作流集成。
- **禁止当装饰标签贴**：`agent`、`LLMOps`、`production-grade`、`enterprise-ready`、`AI transformation`、无工作流与质量边界的 `AI-powered`。
- **提醒**：确定性工作流 ≠ 自主 agent；不得将确定性编排流程升格成「自治 agent」。

### 动词表（按证据类型选词）
- 发现与框定：mapped / diagnosed / decomposed / scoped / translated / framed / validated
- 产品判断：defined / prioritized / sequenced / scoped / traded off / shaped
- 构建与集成：designed / built / integrated / orchestrated / deployed / productionized / instrumented
- 质量与可靠性：evaluated / tested / benchmarked / monitored / debugged / safeguarded / calibrated / isolated / rolled back
- 采纳与赋能：activated / onboarded / enabled / trained / operationalized / scaled / standardized
- 可复用沉淀：generalized / templated / codified / documented / automated / abstracted / fed back
- 结果：reduced / accelerated / increased / improved / stabilized / expanded / saved / enabled
- 用与事实匹配的动词。`owned / 负责` 意味着真正的决策责任，不只是参与。

### 叙事链（按子族选）
- **产品向**：用户/业务问题 → 证据/方法 → 产品决策或权衡 → 跨职能行动 → 交付物 → 可量化结果
- **AI 应用/运营向**：运营/客户问题 → 工作流/系统设计 → AI 方法与集成 → 验证与控制 → 生产/采纳 → 可量化结果
- **部署向**：客户用例 → 部署/治理障碍 → 技术/业务动作 → 赋能 → 上线周期或采纳结果
- **应用 AI/解决方案向**：客户需求 → 架构/原型 → 评估 → 迭代 → 可部署方案 → 可复用模式或业务影响
- **纯 AI 运营向**：重复人工流程 → 自动化设计 → 系统集成 → 监控与人工复核 → 反复生产使用 → 产能/质量/成本结果
- 最强经历第一条通常先立住「问题 + ownership + 结果」，不以通用职责开头；完整链路可跨多条 bullet 铺开。

---

## NONTECH-01｜不要伪装成工程师

对于商科、咨询、战略、运营背景，优先体现：

**业务理解 × Workflow 抽象 × AI 实操 × 数据 × 落地结果**

不要为了技术感强写：

- 模型训练
- 深度学习
- Vector DB
- MCP
- Multi-Agent
- Python

除非真实存在。

---

## NONTECH-02｜不同目标岗位的补强方向

### Target A

优先寻找：

**T2 级 Agent/Workflow/Prototype + Eval + 用户/任务证据**

### Target B

优先寻找：

**业务流程 + AI Solution + Pilot/集成 + ROI**

### Target C

优先寻找：

**AI Workflow + Adoption/Growth + Automation**

### Target D

优先寻找：

**业务/数据问题 + AI-enabled strategy + 实验 + 经营结果**

---

## NONTECH-03｜不要把背景迁移自然度写成录取概率

原研究中的：

**D ≈ B > C > A > 技术平台/模型 PM**

仅表示既有能力复用程度，不代表录取概率，也不应对候选人做“更容易拿 Offer”的预测。

---

# 10. JD 定制流程

下游 Skill 在有目标 JD 时，建议按以下顺序处理。

### STEP 1｜分类

将 JD 分类为 A/B/C/D，可允许主类 + 次类。

例如：

`Primary = A`  
`Secondary = B`

### STEP 2｜提取 JD Signals

从 JD 提取：

- Must
- Common
- Preferred
- 技术深度
- KPI / 结果对象
- 用户/客户类型
- 业务场景

### STEP 3｜抽取候选人 Evidence

使用第 6 节 Schema，只记录明确事实。

### STEP 4｜建立匹配表

```yaml
signal_match:
  - signal: "Workflow Abstraction"
    evidence: "候选人原项目事实"
    strength: "strong | medium | weak | none"
  - signal: "Eval"
    evidence: ""
    strength: "none"
```

### STEP 5｜决定项目优先级

优先展示：
- 与目标 JD 高相关；
- Evidence 强；
- Candidate Ownership 清楚；
- 有结果或验证闭环的项目。

### STEP 6｜改写

执行第 8 节规则。

### STEP 7｜真实性 QA

检查是否出现：
- 新增不存在的技术栈
- 新增不存在的数字
- Ownership 升级
- Demo 写成 Production
- 使用 AI 工具写成 AI PM 项目
- 测试写成 Eval 体系
- 技能词写成 Proven Capability

若出现，回退。

---

# 11. Skill 最终输出前 QA Checklist

在输出改写后的简历前逐项检查：

- [ ] 是否已识别目标岗位 A/B/C/D？
- [ ] 是否按目标 JD，而不是通用 AI PM 模板做了优先级判断？
- [ ] 是否区分 Skill Claim 与 Proven Capability？
- [ ] 是否保留了有价值的传统 PM/运营/策略证据？
- [ ] 是否避免无依据补写 Agent/RAG/Eval/API/Python？
- [ ] 是否避免把 Demo 写成上线产品？
- [ ] 是否避免把参与写成主导？
- [ ] 是否避免制造不存在的指标？
- [ ] AI 技术名词是否服务于真实问题和结果？
- [ ] 是否优先表达候选人的关键决策和 Ownership？
- [ ] 是否优先表达验证方式、用户采用或业务结果？
- [ ] 非技术候选人是否避免“工程师化包装”？
- [ ] 若目标 JD 明确偏技术，是否提高了真实技术 Evidence 权重？
- [ ] 是否存在应先向用户追问、而不是继续生成的关键信息缺口？

---

# 12. 研究结论的置信度与禁止外推

以下属于本研究较稳定、可供 Skill 直接参考的模式：

- AI PM 不是统一岗位，应按工作对象、交付物和 KPI 分类；
- AI Product Fluency 与软件工程能力不是同一个招聘信号；
- “会用 AI 工具”弱于 Workflow/Build/Eval/真实用户证据；
- Eval/Bad Case 是高价值 AI Product Evidence，但并非所有 JD 都明确要求；
- 非技术背景不等于不适合应用型 AI 岗位；
- Coding 不是 A–D 四类岗位的统一硬门槛；
- 项目应优先证明与目标岗位一致的真实结果函数。

以下不能被 Skill 当成硬规则：

- AI 创业公司一定比大厂更重 Side Project；
- 大厂一定比创业公司更看学历；
- 所有 AI PM 都必须会 Python；
- 所有 AI PM 都必须掌握 MCP / Multi-Agent；
- 某一家公司一定偏好某一种候选人；
- 本研究未充分覆盖的公司可以用其他公司的模式代替。

---

# 13. 研究缺口

本研究自身已明确存在以下缺口，Skill 不应自行补齐：

1. B 类 Solution / Implementation 与 C 类 Operations/Growth 的完整 JD 数量少于理想配额；
2. 阿里、百度、京东、快手的近期完整 PM JD 样本不足；
3. AI Native 创业公司样本不足以支持公司类型级别的强结论；
4. 本研究主要是岗位类型与能力信号研究，不包含足够的职级/年限分层样本，因此不应从本文档推导 Senior/Lead/Principal 的统一规则；
5. 某些公司动态招聘页可能在职位关闭后重定向，因此应以 Source Appendix 中 URL 与岗位标识作追溯。

---

# 14. 给下游 Skill 的最短决策规则

当上下文有限时，只保留以下逻辑：

> **先看目标 JD 属于 A/B/C/D 哪类，再从候选人事实中找对应 Hiring Signal 的强 Evidence。**

> **候选人事实决定能不能写；目标 JD 决定优先写什么；本文档决定什么通常算强证据。**

> **AI 简历不是 AI 名词越多越好，而是“问题 → Workflow/方案 → 候选人动作 → 验证 → 用户/业务结果”越完整越好。**

> **非技术候选人不要伪装成工程师；优先证明业务理解、Workflow 抽象、AI 构建/验证、数据与落地结果。**

> **任何缺失的技术、指标、Ownership、上线状态和结果都不得自动补写。**

---

