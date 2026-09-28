# Agent output settings — quiet the firehose

The single highest-leverage change is **not a theme — it's the output mode.** An output style
modifies the system prompt (every response); `CLAUDE.md` is just a user message that drifts.
Do the output-mode fix first, then tune the terminal.

## Claude Code

### Output style (do this first)

```jsonc
// ~/.claude/settings.json
{
  "outputStyle": "Concise"
}
```

Or run `/output-style concise` (needs v2.1.237+). **Concise** cuts measured output ~38% vs
default: first sentence states the answer, no lead-in/step-narration/recap, one-to-three
sentences for simple questions — but still full-length for anything you explicitly ask for, and
it preserves error reports, failing test output, and security warnings.

### Other noise-killers

```jsonc
{
  "maxProseWidth": 90,            // cap prose width in a wide terminal
  "viewMode": "focus",            // default | verbose | focus
  "bashOutputMaxChars": 30000,    // cap successful-command output
  "prefersReducedMotion": true,   // kill spinners/shimmer/flash
  "showTurnDuration": false       // hide "Cooked for" line
}
```

### Custom theme — make diffs pop

Themes live in `~/.claude/themes/<slug>.json` (watched + reloaded live). Use `base: dark-ansi`
to inherit your terminal palette, and override the diff tokens:

```json
{
  "name": "legible-mocha",
  "base": "dark-ansi",
  "overrides": {
    "diffAdded": "#14532d",
    "diffRemoved": "#7f1d1d",
    "diffAddedWord": "#86efac",
    "diffRemovedWord": "#fca5a5",
    "claude": "#89b4fa",
    "success": "#a6e3a1",
    "error": "#f38ba8"
  }
}
```

Token names that matter for diff legibility: `diffAdded`, `diffRemoved`, `diffAddedWord`,
`diffRemovedWord`, `diffAddedDimmed`, `diffRemovedDimmed`, plus `text`, `subtle`, `inactive`.
Create interactively with `/theme` → New custom theme; `Ctrl+E` to edit the highlighted theme.

## Codex CLI

```toml
# $CODEX_HOME/config.toml
hide_agent_reasoning = true      # suppress reasoning noise (CI logs, etc.)
model_verbosity = "low"
model_reasoning_summary = "none"

[tui]
animations = false               # kill ASCII animations + shimmer
alternate_screen = "never"       # KEEP terminal scrollback (most useful single flag)
show_tooltips = false
theme = "dracula"                # set via /theme; custom = .tmTheme in $CODEX_HOME/themes
```

- `/theme` opens a live-preview picker; Codex uses syntect (same engine as bat) so bat themes
  carry over as `.tmTheme` files.
- Status line (footer): `tui.status_line = null` disables it and reclaims a row on a 13" laptop.

## aider

```yaml
# ~/.aider.conf.yml
user-input-color: "#cdd6f4"
assistant-output-color: "#a6e3a1"
tool-output-color: "#89b4fa"
tool-error-color: "#f38ba8"
code-theme: monokai        # Pygments-style names
dark-mode: true
```

Separating input / output / tool / error colors by hue is the single biggest aider readability
win — you can tell at a glance who said what.

## Universal rule

Set the **terminal color scheme first** (covers Cursor CLI, aider, Claude Code, Codex, Gemini at
once), then layer the agent's own output mode, then tune the agent's own colors only if it's your
daily driver.
