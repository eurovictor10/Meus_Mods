#!/bin/sh
# Mostra o que pôr no settings.json para instalar os mods deste repositório
# no Claude Code (macOS/Linux).
set -e
root=$(cd "$(dirname "$0")" && pwd)

cat <<EOF
Ponha isto no bloco "env" de ~/.claude/settings.json (juntando a pastas que
já lá estejam, separadas por ":") e reinicie a app do Claude:

  "CLAUDE_CODE_PLUGIN_DIRS": "$root/Claude-Fables:$root/limite-diario"
EOF
