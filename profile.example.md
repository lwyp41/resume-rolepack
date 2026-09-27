# profile.example.md — 候选人档案模板

> **复制本文件为 `profile.md` 后填写。**
> 本模板住在**知识根**（skill 安装目录）；`profile.md` 必须复制到**工作区根**（你当前的工作目录），
> 框架只从工作区根读它。两个根的关系见 `SKILL.md` → 「两个根：知识根 vs 工作区根」。
> `profile.md` 已被 `.gitignore` 排除，**永不入库**。
> 框架内所有「候选人专属事实」只从这里读取，内核文件中一律不得硬编码。

```bash
cp <SKILL_DIR>/profile.example.md <WORKSPACE>/profile.md
```

**填完再开始任何简历任务。** 框架启动时必须先读工作区根的 `profile.md`；读不到或关键字段为空，
就停下来提示用户先完成设置 —— **不得猜测、不得沿用下面的示例值**。

---

## 1. 基本信息

```yaml
identity:
  name: ""            # 用于文件名与页眉
  name_en: ""         # 英文版姓名写法，例如全大写
  target_tracks:      # 求职方向，对应 references/packs/ 里的方向包
    - ""
```

## 2. 雇主白名单 【关键 · 最高频错误来源】

**只有这里列出的公司，才能被写成「我的雇主」。**

以下三类**永远不是**候选人经历，任何模式下都不得当作雇主：

- 投递目标公司
- JD 里出现的公司
- 输出文件名里的公司名 ← 那是投递目标

```yaml
employer_whitelist:
  - name: ""
    title: ""
    period: ""
```

## 3. 受保护原件

简历原件，**只读**。框架永不修改 / 覆盖 / 重命名 / 移动。
其中一份可标记为 `format_baseline: true`，作为排版基准。

```yaml
protected_originals:
  - path: "简历原件/xxx.docx"
    sha256: ""
    format_baseline: true
    note: ""
```

## 4. 事实源

```yaml
fact_source:
  library_root: "经历库/"
  routing_table: "经历库/经历索引.md"
  # 经历库不是原件超集，两边互补：
  # 只在原件中出现的证据，必须回到原件取
  complement: "protected_originals"
```

## 5. 硬性禁止 【优先级最高】

任何版本（中 / 英）一律不得违反。
裁决顺序中，本表优先于 JD、优先于执行规范、优先于常识。

```yaml
hard_prohibitions:
  # 例：不得把「在某国短期交换」表述为「精通该国语言」
  # 例：未经本人确认，不得写「母语水平」「流利」
  - ""
```

## 6. 数字口径裁决

同一事实在多处数字不一致时，**以本表为准**（优先级高于原件原句）。

```yaml
number_overrides:
  - fact: ""
    value: ""
    source: "经历库/xxx.md"
    note: ""
```

## 7. 单条经历的固定约束

某些经历有既定写法限制，写在这里避免每轮重复交代。

```yaml
entry_specific_rules:
  - entry: ""
    rule: ""      # 例：只写一句话 / 不得编造日期 / 时长上限
```

## 8. 输出约定

```yaml
output:
  dir: "生成简历/"
  naming_zh: "简历_<公司>_<岗位>_v<n>.docx"
  naming_en: "<Name>_CV_<公司>_<岗位>_v<n>.docx"
  increment_version: true    # 递增版本号，不覆盖既有产出
```

## 9. 求职偏好（仅用于岗位挑选）

前八段是**事实**，这一段是**意愿**。它只服务岗位挑选模式：
评估的 Step 1 红线过滤逐岗对照本节，任一不满足直接归入「不建议投」。

偏好缺失时按 profile gate 同样处理 —— 停下来让你补齐，**不做降级评估**。

```yaml
preferences:
  target_industries: []   # 想去哪些行业 / 方向
  excluded: []            # 排除的行业或岗位类型
  salary:
    floor: ""             # 期望底线，低于此不看；不设底线就写「不限」
    current: ""           # 选填，用于算薪资倒挂与跳槽溢价
  deal_breakers: []       # 一票否决：例「外包」「纯销售」「单休」「长期夜班」
  cities:
    accept: []            # 可接受范围，留空 = 不限
    reject: []            # 不去哪些城市
```

填写提醒：

- `salary.floor` 不能留空 —— 不设底线就写「不限」。留空会被判定为未配置。
- `deal_breakers` 接受自由填写：行业、岗位类型、用工形式、工作制都可以往里写。
- 学历 / 工作年限 / 职级**不填在这里** —— 简历原件里有，框架自己算。

---

## 填写检查清单

- [ ] `identity.name` 已填
- [ ] `employer_whitelist` 已逐条确认（**这是最容易出错的一项**）
- [ ] `protected_originals` 至少一份，且有一份标了 `format_baseline`
- [ ] `hard_prohibitions` 已填写（没有就写 `[]`，不要留空）
- [ ] `preferences` 已填，且 `salary.floor` 非空
- [ ] `profile.md` 确认被 git 忽略：`git check-ignore -v profile.md`
