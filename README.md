# Meus Mods

Mods do Claude Code (app desktop) que eu uso.

| Mod | O que faz |
| --- | --- |
| [limite-diario](limite-diario) | Reparte o limite semanal em 7 dias e mostra, por baixo do prompt, quanto dá para gastar hoje. O que sobra de um dia acumula para o seguinte. |
| [Claude-Fables](Claude-Fables) | Transforma o que o Claude está a fazer em pequenos desenhos animados acima do prompt. Cópia de [henrik-thevibe/Claude-Fables](https://github.com/henrik-thevibe/Claude-Fables) (licença MIT, commit `6d0ce80`), com um ajuste local em `hooks/narrator.ts`. |

## Instalar

Clonar este repositório e apontar o `env` de `~/.claude/settings.json` para as pastas dos mods, separadas por `;` no Windows (`:` em macOS/Linux):

```json
{
  "env": {
    "CLAUDE_CODE_PLUGIN_DIRS": "C:/Users/voce/code/Meus_Mods/Claude-Fables;C:/Users/voce/code/Meus_Mods/limite-diario"
  }
}
```

Depois reiniciar a app.
