# Visual Companion for Codex CLI

Use this optional browser companion only after the user explicitly requests it and the current question is easier to answer visually than in text. Good uses include UI layouts, visual hierarchy, spatial diagrams, and side-by-side design directions. Keep requirements, API choices, trade-off lists, and other text-first decisions in the terminal.

## Start

Run from the `brainstorming` skill directory. Use the project root so screens persist and a restarted server can reuse its connection details:

```bash
bash scripts/start-server.sh --project-dir "$PROJECT_ROOT" --open
```

In Codex, this may remain as a long-running command session. Keep that session alive and capture the first `server-started` JSON object:

```json
{"type":"server-started","url":"http://localhost:52341/?key=SESSION_KEY","screen_dir":"/project/.superpowers/brainstorm/SESSION/content","state_dir":"/project/.superpowers/brainstorm/SESSION/state"}
```

Save `url`, `screen_dir`, and `state_dir`. The parent of `state_dir` is `SESSION_DIR`, which is required for cleanup. The same JSON is stored at `state_dir/server-info`.

Treat the complete URL as a session secret. Always give the user the exact `url` value, including `?key=...`; never strip the query, publish it, or substitute a bare host and port. The key protects HTTP and WebSocket access. Keep the default loopback binding unless the user explicitly needs and authorizes broader network access.

If project files are persisted under `.superpowers/`, ensure that directory is ignored by git.

## Interaction loop

1. Confirm `state_dir/server-info` exists and `state_dir/server-stopped` does not. Restart with the same `--project-dir` if needed.
2. Write a new semantic `.html` file into `screen_dir`, such as `layout.html` or `layout-v2.html`. Never reuse a filename; the server displays the newest file.
3. Prefer an HTML fragment. The server supplies the document shell, styles, connection state, and interaction helper. Inspect [`scripts/frame-template.html`](scripts/frame-template.html) for the current CSS classes and markup conventions instead of reproducing them here.
4. Tell the user what the screen shows, provide the complete URL, and ask for terminal feedback or a browser selection. Then end the turn.
5. On the next turn, combine the user's terminal response with `state_dir/events`. Terminal text is authoritative; events add structured interaction evidence.
6. Write a fresh screen when iterating. Return to terminal-only interaction as soon as the question is no longer visual.

## Events

`state_dir/events` is JSON Lines and is cleared when a new screen is pushed. A click has this shape:

```json
{"type":"click","choice":"a","text":"Option A - Single column","timestamp":1706000101}
```

The latest choice is usually the current selection, but earlier clicks can show comparison or hesitation. If the file does not exist, rely only on terminal feedback.

## Cleanup

Stop the server when visual work is finished:

```bash
bash scripts/stop-server.sh "$SESSION_DIR"
```

Project-backed screens remain under `.superpowers/brainstorm/`; temporary sessions are removed by the stop script. Finish or poll the Codex command session after shutdown so no long-running process is left behind.
