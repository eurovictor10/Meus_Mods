# Meus Mods

Mods do Claude Code (app desktop) que eu uso.

| Mod | O que faz |
| --- | --- |
| [limite-diario](limite-diario) | Reparte o limite semanal em 7 dias e mostra, por baixo do prompt, quanto dá para gastar hoje. O que sobra de um dia acumula para o seguinte. |
| [Claude-Fables](Claude-Fables) | Transforma o que o Claude está a fazer em pequenos desenhos animados acima do prompt. É a cópia que eu uso do [Claude-Fables do henrik-thevibe](https://github.com/henrik-thevibe/Claude-Fables) (licença MIT), com as legendas em português do Brasil. |

## Instalar

Precisa do [Git](https://git-scm.com) e da app desktop do Claude.

**Windows** (PowerShell):

```powershell
git clone https://github.com/eurovictor10/Meus_Mods.git
powershell -ExecutionPolicy Bypass -File Meus_Mods\instalar.ps1
```

O script acrescenta as duas pastas a `CLAUDE_CODE_PLUGIN_DIRS` em `~/.claude/settings.json` (guarda antes uma cópia em `settings.json.bak`).

**macOS / Linux**:

```sh
git clone https://github.com/eurovictor10/Meus_Mods.git
sh Meus_Mods/instalar.sh
```

O script mostra a linha a pôr no `settings.json`.

Depois, reiniciar a app do Claude.

Não apague nem mude a pasta `Meus_Mods` de sítio depois de instalar: é de lá que a app carrega os mods.

## Atualizar

`git pull` nesta pasta traz as novidades dos dois mods.
