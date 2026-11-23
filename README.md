# Skills Claude Code : android-material et apple-hig

Deux skills de design pour Claude Code :

- `android-material` : Material Design 3 et Android (composants, tokens, Compose).
- `apple-hig` : Apple Human Interface Guidelines (iOS, macOS, visionOS, etc.).
- `app-audit-upgrade` : audit d'une app (dépendances, avis de sécurité) puis mise à jour sûre dans un worktree Git, avec sauvegarde et vérifications.

## Pourquoi ce skill existe

Un avis de sécurité publié sur une version de Next.js a bloqué le build d'une vraie application : le build refusait de se terminer, donc aucun déploiement ne pouvait partir. La version était visée par sept avis publiés, tous corrigés dans une version plus récente.

Mettre à jour vite, sans vérifier, peut casser l'app. Ne rien faire laisse une faille ouverte. Le skill `app-audit-upgrade` sert à faire les deux choses dans le bon ordre :

1. **Auditer** : savoir exactement ce qui est vulnérable, et ce qui ne l'est pas, avant de toucher à quoi que ce soit.
2. **Mettre à jour dans un worktree séparé** : l'ancien état reste intact, et rien n'est poussé sans accord.
3. **Vérifier** : typecheck, lint, tests, build, puis un nouvel audit qui doit être vide pour la faille corrigée.
4. **Ne pas refaire ce qui existe déjà** : vérifier les branches et les pull requests avant de modifier quoi que ce soit.

Les règles sont les mêmes pour toute app Node, React ou React Native.

## Installation

```bash
git clone URL_DU_DEPOT design-skills
cd design-skills
./install.sh
```

Le script copie les skills dans `~/.claude/skills/`. Si une version existe déjà, elle est renommée `*.backup-AAAAMMJJ-HHMMSS`, rien n'est écrasé.

Pour un autre dossier : `CLAUDE_SKILLS_DIR=/chemin ./install.sh`

Ensuite, ouvre une nouvelle session Claude Code.

## Sources

Les dossiers `.sources/` contiennent des copies de pages Google (Material) et les badges Apple Wallet sont dans `assets/`. Ces contenus appartiennent à leurs auteurs.

---

Publié par RedEagle01.
