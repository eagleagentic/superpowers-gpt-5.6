# Codex Superpowers 技能指南

[English](GUIDE.md) · [README](README.zh-TW.md) · [瀏覽 Skills](skills/superpowers)

這是為 Codex CLI 與 GPT-5.6 family 調整的 newcomer-safe profile。使用者只需描述成果；router 會提供 mandatory implementation baseline，再依風險加入專門 workflows。Skills 不取代使用者指令、最近的 `AGENTS.md`、Codex 內建能力或 domain-specific skills。

## 技能索引

| Skill | 能力 | Trigger |
| --- | --- | --- |
| [`brainstorming`](skills/superpowers/brainstorming/SKILL.md) | 收斂需求與設計選擇 | 不同合理解讀會改變 scope、architecture 或重大結果時使用；使用者不必先說「brainstorm」。 |
| [`executing-plans`](skills/superpowers/executing-plans/SKILL.md) | inline 執行實質計畫 | implementation 已獲授權，且 existing plan 有相依 outcomes 值得明確追蹤時。 |
| [`finishing-a-development-branch`](skills/superpowers/finishing-a-development-branch/SKILL.md) | 處理 branch 交付 | 實作完成，且使用者或 repo policy 要求已授權的 integration、push、PR、branch 或 worktree 決策時。 |
| [`receiving-code-review`](skills/superpowers/receiving-code-review/SKILL.md) | 核實並處理 review feedback | 用於 incoming reviewer feedback；只評估時保持 read-only，實作修正另需授權。 |
| [`requesting-code-review`](skills/superpowers/requesting-code-review/SKILL.md) | 執行風險導向 review | 用於整合前的 independent review，而非 incoming feedback；由明確請求或重大風險觸發。 |
| [`systematic-debugging`](skills/superpowers/systematic-debugging/SKILL.md) | 證據導向定位根因 | 原因不明的 bug、failure、regression 或非預期行為；只診斷時保持 read-only。 |
| [`test-driven-development`](skills/superpowers/test-driven-development/SKILL.md) | 以 red-green-refactor 實作 | 已授權工作明確要求時，或便宜的 red test 可區分實作方向或捕捉已確認 regression 時使用。 |
| [`using-git-worktrees`](skills/superpowers/using-git-worktrees/SKILL.md) | 建立隔離 workspace | 使用者明確要求、執行環境要求，或 long-lived、parallel、高風險變更會因隔離而實質受益時。 |
| [`using-superpowers`](skills/superpowers/using-superpowers/SKILL.md) | 強制安全 workflow defaults | 每次對話啟動；只有可證明不影響行為的工作是 Mechanical，其餘 implementation 皆為 Standard，High-risk 再加 safeguards。 |
| [`verification-before-completion`](skills/superpowers/verification-before-completion/SKILL.md) | 為困難完成聲明設 gate | High-risk 或多個獨立重大聲明需要 reconciliation 時使用；多個例行 commands 本身不觸發。 |
| [`writing-implementation-logs`](skills/superpowers/writing-implementation-logs/SKILL.md) | 記錄已驗證的實作成果 | 需要 durable record，或重大不可逆工作需要 audit/recovery 時；普通修改跳過。 |
| [`writing-plans`](skills/superpowers/writing-plans/SKILL.md) | 產生 durable implementation plan | 明確要求、High-risk 強制，或相依工作需要 resumable coordination 時。 |
| [`writing-skills`](skills/superpowers/writing-skills/SKILL.md) | 維護 Codex 版 Superpowers skills | 建立、修改或 audit 此 bundle 時使用；一般 skill authoring 使用 Codex 內建 `skill-creator`。 |

## 使用範例

使用者不需要知道 skill 名稱。只要描述成果；router 會強制核心 loop，再選擇風險足以支持的額外 workflow。

### 1. 我不確定該用哪個 skill

```text
我需要修改登入流程。請先檢查 repository，找出風險與模糊處，並在編輯前告訴我會使用哪個 workflow。
```

`using-superpowers` 會替任務路由。任何非 Mechanical 的登入 implementation 都須走 Standard：inspect、說明 brief plan 與 acceptance、加入實用的 focused coverage、執行 checks、review final diff。不同解讀會改變結果時加入 `brainstorming`。

### 2. 測試或行為正在失敗

```text
空頁面的分頁測試會間歇性失敗。請重現問題、追蹤根因、做最小修正，並執行回歸檢查。
```

`systematic-debugging` 負責 root-cause analysis。原因與預期行為可信後，若便宜的 red test 可區分修法或捕捉已確認 regression，`test-driven-development` 負責 mutation order；使用者不必先說 TDD。

### 3. 我需要有證據的 review

```text
請 review 我未暫存的變更，檢查資料遺失、公共契約與缺少測試的風險。不要修改檔案；請以檔案與行號證據回報可執行的 findings。
```

`requesting-code-review` 讓 independent review 保持唯讀且聚焦。`receiving-code-review` 評估 incoming findings；只有 implementation 已獲授權才套用有依據的修正。

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
3. 獲得實作授權後，`executing-plans` 逐項完成 outcomes。便宜的 red test 能區分實作或捕捉已確認 regression 時使用 `test-driven-development`；否則在實用時直接加入 focused coverage。
4. 執行聚焦測試與 repository 要求的檢查，並把實際 diff 與 plan、acceptance criteria 對照。
5. `writing-implementation-logs` 記錄已驗證的結果。只有在 commit 或 push 獲授權時才使用 `finishing-a-development-branch`。

若 prompt 沒有明確要求 durable plan，所有非 Mechanical implementation 仍走 Standard；只有可證明不影響行為的 edit 才走 Mechanical path。

## Model 選擇與 delegation

Runtime skills 維持 model-family neutral。以 `/model` 選擇目前使用的 model；此 profile 支援 `gpt-5.6-sol`、`gpt-5.6-terra` 與 `gpt-5.6-luna`。請以 [API pricing](https://developers.openai.com/api/docs/pricing)、[latest-model](https://developers.openai.com/api/docs/guides/latest-model)、[prompt-caching](https://developers.openai.com/api/docs/guides/prompt-caching)、[ChatGPT models](https://learn.chatgpt.com/docs/models) 與 [subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents) 文件確認目前的可用性、價格與 caching 指引。

Codex Ultra 預設提供 native subagent delegation。這個 bundle 因而移除自訂 agent-dispatch skills 與 templates，避免重複 Codex 的 orchestration layer。

## Adaptive selection

1. 每次對話先啟動 `using-superpowers` 並選擇最高適用 tier；不確定只升級、不降級。
2. Direct execution 只適用於可證明不影響行為的 Mechanical edits。其他 implementation 都走 Standard；High-risk 包含 Standard 並增加 safeguards。
3. Standard 必須 inspect context、說明 brief plan 與 acceptance、最小實作並加入實用的 focused coverage、執行聚焦 checks、review final diff，最後回報證據。
4. Skill activation 不會授予 mutation 或 external-action authority。只診斷、只評估、只規劃的請求保持 read-only。
5. 只有 inspection 發現新 scope/risk 或即將執行重大 external action 時才重新分類；相關 state 未變且聲明已有證據時重用 fresh evidence。
6. High-risk 強制 durable plan 與 explicit verification；review、isolation、production-data、deployment controls 只依具名風險加入。
7. 額外 workflows 只由 tier 或 outcome-based metadata 觸發。Native plan 不強制 durable file，普通 implementation 不強制 log。
8. 需要 delegation 時使用 Codex Ultra 的 native capability；不要恢復 bundle-level dispatch workflows。

執行 `bash skills/superpowers/check-context-budget.sh` 檢查技能數量與 context budget。
