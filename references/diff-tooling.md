# Git diff tooling — delta, difftastic, bat

Two tools, two jobs: **delta** is the daily driver (fast, works on huge diffs), **difftastic**
is the opt-in second opinion (syntax-aware, ignores formatting-only changes). Use delta as the
pager; keep difftastic behind an alias, never as `core.pager` — it chews memory on very large
diffs.

## Recommended: delta as `core.pager`

Baseline `~/.gitconfig`:

```gitconfig
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true          # n / N move between hunks
    side-by-side = true      # or false for unified
    dark = true              # or light = true, or omit to auto-detect

[merge]
    conflictStyle = zdiff3
```

The minimal-gutter recipe (the highest-value delta trick for agent diffs — removes the noisy
`@@ -5,6 +7 @@` noise and strips `-/+` markers so code copies straight out):

```gitconfig
[delta]
    side-by-side = true
    line-numbers-left-format = ""
    line-numbers-right-format = "│ "
```

Use **ANSI color names** (not hex) in delta styles so it follows the terminal theme automatically:
`--plus-style 'green'`, `--minus-style 'red'`, `--file-style blue`. If you switch palettes later,
delta's colors follow for free.

### Named feature groups (keep config organized)

```gitconfig
[delta "unobtrusive-line-numbers"]
    line-numbers = true
    line-numbers-minus-style = "#444444"
    line-numbers-zero-style = "#444444"
    line-numbers-plus-style = "#444444"
    line-numbers-left-format = "{nm:>4}┊"
    line-numbers-right-format = "{np:>4}│"
    line-numbers-left-style = blue
    line-numbers-right-style = blue
```

Activate with `features = unobtrusive-line-numbers`, override at runtime with
`DELTA_FEATURES=+side-by-side` or reset with `DELTA_FEATURES=+`.

### Flags that matter for agent output

- `--wrap-max-lines 2` (default) — `0` never wraps, `unlimited` wraps as needed.
- `--hunk-header-style omit` and `--file-style omit` — kill decoration.
- `--syntax-theme none` — disable highlighting; default follows `BAT_THEME`.
- `--paging auto|always|never` — set `never` inside another TUI.
- Preview themes live: `git show | delta --show-syntax-themes`.

## Alternative: difftastic as a `difft` alias

Structural, tree-sitter-based diff. Shows *real* line numbers (not `@@` ranges) and **ignores
formatting-only changes** — exactly what makes an agent's diff unreadable.

```sh
# in ~/.gitconfig — an alias, NOT core.pager
[alias]
    difft = -c diff.external=difft diff
```

```sh
# one-off, without the alias
git log -p --ext-diff
```

Use it when you're reviewing logic, not formatting. Switch back to delta for diffs over ~10k
lines.

## bat — reading files (and file-level diffs)

```sh
# config file: ~/.config/bat/config  (one arg per line)
--style=plain
--paging=never
--theme=ansi          # adapts to terminal theme, even already-printed output
```

- `--style=plain` disables all decoration; `numbers,changes,header` is the middle ground.
- `BAT_THEME=ansi` makes bat follow your 16-color palette (coherent with delta + agent).
- `--strip-ansi=auto` and `--sanitize=always` clean garbled ANSI from agent output you pipe in.
- File-level diff recipe:
  ```sh
  batdiff() {
    git diff --name-only --relative --diff-filter=d -z | xargs -0 bat --diff
  }
  ```

## Full stack for a diff-heavy session

```sh
git config --global core.pager delta
git config --global delta.side-by-side true
git config --global delta.navigate true
git config --global delta.line-numbers-left-format ""
git config --global delta.line-numbers-right-format "│ "
git config --global alias.difft '-c diff.external=difft diff'
```
