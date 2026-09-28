# Credits & Sources

`terminal-legibility` stands on a few shoulders. The skill is our own work, but the concrete
values and techniques it emits come from these projects and references. Links live here, not in
the skill body, so the README and SKILL.md stay self-contained.

## Format

- **Agent Skills specification** — the open `SKILL.md` format this skill conforms to.
  - Spec: https://agentskills.io/specification
  - Repo: https://github.com/agentskills/agentskills

## Design philosophy & rendering layer

- **Charm** — "we make the command line glamorous." The render layer (and much of the
  legibility taste) is learned from Charm's approach to styled terminal output.
  - Home: https://charm.land
  - **Glow** — markdown reader (the recommended render tool): https://github.com/charmbracelet/glow
  - **Glamour** — stylesheet-driven markdown renderer: https://github.com/charmbracelet/glamour
  - **gum** — scriptable terminal UI (the alternative render/setup tool): https://github.com/charmbracelet/gum
  - **Lip Gloss** — terminal styling/layout library (the design language): https://github.com/charmbracelet/lipgloss

## Themes

- **Catppuccin** — Mocha palette (recommended default): https://github.com/catppuccin/catppuccin
- **Gruvbox** — the alternative warm palette: https://github.com/morhetz/gruvbox
- **Tokyo Night** — third option: https://github.com/folke/tokyonight.nvim

## Fonts

- **JetBrains Mono** (recommended default): https://www.jetbrains.com/lp/mono/
- **Fira Code**: https://github.com/tonsky/FiraCode
- **Cascadia Code**: https://github.com/microsoft/cascadia-code
- **Commit Mono**: https://commitmono.com
- **IBM Plex Mono**: https://github.com/IBM/plex

## Diff tooling

- **delta** (recommended default pager): https://github.com/dandavison/delta
- **difftastic** (structural-diff alternative): https://difftastic.wilfred.me.uk
- **bat** (file/syntax reader): https://github.com/sharkdp/bat

## Agent output settings

- **Claude Code** — output styles & settings: https://code.claude.com/docs/en/output-styles
- **Codex CLI** — configuration: https://github.com/openai/codex
- **aider** — options reference: https://aider.chat/docs/config/options.html

## Output-formatting ruleset

The 10-rule self-formatting style is our own, but it was shaped by the **i-have-adhd** skill's
approach to scannable agent responses:

- https://github.com/ayghri/i-have-adhd
