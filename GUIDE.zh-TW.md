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
