---
name: app-audit-upgrade
description: Audits a Node, React, Next.js or React Native app for known security advisories and outdated dependencies, then upgrades safely in a separate git worktree with a backup, duplicate checks, lockfile install, and verification. Use when asked to audit an app, check its security, upgrade Next.js or another framework, or fix a published advisory.
---

# App audit and upgrade

Goal: find what is vulnerable or outdated, upgrade only what is needed, prove it works, and leave the original checkout untouched until the user says so.

## Rules

1. **Back up before any change.** Copy `package.json` and the lockfile with a timestamp suffix (`package.json.backup-YYYYMMDD-HHMMSS`) before editing. Never overwrite a file you have not backed up.
2. **Check for duplicate work first.** Someone may have already upgraded. Look at local branches and recent commits (`git log --all --oneline -i --grep=<package>`), and at open pull requests (`gh pr list --state open`). If equivalent work exists, stop and report it. Do not redo it.
3. **Work in a separate worktree and branch.** `git worktree add -b upgrade/<topic> ../<app>-upgrade`. The original checkout, with its uncommitted work, stays as it is.
4. **Do not commit or push without the user's go.** Report the branch and path.
5. **Do not send data to outside services** (telemetry, reporting commands) unless the user explicitly approves each one.

## Step 1: Audit

Run these from the app root, and note the output:

```bash
node --version
npm --version            # or pnpm / yarn: use the manager the lockfile belongs to
npm ls next react react-native 2>/dev/null | head -30
npm audit --omit=dev     # production dependencies: the ones that ship
npm outdated             # what is behind
```

For Next.js, also run `npx next --version` and compare with the advisories for that version (GitHub Security Advisories, or `npm audit`). List each advisory with its ID, severity, affected range, and fixed version.

Produce a short table:

| Package | Current | Advisory or reason | Fixed in | Upgrade needed? |
|---|---|---|---|---|

Upgrade only what is affected or what the user asked for. Do not bump everything.

## Step 2: Plan

State the exact target version of each package, the files that will change (`package.json`, lockfile, and any config the upgrade guide names), and the checks you will run. For a major version, read the official upgrade guide for every major crossed, and do one step per major.

## Step 3: Upgrade in the worktree

```bash
cp package.json package.json.backup-$(date +%Y%m%d-%H%M%S)
cp package-lock.json package-lock.json.backup-$(date +%Y%m%d-%H%M%S)
# Next.js example, same major:
npm install next@<exact-target> --save-exact
```

If the framework provides an upgrade command (for example `npx next upgrade`), read its output before running any instruction it prints. Follow only the steps that match the table above.

## Step 4: Install from the lockfile

```bash
npm ci
npx next --version       # must print the exact target
```

`npm ci` installs exactly what the lockfile says. If the version is not the target, stop and fix the lockfile before continuing.

## Step 5: Verify

Run every check the project has, and record the result of each:

- Typecheck (`npx tsc --noEmit`)
- Lint (`npm run lint`)
- Tests (`npm test`)
- Production build (`npm run build`). For mobile apps, a Release build on a simulator or device.
- A smoke test of the main pages or screens in a dev server or simulator.
- `npm audit --omit=dev` again: the advisory must be gone.

If something fails, fix the cause in the upgrade branch, then run the checks again. Do not skip a failing check.

## Step 6: Deliver

- Commit the upgrade as one commit with a clear message: what changed, from which version to which, and why (the advisory IDs).
- Show `git diff --stat` and re-read the package changes line by line. Unexpected changes must be reverted.
- Report: branch, worktree path, versions before and after, checks passed, checks not run, and what the user must do next (merge, deploy, restart the dev server).

## What to report, always

Say what was checked, what was changed, what was not verified, and whether anything was stopped because the work already existed. Do not report success for work that was not verified.
