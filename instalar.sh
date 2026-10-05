#!/bin/sh
# Instala os mods deste repositório no Claude Code (macOS/Linux):
# baixa o Claude-Fables do autor e diz o que pôr no settings.json.
# Correr de novo atualiza o Claude-Fables para a versão mais recente do autor.
set -e
root=$(cd "$(dirname "$0")" && pwd)

git -C "$root" submodule update --init --remote Claude-Fables

cat <<EOF
Claude-Fables baixado. Agora ponha isto no bloco "env" de ~/.claude/settings.json
(juntando a pastas que já lá estejam, separadas por ":") e reinicie a app do Claude:

  "CLAUDE_CODE_PLUGIN_DIRS": "$root/Claude-Fables:$root/limite-diario"
EOF
