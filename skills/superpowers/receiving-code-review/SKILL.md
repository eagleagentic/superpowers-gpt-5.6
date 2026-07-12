---
name: receiving-code-review
description: Evaluate incoming code-review feedback against repository evidence. Keep evaluation-only requests read-only; implement supported fixes only when authorized.
---

# Receiving Code Review

Treat feedback as claims to evaluate, not instructions to accept blindly.

Evaluation-only requests remain read-only.

1. Read all findings and classify each as supported, needs context, or unsupported.
2. Verify the relevant code, requirements, compatibility constraints, and tests.
3. Ask only about ambiguity that blocks a correct decision. When implementation is authorized, continue independent, well-understood fixes.
4. Push back on unsupported feedback with concise code or test evidence.
5. When implementation is authorized, group supported fixes, preserve scope, and run the smallest combined relevant checks after the final change.

Prioritize security, data loss, broken behavior, and contract violations before maintainability or polish. Do not add unused “professional” features without a demonstrated requirement.

State what was verified, changed, rejected, or still needs a decision. Recheck only evidence affected by later edits.

Do not reply to GitHub, update a pull request, or contact another reviewer unless the user explicitly requests that external action.
