# Render — make markdown output glamorous (Charm layer)

The missing legibility layer: **raw markdown in the terminal is noise.** Headings, lists, code
blocks, and tables are only readable once they are *styled*. This is the fix for "I can't read
the product doc / the agent's wall of text."

Charm's thesis: the command line doesn't have to be ugly. Two tools do the heavy lifting.

## Recommended: Glow — read markdown with pizzazz

Render markdown (agent output, product docs, READMEs) as styled terminal text instead of raw
`##`, `-`, and backticks.

```sh
brew install glow
```

### Read a file

```sh
glow README.md
glow _vault/Superbuild/Brand/brand-strategy-v1.md
```

### Read from stdin — the agent-output trick

Pipe agent responses or any markdown straight in:

```sh
some-agent | glow -
echo "# Heading\n- item\n\`code\`" | glow -
```

### Read a product doc you've been squinting at

```sh
glow < path/to/doc.md
```

### Key flags

- `glow` (no args) — interactive TUI, browse all markdown under the current dir or repo. `?` lists hotkeys; `less`-style navigation.
- `-w 80` — word-wrap at a column width (solves the "100-char lines are unreadable" problem).
- `-p` — pipe to your pager (defaults to `less -r`, ANSI-aware).
- `-s dark` / `-s light` — force a style; by default Glow auto-detects your terminal background.
- `-s mystyle.json` — custom JSON stylesheet (the Glamour style format).

Persist defaults in `~/.config/glow/glow.yml`:

```yaml
style: "dark"       # or "light", or "auto"
pager: true
width: 90
mouse: true
showLineNumbers: false
```

### Why this beats raw output

- **Headings** get real visual weight instead of `##`.
- **Lists and tables** get alignment and spacing.
- **Code blocks** get a background and monospace treatment.
- The whole thing respects your terminal palette — no manual formatting.

## Alternative: gum — glamorous, scriptable

`gum` is Charm's shell-script UI kit. Two things matter for legibility:

### 1. Syntax-highlight a code dump on the fly

```sh
cat main.ts | gum format -t code
```

This is the one-liner fix for "the agent dumped a 400-line file with no highlighting."

### 2. Render markdown / templates / emoji

```sh
echo "# Title\n- a\n- b" | gum format          # markdown
echo '{{ Bold "x" }} {{ Color "99" "y" }}' | gum format -t template
```

### 3. Build an interactive legibility picker (setup flow)

```sh
# pick a theme, confirm, apply — all with a real TUI instead of y/n prompts
THEME=$(gum choose "Catppuccin Mocha" "Gruvbox Dark" "Tokyo Night")
gum confirm "Write $THEME to your config?" && apply_theme "$THEME"
```

`gum choose` / `gum confirm` / `gum input` / `gum filter` turn a yes/no setup script into a
navigable menu — which is exactly what a "set the view" flow should feel like.

## Style principles (Lip Gloss / Glamour — the design language)

- **Borders and spacing beat color.** Padding and a border make text scannable; color is seasoning.
- **Auto dark/light.** Let the terminal background decide the base; don't hardcode one mood.
- **Respect the palette.** Style with ANSI names or the active theme, not raw hex, so it adapts.
- **Legible, not flashy.** "Glamorous" = styled headings and aligned tables, not rainbow text.

Install both in one go:

```sh
brew install glow gum
```
