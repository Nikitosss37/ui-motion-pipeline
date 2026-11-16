#!/usr/bin/env bash
# Install the ui-motion-pipeline skill.
#   ./install.sh            -> ~/.claude/skills (all projects)
#   ./install.sh --project  -> ./.claude/skills (current project)
set -euo pipefail

src="$(cd "$(dirname "$0")" && pwd)/skills/ui-motion-pipeline"
if [ "${1:-}" = "--project" ]; then
  dest="$PWD/.claude/skills"
else
  dest="$HOME/.claude/skills"
fi

mkdir -p "$dest"
rm -rf "$dest/ui-motion-pipeline"
cp -r "$src" "$dest/"
echo "Installed to $dest/ui-motion-pipeline"
echo "Restart Claude Code, then run: /ui-motion-pipeline <screen or file>"
