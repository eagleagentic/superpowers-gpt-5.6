# Add GUIDE Usage Examples

## Plan

**Goal:** Add practical, bilingual usage examples to the skill guides so new and experienced users can see how to select and combine the existing workflows.
**Why planning is required:** This is a cross-document change with parallel English and Traditional Chinese content plus documentation-specific verification.
**Acceptance:** Both guides contain matching use-case examples, each example names the relevant skill and expected verification, and repository validation passes without broken local links or scope changes.

### Outcome 1: Add short usage scenarios
- Work: Add an English `Usage examples` section and a corresponding Traditional Chinese `使用範例` section after the skill indexes. Cover first-time routing, feature planning and execution, debugging, code review, and verified branch delivery.
- Verify: Manually compare scenario order, skill names, and links between `GUIDE.md` and `GUIDE.zh-TW.md`.

### Outcome 2: Add one complete walkthrough
- Work: Include one representative feature-change walkthrough showing a user prompt, adaptive skill selection, implementation, verification, and handoff without implying that every task must use every workflow.
- Verify: Inspect the rendered Markdown structure and confirm the walkthrough reflects the current skill contracts.

### Outcome 3: Validate the documentation change
- Work: Keep the change limited to the two guides and the matching durable records; do not modify runtime skills, README content, or generated assets.
- Verify: `bash skills/superpowers/check-context-budget.sh` and `git diff --check`.

### Outcome 4: Record the verified implementation
- Work: After primary verification, create or update `superpowers/docs/logs/2026-07-13-011932-02-log-guide-use-cases.md` with the actual changes and fresh evidence.
- Verify: Reopen this plan and its matching log, then reconcile them against the final diff before completion.
