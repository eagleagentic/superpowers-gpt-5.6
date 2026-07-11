---
name: brainstorming
description: "Turn ambiguous, high-impact product or system ideas into a concise, decision-ready design. Use when the user asks to explore an idea, compare materially different approaches, or resolve important requirements before implementation."
---

## Trigger

- Use this skill for ambiguous goals, material product choices, competing architectures, or broad requests needing decomposition.
- Use it when the user explicitly asks to brainstorm or design before implementation.

## Skip

- Skip it for precise tasks with clear acceptance criteria, approved specifications, bug diagnosis, or mechanical code, configuration, and documentation changes.
- Skip questions whose answers are discoverable from repository context.

## Core Loop

1. Inspect only the relevant repository files, instructions, and current behavior with Codex CLI.
2. State the goal, constraints, success criteria, and any safe assumptions.
3. Ask one concise blocking question only when an unresolved choice would materially change the result.
4. Present the recommended approach first. Include alternatives only when they are genuinely viable and materially different.
5. Describe the smallest useful design: ownership boundaries, interfaces, data flow, failure behavior, and verification strategy as applicable.
6. Request one approval only for a material scope, architecture, irreversible, or externally visible decision. Otherwise proceed under stated assumptions.

## Escalation

- Decompose independent subsystems before designing them in detail.
- Pause when required authority, external coordination, or a consequential user choice is missing.
- Read `visual-companion.md` only when the user explicitly requests the visual companion.
- Write or commit a design document only when the user or repository instructions require it.

## Evidence

- Record the chosen approach, rejected material alternatives, assumptions, and acceptance criteria concisely.
- Ensure the proposed design traces directly to the requested outcome before implementation.
