# Skills Claude Code : android-material et apple-hig

Deux skills de design pour Claude Code :

- `android-material` : Material Design 3 et Android (composants, tokens, Compose).
- `apple-hig` : Apple Human Interface Guidelines (iOS, macOS, visionOS, etc.).
- `app-audit-upgrade` : audit d'une app (dépendances, avis de sécurité) puis mise à jour sûre dans un worktree Git, avec sauvegarde et vérifications.

## Pourquoi ces skills existent

Une interface générée par défaut ressemble à toutes les autres : mêmes polices, mêmes cartes, mêmes dégradés. Ces deux skills donnent à Claude les règles des références officielles, pour qu'une app ou un site suive les conventions de la plateforme où il tourne :

- **`apple-hig`** : les Apple Human Interface Guidelines (iOS, macOS, visionOS, etc.), avec les sessions WWDC. Pour que les écrans iPhone se comportent comme des écrans Apple : navigation, typographie, mouvement, accessibilité.
- **`android-material`** : Material Design 3 et Android, avec les tokens et les composants Compose. Pour que les écrans Android suivent le système Material plutôt qu'un style inventé à chaque fois.

Le but est simple : des écrans cohérents avec leur plateforme, et une qualité de design qui ne dépend pas du hasard du prompt.

## Installation

En une ligne :

```bash
curl -fsSL https://raw.githubusercontent.com/EagleHeaven/design-skills/main/install.sh | bash
```

Ou en clonant le dépôt :

```bash
git clone https://github.com/EagleHeaven/design-skills.git
cd design-skills
./install.sh
```

Options :

```bash
./install.sh --list          # les skills disponibles et ce que fait chacun
./install.sh apple-hig       # installer seulement les skills nommés
./install.sh --help
```

Avec la ligne `curl`, les options passent après `bash -s --`, par exemple `... | bash -s -- apple-hig`.

Le script copie les skills dans `~/.claude/skills/`. Si une version existe déjà, elle est renommée `*.backup-AAAAMMJJ-HHMMSS`, rien n'est écrasé. Pour un autre dossier : `CLAUDE_SKILLS_DIR=/chemin ./install.sh`. Pour couper les couleurs : `NO_COLOR=1`.

Ensuite, ouvre une nouvelle session Claude Code.

## Sources

Les dossiers `.sources/` contiennent des copies de pages Google (Material) et les badges Apple Wallet sont dans `assets/`. Ces contenus appartiennent à leurs auteurs.

---

Publié par RedEagle01.
