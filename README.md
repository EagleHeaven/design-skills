# design skills pour Claude Code

Un kit pour que Claude Code dessine des sites et des apps qui ressemblent à du travail de studio, et qui suivent les règles d'Apple et d'Android.

## Pourquoi ces skills existent

Une interface générée par défaut ressemble à toutes les autres : mêmes polices, mêmes cartes, mêmes dégradés. Ce kit donne à Claude des règles de design précises, pour qu'une app ou un site suive les conventions de sa plateforme et garde une vraie direction visuelle :

- **`elevate-ui`** : fait passer un site ou un écran d'app d'un rendu « modèle » à un rendu de studio. Il s'appuie sur des références éditoriales (Typewolf, Awwwards, Land-book, Godly, Mobbin, Coolors) : une direction claire, une grille fine, une échelle typographique, peu de mouvement, et une vérification sur téléphone.
- **`apple-hig`** : les Apple Human Interface Guidelines (iOS, macOS, visionOS, etc.), avec les sessions WWDC. Pour que les écrans iPhone se comportent comme des écrans Apple : navigation, typographie, mouvement, accessibilité.
- **`android-material`** : Material Design 3 et Android, avec les tokens et les composants Compose. Pour que les écrans Android suivent le système Material.

Le but est simple : des écrans cohérents avec leur plateforme, et une qualité de design qui ne dépend pas du hasard du prompt.

## Ce que le kit installe

| Quoi | Source | Rôle |
|---|---|---|
| `elevate-ui`, `apple-hig`, `android-material` | ce dépôt | nos skills, copiés dans `~/.claude/skills/` |
| skills d'Emil Kowalski | [emilkowalski/skills](https://github.com/emilkowalski/skills) | animation, gestes, design engineering |
| taste-skill | [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) | sites qui ne ressemblent pas à de l'IA |
| plugin `frontend-design` | Anthropic | design frontend distinctif |
| plugin `impeccable` | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | audit et finition du design |

Les skills partenaires et les plugins sont installés depuis leurs auteurs, à jour, jamais copiés ici.

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
./install.sh --list          # tout ce que le kit installe
./install.sh --core          # seulement nos skills, sans partenaires ni plugins
./install.sh apple-hig       # seulement les skills nommés de ce dépôt
./install.sh --help
```

Avec la ligne `curl`, les options passent après `bash -s --`, par exemple `... | bash -s -- --core`.

Nos skills vont dans `~/.claude/skills/`. Si une version existe déjà, elle est renommée `*.backup-AAAAMMJJ-HHMMSS`, rien n'est écrasé. Les skills partenaires demandent Node.js (`npx`), les plugins demandent la commande `claude`. Pour un autre dossier : `CLAUDE_SKILLS_DIR=/chemin ./install.sh`. Pour couper les couleurs : `NO_COLOR=1`.

Ensuite, ouvre une nouvelle session Claude Code.

Pour la sécurité, voir le kit séparé : [cybersec-skills](https://github.com/EagleHeaven/cybersec-skills).

## Sources

Les dossiers `.sources/` contiennent des copies de pages Google (Material) et les badges Apple Wallet sont dans `assets/`. Ces contenus appartiennent à leurs auteurs.

---

Publié par RedEagle01.
