# Meus Mods

Mods do Claude Code (app desktop) que eu uso.

| Mod | O que faz |
| --- | --- |
| [limite-diario](limite-diario) | Reparte o limite semanal em 7 dias e mostra, por baixo do prompt, quanto dá para gastar hoje. O que sobra de um dia acumula para o seguinte. |
| [Claude-Fables](https://github.com/henrik-thevibe/Claude-Fables) | Transforma o que o Claude está a fazer em pequenos desenhos animados acima do prompt. É do henrik-thevibe e não fica guardado aqui: uso um clone do repositório dele, para receber as atualizações com `git pull`. |

## Instalar

Clonar este repositório e o do Claude-Fables, e apontar o `env` de `~/.claude/settings.json` para as pastas dos mods, separadas por `;` no Windows (`:` em macOS/Linux):

```json
{
  "env": {
    "CLAUDE_CODE_PLUGIN_DIRS": "C:/Users/voce/code/Claude-Fables;C:/Users/voce/code/Meus_Mods/limite-diario"
  }
}
```

Depois reiniciar a app.
