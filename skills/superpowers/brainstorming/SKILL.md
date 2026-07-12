---
name: brainstorming
description: "Resolve ambiguous product or system work before implementation. Use when materially different interpretations would change scope, architecture, or consequential outcomes; skip precise tasks."
---

# Brainstorming

Skip precise tasks, approved specifications, mechanical changes, and questions answerable from repository context.

1. Inspect only the relevant instructions, files, and current behavior.
2. State the goal, constraints, success criteria, and safe assumptions.
3. Ask one blocking question only when the answer materially changes the result.
4. Recommend one approach first; include only genuinely viable, materially different alternatives.
5. Describe the smallest useful design: ownership, interfaces, data flow, failure behavior, and verification where relevant.
6. Request approval only for a material scope, architecture, irreversible, or externally visible decision.

Decompose independent subsystems only when it clarifies ownership. Pause for missing authority or consequential choices. Read [visual-companion.md](visual-companion.md) only when the user explicitly requests visual comparison.

For later implementation, pass forward the chosen approach, assumptions, and acceptance. Select durable planning only if its description independently matches the work.
