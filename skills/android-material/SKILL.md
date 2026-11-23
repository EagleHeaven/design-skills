---
name: android-material
description: Google's complete Android design guidance, the Android equivalent of Apple's HIG. Material Design 3 and M3 Expressive (live from m3.material.io) plus the developer.android.com design guides (phone, large screens, foldables, desktop windowing, widgets, Wear OS, TV, cars, Android XR, AI glasses), the Android app quality guidelines used by Google Play, and the Google I/O design sessions, distilled for designing, building and reviewing apps. Use when designing or auditing any Android screen; choosing or styling a Material component (navigation bar, rail, drawer, app bar, toolbar, FAB, button group, bottom sheet, dialog, snackbar, menu, list, card, chip, text field, search, tabs, pickers); applying dynamic color, color roles, typography, shape, elevation, motion springs, Material Symbols, layout, window size classes, canonical layouts, edge-to-edge and insets, predictive back; patterns like onboarding, permissions, notifications, Live Updates, settings, passkeys, haptics, widgets, adaptive and themed app icons, splash screen; accessibility (TalkBack, font scale, touch targets); Google Play quality and store listing assets. Also for making a React Native, Expo, Flutter or web app feel native on Android.
---

# Android + Material 3 design (the Android HIG)

Material Design 3 (95 pages of m3.material.io, M3 Expressive era) and the Android Developers design and quality guides (about 380 pages of developer.android.com), fetched live on 2026-11-19 and distilled into actionable rules, plus a verified catalog of Google I/O design sessions. Rules are paraphrased; every section links to its Google source page.

Sister skill: `apple-hig` covers iOS. For a cross-platform product load both; `references/implementation.md` ends with the iOS vs Android difference table.

## How to use this skill

1. Read this file (what Material 3 Expressive is, the numbers that matter, review checklist).
2. Open only the reference file(s) for the task, then `grep` the heading you need. Files are large; never load all of them.
3. When an exact Google wording or a detail missing here matters, refresh the source:
   - Material: `python3 ~/.claude/skills/android-material/scripts/fetch_m3.py <slug>` (for example `components/buttons`, `styles/color/roles`, `foundations/layout/breakpoints`); `--list` prints every slug.
   - Android: `python3 ~/.claude/skills/android-material/scripts/fetch_android.py <path>` (for example `/design/ui/mobile/guides/layout-and-content/edge-to-edge`, `/docs/quality-guidelines/core-app-quality`).
   - Raw snapshots of every page are kept in `.sources/` (`m3dump/`, `dacdump/`, `extra/`) for grep when offline.

| Task | Reference file |
|---|---|
| M3 and M3 Expressive overview, accessibility, usability, adaptive layout (breakpoints, scaffold, panes, canonical layouts, grids, spacing, density, RTL), system bars, interaction states, gestures, inputs, content design and writing, tokens, customization, desktop | `references/foundations.md` |
| Color system and roles, dynamic color, schemes and contrast levels, typography and type scale, shape and shape morphing, elevation, Material Symbols, motion (springs, easing, durations, transitions), spacing, dark theme, fonts | `references/styles.md` |
| Buttons (all kinds), app bars, badges, bottom sheets, button groups, cards, carousel, checkbox, chips, date pickers, dialogs, divider, FAB, extended FAB, FAB menu, icon buttons, lists, loading indicator | `references/components-a.md` |
| Menus, navigation bar, drawer, rail, progress indicators, radio button, scroll fields, search, segmented buttons, side sheets, sliders, snackbar, split button, switch, tabs, text fields, time pickers, toolbars, tooltips | `references/components-b.md` |
| Android platform: app anatomy, edge-to-edge and insets, navigation patterns, predictive back, foldables and postures, large screens, desktop windowing, images, immersive mode, onboarding, settings, help, passkeys, permissions, notifications, Live Updates, picture-in-picture, widgets, adaptive and themed icons, splash screen, haptics, per-app language, Android 15/16/17 UI changes | `references/android-platform.md` |
| Wear OS (Material 3 Expressive for Wear, tiles, complications, watch faces, rotary) and Android TV / Google TV (focus, D-pad, overscan) | `references/wear-tv.md` |
| Android Auto and Automotive OS (templates, driver distraction limits), Android XR (panels, orbiters, spatial UI), AI glasses (Jetpack Compose Glimmer) | `references/cars-xr-glasses.md` |
| Google Play app quality checklists (core, adaptive tiers, large screens, Wear, TV, car, widget, XR) with check IDs and tests | `references/quality.md` |
| Window size classes, densities, touch targets, icon and splash sizes, Play Store graphic assets, widget sizes, test matrix | `references/device-specs.md` |
| Exact token values: type scale, shape scale, elevation, state layers, springs, color role tones, and per-component sizes (heights, paddings, corners) from the Compose Material 3 token files | `references/tokens.md` (raw `.kt` files in `.sources/tokens/`) |
| Google I/O and Android Dev Summit design sessions by year, key takeaways, Compose design API map | `references/io-design-sessions.md` |
| Translating rules to Jetpack Compose, Views, React Native / Expo and web; iOS vs Android differences | `references/implementation.md` |

## What Material 3 Expressive is

Material 3 (Material You, 2021) is the current system; M3 Expressive (announced May 2025) is its evolution, explicitly "not M4" and nothing in M3 is deprecated by it. Google reports it as its most researched update: 46 studies with more than 18,000 participants, with expressive screens preferred across ages and key elements spotted up to four times faster (source: m3.material.io/blog/building-with-m3-expressive). At Google I/O 2026 Material added the Expressive layout system (new scaffold, an 8dp-based spacing system, watch and XR guidance), Expressive lists, menus and search, and declared Material on Android "Compose-first".

What Expressive adds:
- 14 new or updated components: app bars, button groups (new), buttons, extended FAB, FAB menu (new), FAB, icon buttons, loading indicator (new), navigation bar, navigation rail, progress indicators, sliders, split button (new), toolbars (new).
- Motion-physics system: spatial springs for movement, effects springs for color and opacity.
- Emphasized typography styles, a library of 35 shapes with built-in shape morphing, more vibrant color schemes.

Google's seven expressive tactics, usable as a design checklist:

| Tactic | One-line test |
|---|---|
| Use a variety of shapes | Do shape and corner radius contrast point attention to what matters? |
| Apply rich and nuanced colors | Do primary, secondary, tertiary roles and surface tones express priority? |
| Guide attention with typography | Are emphasized styles reserved for the key headline or action? |
| Contain content for emphasis | Is the most important content grouped, spaced and on the brightest surface? |
| Add fluid and natural motion | Do springs and shape morphs make state changes feel physical? |
| Leverage component flexibility | Do components and layout adapt to context and window size? |
| Combine tactics for hero moments | Are there only one or two hero moments, on the most important interactions? |

Material's accessibility principles (honor individuals, learn before not after, treat requirements as a starting point) apply to every decision. Details: `references/foundations.md`.

## The Android platform rules that change most apps

- **Edge-to-edge** is enforced for apps targeting SDK 35 (Android 15) and the opt-out is gone at SDK 36 (Android 16): draw content behind system bars and handle insets everywhere.
- **Predictive back**: for apps targeting SDK 36 on Android 16+, back-to-home, cross-task and cross-activity animations are on by default, `onBackPressed` is no longer called and `KEYCODE_BACK` is no longer dispatched. Use the supported back APIs.
- **Large screens**: for apps targeting SDK 36, orientation, resizability and aspect-ratio restrictions are ignored on displays with smallest width 600dp or more (temporary opt-out property, gone at SDK 37). Layout by window size class, keep state across resizes.
- **Navigation by window size**: navigation bar under 600dp, navigation rail from 600dp (expanded rail in place of the drawer), list-detail and supporting panes from 840dp.
- **Themed icons**: ship a monochrome layer in the adaptive icon.

Exact targetSdk triggers and the full list: `references/android-platform.md`, platform version table.

## Numbers that come up constantly

| Thing | Value |
|---|---|
| Touch target | at least 48x48dp (about 9mm); icons 24dp inside it |
| Window size classes (width) | compact under 600dp, medium 600 to 839dp, expanded 840 to 1199dp, large 1200 to 1599dp, extra-large 1600dp and up |
| Window margins | 16dp compact, 24dp medium and wider |
| Text contrast | at least 4.5:1; large text and essential non-text elements (icons, button containers next to other elements) at least 3:1; disabled states exempt |
| Line length | 40 to 60 characters per line |
| Font scale | text in sp, must survive 200% |
| Spacing base | 8dp scale (4dp for fine adjustments) |

More tables (type scale, color roles, shape corner scale, elevation levels, motion tokens, icon and Play asset sizes, widget sizes): grep `styles.md` and `device-specs.md`.

## Workflow: designing an Android screen

1. Identify window size classes and form factors in scope (compact phone, foldable folded and unfolded, tablet, desktop window, Wear, TV, car, XR). Read the matching section of `android-platform.md` or the form-factor file.
2. Pick navigation from the system patterns: navigation bar (3 to 5 top destinations, compact), navigation rail (medium and up; the expanded rail replaces the navigation drawer, no longer recommended since May 2025), tabs for peers within a destination, top app bar with back for hierarchy, canonical layouts (list-detail, feed, supporting pane) for expanded widths.
3. Lay out edge-to-edge with insets, window margins and the spacing scale; content scrolls under transparent system bars.
4. Style through the theme: color roles (with dynamic color where the brand allows), M3 type scale in sp, shape scale, Material Symbols. No hard-coded colors or sizes.
5. Specify every state: enabled, hovered, focused, pressed, dragged, selected, disabled (state layers), plus loading, empty, error, offline, permission denied, 200% font, RTL, dark theme, contrast levels.
6. Add motion with the motion scheme springs; honor "Remove animations"; add haptics only where they carry meaning.
7. Run the review checklist below, then the relevant section of `quality.md`.

## Review checklist (Material + Android audit)

Flag each failure with the guideline it violates and its Source link.

- [ ] Uses Material 3 components where one exists; custom components behave like their Material counterparts (states, ripple, semantics).
- [ ] Edge-to-edge: content draws behind status and navigation bars; nothing interactive under system gesture insets; no content hidden behind bars, cutouts or the IME.
- [ ] Back works everywhere through the system back gesture, with predictive back animations; no trapped screens.
- [ ] Navigation matches window size class (bar, collapsed or expanded rail); no new navigation drawer, bottom app bar or segmented buttons (no longer recommended since M3 Expressive: use expanded rail, docked toolbar, connected button group); layout adapts at 600 and 840dp; works in split screen, freeform windows, both foldable postures and both orientations; state survives resizes.
- [ ] Touch targets at least 48x48dp with enough spacing.
- [ ] Text in sp, readable and unclipped at 200% font scale; no fixed heights around text.
- [ ] Contrast at least 4.5:1 for text and 3:1 for essential non-text elements, in light, dark and with dynamic color; color never the only signal.
- [ ] Colors come from color roles in pairs (container with its on-role); dynamic color tested with several wallpapers; dark theme complete.
- [ ] Type uses the M3 type scale; emphasized styles reserved for hierarchy; shapes from the corner scale.
- [ ] Every interactive element has a TalkBack label and role; logical traversal order; headings marked; custom actions for swipe-only actions; works with Switch Access, keyboard and D-pad (visible focus).
- [ ] Motion uses the motion scheme; "Remove animations" respected; no motion that only decorates.
- [ ] Permissions requested in context with a rationale, with a working path when denied; notifications permission (Android 13+) asked at a meaningful moment.
- [ ] Notifications in proper channels, actionable, grouped; Live Updates only for ongoing user-initiated activities.
- [ ] Onboarding short and skippable; splash screen uses the platform splash API with no extra branded splash activity.
- [ ] Adaptive icon with foreground, background and monochrome layers; key art inside the safe zone.
- [ ] Copy: sentence case, concise labels, clear verbs on buttons, no blame in errors, notifications copy per Material content design.
- [ ] Core app quality and, for large screens, adaptive quality tier checks pass (see `quality.md`); Play Store assets meet specs (see `device-specs.md`).

## Working rules for this skill

- Quote Google's exact wording only via the fetch scripts; in deliverables, paraphrase and link the Source.
- When the guidelines are silent, reason from the expressive tactics and accessibility principles and say so; do not present an inference as Google guidance.
- For a cross-platform (React Native / Expo / Flutter / web) product, apply this skill to the Android build and `apple-hig` to the iOS build, and state where they intentionally differ (`references/implementation.md`).
- The distillation is a snapshot (2026-11-19, Material content version 2026-11-18). If a decision hinges on a recent change, run the fetch script; Material pages carry an "M3 Expressive update" note and the Android pages list their last update.
