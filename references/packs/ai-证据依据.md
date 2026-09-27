---
document_type: role_evidence_reference
layer: evidence
version: "1.0"
language: zh-CN
applies_to: AI 类岗位（A/B/C/D 子族判定见 `ai-执行规范.md`）
merge_source: 由 ai-product-internet-product.md 与 ai-operations-ai-applications.md 合并删减而成（海外公开 JD 样本，2026-09-19）
---

# AI 类岗位：证据与表达依据（依据层）

**怎么用**：执行层 `ai-执行规范.md` 必读；本文件**按需读** —— 拿不准某条证据算不算强证据、担心过度声称、需要措辞/动词/改写示例时再来查。

本文件不是候选人事实来源。**市场上常见的能力不等于候选人具备**；不得因为市场常见就给候选人补写 Agent、RAG、Eval、Python、SQL 之类内容。

## 0. 适用域警告

- §1–§7 源自海外公开 JD 样本（Anthropic / Figma / Stripe / Asana / Scale AI / Databricks）。**只取「证据怎么组织、什么算过度声称」这类通用写法**；其对职级、技术栈、薪酬的市场要求不套用到国内岗位。
- §8 是美团/腾讯/字节官方 JD 的国内研究结论，适用于国内互联网 AI 岗位。投金融、国企、银行时，**仍以目标雇主的调研信号（外部调研 R1–R3）为准**，本文件只提供证据组织方式。

---

## 1. 招聘方反复要看的五类证据

### A. 问题与工作流框定

说清为谁解决什么重复性问题、现有系统与流程是什么、为什么这里适合用 AI、哪些环节必须保留人工判断。

- 弱：`用 AI 提升了业务效率。`
- 强：`梳理 [重复工作流] 覆盖 [用户/系统]，定位 [决策或瓶颈]，设计 [AI 工作流/自动化] 并保留 [人工审核节点]，改善 [可量化结果]。`

不要把个人提效实验写成组织级 AI 运营体系 —— 除非素材能支撑「被采纳、被集成、被反复生产使用」。

### B. 交付物

把做出来的东西说具体：agentic workflow、检索应用、分类器、copilot、自动化、API 集成、评估管线、部署手册、内部工具、面向客户的应用。说清输入、接了哪些系统、输出、运行环境。

AI 运营类岗位的「built」通常需要生产 ownership 证据支撑：测试用例、监控、护栏、版本管理、故障处理、持续迭代。

### C. 评估与质量

可写的证据：评估集/测试集；明确的质量或任务成功标准；错误分析与失败分类；人工复核与升级规则；prompt/模型/数据/工作流变更后的回归检查；时延、成本、可靠性、吞吐测量；**评估改变了哪个产品 or 部署决策**。

> 禁止：在没有指标、评估方法、基线、来源语境的情况下写「提升了准确率」。

### D. 可靠性与运营

监控与告警、降级路径与故障隔离、权限与策略执行、数据质量与系统对接、人在回路检查点、可复现部署与回滚、成本与时延控制、支持交接与 runbook、故障定位与修复、采纳跟踪与反馈闭环。

> 只写候选人**真正设计或运维过**的控制点；不得由原型推断生产可靠性。

### E. 采纳与业务结果

time-to-value、活跃用户、工作流采纳率、吞吐、质量、成本下降、周期缩短、收入、客户扩展、任务成功率、人工工作量下降。

- 对客链路：`部署完成 → 用户可用 → 工作流被采纳 → 可量化客户结果`
- 内部链路：`自动化上线 → 被反复使用 → 质量与异常率被监控 → 产能/周期结果`

> 禁止把 prompt 数、workflow 数、demo 数、API 调用量直接说成业务影响。

---

## 2. AI 证据阶梯（六层）

1. **用例与能力边界**：模型/agent/系统对用户能做什么、不能做什么。
2. **验证**：规模化之前，想法、工作流、原型或 PMF 是怎么被测试的。
3. **质量与评估**：测了什么、评估怎么设计、失败模式如何反过来改变了产品。
4. **人机交互与控制**：用户如何理解、指挥、复核、纠正、覆盖 AI 行为。
5. **运营约束**：数据质量、隐私、时延、成本、可靠性、监控、治理、人在回路（相关时才写）。
6. **采纳与持久价值**：用户是否发现、激活、信任、复用、扩展了它。

不是每个岗位都要占满六层 —— 只用 JD 与素材支撑得住的维度。

---

## 3. 有含义的表述 vs 装饰性标签

> 本节与 §5（叙事链）、§6（动词表）、§7（低价值表达）的写作透镜核心已上提至 `ai-执行规范.md`「改写措辞透镜」专节（改写前必读）。执行层为准，本节保留完整示例与补充。

**可以写（仅在能解释底层工作时）**：agentic workflow（与 agent 的区别）、retrieval/RAG、工具调用与 API 集成、模型或 prompt 评估、质量/任务成功率/错误率/回归测试、人在回路与升级、护栏与策略控制、监控/可观测/告警、部署/生产化/灰度/回滚、数据质量/隐私/权限/治理、时延/成本/吞吐/可靠性、采纳/赋能/上线周期/工作流集成。

**禁止当装饰标签贴**：`agent`、`LLMOps`、`production-grade`、`enterprise-ready`、`AI transformation`、没有工作流与质量边界的 `AI-powered`。

> 提醒：确定性工作流 ≠ 自主 agent。不得把确定性编排流程升格成「自治 agent」。

---

## 4. 与相邻岗位的边界（过度声称红线）

| 素材里的事实 | 可信说法 | 不要声称 |
|---|---|---|
| 需求/干系人收集 | 浮现并结构化了用户或业务问题；有决策证据时说「影响了优先级」 | 没有决策证据却说「负责产品策略」 |
| 项目协调 | 推动了跨职能交付、依赖或上线工作 | 没有证据却说「负责路线图/用户结果」 |
| 研究/分析 | 产出了影响产品决策的证据 | 只是桌面或市场研究，却说是「产品发现」 |
| 运营/流程自动化 | 为特定用户群设计或改进了工作流并度量运营价值 | 内部流程说成「产品上线」 |
| 工程/实现 | 配合技术约束、交付了能力、改进了系统质量 | 仅凭实现声称产品 ownership |
| 数据科学/ML 研究 | 设计了实验、评估、模型、数据集或错误分析 | 没有部署证据却说生产应用 ownership |
| 客户成功/解决方案 | 推动采纳、指导部署、转化需求、做技术 workshop | 没有证据却说架构或代码 |
| GTM/销售工程 | 把客户痛点连到 AI 用例、demo、pilot、商业采纳 | 没有交付证据却说生产部署/产品 ownership |
| 传统运营 | 改进流程、搭建自动化、管理系统 | 没有 AI 特定工作却说 AI 应用能力 |

混合型岗位用**两段式**：`客户/业务结果 + 技术或运营机制`。不要把真实重心藏在「AI」这个大词后面。

---

## 5. 叙事链（按子族选）

- **产品向**：`用户或业务问题 → 证据/方法 → 产品决策或权衡 → 跨职能行动 → 交付物 → 可量化结果`
- **AI 应用/运营向**：`运营或客户问题 → 工作流/系统设计 → AI 方法与集成 → 验证与控制 → 生产/采纳 → 可量化结果`
- **部署向**：`客户用例 → 部署或治理障碍 → 技术/业务动作 → 赋能 → 上线周期或采纳结果`
- **应用 AI/解决方案向**：`客户需求 → 架构/原型 → 评估 → 迭代 → 可部署方案 → 可复用模式或业务影响`
- **纯 AI 运营向**：`重复人工流程 → 自动化设计 → 系统集成 → 监控与人工复核 → 反复生产使用 → 产能/质量/成本结果`

最强经历的第一条通常先立住「问题 + ownership + 结果」，不要以通用职责开头；完整链路可以跨几条 bullet 铺开。

---

## 6. 动词表（按证据类型选词）

- 发现与框定：mapped / diagnosed / decomposed / scoped / translated / framed / validated
- 产品判断：defined / prioritized / sequenced / scoped / traded off / shaped
- 构建与集成：designed / built / integrated / orchestrated / deployed / productionized / instrumented
- 质量与可靠性：evaluated / tested / benchmarked / monitored / debugged / safeguarded / calibrated / isolated / rolled back
- 采纳与赋能：activated / onboarded / enabled / trained / operationalized / scaled / standardized
- 可复用沉淀：generalized / templated / codified / documented / automated / abstracted / fed back
- 结果：reduced / accelerated / increased / improved / stabilized / expanded / saved / enabled

用与事实匹配的动词。`owned / 负责` 意味着真正的决策责任，不只是参与。

---

## 7. 低价值表达与关键词用法

**不要过度使用**：没有决策或结果的「负责」；没说决策/约束/结果的「跨职能协作」；没展示阶段的「端到端产品生命周期」；没有证据的「用户中心」「数据驱动」；没有工作流与质量边界的「AI 驱动」；只有执行却说「负责策略」；站会/迭代等流程仪式语言（除非 JD 明确看重）；把原始产出数量当成果；没有证明的软技能形容词。

**ATS 与业务语言**：只在与候选人证据匹配时使用 JD 原词；放进有证据承载的句子里，分布在经历、项目、技能中；**不要堆关键词块**，也不要列工具而不说明用它做到了什么。

**层级信号（仅作参考）**：校招/初级看问题拆解、分析可靠、研究质量、原型、需求清晰、有度量的结果、在既定范围内的执行力；正式 PM 及以上才谈领域 ownership、优先级决策、跨职能上线、可量化结果。**不得把「参与」改成「负责」来抬高层级。**

---

## 8. 附：国内样本研究结论

以下内容来自原 `ai-pm-resume-editing-skill-reference.md` 的研究存档（美团/腾讯/字节官方 JD，2025-12 至 2026-08），适用于国内互联网 AI 岗位，用于事实追溯与边界校验。原始 JD 样本清单（Source Appendix）未并入本文件，需按 URL 追溯时查 `_archive/ai-pm-resume-editing-skill-reference.md`。



### 执行摘要

#### 研究口径与证据边界

本研究以 **2025–2026 年仍在招聘、近期更新或可由官方招聘页面核验的岗位**为主，核心观察对象是字节跳动、腾讯、美团，并补充联想、小红书、百度官方招聘入口、Microsoft Research Asia 等样本。美团官方招聘站在 2026 年仍持续出现“AI 产品经理”“AI 产品运营”“AI 策略产品”等岗位；腾讯官方招聘站同时存在企业微信 Agent、腾讯会议 AI 策略、游戏 AI 产品、腾讯云 AI Solution/MaaS 运营等不同形态；字节官方招聘站则同时覆盖 AI 应用平台、AI Coding、飞书 AI Solution、火山方舟 MaaS 解决方案等岗位。citeturn4search3turn4search9turn20search18turn9search15turn8search6

本轮整理到 **60+ 个可核验招聘记录与技术对照岗位**。其中相当一部分可以定位到独立官方 JD；少部分只在官方招聘列表的搜索索引中保留了岗位标题与摘要。由于公开网页索引的结构差异，**A 类 AI Application/Agent PM 样本最充分；B 类 Solution/Implementation 与 C 类 Operations/Growth 的完整独立 JD 数量低于你提出的理想最低配额，因此涉及 B/C 的“市场普遍性”判断按中等置信度处理**。阿里、百度、京东及多数 AI Native 创业公司的现行招聘页对搜索引擎索引尤其不稳定，因此本报告**不会用不足的样本强行得出公司级结论**。百度当前官方社招入口确实持续展示大模型、AI 相关招聘，但可被公开索引完整还原的 PM 级 JD 不足以与美团、腾讯进行同强度编码。citeturn4search2

以下统一使用三个证据标签：

**【事实】**：JD 或官方招聘资料直接出现。  
**【研究归纳】**：在多个 JD 中反复出现后形成的招聘模式。  
**【推论】**：基于上述事实对简历筛选、能力信号进行的合理解释，不等同于招聘方原话。

#### 最重要的研究结论

**第一，当前市场里的“AI PM”不是一个统一岗位。** 最稳定的分界不是职位名称，而是**主要被考核的结果对象**：

| 类型 | 最核心问题 | 主要结果对象 |
|---|---|---|
| AI Application / Agent PM | AI 能否在具体用户任务中真正工作 | 产品体验、任务完成、使用与留存 |
| AI Solution / Implementation | AI 能否在企业流程中落地、部署并形成价值 | Pilot、交付、上线、客户采用、ROI |
| AI Operations / Growth | 已有 AI 产品能否被更多人发现、理解、采用和持续使用 | Adoption、活跃、漏斗、增长、商业化 |
| AI Strategy / Business | AI/数据能力应被用于哪个业务杠杆，怎样形成经营结果 | 转化、效率、GMV/收入、策略效果 |

这一分类可以从当前 JD 直接观察到。美团 CatPaw、金融 Agent、到餐销售 Agent 等岗位把产品对象直接放在 Agent/工作流上；腾讯云 AI 解决方案岗位要求把模糊业务需求拆成可执行技术路线并输出可部署方案；美团 AI 产品运营强调从用户洞察到运营策略落地；美团搜索/广告/营销策略岗位则把大模型能力嵌入搜索、推荐、广告、营销增长等经营问题。citeturn7search12turn7search19turn7search27turn10search5turn21search1turn7search15turn6search18

**第二，对应用型 AI PM 而言，“AI 技术能力”已经明显超过“会用 ChatGPT”，但还没有普遍演化成“必须会 Python”。** 字节的 AI 应用平台 PM 明确要求理解大模型、Prompt、Agent 等核心原理，并理解代码领域；腾讯智能体套件产品岗直接出现 Agent、RAG、智能体编排、MCP/工具调用等产品经验；美团金融 Agent PM 要求理解大模型原理与应用场景。但相对应的产品 JD 并没有普遍把 Python、算法训练或工程开发列为硬性门槛。真正把编程、工程架构、模型数据管线作为核心要求的，更多出现在技术型 AI PM、数据平台或工程/算法对照组。citeturn4search16turn10search16turn7search27turn20search26turn20search14

因此，对 Resume Skill 最重要的一条规则是：

> **【研究归纳】“AI 产品理解”与“软件工程能力”不能被当作同一信号。**  
> 一个候选人可以不具备工程师级编码能力，却拥有足够强的 Agent/Workflow/Eval/Prototype 产品能力；反之，会 Python 也不能自动证明其会做 AI 产品。

**第三，“hands-on”正在变得重要，但招聘意义上的 hands-on 更接近“能把 AI 能力变成可运行工作流，并能验证效果”，而不是使用过多少 AI 工具。** 美团校招 AI 产品运营样本直接偏好大模型、Agent、AI 办公产品的重度用户；Microsoft Research 的 AI Operations 岗位要求评估并集成 ChatGPT、Notion AI、Zapier、Make，重构真实运营流程、建设知识库和自动化方案；联想近期 AI PM 则出现“AI 原生团队核心成员”“独立负责项目从 0 到 1”的更高强度要求。citeturn7search2turn20search20turn21search7

由此可形成四层证据强弱：

**使用 AI 工具 < 设计 AI Workflow < 构建可运行 AI 产品/Agent < 能诊断、评测和改进 AI 系统。**

**第四，Eval 是区分“AI 概念经历”和“真正 AI 产品经历”的高价值证据之一，但不能说所有 AI PM JD 都明确要求 Eval。** 当前 Agent 产品、数据管理和 AI 系统岗位越来越强调质量闭环、训练反馈、Bad Case、评测或类似机制；腾讯 AI 数据工程对照岗直接围绕评测系统和数据管线，而字节大模型数据管理 PM 会根据训练反馈调整数据治理策略。citeturn9search7turn11search10

因此 Resume Skill 应把：

> “熟悉 RAG / Agent / Prompt”

视为**技能声明**，而不是能力证据；

而把：

> “为 XX Agent 定义任务集 → 搭建 Workflow → 建立 XX 条真实案例评测集 → 分析失败类型 → 调整 Prompt/Retrieval/Tool → 改善任务成功率”

视为真正的 **AI Product Evidence**。

**第五，业务背景、咨询背景、运营背景并不天然被应用型 AI 岗位排除。** 字节飞书 AI Solution 顾问明确接受 SaaS 售前工程、Solution 专家、技术咨询，以及具有技术背景的 B 端 PM/项目经理；字节企业效能顾问围绕战略管理、知识管理、AI 提效设计咨询方案并交付项目；美团 AI 营销增长策略岗位重点要求业务理解、数据分析和跨团队项目能力。citeturn8search6turn8search29turn7search15

真正的风险是：

> **【研究归纳】非技术候选人没有 AI 构建/验证证据，而不是“专业不是 CS”本身。**

**第六，CS/理工背景在不同岗位的权重差异很大。** 美团无人车运力 AI PM 明确偏好计算机、AI 等专业，字节 AI 应用平台也偏好 CS/AI/软件/数据相关背景；但很多 Agent PM、AI 策略、产品运营和 Solution JD 更强调领域经验、产品经验、客户/业务理解及大模型应用理解，而非把计算机专业设成统一硬门槛。citeturn7search0turn4search16turn21search1turn10search1

**第七，最值得写入简历的不是“用了 AI”，而是“AI 改变了哪段真实 workflow，以及最终产生什么可测结果”。** 当前招聘信号从弱到强大致呈现：

**技术名词 → Demo → Workflow → 真实用户 → Eval → 上线 → Adoption → Business Impact → Scale。**

这与 JD 的工作对象一致：Application 岗位围绕真实产品/Agent；Solution 围绕部署和客户；Operations 围绕 adoption；Strategy 围绕经营指标。citeturn7search21turn10search5turn21search1turn7search11

**第八，对“AI 创业公司比大厂更重作品和独立构建能力”这一假设，本轮证据不足以做确定判断。** 本次能够公开核验的 AI Native 创业公司现行官方 JD 数量不足；而大厂和大型科技公司本身已经出现非常强的 0→1、Agent 构建、AI Coding、工程理解要求，例如字节 TRAE、腾讯智能体套件和联想“产品+工程”AI PM。citeturn9search15turn10search16turn21search7

因此不能形成“创业公司看作品、大厂看履历”的二元规则。

---

### 四类岗位画像

**AI Application / Agent PM**

【事实】典型岗位包括美团 CatPaw/NoCode、金融 Agent、销售 Agent、外卖 AI PM；腾讯企业微信智能助理 Agent、AI 平台 Agent、CodeBuddy/WorkBuddy、腾讯会议 AI 策略；字节 AI 应用平台和 TRAE AI Coding PM。citeturn7search12turn7search27turn7search19turn20search18turn10search16turn10search1turn4search16turn9search15

它的主要用户可以是 C 端消费者、商家、销售、企业员工、程序员或内部业务团队。核心工作不是“管理模型本身”，而是把模型、Agent、RAG、工具调用、上下文等能力组织成一个完成真实任务的产品体验。

【研究归纳】典型工作闭环是：

用户任务识别 → Workflow 拆解 → 判断哪些步骤适合 AI → Agent/交互方案 → Prompt/Context/Knowledge/Tool 设计 → Prototype/Pilot → Eval/Bad Case → 上线 → 使用与质量数据 → 迭代。

与传统 PM 相比，它增加了**概率性输出质量、上下文管理、工具执行、评测与失败模式**这些工作对象；但用户研究、需求优先级、产品设计、跨团队推动依然是基本盘。腾讯智能体套件岗位直接把 Agent/RAG、智能体编排、MCP/工具调用放到产品经验要求中，而字节应用平台 JD 强调大模型、Prompt、Agent 核心原理。citeturn10search16turn4search16

**AI Solution / Implementation**

【事实】腾讯云 AI Solution 岗位强调深入行业场景，将模糊业务需求拆解为可执行技术路线，负责需求分析、技术选型、架构设计并形成可部署方案；字节飞书 Solution 顾问接受 SaaS 售前、Solution、技术咨询、B 端 PM/项目管理背景；火山方舟 MaaS 解决方案岗位围绕企业大模型、插件、AI 应用开发与安全能力。citeturn10search5turn8search6turn8search15

这类岗位服务的首要对象通常不是抽象“用户”，而是**企业客户、业务部门、客户 IT/技术团队、销售与交付团队**。

【研究归纳】其完整闭环更接近：

客户问题 → 业务流程诊断 → 场景筛选 → 数据/系统约束 → AI 方案 → PoC/Pilot → 系统集成 → 部署 → Adoption → ROI → 方案标准化/复制。

它与咨询的区别是需要对最终技术/产品落地承担更多责任；与传统 Solution Architect 的区别是，部分岗位同时承担产品需求沉淀与产品 roadmap 反哺；与 Application PM 的区别是，成功指标更偏**能否部署、采用、复制和产生客户价值**，而不只是产品体验。腾讯相关 Solution JD 就出现了“从模糊需求到技术路线”“输出可部署 AI 方案”“方案沉淀反哺产品”的结构。citeturn10search5turn10search12

**AI Operations / Growth / Enablement**

【事实】美团外卖 AI 产品运营专家强调本地生活与商家侧 AI 产品运营；另一美团 AI 产品运营岗位强调从用户洞察到策略落地；校招样本偏好大模型、Agent、AI 办公产品重度用户。腾讯存在 AI 产品运营、混元 AI-hub 内部用户运营、MaaS 产品运营和 AI 方向产品行销。citeturn21search1turn7search10turn7search2turn10search3turn10search15turn10search17turn10search18

Microsoft Research 的 AI Operations/组织创新岗位提供了非常清晰的 Enablement 样本：评估并集成 ChatGPT、Notion AI、Zapier、Make，重塑招聘与运营流程，建设知识库、自动化数据处理与内部报告。citeturn20search20

【研究归纳】这类岗位不是传统内容运营简单改名。最有区分度的工作是：

找到适合 AI 的工作流 → 设计使用方式/模板/自动化 → 教育用户 → 降低首次成功门槛 → 收集失败案例 → 与产品/算法协同迭代 → 提高激活、频次、渗透与持续采用。

因此强候选人的证据往往既包括 **Growth/运营方法论**，又包括足以亲自验证 Agent/Workflow 的 AI 实操。

**AI Strategy / Business / 数据驱动产品**

【事实】美团 AI 营销增长策略产品要求 AI 或策略产品相关经验，并强调业务理解、数据分析、跨团队协作；搜索广告、推荐策略等岗位会用大模型做 Query Intent、长尾匹配、推荐/搜索场景优化，并要求独立负责复杂策略项目。citeturn7search15turn6search18turn7search28

腾讯会议“AI 策略”岗位则把 AI Agent 能力建设与会议场景体验结合，是 A/D 边界岗位。citeturn10search1

【研究归纳】其核心问题通常不是“怎样设计一个聊天机器人”，而是：

**业务目标是什么 → 哪个环节存在可优化决策 → AI/数据能否改变决策质量或成本 → 如何实验 → 如何衡量经营结果。**

因此这类岗位最容易和传统策略产品、商业分析混淆。判断标准是：**如果 AI 只是偶尔被提到的手段而核心 KPI 仍是搜索、广告、转化、利润、供给效率，该岗位更接近 D；如果主要交付物是一个面向用户的 Agent，则应归 A。**

---

### 十个研究模块

**岗位定义与边界**

最实用的 JD 分类方法不是看标题中有没有“AI”，而是依次判断四件事：

| 判断问题 | 更可能归类 |
|---|---|
| 是否直接负责 Agent/助手/AI 功能的产品体验？ | A |
| 是否大量出现客户、PoC、部署、交付、方案、行业场景？ | B |
| 是否大量出现运营策略、用户教育、活跃、增长、渗透、商业化？ | C |
| 是否大量出现业务策略、搜索/推荐/广告、经营效率、收入、ROI？ | D |

【研究归纳】“Agent”也不能单独决定分类。例如客户侧 Agent 方案的 owner 可以是 B；销售 Agent 的产品 owner 是 A；推动员工采用 Agent 的岗位可以是 C；利用 Agent 改善销售经营指标的策略岗则可能是 D。citeturn7search19turn8search6turn20search20turn7search15

对 Resume Skill，应优先依赖 **工作对象 + 交付物 + KPI**，职位名称只能作为弱特征。

**核心职责与工作流程**

跨四类岗位最稳定的共性职责，是场景理解、需求拆解、方案设计、跨团队协作、上线/落地、数据反馈和持续迭代。美团多个 AI PM、腾讯 Agent PM、字节应用平台均体现这种端到端 ownership。citeturn7search21turn10search16turn4search16

但以下职责的岗位区分度更高：

| 工作对象 | A | B | C | D |
|---|---|---|---|---|
| 用户需求发现 | 核心 | 核心 | 核心 | 常见 |
| Workflow 拆解 | 核心 | 核心 | 常见 | 常见 |
| Agent 方案 | 核心 | 常见 | 加分 | 视岗位 |
| Prompt/Context | 常见 | 常见 | 加分 | 低至中 |
| RAG / Knowledge / Tool | 常见，尤其企业应用 | 常见至核心 | 加分 | 视场景 |
| Eval / Bad Case | 越来越重要 | 常见 | 反馈型 | 策略效果评估 |
| Pilot/PoC | 常见 | 核心 | 可参与 | 较少 |
| Deployment | 常见 | 核心 | 较少 | 较少 |
| Adoption | 核心结果之一 | 核心结果之一 | 核心 | 中 |
| Growth | 视产品 | 次要 | 核心 | 常见 |
| 客户交付 | 低 | 核心 | 视 ToB 岗位 | 低 |
| ROI | 中 | 核心 | 中高 | 核心 |
| 商业化 | 视产品 | 高 | 高 | 高 |

腾讯云 Solution JD 的需求分析—技术选型—架构—部署链条，与美团 AI 产品运营的用户洞察—策略落地链条形成了非常明显的岗位边界。citeturn10search5turn7search10

**招聘能力模型**

这里的 Must/Common/Plus 是根据本样本中的“职责中心性 + 任职要求重复出现程度”归纳，而非机械关键词计数。

| 能力 | A 应用/Agent | B Solution | C 运营/增长 | D 策略/业务 |
|---|---|---|---|---|
| Product Sense | Must | Common | Common | Common |
| 用户/客户研究 | Must | Must | Must | Common |
| 场景判断 | Must | Must | Must | Must |
| 业务理解 | Common | Must | Must | Must |
| Workflow 抽象 | Must | Must | Common | Common |
| 数据分析 | Common | Common | Must | Must |
| AI 产品理解 | Must | Must | Common–Must | Common |
| 技术理解 | Common–Must | Must | Plus–Common | Plus–Common |
| Evaluation | Common | Common | Plus | Common |
| 0→1 | Common | Common | Plus | Common |
| 项目推进 | Must | Must | Must | Must |
| 跨团队协作 | Must | Must | Must | Must |
| 商业化 | Plus | Common–Must | Common | Common–Must |
| 客户沟通 | Plus | Must | 视 ToB 情况 | Plus |
| Growth | Plus | Plus | Must | Common |
| ROI | Common | Must | Common | Must |
| Ownership | Must | Must | Must | Must |
| Structured Thinking | Must | Must | Must | Must |
| Learning Agility | Common | Common | Common | Common |

例如，腾讯云 AI Solution 把行业理解、需求拆解、技术路线和方案交付连在一起；美团 AI 营销增长策略则把业务、数据与跨团队协作结合；联想近期技术型 AI 产品岗体现了更高的产品+技术 ownership。citeturn10search5turn7search15turn21search7turn21search16

**AI 与技术能力要求**

最核心结论是：**当前招聘市场存在连续的技术深度谱，而不是“会代码 / 不会代码”二分。**

【事实】字节应用平台需要大模型、Prompt、Agent 原理；腾讯智能体套件明确出现 Agent、RAG、编排、MCP/Tool Calling；美团金融 Agent 要求理解大模型原理与场景。citeturn4search16turn10search16turn7search27

【研究归纳】因此对于 A 类，以下已经接近基础门槛：

**LLM 能力/局限理解、Prompt/Context 基础、Agent/Workflow 概念、工具/知识的使用方式、AI 输出为什么会失败、如何定义一个最基本的验证闭环。**

RAG、Knowledge Base、Tool Use/Function Calling 在企业 Agent 与复杂任务中价值很高；Memory、Multi-Agent、MCP 则明显更依场景而定，不能被 Resume Skill 当成所有 AI PM 必填技能。腾讯智能体套件明确要求 Agent/RAG/MCP，但其他大量 AI PM JD 并未要求所有这些组件。citeturn10search16turn7search21

**SQL：**在策略、增长、数据驱动岗位更重要；不是所有 Application PM 的统一硬门槛。

**Python：**没有证据支持“AI PM 普遍必须会 Python”。工程、数据、Infra、技术型产品的要求明显更高；普通应用 PM 的 JD 更常见的是“理解”“熟悉”“有产品经验”，而不是编程要求。腾讯工程对照岗直接要求 AI 编程工具或后台开发能力，体现出其与产品岗的边界。citeturn20search26turn20search22

**Cursor / Claude Code / Codex / Vibe Coding：**本样本中并未形成普通 AI PM 的普遍 JD 硬要求。字节 TRAE 本身是 AI Coding 产品，要求理解 AI 编程产品当然更深，但不能把这种垂直岗位外推到所有 AI PM。citeturn9search15

**Dify / Coze / n8n 等低代码工具：**招聘方更关心的是能否构建工作流、验证方案，而不是某一个具体工具品牌。Microsoft Research 的 AI Operations 甚至直接用 Zapier/Make 等集成工具作为真实流程改造手段，证明低代码/自动化工具可以构成严肃的 hands-on 证据。citeturn20search20

对问题“不会开发，但能独立搭 Agent / Workflow / Prototype，是否足够？”：

**【推论】对相当一部分 A、C，以及偏业务方案的 B 岗位，是可以达到有竞争力技术深度的；但前提是候选人不仅能搭出来，还能解释场景、流程、数据、失败案例与评测。** 这一结论来自大量 PM JD 对 Agent/AI 产品理解的要求，与工程 JD 的显式编码要求之间的差异，不能理解成“任何不会代码的人都满足要求”。citeturn4search16turn10search16turn20search20turn20search26

**候选人背景偏好**

【事实】在偏技术应用场景中，CS/AI/理工背景会被明确偏好。例如美团无人车运力 AI PM 偏好计算机、AI 相关专业；字节 AI 应用平台偏好 CS/AI/软件/数据背景。citeturn7search0turn4search16

但 B 类岗位提供了非常重要的反例：字节飞书 AI Solution 接受 SaaS 售前工程、Solution、技术咨询，也接受有技术背景的 B 端 PM/项目经理。citeturn8search6

C 类更加开放：联想 AI 运营的专业要求包括计算机、市场营销等相关背景，并把 AI 运营经验列为优先项而不是统一工程学历门槛。citeturn20search4

因此：

**产品背景**最自然匹配 A。  
**ToB/SaaS、咨询、售前/Solution**最自然迁移 B。  
**运营、增长、市场、用户研究**最自然迁移 C。  
**商科、战略、咨询、商业分析、数据分析**与 D 的业务/策略结构高度兼容。citeturn8search6turn21search1turn7search15

但“自然迁移”不等于无需补 AI。

对非技术背景，强补偿信号依次是：

**真实 AI Workflow → 可运行 Demo/Prototype → Eval → 实际用户 → Adoption/ROI。**

“上过 AI 课程”“常用 ChatGPT”“熟悉 RAG 概念”只能部分缓解技术可信度，不足以替代项目证据。

**AI 实操与项目要求**

本次样本支持“hands-on 价值上升”，但不足以支持“所有 AI PM 都要求 side project”。

比较四个层次：

| 层级 | 行为 | 招聘信号 |
|---|---|---|
| 使用 AI 工具 | 用 ChatGPT/Claude 完成写作、分析等 | 弱 |
| 设计 AI Workflow | 把多步骤业务流程重构为 AI + 人 + Tool 流程 | 中 |
| 构建 AI 产品 | 做出可运行 Agent/Prototype，接知识、Tool/API，有用户 | 强 |
| 理解并改进 AI 系统 | Eval、Bad Case taxonomy、检索/Prompt/Tool 调优、质量/成本权衡 | 很强 |

美团甚至在产品运营候选人中寻找大模型/Agent/AI 办公产品的重度用户，而 Microsoft Research 进一步要求真正把 AI 工具接入组织流程。联想 2026 AI PM 则出现独立负责 AI 项目 0→1 的要求。citeturn7search2turn20search20turn21search7

因此，**“AI 深度用户”是入门 signal，不是最终 signal。**

强 AI side project 不在于技术栈复杂，而在于是否包含：

真实问题 → Workflow → 构建 → 测试 → Eval → 迭代 → 用户/结果。

一个用了 8 个框架却没有真实任务或验证的 Agent，其招聘价值可能低于一个技术简单但有真实用户和完整 Eval 的 workflow。

**招聘方认可的结果指标**

这里必须区分“JD 明确要求的结果方向”和“AI 项目可使用的质量指标”。

【研究归纳】A 类最有价值的是两组指标：

**用户侧：**激活、使用率、任务使用频次、留存、渗透、Adoption。  
**AI 侧：**Task Success、Pass Rate、Bad Case、Human Acceptance、Accuracy、Latency、Coverage，以及在适用场景下的 Hallucination。

但后一组技术质量指标并非所有 PM JD 都逐项写明。它们之所以具有招聘价值，是因为 Agent/评测/数据反馈型岗位明确需要质量闭环。字节大模型数据管理 PM 和腾讯 AI 数据/评测对照岗位显示了训练反馈、数据质量和评测系统的重要性。citeturn9search7turn11search10

B 类优先顺序通常更接近：

**部署/上线 → Pilot 成功 → 客户采用 → 实施周期 → 自动化率/效率 → 成本节省/ROI → 可复制客户数。**

这是腾讯云 Solution 岗位“可部署方案”导向和字节企业效能咨询/解决方案导向的自然结果。citeturn10search5turn8search29

C 类最有价值的是：

**Activation、Adoption、渗透率、留存、使用深度、Conversion/Funnel、Automation Rate、人效和时间节省。**

Microsoft Research AI Operations 直接把减少重复事务、提升效率和流程自动化作为工作目标。citeturn20search20

D 类最有价值的是：

**Revenue、GMV、转化率、广告/推荐效果、ROI、Cost Saving、决策效率。**

美团广告、搜索、推荐和 AI 营销增长策略岗位明确把 AI 与交易、广告、推荐及经营价值连接。citeturn7search11turn7search18turn7search15turn6search18

Resume Skill 不应自动要求每个项目都写 DAU 或 Revenue；应匹配岗位真正的结果函数。

**高价值简历证据**

最重要原则是：

> **能力词不是 Evidence；动作也不是最终 Evidence；完整闭环事实才是 Evidence。**

例如“熟悉 Agent”只能证明候选人做了声明。

“使用 Coze 搭过 Agent”证明了一定 hands-on。

“为销售团队拆解线索筛选→信息补全→话术生成→CRM 更新 workflow，搭建可运行 Agent，并用真实 case 建立评测与人工兜底，最终在实际团队使用”才同时证明 **Workflow abstraction + AI hands-on + Eval + User insight + Ownership**。

对机器筛选而言，应优先抽取这些事实：

**0→1：**是否由候选人从问题定义一直推进到 MVP/Pilot/上线，而不是只维护已有功能。

**Ownership：**是否拥有明确决策权或端到端责任，例如需求定义、优先级、协调工程/算法、上线和指标。

**Product Sense：**是否发现了一个具体用户问题、作出取舍，并证明解决方案产生实际行为变化。

**AI Hands-on：**是否亲自设计 Agent/Workflow/Prompt/Context/Knowledge/Tool，而非单纯协调算法团队。

**Eval：**是否定义成功标准、测试集、失败类型和迭代机制。

**Technical Fluency：**是否解释模型/API/RAG/Tool/Data 等组件为什么存在以及如何影响产品，而不是罗列术语。

**Data Driven：**是否用数据发现问题、设定指标、实验和复盘。

**Business Impact：**是否产生收入、转化、节省、效率、ROI。

**Adoption：**是否真正有用户开始使用并持续使用。

**Scale：**是否从个人 Demo 走到团队、部门、多客户或大规模用户。

**简历表达与项目取舍规律**

针对 A，应优先放大：

**真实 AI 产品 > Agent/Workflow Prototype > 有 Eval 的 side project > 传统 PM 项目 > 与 AI 无关的纯分析项目。**

但传统产品项目仍有价值，尤其是其中的用户洞察、0→1、复杂流程抽象、数据实验、平台生态经验。

针对 B，应优先放大：

**客户/业务流程 → Solution → PoC → 系统集成 → 上线 → ROI** 的项目链条。

咨询项目只有“做了行业研究和 PPT”价值有限；若存在真实流程诊断、方案设计、Pilot、技术团队协同或客户采用，则可以转化为很强的 Solution evidence。字节飞书相关岗位本身就证明咨询/Solution 背景可进入这一类岗位。citeturn8search6turn8search29

针对 C，应放大：

**用户洞察 → 激活/教育机制 → Workflow 模板/运营 → 数据漏斗 → Adoption/Retention**。

纯内容发布量、活动场次等过程指标应弱化，除非能够连接 AI 产品采用。

针对 D，应放大：

**业务问题 → 数据分析 → 策略设计 → AI/模型能力 → 实验 → 经营结果。**

传统咨询/战略项目如果只停留在行业研究，AI PM 信号较弱；如果它包含业务流程拆解、量化决策、自动化机会识别、AI Pilot、ROI 模型，则价值明显提高。

对下游 Resume Skill，可以采用以下规则：

> 若传统项目没有 AI，但证明了用户洞察、Workflow abstraction、0→1、数据驱动、商业结果，不应删除；应把它保留为 PM 基础能力证据。

> 若 AI side project 有真实 build/eval evidence，即使规模小，也应在 A/B 岗位匹配时提高权重。

> 若候选人只是“使用 AI 加速自己的工作”，不能自动改写成“AI 产品经验”。

> 若项目没有真实 RAG、Agent、Eval，不得为了关键词匹配而补写这些技术。

**大厂与 AI 创业公司的差异**

本轮能做出的可靠结论比原假设更谨慎。

【事实】大厂已经存在非常“builder-oriented”的 AI PM：字节 TRAE 做 AI Coding 产品；腾讯智能体套件要求 Agent/RAG/MCP/Tool Calling；联想 AI 原生 PM 甚至直接强调产品思维与工程能力以及独立 0→1。citeturn9search15turn10search16turn21search7

因此：

**【研究归纳】“大厂岗位只看产品流程、不重实操”已经不成立。**

但由于本轮没有获得足够数量、时间同质且可核验的 MiniMax、智谱、月之暗面、阶跃星辰等现行官方 PM JD：

**【证据不足】无法证明 AI 创业公司整体比大厂更不看学历或大厂履历。**

**【证据不足】无法证明 startup 普遍要求 side project，而大厂普遍不要求。**

**【推论】早期 AI 团队由于人员少、角色边界宽，理论上更可能重视独立构建、速度与跨职能能力；但这个判断不应写进 Resume Skill 的硬规则，除非后续增加足够创业公司 JD 样本。**

---

### 岗位与技术深度矩阵

#### 四类岗位对比

| 能力/要求 | AI 应用 / Agent PM | AI Solution | AI 运营 / 增长 | AI 策略 / 业务 |
|---|---|---|---|---|
| 用户问题识别 | Must | Must | Must | Common |
| 场景判断 | Must | Must | Must | Must |
| Workflow abstraction | Must | Must | Common | Common |
| Agent 产品设计 | Must/Common | Common | Plus | Plus |
| Prompt / Context | Common | Common | Plus | Rare–Plus |
| RAG / KB | Common | Common | Plus | Rare |
| Tool Use / MCP | Common | Common | Plus | Rare |
| Eval / Bad Case | Common | Common | Plus | Common |
| Product Sense | Must | Common | Common | Common |
| Data Analysis | Common | Common | Must | Must |
| SQL | Plus/Common | Plus/Common | Common | Common/Must |
| Python | Plus | Plus | Rare | Plus |
| 工程级 Coding | Rare | Plus | Rare | Rare |
| Prototype 能力 | Common | Common | Plus/Common | Plus |
| 客户沟通 | Plus | Must | Common（ToB） | Plus |
| 交付 | Plus | Must | Plus | Rare |
| Adoption | Must/Common | Must | Must | Common |
| Growth | Plus | Plus | Must | Common |
| Business/ROI | Common | Must | Common | Must |
| 商业化 | Plus | Common/Must | Common | Common/Must |
| 0→1 | Common/Must | Common | Plus | Common |
| Ownership | Must | Must | Must | Must |

以上矩阵与腾讯 Agent/Cloud Solution、美团产品/运营/策略、字节 Application/Solution 的职责分化一致。citeturn10search16turn10search5turn21search1turn7search15turn4search16turn8search6

#### AI Technical Depth Model

以下 T0–T4 **不是任何公司的官方职级**，而是从 JD 技术要求聚类得到的 Resume Skill 技术深度模型。

| 技术层级 | 可观察能力 | 典型岗位匹配 | 简历证据要求 |
|---|---|---|---|
| **T0 AI User** | 熟练使用主流 LLM/AI 产品；知道主要能力边界 | C 入门、部分 D | 不能仅写“熟悉 ChatGPT”；需说明用于什么真实任务 |
| **T1 AI Product Fluent** | 理解 LLM、Prompt、Context、Agent、RAG/Tool 基本概念和限制 | 多数 A 的基础线；部分 B/C/D | 能解释产品方案为什么这样设计 |
| **T2 AI Builder** | 能独立搭 Agent/Workflow/Prototype；接知识/工具；做基本 Eval/Bad Case | 强 A；C Enablement；部分 B | 可运行 Demo + workflow + case/eval |
| **T3 Technical Product** | API、RAG/KB 架构、Function Calling/MCP、模型选择、数据流、Eval/Guardrail；可做 SQL/脚本 | B Solution、技术型 A、企业 Agent | 系统方案、集成、质量/成本/延迟权衡 |
| **T4 Engineering-adjacent** | 能实际编码/架构/部署，理解数据、模型训练或平台工程 | 技术型 AI PM、平台/模型 PM、工程对照组 | 代码、架构、部署、工程指标 |

字节普通 AI 应用 PM 更接近 T1–T3，腾讯智能体套件接近 T2–T3；联想部分“产品+工程”AI PM 则接近 T3–T4，而腾讯后台开发、金融风控 Agent 技术岗位明显属于 T4 技术对照。citeturn4search16turn10search16turn21search7turn20search22turn20search14

由此可以回答几个关键问题：

**AI PM 是否必须会代码？**  
【研究归纳】**否。** 本样本不支持把 Coding 设成所有 A–D 岗位硬门槛。citeturn4search16turn7search27turn10search16

**应用型 AI PM 的合理最低线是什么？**  
【推论】对于竞争性候选人，T1 已逐渐接近“能参与面试讨论”的最低线；真正有明显区分度通常在 T2，即能把需求独立转成 Agent/Workflow/Prototype，并验证效果。

**商科候选人需要学到 T4 吗？**  
通常没有招聘事实支持这么做。对 A/C/D，T2 往往比“为了显得技术而学一点 Python 语法”更有招聘价值；B 的复杂企业 Solution 可进一步补到 T3。

**什么时候 Python 值得突出？**  
目标 JD 明确要求数据分析、脚本、技术集成、平台/模型、开发能力时。否则 Python 是 supporting signal，不是 primary signal。

**Vibe Coding 是否应该算 AI PM 核心技能？**  
目前不能。它非常适合作为快速 prototype 的手段，但本样本尚未出现 Cursor/Claude Code/Codex 作为普通 AI PM 的普遍硬要求。AI Coding 垂直岗位是特殊情况。citeturn9search15turn20search26

---

### Hiring Signal 与 Evidence Matrix

| Hiring Signal | 弱证据 | 中等证据 | 强证据 |
|---|---|---|---|
| **AI Hands-on** | “熟悉 ChatGPT/Claude” | 搭过 Prompt/Agent Demo | 独立构建真实 Workflow/Agent，接 Tool/Knowledge/API，有真实 case 和用户 |
| **0→1** | “参与 AI 项目” | 负责某模块 MVP | 从问题定义、方案、构建/Pilot 到上线及结果全链路 owner |
| **Ownership** | “协助”“参与” | 独立负责功能 | 主动识别问题、做关键取舍、协调多团队并承担结果 |
| **Product Sense** | “产品感觉好” | 做需求分析/竞品 | 从用户行为发现高价值问题，改变方案优先级并产生用户结果 |
| **Eval** | “了解大模型评测” | 做人工测试/Bad Case | 定义成功标准、评测集、失败 taxonomy、基线和迭代闭环 |
| **Data Driven** | “熟悉数据分析” | 做 Dashboard/SQL | 数据发现问题 → 假设 → 实验 → 决策 → 结果 |
| **Business Impact** | “提升效率” | 有明确业务指标 | Revenue/ROI/Cost Saving/Conversion 等有基线、结果和业务范围 |
| **User Insight** | “做过访谈” | 访谈后形成需求 | 多源用户证据改变产品判断，并由行为/指标验证 |
| **Technical Fluency** | 罗列 LLM/RAG/Agent | 能解释各组件 | 能讨论为什么选 RAG/Tool/Agent、失败模式、质量/延迟/成本、安全权衡 |
| **Adoption / Growth** | “负责运营推广” | 活动带来注册/试用 | 激活→首次成功→重复使用→留存完整漏斗改善 |
| **Workflow Abstraction** | “了解业务流程” | 画流程图 | 把复杂人工流程拆成 AI/Rule/Human/Tool 节点并实际自动化 |
| **Scale** | 一次性 Demo | 小组试点 | 从 Pilot 复制到多部门/多客户/大量用户，并建立标准化机制 |

这一 Evidence Matrix 与当前招聘职责是一致的：Application 要产品和 Agent 闭环，Solution 要部署交付，Operations 要 adoption，Strategy 要经营结果。citeturn7search12turn10search5turn21search1turn7search15

对下游 Resume Generation Skill，建议把以下判定写成硬约束：

> **“熟悉 XX”只能作为自述技能，不能升级为 proven capability。**

> **没有真实构建事实，不应推断 Hands-on。**

> **没有测试集、标准或分析闭环，不应推断 Eval 能力。**

> **没有起点与结果，不应把“提升”“优化”自动解释成 Business Impact。**

> **没有需求发现、产品取舍或结果责任，仅做项目协调，不应自动判定为 Product Ownership。**

> **候选人用 AI 自己写文档/分析数据，可以证明 AI fluency，但不能自动证明 AI Product Management。**

> **Side Project 可以成为强证据，但只有在其具备问题、构建、验证、迭代这几个环节时；“克隆 ChatGPT”本身不是强证据。**

---

### 非技术背景、公司差异与 Resume Skill 规则

#### 非技术与商科背景专项结论

**优势在哪里**

商科、咨询、战略、运营背景在 B/C/D 并非天然弱势。

B 需要把模糊客户问题变成方案、协调客户与技术、判断 ROI；字节 Solution/企业效能岗位明确容纳咨询、Solution 和 B 端产品背景。citeturn8search6turn8search29

C 的核心是用户洞察、运营、adoption 与流程改造，美团与 Microsoft Research 样本均证明这一点。citeturn21search1turn20search20

D 的业务理解、数据分析、策略能力则天然接近商科/咨询训练；美团 AI 营销增长策略就是典型案例。citeturn7search15

**主要风险**

风险不是“不是 CS”，而是简历中出现以下组合：

**大量战略/运营语言 + 没有 AI build + 没有产品落地 + 没有 Eval + 没有用户采用。**

这种候选人容易被判断为“懂业务但无法和 AI 产品/技术团队共同完成落地”。

**更匹配的岗位排序**

对纯商科/咨询转型者，本样本支持的自然度大致是：

**D Strategy/Business ≈ B Solution > C AI Enablement/Growth > A Agent PM > 技术平台/模型 PM。**

但这不是录取概率排序，而是**既有能力复用程度**。

**应该证明什么**

面向 A，至少应寻找 **T2 级 Agent/Workflow/Prototype + Eval** 证据。

面向 B，应寻找 **真实业务流程 + AI 方案 + Pilot/集成/ROI**。

面向 C，应寻找 **AI Workflow + Adoption/Growth + Automation**。

面向 D，应寻找 **数据/业务问题 + AI 方案或 AI-enabled strategy + 经营结果**。

**不值得强行包装什么**

除非真实存在，不要为了“技术感”强写 Python、模型训练、Vector DB、MCP、Multi-Agent。

对于多数非技术 A/C/D 候选人，一个真实的：

**Agent + Workflow + API/Tool + Eval + 用户**

通常比一串技术名词更具有招聘解释力。

#### 公司层面招聘信号

**美团**

本次样本最丰富，且 AI 职位明显嵌入真实业务 workflow：外卖、到餐、金融、商家、广告、搜索推荐、无人车等。其招聘信号不是单纯追求“AI 酷炫”，而是非常重**场景、业务流程、策略结果和运营落地**。同时既有 CatPaw/NoCode 等平台产品，也有 AI 产品运营和 AI 策略产品。citeturn7search12turn7search21turn21search1turn7search15turn6search18

Resume Skill 对美团类岗位应提高以下证据权重：

**业务场景深度、数据指标、Workflow、业务结果、跨团队推进。**

**腾讯**

样本横跨 WXG、IEG、CSIG、CDG/TEG 等业务，Agent 形态非常多元，包括企业微信智能助理、腾讯会议、游戏 AI、AI 平台、智能体套件及腾讯云 Solution。部分岗位技术词非常明确，例如 Agent、RAG、编排、MCP/Tool Calling。citeturn10search14turn10search1turn10search8turn20search18turn10search16

腾讯云方向则明显提高 **行业/客户理解 + Solution Architecture + Deployment** 权重。citeturn10search5turn10search2

**字节跳动 / 飞书 / 火山引擎**

本次样本呈现三条线：AI 应用平台与 AI Coding 产品、飞书企业 Solution/效能咨询、火山方舟 MaaS Solution。其 JD 往往同时强调 AI 理解与产品/客户问题，并且在 AI 应用产品上出现较强技术 fluency 信号。citeturn4search16turn9search15turn8search6turn8search15

因此 Resume Skill 对这类岗位应更敏感于：

**LLM/Agent 理解 + 0→1 + AI 原生产品思维 + 企业场景/技术沟通。**

**百度**

百度当前官方社招入口持续存在 AI、大模型、智能标注/评测等岗位，且公司业务在 2026 年仍在推进企业 Agent 与 AI 应用；但本轮通过公开索引获得的独立 PM JD 数量不足，不应据此构建细粒度“百度 PM 偏好”规则。citeturn4search2turn12search5

**阿里 / 阿里云 / 钉钉**

本轮确认到官方人才入口，但无法从公开索引稳定获得足量、同时间口径的具体 AI PM JD。因而不能负责任地给出“阿里比腾讯更重 XX”这类公司比较。后续知识库如补充阿里官方 ATS 原始 JD，应独立更新，而不应用本报告其他公司的模式进行填补。

**京东、快手**

同理，本轮未获得足够的近期、可完整核验独立 PM JD 样本，不建议 Resume Skill 建立公司特定规则。

**小红书**

小红书 2026 校招页面对“点点”AI 应用团队的公开介绍明确提到 Agent、大模型、生成式 UI 和评测体系研发，说明其 AI 应用工作本身具有明显 Agent + Eval 特征；但该页面是团队/校招介绍而不是足够完整的 PM 独立 JD，因此只能作为弱公司信号。citeturn18search7

**联想：补充观察**

近期官方 AI PM 样本特别有价值，因为它揭示了市场的高技术端：有岗位直接要求 AI 原生、产品思维与工程能力、独立 0→1；另一个技术型 AI PM 围绕 AI 数据智能体；供应链 AI PM 则要求推动 Agent 在订单、供应链和业务流程中的落地、与架构师和开发共同设计集成方案。citeturn21search7turn21search16turn21search18

它说明 **T3/T4 AI PM 确实存在，但不能反过来代表全部 AI PM。**

#### 可直接供 Resume Generation Skill 使用的规则集

| Target / 情况 | 机器应优先寻找的事实 |
|---|---|
| Target = A Application/Agent PM | Agent、Workflow、用户场景、Prototype、Eval、Bad Case、0→1、Adoption |
| Target = B Solution | 行业/客户、业务流程、技术方案、PoC/Pilot、系统集成、上线、ROI、可复制 |
| Target = C Operations/Growth | AI 产品深度使用、用户洞察、Activation、Adoption、Retention、自动化、人效 |
| Target = D Strategy/Business | 数据分析、策略、AI-enabled decision、实验、ROI、Revenue/GMV/Conversion |
| 候选人写“熟悉 Agent” | 只记作 weak skill signal |
| 候选人真实搭 Agent | 升为 hands-on signal |
| Agent 还有真实 workflow + Tool/KB | 升为 medium/strong build signal |
| 另有 Eval/Bad Case 闭环 | 升为 strong AI product signal |
| 再有真实用户/Adoption | 升为 deployment/product-market evidence |
| 再有 Revenue/ROI/Cost Saving | 升为 business-impact evidence |
| 非技术候选人只有课程/证书 | 不视为技术深度已补足 |
| 非技术候选人有独立 Workflow/Prototype/Eval | 可抵消相当一部分“无工程背景”的信号缺口 |
| JD 未要求 Python | 不应为了 AI PM 标签强行突出 Python |
| JD 明确要求技术架构/数据平台/开发 | 提高 Python/API/系统设计/工程证据权重 |
| 项目只是使用 ChatGPT 提效 | 可证明 AI fluency，不证明 AI Product Ownership |
| 项目没有实际 Eval | 不得自动生成“建立评测体系”等表述 |
| 项目没有上线或用户 | 不得将 Demo 写成 production AI product |
| AI 技术名词很多但没有结果 | 降低权重 |
| 技术简单但真实用户、Eval、ROI 完整 | 提高权重 |

这组规则与当前 JD 中最稳定的招聘分界一致：**岗位事实 → Hiring Signal → Candidate Evidence**，而不是“AI PM 简历应该多写 AI 关键词”。citeturn4search16turn10search5turn21search1turn7search15

---

