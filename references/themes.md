# Terminal themes — legibility-first palettes

Rule that beats palette choice: **contrast is the fix, not the hue.** Enforce a floor of ~4.5:1
for body text, 7:1 if you read all day. The slot that fails most is **bright-black / dim** —
used for comments, timestamps, and agent "reasoning" text. If that slot looks grey-on-grey, the
palette is failing you even if it looks pretty.

## Recommended: Catppuccin Mocha (~12:1 fg/bg)

Largest ecosystem (ports for every terminal, editor, and agent). Legible, muted-but-not-muddy.

```
background  #1e1e2e
foreground  #cdd6f4

color0  #45475a    color8   #585b70
color1  #f38ba8    color9   #f37799
color2  #a6e3a1    color10  #89d88b
color3  #f9e2af    color11  #ebd391
color4  #89b4fa    color12  #74a8fc
color5  #f5c2e7    color13  #f2aede
color6  #94e2d5    color14  #6bd7ca
color7  #a6adc8    color15  #bac2de
```

Note: the "bright" variants are *more saturated*, not brighter — this is intentional and keeps
screenshots from washing out. For a lighter alternative, Catppuccin Latte is the light flavor.

## Alternative: Gruvbox Dark (warm, low glare)

Widely rated the most comfortable for long sessions. Slightly lower max contrast but warm tones
reduce perceived glare on OLED/low-brightness displays.

```
background  #282828          # "soft" = #32302f, "hard" = #1d2021
foreground  #ebdbb2

color0  #282828    color8   #928374
color1  #cc241d    color9   #fb4934
color2  #98971a    color10  #b8bb26
color3  #d79921    color11  #fabd2f
color4  #458588    color12  #83a598
color5  #b16286    color13  #d3869b
color6  #689d6a    color14  #8ec07c
color7  #a89984    color15  #ebdbb2
```

## Third option: Tokyo Night

Excellent for screenshots, but its comment/dim colors can vanish on low-brightness displays —
only pick it if you keep brightness up.

```
background  #1a1b26
foreground  #c0caf5

color0  #15161e    color8   #414868
color1  #f7768e    color9   #ff899d
color2  #9ece6a    color10  #9fe044
color3  #e0af68    color11  #faba4a
color4  #7aa2f7    color12  #8db0ff
color5  #bb9af7    color13  #c7a9ff
color6  #7dcfff    color14  #a4daff
color7  #a9b1d6    color15  #c0caf5
```

## Mechanical contrast enforcement

Don't trust your eyes — enforce it in the terminal:

- **Ghostty:** `minimum-contrast = 3` (3+ is the "easy to read" range).
- **Kitty:** `text_fg_override_threshold 4.5 ratio` (HSLuv-corrected, "meets WCAG AA").

## Palette self-check (run in the terminal)

Prints all 16 ANSI slots as colored samples — look for any line you can't read at a glance.

```sh
for i in {0..15}; do printf "\e[38;5;${i}m%3d ██ The quick brown fox\e[0m\n" $i; done
```

The `dim`/`bright-black` slot (index 8) is the one to judge hardest — it's where agent reasoning
and comments live.

## Selection / diff background rule (from Catppuccin's style guide)

Keep selection and diff backgrounds from swamping the text:
- Selection background = overlay color at **20–30% opacity**.
- Changed text background = **10–20%**, changed line = **15–25%**.
