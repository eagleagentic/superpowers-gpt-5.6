# 適用於 GPT-5.6 Sol 的 Superpowers

<p align="center">
  <strong>專為 Codex CLI 打造的精簡、adaptive Superpowers profile。</strong>
</p>

<p align="center">
  <a href="README.md">English</a> ·
  <a href="GUIDE.zh-TW.md">繁體中文指南</a> ·
  <a href="GUIDE.md">English Guide</a> ·
  <a href="skills/superpowers">瀏覽 Skills</a>
</p>

![GPT-5.6 Sol Superpowers 儀表板，呈現 14 個 skills、3,612 words、精簡 80.5% 及 adaptive routing 流程](assets/readme-dashboard.zh-TW.svg)

這是針對 Codex 與 GPT-5.6 Sol 調整的 [obra/superpowers](https://github.com/obra/superpowers/tree/main/skills) 版本。它保留能改善成果的工程紀律，同時移除現代 Codex 已能原生處理的流程負擔。

> **關鍵差異：** `using-superpowers` 會在每次對話開始時啟動，但它是輕量 router，不是 mandatory process chain。

## 為何選擇本版

| Adaptive by default | Codex-native | 與風險成比例的嚴謹度 |
| :--- | :--- | :--- |
| 只載入完成任務所需的最小 skill set。 | 使用原生 planning、subagents、approvals 與 shared-workspace semantics。 | 只有在能實質改善成果時才使用 TDD、worktrees、review 與 delegation。 |

| 精簡 context | 更低的協調成本 | 更安全的授權邊界 |
| :--- | :--- | :--- |
| 14 個 skill bodies 合計 3,612 words，比上游少 80.5%。 | 簡單工作由主 agent inline 完成，只委派具實質工作量的獨立工作。 | 保留使用者既有變更；破壞性或對外可見的操作必須先取得授權。 |

## 與 obra/superpowers 比較

| 面向 | GPT-5.6 Sol 版本 | obra/superpowers |
| --- | --- | --- |
| 對話開始 | 每次啟動輕量 skill router | 每次檢查並啟用適用 skills |
| Skill 選擇 | 最小充分集合，不自動串接固定流程 | Mandatory workflows 與有序 skill transitions |
| Brainstorming | 用於模糊且高影響的選擇 | 所有 creative 或 behavior-changing 任務開始前都必須使用 |
| Planning | 一般工作使用原生 planning；需要 handoff 才寫 durable plan | 完整計畫、細粒度步驟與頻繁 commits |
| TDD | 適用於可測試行為且 repository 有實用 test harness 時 | 幾乎所有 feature、fix 與 refactor 的 hard gate |
| Subagents 與 review | 依風險與實際工作量啟用 | Fresh agents 與 staged reviews 是預設流程核心 |
| Worktrees 與交付 | 明確要求或隔離有實質價值時才建立 | 標準 implementation workflow 的一部分 |
| Verification | 使用與聲明相稱的新鮮證據，避免重複 gates | Universal completion gate |
| 目標環境 | Codex CLI 與 GPT-5.6 Sol | 多種 agent harnesses |

比較基準固定為上游 commit [`d884ae0`](https://github.com/obra/superpowers/tree/d884ae04edebef577e82ff7c4e143debd0bbec99/skills)。2026-07-11 使用 `wc -w` 量測雙方 14 個 `SKILL.md`：**本版 3,612 words，上游 18,516 words**。

## 探索 Skills

- 閱讀 [繁體中文技能指南](GUIDE.zh-TW.md) 或 [English skill guide](GUIDE.md)。
- 瀏覽 [`skills/superpowers`](skills/superpowers) 內的 tailored bundle。
- 查看每次對話都會啟動的 [`using-superpowers`](skills/superpowers/using-superpowers/SKILL.md) router。

修改 bundle 後，執行 context-budget 驗證：

```bash
bash skills/superpowers/check-context-budget.sh
```

Sync script 會保護這份 tailored profile；只有明確傳入 `--replace-tailored` 才會以 upstream skills 取代它。

## 上游致謝

本專案改作自 Jesse Vincent 的 [obra/superpowers](https://github.com/obra/superpowers)。更聚焦的 Codex 定位、adaptive routing policy、精簡指令與 Codex-specific tooling，正是本版更適合 GPT-5.6 Sol 的原因。
