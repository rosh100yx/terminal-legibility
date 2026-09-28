#!/usr/bin/env bash
# Detect the terminal, shell, and installed diff/browse tools for the
# terminal-legibility skill. Read-only — never modifies anything.
set -u

have() { command -v "$1" >/dev/null 2>&1 && echo "yes" || echo "no"; }

echo "== Terminal =="
echo "TERM_PROGRAM   : ${TERM_PROGRAM:-<unset>}"
echo "TERM           : ${TERM:-<unset>}"
echo "COLORTERM      : ${COLORTERM:-<unset>} (truecolor if 'truecolor' or '24bit')"
echo "TERMINAL_EMULATOR: ${TERMINAL_EMULATOR:-<unset>}"

echo
echo "== Shell =="
echo "SHELL          : ${SHELL:-<unset>}"

echo
echo "== Config dirs present =="
for d in \
  "$HOME/.config/wezterm" \
  "$HOME/.config/kitty" \
  "$HOME/.config/alacritty" \
  "$HOME/.config/ghostty" \
  "$HOME/.config/bat" \
  "$HOME/.config/delta" \
  "$HOME/.warp" \
  "$HOME/.claude" \
  "${CODEX_HOME:-$HOME/.codex}" \
  "$HOME/.config/aider"; do
  if [ -d "$d" ]; then echo "present : $d"; else echo "absent  : $d"; fi
done

echo
echo "== Config files present =="
for f in \
  "$HOME/.wezterm.lua" \
  "$HOME/.config/kitty/kitty.conf" \
  "$HOME/.config/alacritty/alacritty.toml" \
  "$HOME/.config/alacritty/alacritty.yml" \
  "$HOME/.config/ghostty/config" \
  "$HOME/.gitconfig" \
  "$HOME/.claude/settings.json" \
  "${CODEX_HOME:-$HOME/.codex}/config.toml" \
  "$HOME/.aider.conf.yml"; do
  if [ -e "$f" ]; then echo "present : $f"; else echo "absent  : $f"; fi
done

echo
echo "== Tools installed =="
for t in delta bat difftastic eza fzf gh git; do
  printf "%-12s: %s\n" "$t" "$(have "$t")"
done

echo
echo "== Current git pager =="
git config --get core.pager 2>/dev/null || echo "<unset> (default pager)"
