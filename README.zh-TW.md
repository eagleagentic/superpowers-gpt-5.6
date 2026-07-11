# 適用於 GPT-5.6 Sol 的 Superpowers

[English](README.md)

這是針對 Codex 與 GPT-5.6 Sol 調整的 [obra/superpowers](https://github.com/obra/superpowers/tree/main/skills) adaptive 版本。它保留原作最有價值的工程紀律，同時移除現代 Codex 已能原生處理的流程負擔。

## 為何本版更適合 Codex

`using-superpowers` 會在每次對話開始時啟動，確保 skill routing 隨時可用；router 隨後只載入完成任務所需的最小 skill set，不會強迫所有任務依序經過設計、規劃、worktree、TDD、subagent、review 與 branch finishing。

- **Skill 正文減少 80.5%：**14 個 `SKILL.md` 合計 3,612 words，上游為 18,516。
- **Codex-native 執行：**直接配合原生 planning、subagents、approvals、tools 與 shared-workspace semantics。
- **流程與風險成比例：**只有在能實質改善成果時才使用 TDD、worktrees、reviews 與 delegation。
- **更低的協調成本：**簡單變更由主 agent inline 完成，只委派具實質工作量且彼此獨立的工作。
- **更安全的授權邊界：**保留使用者既有變更；破壞性或對外可見的操作必須先取得授權。
- **不依賴 RTK：**範例與驗證腳本使用一般開發環境可用的標準命令。

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

比較基準固定為上游 commit [`d884ae0`](https://github.com/obra/superpowers/tree/d884ae04edebef577e82ff7c4e143debd0bbec99/skills)，並於 2026-07-11 使用 `wc -w` 量測雙方 14 個 skill 正文。本版是在明確的 Codex 目標環境下更好；上游仍是涵蓋更多 harness 的通用發行版。

## 內含內容

調整後的 bundle 位於 [`skills/superpowers`](skills/superpowers)。可閱讀其[簡介](skills/superpowers/README.md)與[繁體中文技能指南](skills/superpowers/GUIDE.md)，了解 routing 原則與完整 skill 索引。

修改後應驗證 skill metadata、shell syntax 與 context budget。Bundle-level budget check 為：

```bash
bash skills/superpowers/check-context-budget.sh
```

`skills/superpowers/sync-skills.sh` 會拒絕覆寫這份 tailored profile，除非明確傳入 `--replace-tailored`。

## 上游致謝

本專案改作自 Jesse Vincent 的 [obra/superpowers](https://github.com/obra/superpowers)。更聚焦的 Codex 定位、adaptive routing policy、精簡指令與 Codex-specific tooling，正是 GPT-5.6 Sol 使用者選擇本版的理由。
