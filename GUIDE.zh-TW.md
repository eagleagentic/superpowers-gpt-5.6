# Codex Superpowers 技能指南

[English](GUIDE.md) · [README](README.zh-TW.md) · [瀏覽 Skills](skills/superpowers)

這是為 Codex CLI 與 GPT-5.6 family 調整的 adaptive profile。Skills 只補充任務需要的流程知識，不取代使用者指令、最近的 `AGENTS.md`、Codex 內建能力或 domain-specific skills。

## 技能索引

| Skill | 能力 | Trigger |
| --- | --- | --- |
| [`brainstorming`](skills/superpowers/brainstorming/SKILL.md) | 收斂需求與設計選擇 | 需要探索設計、需求仍模糊或行為變更有重要取捨時。 |
| [`executing-plans`](skills/superpowers/executing-plans/SKILL.md) | 依既有計畫 inline 執行 | 已有可執行 implementation plan，適合由主 agent 在目前 session 完成時。 |
| [`finishing-a-development-branch`](skills/superpowers/finishing-a-development-branch/SKILL.md) | 處理 branch 交付 | 實作完成，且使用者或 repo policy 要求已授權的 integration、push、PR、branch 或 worktree 決策時。 |
| [`receiving-code-review`](skills/superpowers/receiving-code-review/SKILL.md) | 核實並處理 review feedback | 收到 code review 建議，需要判斷正確性或實作修改時。 |
| [`requesting-code-review`](skills/superpowers/requesting-code-review/SKILL.md) | 執行風險導向 review | 使用者明確要求 review，或變更涉及安全、資料、併發、公共 API 或跨模組風險時。 |
| [`systematic-debugging`](skills/superpowers/systematic-debugging/SKILL.md) | 證據導向定位根因 | 遇到 bug、測試失敗或非預期行為，且原因尚未證實時。 |
| [`test-driven-development`](skills/superpowers/test-driven-development/SKILL.md) | 以測試保護可觀察行為 | 在有實用自動化 test harness 的 repo 實作新行為或修復可重現 bug 時。 |
| [`using-git-worktrees`](skills/superpowers/using-git-worktrees/SKILL.md) | 建立隔離 workspace | 使用者明確要求、執行環境要求，或 long-lived、parallel、高風險變更會因隔離而實質受益時。 |
| [`using-superpowers`](skills/superpowers/using-superpowers/SKILL.md) | 路由這組流程技能 | 每次對話開始時啟動，在回覆或採取行動前選擇最小的相關 skill set。 |
| [`verification-before-completion`](skills/superpowers/verification-before-completion/SKILL.md) | 以新鮮證據支持完成聲明 | 即將 final handoff 或聲稱成功，且沒有其他 active workflow 提供同等 gate 時。 |
| [`writing-implementation-logs`](skills/superpowers/writing-implementation-logs/SKILL.md) | 記錄已驗證的實作成果 | persistent implementation 與 primary verification 完成後使用一次。 |
| [`writing-plans`](skills/superpowers/writing-plans/SKILL.md) | 產生 durable implementation plan | 使用者要求計畫，或複雜工作需要可恢復、跨 session 的 handoff 時。 |
| [`writing-skills`](skills/superpowers/writing-skills/SKILL.md) | 維護 Codex 版 Superpowers skills | 使用者明確點名 `writing-skills`，或要求維護這份 bundle 時；一般 skill authoring 使用 Codex 內建 `skill-creator`。 |

## 使用範例

以下是起點，不是強制串接的流程。描述你想達成的結果，Codex 會選擇真正有幫助的最小 workflow。

### 1. 我不確定該用哪個 skill

```text
我需要修改登入流程。請先檢查 repository，找出風險與模糊處，並在編輯前告訴我會使用哪個 workflow。
```

`using-superpowers` 會替任務路由。如果需求確實不清楚，可能加入 `brainstorming`；否則會 inline 完成，避免引入無關流程。

### 2. 測試或行為正在失敗

```text
空頁面的分頁測試會間歇性失敗。請重現問題、追蹤根因、做最小修正，並執行回歸檢查。
```

`systematic-debugging` 負責蒐集證據與測試假設。如果 repository 有實用的 test harness，且修正會改變可觀察行為，再加入 `test-driven-development`。

### 3. 我需要有證據的 review

```text
請 review 我未暫存的變更，檢查資料遺失、公共契約與缺少測試的風險。不要修改檔案；請以檔案與行號證據回報可執行的 findings。
```

`requesting-code-review` 會讓 review 保持唯讀且聚焦。收到 review 後，使用 `receiving-code-review` 對照 repository 驗證 findings，再套用有依據的修正。

### 4. 變更已經可以交付

```text
實作已完成。請用新鮮證據驗證完成聲明、記錄 implementation log，並準備已獲授權的 branch 交付。
```

`verification-before-completion` 蒐集新鮮證據，`writing-implementation-logs` 記錄結果，`finishing-a-development-branch` 只在已獲授權時處理 commit、push 或其他交付動作。

### 完整 walkthrough：加入報表匯出

先用一個以結果為中心的請求開始：

```text
請為既有報表加入 CSV 匯出。先釐清重要的設計問題並寫出 durable plan，再用聚焦測試完成實作、驗證最終行為，最後摘要變更內容。
```

預期流程如下：

1. `using-superpowers` 路由請求；只有 delimiter、escaping 或輸出責任等重要選擇才交給 `brainstorming` 釐清。
2. `writing-plans` 記錄 acceptance criteria 與驗證策略。plan 建立前不要開始實作。
3. 獲得實作授權後，`executing-plans` 逐項完成 outcomes。如果 repository 的 test harness 能測試匯出行為，就使用 `test-driven-development`。
4. 執行聚焦測試與 repository 要求的檢查，並把實際 diff 與 plan、acceptance criteria 對照。
5. `writing-implementation-logs` 記錄已驗證的結果。只有在 commit 或 push 獲授權時才使用 `finishing-a-development-branch`。

如果最後確認只是低風險的一行修改，同一個 router 也可以選擇更簡單的 inline 路徑，不會強迫使用完整流程。

## Model 選擇與 delegation

Runtime skills 維持 model-family neutral。以 `/model` 選擇目前使用的 model；此 profile 支援 `gpt-5.6-sol`、`gpt-5.6-terra` 與 `gpt-5.6-luna`。請以 [API pricing](https://developers.openai.com/api/docs/pricing)、[latest-model](https://developers.openai.com/api/docs/guides/latest-model)、[prompt-caching](https://developers.openai.com/api/docs/guides/prompt-caching)、[ChatGPT models](https://learn.chatgpt.com/docs/models) 與 [subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents) 文件確認目前的可用性、價格與 caching 指引。

Codex Ultra 預設提供 native subagent delegation。這個 bundle 因而移除自訂 agent-dispatch skills 與 templates，避免重複 Codex 的 orchestration layer。

## Adaptive selection

1. 每次對話先啟動 `using-superpowers`，再依 metadata 選擇直接匹配任務的最小 skill set。
2. 不因「可能有幫助」串接設計、計畫、worktree、TDD、review 或 branch-finishing workflows。
3. 需要 delegation 時使用 Codex Ultra 的 native capability；不要恢復 bundle-level dispatch workflows。
4. 依風險調整規劃與驗證深度；文件或機械修改不需要完整開發儀式。
5. 宣稱完成前提供與該聲明相稱的新鮮證據，避免重跑無關檢查。

執行 `bash skills/superpowers/check-context-budget.sh` 檢查技能數量與 context budget。
