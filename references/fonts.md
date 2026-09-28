# Fonts — size, weight, line-height, ligatures

The legibility levers at terminal sizes, in order of cost-per-pixel: **x-height > weight >
line-height > size**. Get these right before touching the palette.

## Recommended: JetBrains Mono

Tallest x-height of the mainstream coding fonts, ~138 ligatures across 8 weights, free. The
default pick.

| Font | x-height | Ligatures | Notes |
|------|----------|-----------|-------|
| **JetBrains Mono** | tallest | ~138 | Recommended default |
| Fira Code | regular | ~200 (largest set) | widest ligature range |
| Cascadia Code | regular | wide | true cursive italics for comments |
| Commit Mono | regular | basic | "smart kerning" — best newer entrant |
| IBM Plex Mono | regular | none | most neutral/plain |
| MonoLisa / Berkeley Mono | n/a | n/a | commercial; claims self-published |

## Size and line-height

- **Size:** 14pt is the floor for sustained reading on a modern Mac; 15–16pt is not indulgent.
- **Line-height:** a little extra leading — **~1.2** — buys more readability per pixel than a
  size bump. If the terminal exposes line spacing, that's the cheapest win. (Do **not** apply the
  editor/web rule of 1.4–1.6 to a terminal cell grid.)
- **Width:** 100–120 columns is fine; the 80-column convention is a punch-card artifact.

Per-terminal flags:

- **Kitty:** `modify_font cell_height -2px` (or `%`), `modify_font baseline 3`
- **Ghostty:** `adjust-cell-height = 20%`, `adjust-cell-width`, `adjust-font-baseline`
- **WezTerm:** `line_height` in the font table; diagnose with `wezterm ls-fonts`

## Ligatures: off (or break under the cursor)

Ligatures merge characters (`=>` becomes one glyph), which can be harder to parse in unfamiliar
code and is *guaranteed* to be wrong sometimes. The right default is off — or enable them but
break under the cursor so editing stays unambiguous:

- **Kitty:** `disable_ligatures cursor` (also `always` / `never`, toggle per-window with
  `map alt+1 disable_ligatures_in active always`)
- **Ghostty:** `font-feature = -calt, -liga, -dlig`

## Non-negotiables

- **Slashed or dotted zero** — on. Kitty: `font_features FiraCode-Retina +zero +onum`
- **Regular or Medium weight only** — never Light/Thin.
- **`l` / `1` / `I` must be distinguishable** — if you can't tell them apart at a glance, the
  font fails you. SF Mono and Recursive have a known `1`/`l` confusion; avoid for this use.

## Quick test

Type `Il1|O0` and a `=>` in the terminal at your working size. If any two glyphs blur together,
change size, weight, or ligature setting before changing anything else.
