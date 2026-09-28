# Launch copy — ready to post

Swap `{repo}` for the final URL before posting. Each is written to be pasted as-is.

## Hacker News — Show HN

**Show HN: terminal-legibility — an agent skill that makes your TUI stop fighting you**

I kept squinting at my terminal and losing the thread of what the agent actually did. The wall
of thrown-back text, the `@@ -5,6 +7 @@` noise, the spinners, the "Sure! Let me take a look…"
preamble — none of it told me what to do next.

So I made it a skill. It does two things:

1. Sets the view — Catppuccin/Gruvbox themes with enforced contrast, JetBrains Mono with
   ligatures off, delta for side-by-side word-highlighted diffs, difftastic behind an alias,
   and the output-mode knobs for Claude Code / Codex / aider.
2. Fixes the throw-back — a 10-rule output style: lead with the next action, cap lists at 5,
   no preamble or "anything else?", end with `Next Actions` + `Reflective Questions`.

MIT, no deps, works with any Agent-Skills tool (and plain Claude Code via a copy into
`~/.claude/skills`). The one rule I'd love feedback on: the "first line / last line" test — if
a reader only reads those two lines, do they know what to do next *and* what just happened?

Repo: {repo}

## X / Twitter

My terminal finally stopped fighting me.

`terminal-legibility` — an agent skill that makes Claude Code / Codex / aider output scannable:
- Catppuccin + enforced contrast, JetBrains Mono, ligatures off
- delta for readable diffs (no more `@@` noise)
- a 10-rule output style: next action first, no "Sure!", ends with Next Actions + Reflective Questions

MIT, no deps. {repo}

## dev.to / blog

**Your terminal is lying to you about what the agent did.**

The problem isn't the model — it's the medium. A coding-agent TUI throws back walls of text,
`@@ -5,6 +7 @@` hunk noise, spinners, and "Let me know if you need anything else!" — with no
clear answer to the only two questions that matter: *what do I do next?* and *what just happened?*

`terminal-legibility` is an Agent Skill that fixes both halves.

**Half 1 — set the view.** A legibility profile: Catppuccin Mocha (≈12:1 contrast) or Gruvbox
Dark, JetBrains Mono at 15pt with ligatures off, `delta` as the git pager with side-by-side
word-level highlight, `difftastic` as an opt-in alias, and the exact verbosity/theming settings
for Claude Code (`outputStyle: Concise`), Codex (`hide_agent_reasoning`), and aider.

**Half 2 — fix the throw-back.** A ten-rule output style the agent applies to itself: lead with
the next action, cap lists at five, no preamble or recap, matter-of-fact errors, and close with
`## Next Actions` + `## Reflective Questions`. The linchpin is a pre-send test — if you read only
the first and last line, do you know what to do next and what just happened?

MIT, no dependencies, works with any tool that follows the Agent Skills spec. Copy the folder in
or `cmd skills add`.

{repo}

## Launch checklist

- [ ] `git init` in the skill dir and commit (`SKILL.md`, `references/`, `scripts/`, `README.md`, `LICENSE`, `package.json`, `LAUNCH.md`)
- [ ] create the GitHub repo + push
- [ ] `npm publish --access public` (scope `@superbuild`)
- [ ] list on https://agentskills.io if a submission path exists
- [ ] post the HN + X + dev.to copy, linking the repo
