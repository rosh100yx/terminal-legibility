# terminal-legibility

**Make your terminal stop fighting you.** An [Agent Skill](https://agentskills.io/specification)
that turns a coding-agent TUI from a wall of text into something you can *squint at and read*.

```text
BEFORE                                AFTER
─────────────────────────────          ─────────────────────────────
[agent] Sure! Let me explore...        [agent] Run: git log -p | delta
        <spinner> <spinner>                   Side-by-side diff, word-
        "I'll take a look at that."            level highlight, no @@ noise
        <200-line unstructured                 Theme: Catppuccin Mocha
         wall of text>                          Font: JetBrains Mono 15pt
        "Let me know if you need               ─────────────────────────
         anything else!"                        ## Next Actions
                                                 - [ ] apply delta config
                                                ## Reflective Questions
                                                 - Do you want side-by-side
                                                   or unified?
```

It attacks the two problems that make a TUI hard to read:

1. **The view** — theme, font, git diffs, and agent verbosity that fight the reader.
2. **The throw-back** — agent responses with no clear next step and no way to see what just
   happened.

## Install

Pick one:

```sh
# Command Code / any Agent-Skills tool: install from GitHub
cmd skills add rosh100yx/terminal-legibility

# or copy the directory into your skills dir
cp -R .agents/skills/terminal-legibility ~/.commandcode/skills/

# or via npm
npx @superbuild/terminal-legibility
```

## Use

Just talk to it:

> "this is too hard to read", "squint", "make the output readable", "readable diffs",
> "tame the firehose", "set up my terminal theme/font"

It runs five phases:

1. **Detect** — `scripts/detect.sh` identifies your terminal, shell, diff tools, and agent configs.
2. **Audit** — flags the contrast / font / diff / verbosity weak spots.
3. **Emit** — a legibility profile: one recommended default + one alternative per layer.
4. **Apply** — copy-paste snippets, or write to config files that already exist (diff-only, never clobbers).
5. **Self-format** — applies a 10-rule output style so *its own* responses lead with the next action and end with Next Actions + Reflective Questions.

## The legibility profile (defaults)

| Layer | Default | Alternative |
|-------|---------|-------------|
| Theme | Catppuccin Mocha (~12:1 contrast) | Gruvbox Dark (warm, low glare) |
| Font | JetBrains Mono (tallest x-height) | Commit Mono (smart kerning) |
| Diff | `delta` as `core.pager` | `difftastic` as a `difft` alias |
| Output | `outputStyle: Concise` (Claude Code) | `viewMode: focus` |

Full, copy-pasteable config lives in [`references/`](references/) — exact ANSI hexes, font flags
per terminal, delta/difftastic/bat gitconfig, and Claude Code / Codex / aider settings.

## The output rules (what the skill makes every agent do)

1. Lead with the next action — command, path, or snippet first.
2. Number multi-step tasks; one bounded action per step.
3. End with one concrete <2-min next action.
4. Cap lists at 5; group and rank.
5. Structure over prose — tables, ASCII trees, checklists.
6. No preamble, recap, or pleasantries.
7. Matter-of-fact errors: cause + fix, never "Uh oh".
8. Restate state every turn ("Step 3 of 5 done").
9. Close open work with `## Next Actions` + `## Reflective Questions`.
10. Pre-send test: reading only the first and last line, do you know what to do next *and* what just happened?

## Layout

```
terminal-legibility/
├── SKILL.md            # the skill (frontmatter + phased body + ruleset)
├── scripts/
│   └── detect.sh       # read-only terminal/shell/tool detection
├── references/
│   ├── themes.md       # Catppuccin Mocha, Gruvbox Dark, Tokyo Night + contrast rules
│   ├── fonts.md        # fonts, size, line-height, ligatures
│   ├── diff-tooling.md # delta, difftastic, bat config
│   └── agent-settings.md # Claude Code / Codex / aider verbosity + theming
└── LICENSE             # MIT
```

## License

MIT — free core, forever. See [LICENSE](LICENSE).
