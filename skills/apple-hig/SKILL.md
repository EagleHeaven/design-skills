---
name: apple-hig
description: Apple's complete Human Interface Guidelines (HIG, Liquid Glass era, live from developer.apple.com) plus the WWDC design sessions, distilled for designing, building and reviewing apps. Use when designing or auditing any iOS, iPadOS, macOS, watchOS, tvOS, visionOS or iPhone Duo screen; choosing or styling a system component (tab bar, toolbar, sheet, alert, menu, list, button, search, widget, Live Activity, notification); applying Liquid Glass, materials, color, Dark Mode, typography, Dynamic Type, SF Symbols, layout, safe areas, app icons; patterns like onboarding, modality, loading, settings, search, haptics, accounts; inputs (gestures, keyboard, pointer, Pencil, Digital Crown, eyes); technologies (Apple Pay, Sign in with Apple, In-App Purchase, Siri, App Clips, Wallet, CarPlay, generative AI); accessibility and App Store design review readiness. Also for making a React Native, Expo or web app feel native on Apple platforms.
---

# Apple HIG + WWDC design

The full Human Interface Guidelines (173 pages, fetched from Apple's live HIG on 2026-11-19) distilled into actionable rules, plus a verified catalog of WWDC design sessions. Rules are paraphrased; every section links to its Apple source page.

Sister skill: `apple-design` covers fluid motion and gesture physics (WWDC 2018 *Designing Fluid Interfaces*) translated to the web. Load it too for springs, drag, momentum and interruptible animation.

## How to use this skill

1. Read this file (principles, Liquid Glass, the numbers that matter, review checklist).
2. Open only the reference file(s) for the task, then `grep` the heading you need. Files are large; never load all of them.
3. When an exact Apple wording or a detail missing here matters, refresh the source: `python3 ~/.claude/skills/apple-hig/scripts/fetch_hig.py <slug>` prints the live page as markdown (slug = last part of the Source URL). `--list` prints every slug.

| Task | Reference file |
|---|---|
| Platform traits, the 8 design principles, iPhone Duo, games | `references/platforms.md` |
| Accessibility, app icons, branding, color, Dark Mode, icons, images, immersive, inclusion, layout, materials (Liquid Glass), motion, privacy, RTL, SF Symbols, spatial layout, typography, writing | `references/foundations.md` |
| Onboarding, launching, loading, modality, feedback, entering data, search, settings, accounts, notifications permission, haptics, audio, video, drag and drop, undo, multitasking, files, sharing, ratings, charts, full screen, workouts | `references/patterns.md` |
| Charts, image/text/web views, lists, collections, split views, tab views, labels, disclosure, buttons, menus, context menus, edit menus, toolbars, the menu bar, ornaments, activity views, search fields, sidebars, tab bars, token fields | `references/components-a.md` |
| Alerts, action sheets, sheets, popovers, panels, windows, scroll views, page controls, pickers, segmented controls, sliders, steppers, text fields, toggles, keyboards, gauges, progress, rings, widgets, Live Activities, notifications, controls, complications, App Shortcuts, snippets, status bar, Top Shelf, watch faces | `references/components-b.md` |
| Gestures, keyboards and shortcuts, pointer, Pencil and Scribble, Action button, Camera Control, Digital Crown, eyes, focus, game controls, remotes, motion sensors, nearby interactions | `references/inputs.md` |
| Apple Pay, Sign in with Apple, In-App Purchase, App Clips, Wallet, Siri, SharePlay, CarPlay, HealthKit, HomeKit, Game Center, generative AI, machine learning, AR, Maps, Live Photos, VoiceOver, Mac Catalyst, iCloud, NFC, Tap to Pay, ID Verifier, iMessage, CareKit, ResearchKit, ShazamKit | `references/technologies.md` |
| WWDC design sessions by year, key takeaways, SwiftUI/UIKit design APIs | `references/wwdc-design-sessions.md` |
| Translating HIG to SwiftUI, UIKit, React Native/Expo and web | `references/implementation.md` |
| App Store screenshot sizes (incl. iPhone Duo, required April 2027), derived point sizes, test matrix, Add to Apple Wallet badges | `references/device-specs.md`, `assets/wallet-badges/` |

## The design principles (HIG "Design principles")

Apple's current HIG frames all guidance around eight principles. Use them to settle trade-offs.

| Principle | One-line test |
|---|---|
| Purpose | Does every feature serve what the product is for, and is the core made great? |
| Agency | Can people act freely, skip guided flows, see what is happening and undo mistakes? |
| Responsibility | Is data use transparent, minimal and safe, with a clear reason at each permission ask? |
| Familiarity | Does it reuse concepts and system patterns people already know, consistently? |
| Flexibility | Does it adapt to devices, input methods, Dynamic Type, languages and abilities? |
| Simplicity | Does each element earn its place; is the hierarchy obvious at a glance? |
| Craft | Are the details (alignment, states, edge cases, motion) finished? |
| Delight | Is the emotional tone right and the experience satisfying to use? |

## Liquid Glass: the current design language

Introduced at WWDC 2025 (iOS/iPadOS/macOS/watchOS/tvOS 26) and unifying all platforms.

- Two layers: **content** (your data, media, backgrounds) and a **functional layer** of Liquid Glass floating above it (tab bars, toolbars, sidebars, navigation, sheets, popovers, menus). Content scrolls and peeks beneath.
- Never put Liquid Glass in the content layer. Use standard materials (ultra-thin, thin, regular, thick) there. Exception: transient controls such as sliders and toggles take on glass while being manipulated.
- Standard system components adopt it automatically. Recompile with the latest SDK first, remove custom bar backgrounds, then judge. Custom glass is for a few of the most important custom controls only.
- Variants: **regular** (blurs and adjusts luminosity, for text-heavy or legibility-critical UI) and **clear** (highly translucent, only over rich media; add a ~35% dark dimming layer when the media is bright).
- Scroll edge effects replace hard bar dividers; let them work instead of adding opaque backgrounds.
- Glass has no color of its own; it takes color from content behind it. Tint sparingly (primary action, status), and tint the glass background rather than the symbol or text. Bar symbols and text stay monochrome and flip light/dark with the content below.
- Respect Reduce Transparency, Increase Contrast and the user's glass appearance preference; never hard-code assumptions about how glass looks.
- Concentric shapes: standard buttons and fields in bars get corner radii concentric with the bar; keep margins concentric with the container edge (also for Live Activities and icons).

- WWDC 2026 (the 2027 releases) refines Liquid Glass rather than replacing it: system components pick up the refresh with no code change; new toolbar and tab APIs (toolbar minimize on scroll, prominent tab, overflow menu), the `.automatic` scroll edge effect gets its own look (re-check apps that forced `.soft`), macOS sidebars reach the window edges and controls can use interactive glass. Brand guidance (session 251): keep the UI layer native and put brand expression in the content layer.

Details: `references/foundations.md` (Materials, Color, Layout) and `references/wwdc-design-sessions.md` (2025 sessions and APIs).

## Numbers that come up constantly

| Thing | Value |
|---|---|
| Hit target (iOS/iPadOS) | 44x44 pt default, 28x28 pt minimum |
| Hit target (macOS) | 28x28 pt default, 20x20 pt minimum |
| Hit target (visionOS) | 60x60 pt |
| Body text default / minimum | iOS 17/11 pt, macOS 13/10 pt, tvOS 29/23 pt, visionOS 17/12 pt, watchOS 16/12 pt |
| Text contrast | 4.5:1 up to 17 pt; 3:1 at 18 pt and above, or for bold text |
| Clear glass over bright media | ~35% dark dimming layer |

More tables (Dynamic Type sizes per style, app icon sizes, widget sizes, system colors, standard shortcuts): grep the reference files.

## Workflow: designing a screen

1. Identify platform(s) and the device classes (compact/regular width, iPhone Duo poses, windowed iPad, Mac window sizes). Read the platform section in `platforms.md`.
2. Pick navigation from system patterns: tab bar (flat top-level sections), sidebar/split view (deep hierarchy on iPad/Mac), hierarchical push, modal sheet for a self-contained task. Read the component pages before inventing anything custom.
3. Lay out with safe areas and layout margins, adaptive to size classes; content first, controls in the glass layer.
4. Type with system text styles and Dynamic Type; color with semantic/system colors that adapt to Dark Mode and Increase Contrast; icons with SF Symbols matched to text weight.
5. Specify every state: default, pressed, disabled, loading, empty, error, offline, permission denied, accessibility sizes, RTL.
6. Add feedback: haptics where meaningful, motion that clarifies, never motion as decoration only; honor Reduce Motion.
7. Run the review checklist below.

## Review checklist (HIG audit)

Flag each failure with the HIG page it violates and its Source link.

- [ ] Uses system components where one exists; custom components behave like their system counterparts.
- [ ] Liquid Glass only in the functional layer; no stacked glass on glass; custom glass limited and justified.
- [ ] No opaque custom bar backgrounds hiding scroll edge effects (unless a deliberate, justified choice).
- [ ] Hit targets meet platform minimums; spacing prevents mis-taps.
- [ ] Dynamic Type supported up to the largest accessibility sizes without truncating essential text; layout reflows.
- [ ] Contrast meets 4.5:1 / 3:1 in light, dark, and Increase Contrast.
- [ ] Semantic colors; color never the only carrier of meaning.
- [ ] Every interactive element has an accessibility label, trait and, if needed, hint; VoiceOver order is logical; custom actions for swipe-only actions.
- [ ] Reduce Motion, Reduce Transparency, Bold Text, Button Shapes, Voice Control respected.
- [ ] Safe areas respected; nothing important under the Dynamic Island, home indicator or rounded corners.
- [ ] RTL mirroring correct (directional icons flip, numbers and media controls do not).
- [ ] Modality used only for focused tasks, with a clear way out; destructive actions confirmed and undoable where possible.
- [ ] Permissions asked in context with a clear reason, never at launch without need; app works when denied.
- [ ] Onboarding short and skippable; launch goes straight to content; no splash marketing.
- [ ] Loading shows content placeholders or progress; no blocking spinners for local work.
- [ ] Copy: clear, concise, plain language, consistent terminology, sentence/title case per platform convention, no blame in errors.
- [ ] App icon follows the layered icon format (Icon Composer), no text unless essential, works in light, dark, tinted and clear appearances.
- [ ] Platform conventions: Mac menu bar complete with standard items and shortcuts; iPad supports pointer, keyboard, multitasking; watch glanceable; tvOS focus-based; visionOS uses ornaments, depth and comfortable spatial placement.
- [ ] Brand-mark rules exact for Apple Pay, Sign in with Apple, Wallet and other Apple technologies used.

## Working rules for this skill

- Prefer Apple's wording of a rule only via the fetch script; in deliverables, paraphrase and link the Source.
- When the HIG is silent, reason from the eight principles and say so; do not present an inference as Apple guidance.
- For a cross-platform (React Native / Expo / web) product, apply the HIG to the iOS build and state where Android or web conventions intentionally differ. See `references/implementation.md`.
- The distillation is a snapshot (2026-11-19). If a decision hinges on a recent change, run the fetch script and check the page's change log section.
