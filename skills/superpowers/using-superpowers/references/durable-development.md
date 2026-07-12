# Durable Development Lifecycle

Apply this lifecycle automatically to authorized persistent work. Conversation-only, read-only, plan-only, blocked, and no-diff work do not receive an Implementation Log.

## Ownership

- A durable plan owns intent, scope, material decisions, acceptance, and verification strategy when planning is required.
- The Implementation Log owns the concise human-readable outcome, verification summary, and material limitations.
- Plans live only in `./superpowers/docs/plans/`; Implementation Logs live only in `./superpowers/docs/logs/`. Planned records share a timestamp and scope slug, with `01-plan` before `02-log`; simple work has only a `01-log`.
- Repository state owns the implementation that exists.
- Verification evidence proves the final repository state against acceptance; it cannot redefine acceptance or excuse stale documentation.

## Choose durable records

Inspect `./superpowers/docs/plans/` and `./superpowers/docs/logs/` for records with the same timestamp and scope slug. Create plans only at `./superpowers/docs/plans/YYYY-MM-DD-HHMMSS-01-plan-<slug>.md`, planned logs only at `./superpowers/docs/logs/YYYY-MM-DD-HHMMSS-02-log-<slug>.md`, and simple logs only at `./superpowers/docs/logs/YYYY-MM-DD-HHMMSS-01-log-<slug>.md`. Use the plan's timestamp and slug when creating its log; the phase token is fixed and makes plan → log order explicit. Keep one plan and one log per implementation scope.

Keep the file concise and recoverable. Do not store transcripts, hidden reasoning, routine command output, or detailed diff narration.

## Plan gate

Require a durable plan when the user requests planning, Codex enters Plan Mode or creates a native plan, or the work is complex, important, high-risk, dependent, cross-subsystem, public-contract, isolated, destructive, or long-running. Once planning occurs, the requirement cannot be downgraded for that task.

Initial read-only inspection is allowed. Before the first implementation mutation on planned work:

1. Create or update the plan file with goal, planning reason, acceptance, outcomes, and verification.
2. Confirm the proposed mutation is covered.
3. Keep native-plan progress synchronized with material task-file changes.

When Plan Mode forbids writes, name the plan path and make it the first permitted repository mutation before implementation. A simple, low-risk, reversible task with one direct path may implement without a prewritten plan. If it becomes complex or planning starts, stop and materialize the plan before continuing.

Preserve original intent and acceptance. Record material requirement, scope, design, review, or verification-strategy changes before implementation continues.

## Completion-log gate

After the whole persistent implementation and fresh primary verification, apply `writing-implementation-logs` once:

1. Create or update the matching `02-log` in `./superpowers/docs/logs/`; simple work creates only a `01-log`.
2. Summarize what changed in one to three human-readable bullets.
3. Record one to three verification results and only material limitations.
4. Derive the log from the actual diff and fresh evidence, not conversation memory.

The log is the terminal documentation mutation and does not trigger another log. Run affected documentation and diff checks afterward; do not repeat unrelated expensive suites. A later same-scope implementation mutation invalidates the log and affected evidence. Reverify and update the matching log instead of adding another.

## Reconciliation gate

Immediately before completion, commit, or push, reopen the plan when required and the matching log; compare them with the actual diff, acceptance, and fresh evidence. Missing or stale required documentation is a hard failure.

Reported completion and prior checks are candidate evidence only. The active session owns documentation, fresh verification, and reconciliation before commit or push.
