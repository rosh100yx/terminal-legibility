<div align="center">
  <img src="https://raw.githubusercontent.com/rosh100yx/terminal-legibility/main/assets/cover.png" alt="terminal-legibility — make your terminal stop fighting you" width="100%" />
  <h1>terminal-legibility</h1>
  <p><b>Make your terminal stop fighting you.</b></p>
  <p><i>An Agent Skill that turns a coding-agent TUI from a wall of text into something you can squint at and read — legible themes, fonts, diffs, rendering, and a self-formatting output style.</i></p>
  <br/>

  <p>
    <a href="https://www.npmjs.com/package/terminal-legibility"><img src="https://img.shields.io/npm/v/terminal-legibility?style=for-the-badge&color=cb3837&logo=npm" alt="npm" /></a>
    <a href="https://www.npmjs.com/package/terminal-legibility"><img src="https://img.shields.io/npm/dm/terminal-legibility?style=for-the-badge&color=cb3837&logo=npm" alt="npm downloads" /></a>
    <a href="https://github.com/rosh100yx/terminal-legibility"><img src="https://img.shields.io/github/stars/rosh100yx/terminal-legibility?style=for-the-badge&color=ffdd57&logo=github" alt="GitHub stars" /></a>
    <a href="https://github.com/rosh100yx/terminal-legibility/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License" /></a>
  </p>

  <p>
    <b>Get started:</b><br/>
    <code>cmd skills add rosh100yx/terminal-legibility</code><br/>
    <sub>No dependencies. Works with any tool that follows the Agent Skills format (format + attributions in <a href="CREDITS.md">CREDITS.md</a>).</sub>
  </p>
  <br/>
</div>

<div align="center">
  <img src="https://raw.githubusercontent.com/rosh100yx/terminal-legibility/main/assets/before-after.png" alt="before and after — raw markdown vs styled output" width="90%" />
</div>

## The two problems it fixes

1. **The view** — theme, font, git diffs, rendering, and agent verbosity that fight the reader.
2. **The throw-back** — agent responses and raw markdown with no clear next step and no way to
   see what just happened.

## Install

Pick one:

```sh
# Command Code / any Agent-Skills tool: install from GitHub
cmd skills add rosh100yx/terminal-legibility

# or copy the directory into your skills dir
cp -R terminal-legibility ~/.commandcode/skills/

# or install as a versioned package
npm install terminal-legibility
```

## Use

Just talk to it:

> "this is too hard to read", "squint", "make the output readable", "readable diffs",
> "tame the firehose", "set up my terminal theme/font"

It runs five phases:

1. **Detect** — `scripts/detect.sh` identifies your terminal, shell, diff tools, and agent configs.
2. **Audit** — flags the contrast / font / diff / render / verbosity weak spots.
3. **Emit** — a legibility profile: one recommended default + one alternative per layer.
4. **Apply** — copy-paste snippets, or write to config files that already exist (diff-only, never clobbers).
5. **Self-format** — applies a 10-rule output style so *its own* responses lead with the next action and end with Next Actions + Reflective Questions.

## The legibility profile (defaults)

| Layer | Default | Alternative |
|-------|---------|-------------|
| Theme | Catppuccin Mocha (~12:1 contrast) | Gruvbox Dark (warm, low glare) |
| Font | JetBrains Mono (tallest x-height) | Commit Mono (smart kerning) |
| Diff | `delta` as `core.pager` | `difftastic` as a `difft` alias |
| Render | `glow -` for docs / agent output | `gum format -t code` |
| Output | `outputStyle: Concise` (Claude Code) | `viewMode: focus` |

Full, copy-pasteable config lives in [`references/`](references/) — exact ANSI hexes, font flags
per terminal, delta/difftastic/bat gitconfig, glow/gum rendering, and Claude Code / Codex /
aider settings. Attributions for all of the above are in [CREDITS.md](CREDITS.md).

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
│   ├── detect.sh       # read-only terminal/shell/tool detection
│   └── verify.sh       # validates SKILL.md before publish
├── references/
│   ├── themes.md       # Catppuccin Mocha, Gruvbox Dark, Tokyo Night + contrast rules
│   ├── fonts.md        # fonts, size, line-height, ligatures
│   ├── diff-tooling.md # delta, difftastic, bat config
│   ├── rendering.md    # glow, gum, Lip Gloss/Glamour style
│   └── agent-settings.md # Claude Code / Codex / aider verbosity + theming
├── assets/             # cover + before/after images
├── .github/workflows/  # CI + npm release on tag
├── CREDITS.md          # attributions & source links
└── LICENSE             # MIT
```

## License

MIT — free core, forever. See [LICENSE](LICENSE).
