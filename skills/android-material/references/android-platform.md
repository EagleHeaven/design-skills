# Android & Material 3: Android Platform Design (phones, large screens, foldables, desktop, home screen)

Distilled from the developer.android.com Android design guides, platform guides and behavior-change notes (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

Related: system bars, accessibility and glossary are covered in a separate foundations reference; Material component specs live in the components reference.

## Contents

1. [Android design overview](#android-design-overview)
2. [App anatomy](#app-anatomy)
3. [Layout basics](#layout-basics)
4. [Content structure](#content-structure)
5. [Common layouts](#common-layouts)
6. [Layout and navigation patterns](#layout-and-navigation-patterns)
7. [Adapt layouts](#adapt-layouts)
8. [Window size classes](#window-size-classes)
9. [Foldable postures and orientation](#foldable-postures-and-orientation)
10. [Edge-to-edge and insets](#edge-to-edge-and-insets)
11. [Grids and units](#grids-and-units)
12. [Images and graphics](#images-and-graphics)
13. [Immersive content](#immersive-content)
14. [Large screens](#large-screens)
15. [Desktop experiences and windowing](#desktop-experiences-and-windowing)
16. [Design gallery (canonical patterns by category)](#design-gallery-canonical-patterns-by-category)
17. [Predictive back design](#predictive-back-design)
18. [Onboarding and authentication](#onboarding-and-authentication)
19. [Passkeys and sign-in](#passkeys-and-sign-in)
20. [Settings](#settings)
21. [Help and feedback](#help-and-feedback)
22. [Permissions](#permissions)
23. [Per-app language](#per-app-language)
24. [Notifications](#notifications)
25. [Live Updates](#live-updates)
26. [Picture-in-picture](#picture-in-picture)
27. [Widgets](#widgets)
28. [App icons (adaptive and themed)](#app-icons-adaptive-and-themed)
29. [Splash screen](#splash-screen)
30. [Haptics](#haptics)
31. [Themes (Android mobile guide)](#themes-android-mobile-guide)
32. [Color (Android mobile guide)](#color-android-mobile-guide)
33. [Material components overview](#material-components-overview)
34. [Translate iOS designs to Android](#translate-ios-designs-to-android)
35. [Samples](#samples)
36. [Platform version changes (Android 15, 16, 17)](#platform-version-changes-android-15-16-17)

---

## Android design overview

Source: https://developer.android.com/design/ui/mobile

- The Android mobile design guides cover phones, foldables and tablets, grouped as: Foundations (system bars, accessibility, glossary), Styles (themes, color, type, motion), Layout and content, Behaviors and patterns (predictive back, settings, onboarding, passkeys), Components (Material 3), Home screen (notifications, widgets, PiP, Live Updates).
- Tooling named by the source: Android UI kit (Figma), Android Design Figma community, Material Theme Builder (dynamic color), window size classes, M3 site, core app quality and large screen quality guidelines.
- Related references in this skill: system bars, accessibility and glossary are covered in a separate reference file (cross-reference them for status bar / navigation bar rules).

---

## App anatomy

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/app-anatomy

Three regions make up most Android screens:

| Region | Contents | Rule |
|---|---|---|
| System bars | Status bar (time, battery, notification icons) and navigation bar (gesture handle or 3-button) | Owned by the OS; your content draws behind them (edge-to-edge) |
| Navigation region | Navigation bar, rail, drawer, app bars, actions | Gives access to destinations and key actions |
| Body | Screen content, grouped in containers | Must continue under the navigation and system bar regions |

- Pick composition and navigation from how users interact with the content and the information architecture.

---

## Layout basics

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/layout-basics

- **Orientation**: verify both portrait and landscape, plus different aspect ratios, size classes and resolutions.
- **Device safe areas**: honor display cutouts, edge-to-edge insets, edge (curved) displays, the software keyboard and system bars.
- **Keyboard**: do move a focused input up or attach it to the keyboard; don't hide inputs behind the keyboard (users may not know they can scroll).
- **Ergonomics**: keep primary navigation and essential actions in reachable areas; a FAB gives a prominent, reachable action point.
- **Containment**: group related content (for example cards with related actions).
- **Alignment and spacing**: consistent alignment and consistent spacing between like elements; inconsistent spacing looks haphazard.
- **Essential interactions**: avoid too many actions per view.
- **Notate specs**: for custom layouts, document alignment, constraints or gravity, and how images respond to their container.

---

## Content structure

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/content-structure

Four steps: base grid, containment, positioning, scale and crop.

1. **Base structure (layout grid)**
   - Margins: 16dp standard on compact widths; margins grow on larger screens. Body content and actions stay inside and align to margins.
   - Add system bar insets at this step so key actions never sit under system bars, while backgrounds still draw behind them.
   - Columns: phones commonly use 4 columns. Choose the grid by hierarchy:

   | Grid type | Use for |
   |---|---|
   | Hierarchical | Content with clear hierarchy (editorial, detail screen with large header / key art) |
   | Modular | Equally important, structured items (photo gallery) |
   | Column | One-directional responsive layouts needing flexibility |
   | Manuscript, masonry | Other options named by the source |

   - Avoid an overly granular grid; use the baseline grid for spacing units. Break the grid only when content demands it.
2. **Containment**: implicit containment uses whitespace; explicit containment uses dividers and cards. Android builds with rows, columns and boxes.
3. **Position content**: decide one-dimensional (filters, tags: flexbox / FlowRow) vs two-dimensional (grid) flow; combine (carousel above vertical cards). Use lazy rows / columns for scrolling. Compose: `Arrangement`, `Alignment`, custom `AlignmentLine`.
4. **Scale and crop**: notate how images scale and crop per container; constrain aspect only when the content requires it (vertical-only video) and balance the empty space. Don't keep the same scale on larger screens: use the space and consider viewing distance.

- **Pinned content**: FABs with critical actions can stay fixed; pin text inputs to the keyboard for messaging and authentication.
- Material 3 components bring their own states; `Scaffold` provides slots for app bars, FAB, snackbar and content.

---

## Common layouts

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/common-layouts

| Layout | What it is | Compact behavior | Larger behavior |
|---|---|---|---|
| List-detail | List of items revealing supplementary detail (messaging, contacts, file browsers) | Only list or detail visible | Both side by side |
| Feed | Equivalent items in a configurable grid (cards, tiles), often dynamic from an API | List or grid | More columns; grid can be rigid or staggered |
| Supporting pane | Secondary content or controls (sheets, dialogs) keep the primary view focused | Bottom sheet | Opens as a pane |

- Dynamic content is served on the fly (user-generated, preference-driven); static content is hard-coded.
- Feed / grid: keep spacing and logic consistent; implement with lazy lists or lazy grids.
- WebViews: in most cases prefer opening the standard browser (Chrome) through an intent over an in-app WebView.

---

## Layout and navigation patterns

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/layout-and-nav-patterns

| Pattern | Role | Rules |
|---|---|---|
| Navigation bar | Primary navigation | 3 to 5 destinations of equal hierarchy; becomes a navigation rail on large screens |
| Modal navigation drawer | Primary navigation | Can hold more than 5 destinations but less ergonomic (top reach on compact) |
| Tabs, bottom app bar | Secondary navigation | Supplement primary navigation or appear on child views; tabs group sibling content |
| FAB | Highest-importance action | One FAB action per screen; sizes and an extended (labeled) form; pin with `Scaffold` so it stays visible while scrolling |
| Top app bar actions / inline actions | Secondary actions | Put near the content they relate to |
| Overflow menu | Rare actions | For actions not promptly or frequently needed |

- **Adaptive navigation**: don't reuse the bottom navigation bar across all sizes. Do switch to a navigation rail on large screens (better hand placement and spacing). Medium can use a rail or horizontal navigation items. On a compact cover screen a rail can still be more ergonomic.

---

## Adapt layouts

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/adapt-layout

- Decide layout changes by window width class first, then height.
- Three adaptive methods: **reflow**, **reveal**, **presentation change**.
- Don't lock to portrait: it causes letterboxing when the app is resized (desktop windowing, multitasking).
- Adaptive is the default: "mobile" includes phones, foldables, tablets and everything between.
- Design key ("hero") screens at size-class breakpoints, or notate at a foundational level how content constrains, expands or reflows.

| Do | Don't |
|---|---|
| Set a max width on content and components | Let content stretch full width |
| Think in containment / panes | Stretch inputs and buttons |
| Let a component change presentation (bottom sheet becomes side sheet) | Stretch a component instead of changing it |

**Panes per width class**

| Width class | Panes |
|---|---|
| Compact | 1 |
| Medium | 1 to 2 |
| Large, extra-large | Multiple |

- Panes can move in, hide, expand, be constrained or pop up.
- Rescale elements with screen size, density and input: a small video grid that fits a phone overwhelms a tablet.
- Small screens matter too: foldable cover screens and unusual aspect ratios. For control-based layouts (media players) reflow controls and reveal content; keep an anchor element (large play button) and let hero art become the cover screen background.
- **Beyond size classes**: plan for external monitors, input devices, viewing distance and posture changes; the `mediaQuery` API lets you adapt individual components. Adapt at the component or pane level instead of designing whole screens per size, input, form factor and posture.
- Quality bar: aim for the differentiated tier in core app quality and large screen quality guidelines.

---

## Window size classes

Source: https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes

| Size class | Breakpoint | Typical case |
|---|---|---|
| Compact width | < 600dp | 99.96% of phones in portrait |
| Medium width | 600dp to < 840dp | 93.73% of tablets in portrait, most unfolded inner displays in portrait |
| Expanded width | 840dp to < 1200dp | 97.22% of tablets in landscape, unfolded inner displays in landscape |
| Large width | 1200dp to < 1600dp | Large tablet displays |
| Extra-large width | >= 1600dp | Desktop displays |
| Compact height | < 480dp | 99.78% of phones in landscape |
| Medium height | 480dp to < 900dp | 96.56% of tablets in landscape, 97.59% of phones in portrait |
| Expanded height | >= 900dp | 94.25% of tablets in portrait |

- Width and height are classified separately; width usually matters more because vertical scrolling is common.
- Use height too: phones and open flippables in landscape are medium width but compact height, where two panes are impractical.
- Size classes describe the app window, never the device: don't use them for "isTablet" logic. They change at runtime (rotation, multi-window, fold / unfold, desktop windows).
- Compact / medium / expanded map to M3 layout guidance; large and extra-large were added for desktop and connected displays.
- Compose: `currentWindowAdaptiveInfo().windowSizeClass` (library `androidx.compose.material3.adaptive`); pass `supportLargeAndXLargeWidth = true` to get large / extra-large. Check with `isHeightAtLeastBreakpoint(WindowSizeClass.HEIGHT_DP_MEDIUM_LOWER_BOUND)` and the width equivalents. Pass the class down as state.
- Testing order: with an existing compact layout, optimize expanded first (most room), then decide medium.

---

## Foldable postures and orientation

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/postures-and-orientation

**Orientation**
- Don't lock to portrait: it looks like a bug and letterboxes in multitasking. Support rotation.
- Landscape on a phone gives medium width with compact height. In landscape: support edge-to-edge bars, pick the best navigation (horizontal navigation bar of reduced height or a rail), reflow content or change density.
- Letterbox content inside a container or switch content orientation when available. If content didn't scroll in portrait, don't make it scroll in landscape.
- Example adaptations: hero image stays prominent and sticky; bottom app bar undocks; a filter bottom sheet becomes a side sheet, or stays full-screen with a two-column layout when more attention is needed.

**Postures**

| Posture | Description | Design opportunity |
|---|---|---|
| Flat | Unfolded | Usually medium or large width |
| Folded | Closed, outer screen | Typically compact |
| Tabletop | Half-folded horizontally | Large controls below, landscape video above |
| Hinge | Fold area (trifolds have several) | Keep controls and text off the hinge; widen the gutter in two-pane list-detail |

- You don't need to support every posture; pick one that fits (a media player can offer tabletop and cover UIs).

**Cover screens** (often square, flip-phone style)
- Stay edge-to-edge; keep UI clear of camera cutouts; keep use cases focused.
- Media: cover art as background with a quick-view of key info. Feeds: hero image plus a peek at title for scrolling.
- Keyboard up: the message input is the main focus. Filter sheets go full-screen with adapted button placement.
- A small navigation rail can avoid cutouts and respect the reduced height.
- Do continue UI under system UI; don't stop the UI before the system bars.

---

## Edge-to-edge and insets

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/edge-to-edge

- Draw backgrounds and scrolling content under the system bars. Inset text, buttons and other tappable content.
- Don't put tap or drag targets inside system gesture insets: they conflict with gesture navigation.
- Google publishes an agent skill (android/skills repository) to migrate Compose apps to adaptive edge-to-edge.

| Inset type | Applies to |
|---|---|
| System bar insets | Tappable UI that must not be obscured by system bars |
| System gesture insets | OS gesture areas (back edges, home handle) that take priority over the app |
| Display cutout insets | Camera cutouts and other hardware intrusions |

**Status bar**
- Top app bars collapse on scroll. M3 small top app bar collapses to status bar height or scrolls off; medium and large collapse to a smaller bar.
- Sticky small bar: collapse it to status bar height. Non-sticky: add a matching background gradient.
- When content scrolls under it, make the status bar translucent: use the M3 `TopAppBar` automatic scroll protection, a custom gradient composable, or `GradientProtection` (Views).
- Adaptive layouts: give each pane its own protection matching that pane's background; give the navigation drawer its own protection. Don't stack protections (built-in TopAppBar plus custom).

**Navigation bar**
- `BottomAppBar` collapses on scroll through `scrollBehavior`. When it animates away, add a scrim behind 3-button navigation; keep gesture navigation transparent with no extra scrim.
- Keep `NavigationBar` visible while scrolling (it has no `scrollBehavior`; same for the one inside `NavigationSuiteScaffold`).

**Display cutouts**
- Inset critical UI with display cutout insets; don't place critical UI at the extreme edge.
- Solid app bar backgrounds draw into the cutout; horizontal carousels scroll through the cutout area.

### Material 3 inset handling (Compose)

Source: https://developer.android.com/develop/ui/compose/system/material-insets

| Composable | Insets applied automatically |
|---|---|
| `TopAppBar`, `CenterAlignedTopAppBar`, `MediumTopAppBar`, `LargeTopAppBar` | Top + horizontal system bars |
| `BottomAppBar` | Bottom + horizontal system bars |
| `ModalDrawerSheet`, `DismissibleDrawerSheet`, `PermanentDrawerSheet` | Vertical + start |
| `ModalBottomSheet` | Bottom |
| `NavigationBar` | Bottom + horizontal |
| `NavigationRail` | Vertical + start |
| `Scaffold` | Provides `PaddingValues` to content but does not apply them |

- With `Scaffold`, pass `innerPadding` as `contentPadding` of a `LazyColumn` and call `Modifier.consumeWindowInsets(innerPadding)`. Avoid stacking other inset approaches (rulers, padding modifiers, inset size modifiers) on top, or you double-pad.
- Override with the `windowInsets` parameter; disable with `WindowInsets(0, 0, 0, 0)`.
- M2 Compose components (`androidx.compose.material`) don't handle insets: use their `windowInsets` / `contentWindowInsets` parameters (1.6.0+) or manual padding.

---

## Grids and units

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/grids-and-units

- Notate specs in dp and sp, never px. Always use sp for font sizes (it follows the user's font size setting).
- dp: 1dp is about 1px on a 160 dpi screen. Formula: `dp = (width in px * 160) / screen density`.
- Baseline grid: 8dp for layout, components and spacing; 4dp for icons, type and small elements inside components.
- Export raster graphics for every density bucket; vectors (`nodpi` / `anydpi`) need no per-density copies.

| Density bucket | Scale | Approx dpi |
|---|---|---|
| mdpi | 1x | 160 |
| hdpi | 1.5x | 240 |
| xhdpi | 2x | 320 |
| xxhdpi | 3x | 480 |
| xxxhdpi | 4x | 640 |

- Layout grids: hierarchical (reflow, resize, reveal cells), modular (add cells, content snaps or wraps), column (change column count and width at breakpoints).
- Window size classes: compact, medium, expanded (see Window size classes).
- Recommended aspect ratios: 16:9, 3:2, 4:3, 1:1, 3:4, 2:3. Keep ratios consistent across images, surfaces and screens.

---

## Images and graphics

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/images-graphics

- Rules: no baked-in text in assets; vectors first; provide raster assets per density bucket; add enough scrim between images and overlaid text; some effects (blur, complex gradients) cost performance; Animated Vector Drawables for small UI animations.
- **Export**: lowercase names, no resolution suffix; simple assets as SVG (convert to Vector Drawable with Vector Asset Studio); photos as WebP, PNG or JPG; organize per-density folders. Prefix icons `ic_`.
- **Vector** (lossless): SVG and `VectorDrawable` (XML, supports gradients). Use for icons, hero illustrations (high emphasis, set the tone) and spot illustrations (small, inline). `AnimatedVectorDrawable` for icon motion.
- **Raster** (lossy): PNG, GIF, JPG, WebP for photos, rich textures, complex gradients.
- Icons and small assets include intrinsic padding (for example a 24dp icon with built-in padding) for consistent sizing and touch room.
- App icons: adaptive icons as vector drawables, legacy icons as PNG. Monochrome icons appear in system UI (themed icons, notifications, status bar, widgets). Splash screens (Android 12+) feature the app icon.
- **Placement / ContentScale**: `Fit`, `Crop`, `FillHeight`, `FillWidth`, `FillBounds`, `Inside`, `None`; clip to shapes for effects.
- **Responsive cropping** per breakpoint: keep one fixed ratio, adapt ratios (for example 1:1 to 16:9), or keep a fixed height with fluid width.
- **Effects**: `Brush` gradients (color stops, tiling); `Modifier.blur()` (Android 12+ only, performance cost); `BlendMode`; tint one asset for several colors and states; animate programmatically instead of shipping motion files.

---

## Immersive content

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/immersive-content

- Immersive mode hides system bars for video, games, images, books, video calls, presentations, and kiosks.
- Always provide an obvious way to bring UI back (tap during playback reveals controls and system bars).
- Never permanently hide system bars on personal devices (only Android Enterprise / DPC kiosk deployments can).
- Add an overlay or scrim behind text and controls drawn over content.
- Use immersive only when the benefit goes beyond extra pixels: users jump out often to check notifications or search. Games use it to prevent accidental exits.
- Pair with picture-in-picture and Chromecast to continue the experience.
- API: `WindowInsetsControllerCompat` hides the status bar, the navigation bar, or both.

---
## Large screens

Source: https://developer.android.com/design/ui/large-screens

- Target tablets, foldables and ChromeOS while still supporting every phone size.
- Use canonical layouts plus out-of-the-way navigation (rail, drawer):

| Canonical layout | Purpose |
|---|---|
| List-detail | One-click access to supplementary detail for list items |
| Feed | Expansive grid; emphasis through proportion and scale |
| Supporting pane | Primary area plus secondary area for tools, options, settings |
| Navigation rail and drawer | Primary destinations in reach with minimal space |

- Breakpoints on this page: compact < 600dp, medium 600 to < 840dp, expanded >= 840dp (large and extra-large added later, see Window size classes).
- Quality bar: large screen app quality guidelines (three tiers on Google Play). Material references: Understanding layout, Applying layout, Canonical layouts.

---

## Desktop experiences and windowing

Source: https://developer.android.com/design/ui/desktop

- Desktop on Android means free-form windows, higher density, multi-window, pointer precision and physical keyboard support.

### Across form factors

Source: https://developer.android.com/design/ui/desktop/guides/foundations/across-form-factors

| Form factor | Desktop setup |
|---|---|
| Phones, foldables | Connected external monitor, mouse / touchpad, keyboard; apps in free-form windows on the external display while the phone stays touch |
| Tablets | Keyboard folio with touchpad; with an external display both screens run desktop mode and windows drag between them |
| Chromebooks | Built-in keyboard and touchpad; some have touch, stylus, tablet mode |
| XR | Home Space apps sit side by side and resize; eye and hand input, optional keyboard and pointer; apps placed at varying depths |

### Design principles

Source: https://developer.android.com/design/ui/desktop/guides/foundations/design-principles

| Principle | Meaning |
|---|---|
| Adaptive from the start | Design mobile layouts and hierarchy modular so they scale up |
| More screen, more done | Show more information more densely instead of scaling elements up |
| Refine the motion | Small, short moves can be faster than on mobile (no finger occluding); large, long moves slower or simplified |
| Multitasking at the core | Support multitasking inside the app, not only via OS windows |
| Balance efficiency with simplicity | Fewer steps without overwhelming |
| All inputs equal | Touch, pointer and keyboard all first-class; users switch often |

### Get started with desktop

Source: https://developer.android.com/design/ui/desktop/guides/foundations/get-started

- Order of work: adapt layout, then density, then input interactions. Figma "Adaptive design lab" available.
- **Panes**: think in containment groups, not screens; panes expand, constrain, hide, move or pop up.
- **Scale**: account for viewing distance; bump type one or two steps up the scale, or use a dedicated desktop / expanded type scale. Don't just blow images up across the screen.
- **Content**: per pane decide if and how it adapts (list row to card only if scannability survives); components can change width, visibility or type. Set max widths, max paddings and margins inside panes. Limit short-form line length to about 60 characters; long-form can run longer. Use progressive disclosure as the window grows (show descriptions hidden on compact). Content can reflow (vertical grid with carousel becomes masonry with feature carousel). Consider user-adjustable layouts.
- **Navigation**: show detail and supporting content beside the list instead of navigating. Bottom navigation bar becomes a side rail (never stretch the bar). Fix tabs to a max width for precision. App bars may attach to their pane if hierarchy stays clear.
- **Density**: tables and data can be denser; density is optional and text must still scale (no hard-set type sizes). Use exact click targets: intrinsic target padding causes misclicks.
- **Inputs**: hover states (mouse, stylus); visible focus for Tab navigation; cursor states; right-click context menus; hover tooltips; keyboard shortcuts.

### Pointer interactions

Source: https://developer.android.com/design/ui/desktop/guides/interaction/pointer-interactions

- Every primary journey must be possible with primary (left) clicks alone; this also serves Switch Access.
- Secondary click (right-click, two-finger tap) opens context menus; don't require long-press on desktop.
- Hover: change visual state (M3 states) and optionally reveal tooltips or actions.
- Drag-and-drop: instantaneous click-and-drag with pointers (touch needs long-press because one-finger swipe scrolls).
- Selection: offer a dedicated target such as a checkbox on hover instead of touch-and-hold.
- Target size: set max widths on buttons; avoid intrinsic targets beyond the visual bounds. Pointer-only secondary targets (archive on hover) may be smaller than 48 x 48dp.

### Cursors

Source: https://developer.android.com/design/ui/desktop/guides/interaction/cursors

| Group | System cursor icons |
|---|---|
| General | Pointer, Hand pointer (clickable), All scroll, Grab, Grabbing, Copy, No drop, Text, Text vertical, Alias, Process spinner (busy) |
| Services | Help, Context menu, Crosshair, Cell (spreadsheet), Zoom in, Zoom out, Spot hover, Spot touch |
| Resize | Resize arrows (directional), No resize directional, No resize all directions |
| Stylus | Scribe hover (field is writable with stylus) |

- Set the system cursor that matches the action (zoom-in over zoomable images); make a custom cursor only for specialized actions Android doesn't cover.

### Keyboard interaction

Source: https://developer.android.com/design/ui/desktop/guides/interaction/keyboard

- Everything reachable by keyboard alone. Tab cycles all interactive elements in reading order (top-to-bottom, left-to-right, mirrored for RTL). Arrow keys move directionally (Right = next in row, Down = next row).
- Trap focus inside modal dialogs. Escape dismisses temporary UI (dialogs, menus, bottom sheets) as a local cancel.
- Follow component patterns (slider: Left / Right change value). Reference: WAI-ARIA Authoring Practices patterns.
- Set initial focus on the key element (search bar, primary action). Use distinct, consistent focus styles.
- Support standard and custom shortcuts and register them with the system Keyboard Shortcuts Helper. Examples from the gallery: Space toggles media playback, Enter sends messages.

### Multitasking

Source: https://developer.android.com/design/ui/desktop/guides/system/multi-task

- Multi-instance: users keep several windows of one app and switch with Alt + Tab; support it if it fits.
- Drag-and-drop data between apps and the OS.
- Media keeps playing when minimized or backgrounded; add PiP with play, pause, previous, next.

### Desktop system bars

Source: https://developer.android.com/design/ui/desktop/guides/system/system-bars

- Taskbar at the bottom shows open and pinned apps; long-press or right-click an icon for pin, new window, close and your App Shortcuts (so define useful App Shortcuts).
- Free-form windows get a header bar with minimize, maximize, close. Use its customizable middle area for app navigation or global actions like search (customizable header insets API).

---

## Design gallery (canonical patterns by category)

Source: https://developer.android.com/design/ui/gallery

Figma: Android Adaptive UI Samples. Filters in the gallery: Creativity, Games, Media, Productivity, Reading, Shopping, Social; Phone, Foldable, Tablet, Desktop, Wear OS, Cars.

| Category | Canonical patterns from the gallery |
|---|---|
| Creativity | Supporting pane for palettes, color pickers, settings that never block the canvas; movable, resizable panels; contextual menus at point of need; multi-window reference beside editor; drag-and-drop in and between apps; stylus: low latency, hover feedback, palm rejection, tilt and pressure (Concepts: 70% more time on tablets; Luminar: photo-centric sliders and subtle sound feedback) |
| Games | Handle configuration changes for every orientation, posture and window size with continuity of play; support game controllers, mouse, trackpad and keyboard (ChromeOS, Google Play Games on PC) |
| Media | Feed for discovery; detail with related titles and reviews beside playback; browse while playing; tabletop posture (media above fold, controls below); PiP and multi-window |
| Productivity | List-detail file browsing with thumbnails; right-click context menus for file actions; supporting pane for tools and inline comments; tabletop for video calls / presentations; drag between views and apps; multi-window note taking (WPS Office foldable case) |
| Reading | Feed of books with side navigation; list-detail for news (headlines beside full article); collapsible supporting pane for notes, bookmarks, comments; immersive full-screen with adapted line length; two-page book layout on unfolded foldables; multi-window note taking (ABCmouse: guided character for pre-readers instead of text menus) |
| Shopping | Large catalog imagery with emphasis by size and position; list-detail product details; supporting pane filters; drag-and-drop cart, wish list and sharing to chat (eBay tablet optimization) |
| Social | List-detail conversations; supporting pane for comments and creation tools; feed for posts; drag-and-drop sharing; dual-screen foldable uses (rear-camera selfies, interpreter); tabletop video calls (Google Duo); PiP and multi-window; laptop input (Enter sends, hover on links, shortcuts) |

**Pawparazzi adaptive case study** (https://developer.android.com/design/ui/gallery/social/pawparazzi)
- Design adaptively instead of pixel-perfect lockups. Align micro layout to the 8dp baseline grid; choose a hierarchical grid when content hierarchy drives columns.
- Reveal: larger windows show more rows and details simultaneously. Compact gallery is 2 across; a ranking grid (2x4) lets the top item span 2 columns and rows (Grid API).
- Flexbox for one-directional, content-sized components (filter chips; reveal more filters on large screens).
- `MediaQuery` for context: precise pointer input allows smaller targets and denser content.

---
## Predictive back design

Source: https://developer.android.com/design/ui/mobile/guides/patterns/predictive-back

- Predictive back lets a user, during a gesture-navigation back swipe, preview the destination and then commit (release past threshold) or cancel.
- Opting in (default back navigation) gives system animations: back-to-home, cross-activity, cross-task. MDC Android 1.10.0-alpha02+ adds Material component animations for bottom sheets, side sheets and search.
- Requires edge-to-edge: the gesture respects system gesture insets. Never place touch or drag targets fully under gesture areas.

### Full-screen surfaces (custom in-app transitions)
- During the gesture the inner area scales down; past the commit threshold the content swaps to the next state with a fade through.
- Interpolator: cubic-bezier (0.1, 0.1, 0, 1), matching SystemUI.
- Cancel: content quickly returns to original scale and state, undoing any change.

| Parameter | Initial | Target | Note |
|---|---|---|---|
| Exit scale | 100% | 90% | |
| Enter scale | 110% | 100% | |
| Exit fade | 100% | 0% | Fully faded at 35% progress |
| Enter fade | 0% | 100% | Starts at 35% progress |

- At the 35% fade-through threshold neither screen is visible.

### Shared element transitions
- Works between views / composables in the same fragment or screen, or with your own back stack via `PredictiveBackHandler`. Does not work with `FragmentManager`, the Navigation Component or Navigation Compose: there, skip the 90% scale and run the shared element transition as the user navigates back.
- The surface detaches from the screen edge and follows the finger. Don't suggest that committing dismisses the item in the swipe direction. Use it to return a detail screen into its list item (for example a calendar event back into a day view); a subtle overshoot absorbs spring tension.
- Only the system can dismiss the app window itself.

| Parameter | Value | Context |
|---|---|---|
| X shift | ((screen width / 20) - 8) dp | Max shift, keeps 8dp margin (1280dp wide gives 56dp) |
| Y shift | ((available screen height / 20) - 8) dp | Max shift, keeps 8dp margin; decelerate into the limit |
| Scale | 90% | Minimum scale; margins are 5% of width per side |
| Off-screen scale | Never below 50% | If the surface shifts off screen |
| Edge gap | 8dp | Always preserved |

- Don't map linear gesture progress straight to the animation. Feed it through `STANDARD_DECELERATE` or `PathInterpolator(0f, 0f, 0f, 1f)` so movement is visible early.
- Commit: a confirmation animation plays. Flings: the system first animates toward the max preview state to absorb velocity, then commits.
- Cancel: the window moves and scales back to its original edge-to-edge state.

### Implementation (developer guide)

Source: https://developer.android.com/guide/navigation/custom-back/predictive-back-gesture

- Predictive back is enabled by default. From Android 15, the developer option is gone and back-to-home, cross-task and cross-activity animations show for opted-in apps (on Android 13 and 14 test via Settings > System > Developer options > Predictive back animations).
- APIs: AndroidX `OnBackPressedCallback` (Activity 1.6.0+, backward compatible, used by most apps) or platform `OnBackInvokedCallback`. Compose: `PredictiveBackHandler` (activity-compose 1.8.0+, gives a `Flow<BackEventCompat>` with `progress`; catch `CancellationException` to reset UI) and `BackHandler` when progress isn't needed.
- Stop intercepting `KeyEvent.KEYCODE_BACK` and overriding `onBackPressed` (Activity, Dialog); that interception is no longer supported.
- Fragments / Navigation Component: upgrade to AndroidX Activity 1.6.0+.
- Opt out: `android:enableOnBackInvokedCallback="false"` on `<application>` or per `<activity>` (activity value overrides app default). It disables system animations and ignores `OnBackInvokedCallback`; `OnBackPressedCallback` still runs.
- Callback rules:
  - Drive each callback's enabled state from observable UI state (`StateFlow`, Compose State); don't decide inside the back event.
  - An enabled callback with `PRIORITY_DEFAULT` or `PRIORITY_OVERLAY` suppresses predictive animations, so use callbacks only for UI logic (dialog, animation), never for business logic or logging.
  - To log back navigation: Compose, use `ViewModel.onCleared()`; Android 16+, use `OnBackInvokedCallback` with `PRIORITY_SYSTEM_NAVIGATION_OBSERVER` (observes without consuming); Views, check `isFinishing` in `onDestroy()` or `isRemoving` / `OnBackStackChangedListener`.
  - Keep callbacks single-responsibility. The last enabled callback wins: in Compose, innermost first (for example "unsaved form" handler, then screen `BackHandler`, then `NavHost`, then system back-to-home).
- Google strongly recommends migrating now; unmigrated apps may behave unexpectedly in future releases.

---

## Onboarding and authentication

Source: https://developer.android.com/design/ui/mobile/guides/patterns/onboarding

- Takeaways: collect only critical information; use platform libraries (passkeys) for trust and convenience; clear, assistive language; explain feature value and the reason for each permission.
- Process: (1) list what users must set up, learn, authorize; (2) split "before using the app" vs "while using it" and minimize upfront friction; (3) in-context items get an explanation plus action; (4) essential upfront steps go in logical order, value proposition first, then the action (account, permission); (5) pick auth methods (passkeys reduce friction); (6) provide recovery; (7) show progress (stepper, pager, progress indicator).

| Entry placement | When to use | Trade-off |
|---|---|---|
| Welcome (upfront) | Registration required before any content, no preview possible, in-context learning unsuitable | Users learn fast, but higher drop-off before they see value; mitigate by teasing content |
| Contextual (just-in-time) | You can preview content to entice sign-up, or want small memorable steps | Supports permission priming at the moment of need; better retention |

- **Registration**: ask only the minimum (email, password); combine steps; for long flows split screens but avoid one input per screen; state password requirements clearly.
- **Sign in**: fast and unobtrusive; consider single sign-on combining sign-up and sign-in; offer biometrics and autofill.
- **Walkthroughs**: question whether you need one; prefer motion cues or in-context tooltips. A preview of real content usually persuades better than static slides. Always offer a persistent skip / sign in option. Let users skip and resume (cache progress) and say what happens to progress.
- **Progress**: use steppers and progress indicators; don't use indicators that look like decoration (a changing illustration).
- **Permissions**: prime at the moment of need with the value explained; don't request permissions you can't justify.
- **Recovery**: never assume the happy path. Put "Forgot password" in an accessible place; help users recover usernames; show password requirements upfront. Never pre-fill passwords in reset flows; mask sensitive input by default (pre-filling email is fine).
- **Forms**: group related fields (first / last name together) so they can reflow; avoid long scrolling forms; question every field (losing a long form on back causes abandonment). Break long onboarding into smaller steps.
- **Expanded / landscape**: don't stretch buttons or inputs across the screen; set a max width on form elements.
- **Education components**: rich tooltips and dialogs for feature discovery; sheets for interstitial onboarding content.
- **Other form factors**: hand off authentication to the phone (for example a Google TV sign-in completed on mobile); add discovery prompts for companion experiences (Wear OS, AI glasses).
- **Writing**: confirm actions with snackbars or toasts instead of modal dialogs; error copy is encouraging and solution-focused, never mocking (especially in password recovery).
- Resource: Android Onboarding Figma Kit.

---

## Passkeys and sign-in

Source: https://developer.android.com/design/ui/mobile/guides/patterns/passkeys

- Use the Credential Manager API: it unifies passkeys, passwords and federated sign-in (Sign in with Google), so don't list every method upfront.
- Make passkeys the default sign-in and sign-up method, with an alternative path ("Other options", where the passkey option stays visible). Don't present all sign-up options side by side as the default.
- Principles: simplicity (fewest steps), transparency (what data and why), control (optional details later).

**When to promote passkey creation**

| Moment | Guidance |
|---|---|
| Account creation | Primary option; short benefits plus a "learn more" link |
| Account recovery / password reset | Users are frustrated with passwords; prompt at the end of reset |
| Right after password sign-in | Prompt immediately to prevent future forgotten passwords |
| Account settings | Offer upgrade; avoid duplicate passkeys for the same username in the same manager |

- Android 15 makes creation single-tap (Android 14 and earlier: two taps). Sign-in with one account on Android 15 goes straight to screen lock (earlier versions confirm the account first). Branding on the biometric screen is Android 15 only.
- Android 13 and earlier: credentials in Google Password Manager. Android 14+: Credential Manager aggregates all enabled password managers. If a user has a password and a passkey, the system proposes the passkey; duplicates across managers show the last used one, with "More options" / "Sign-in options" for alternatives.

**Content design**

| Do | Don't |
|---|---|
| Show benefits (speed, simplicity, security) before starting creation | Launch creation without explaining benefits |
| Lead the header with benefits, explain passkeys in the body | Put the word "passkey" front and center in the header |
| Describe it as signing in with your screen lock (fingerprint, face, PIN) | Over-explain the technology |
| Button label exactly "Create a passkey" | Other labels |
| "Save a passkey to [password manager]" for storage | |
| Confirm successful creation | Skip the confirmation |
| "Sign in", "Sign in with a passkey", "Sign in with a password" (verb, no hyphen; "sign-in" as noun) | "Log in" |

- "passkey" is lowercase, not a proper noun, used with "a"; pluralize normally.

**Settings management**
- Provide a passkey section in settings with entry points before creation, after creation, and behind "Manage".
- Per passkey show at least: password manager name and icon, created and last-used timestamps, a "delete" option (use the word "delete").
- Don't emphasize the device name where it was created (users may think it lives only there).
- Deleting in the app or in the password manager stops it working; full removal may require both. Consider re-prompting if all passkeys are deleted.
- Use Google's passkey icon (Material Symbols "passkey"), filled version only.
- Troubleshooting: link to Google's passkey help article.

---

## Settings

Source: https://developer.android.com/design/ui/mobile/guides/patterns/settings

- Respect system settings (you may need none); clear precise language; overview plus groups and screens when needed; correct selection controls; polite defaults; easy access.

| Include | Avoid |
|---|---|
| Infrequently accessed preferences | Frequent actions (put them in context of the feature) |
| Saved user preferences | App info such as version number or licensing |
| | Account management |
| | Duplicates of device-level settings |

- **Defaults**: what most users would pick; neutral and low risk; lower battery and data use; interrupt only when important.
- **System settings**: extend (more theming, finer sound control), never replicate or override; they may encode accessibility needs. Don't override system theme unless you add more customization. Offer a Quick Settings tile for frequent recurring actions.
- **Contextual settings**: put frequent ones near the feature (closed captions on the video player).
- **Navigation placement**: usually secondary (top app bar menu, overflow). If crucial, a primary destination (navigation bar, drawer, rail). In a drawer or menu, "Settings" comes after all items except Help & Feedback. Name it "Settings" (never "Options" or "Preferences"). Settings combined with Account must remain reachable when signed out. Be careful hiding settings behind a Profile icon.
- **Layout**: list or list-detail with Material lists (label, supporting text, icons, controls). Overview page shows the most important settings and their values; account, app info, help and feedback go on separate screens.
- Group into small sets with headings and containment. **15 or more settings: group related ones in a subscreen.** The label that opens a subscreen matches its title. Deep hierarchies get search.

| Pattern | Use |
|---|---|
| Individual switch (subscreen) | Setting needs a long description; secondary text shows current value |
| Dependency | Dependent setting sits below its parent with a reason when unavailable; a parent switch toggles a group; explain system-setting dependencies and link to them |
| Single choice (on / off) | Switch or checkbox; never a radio button for one option |
| Multiple choice (one of many) | Radio buttons in a dialog or child screen; not for booleans or fewer than 2 choices |
| Slider | Ranges, large values, imprecise settings |
| Date and time | Pickers |

- **Adaptive**: list-detail canonical layout; overview is the list, subscreens become detail panes; don't let single-pane items stretch full width (max width or supplementary content).
- **Writing labels**: lead with the important words; neutral terms ("Block") over "Don't" / "Never"; impersonal ("Notifications" over "Notify me"), second person if needed, never first person; familiar acronyms only; explain unfamiliar settings. Avoid generic verbs (Set, Change, Edit, Modify, Manage, Use, Select, Choose), repeating the section title, and jargon. Add supporting text only when the label isn't enough, and prefer showing status; long explanations go to a second screen.
- Filters differ from settings: filters are contextual to the content currently being viewed.

---

## Help and feedback

Source: https://developer.android.com/design/ui/mobile/guides/patterns/help-content

- Help and Feedback is secondary: put it in the overflow menu, at the bottom of a navigation drawer, or in settings.
- Standard Android labels: "Help" and "Send feedback" (alternatives like "Help Center" are fine if consistent across platforms).
- Prioritize frequent help topics at the top, linking straight to relevant features or settings; demote Privacy and Terms of service (overflow or lower on screen).
- Include issue reporting; consider the Google Play In-App Review API to prompt reviews.
- Support instructions with images, icons, video or animation.

---
## Permissions

Source: https://developer.android.com/training/permissions/requesting

- Dangerous (runtime) permissions must be requested at runtime on Android 6.0 (API 23)+. First check whether you need one at all: many use cases (taking photos via intents, pausing media, relevant ads) need no permission. Special permissions follow a separate flow.

**Principles**
- Ask in context, when the user starts the feature that needs it (pairs with "permission priming" in Onboarding).
- Never block: every educational / rationale flow can be cancelled.
- On denial or revocation, degrade gracefully and keep the rest of the app usable.
- Don't assume system behavior (permission groups, auto-grant or auto-deny can change).

**Workflow**
1. Declare in the manifest.
2. Design UX so specific actions map to specific permissions; tell users which actions need access.
3. Wait until the user invokes that action.
4. Check `ContextCompat.checkSelfPermission()` every time (returns `PERMISSION_GRANTED` / `PERMISSION_DENIED`).
5. If denied and `shouldShowRequestPermissionRationale()` is true, show an educational UI explaining what data and what benefit; otherwise skip straight to the request.
6. Request with the AndroidX `RequestPermission` / `RequestMultiplePermissions` contracts (`registerForActivityResult`, `launch()`), or `requestPermissions()` with your own request code.
7. Read the result; 8. use the data or degrade gracefully.

**Rationale design**
- The system dialog says what, never why, and can't be customized: put the "why" in your own UI (for example the label of the button that enables the feature).
- Say whether access serves a core feature or advertising; if you use only part of a group (coarse location only) say so.
- Show real-time access cues for camera / microphone in background (in-app or notification icon). Android 12 (API 31)+ shows system privacy indicators for camera and mic.

**Denial handling**

| Rule | How |
|---|---|
| Minimize functionality loss | Keep whatever works without the data, even degraded (mic denied: text input stays fully usable) |
| Guide attention | Show a message where results would appear, or a distinct button with an error icon and color |
| Be specific | Name the unavailable feature; no generic message |
| Don't block the UI | No full-screen warning walls |
| Accept the preference | Inform without pressuring users to change their mind |

- Denying the same permission twice over the install's lifetime means "don't ask again": the system dialog no longer appears (`USER_FIXED`; once denied = `USER_SET`). Send users to settings only through your own explained UI (inference).
- Testing: `adb shell dumpsys package <pkg>` shows flags; `adb shell pm clear-permission-flags <pkg> <perm> user-set user-fixed` resets them; `adb install -g` grants all.

**Location**

| Type | When | Permissions |
|---|---|---|
| Foreground | Visible activity or a `location` type foreground service (required type on Android 10+), one-off or time-bound sharing (turn-by-turn, share current location) | `ACCESS_COARSE_LOCATION` always; add `ACCESS_FINE_LOCATION` only if precision helps |
| Background | Continuous sharing (family location), geofencing (IoT home automations) | `ACCESS_BACKGROUND_LOCATION` on Android 10 (API 29)+; Play restricts it to core functionality |

**Lifecycle rules**
- One-time permissions (Android 11, API 30+): "Only this time" for location, mic, camera. Access lasts while visible, briefly after backgrounding, or until a foreground service started while visible stops. Revocation kills the process; next use re-prompts.
- Android 13+: `revokeSelfPermissionOnKill()` / `revokeSelfPermissionsOnKill()` drops permissions you no longer need (whole group to disappear from settings); tell the user on next launch.
- Auto-reset: apps targeting Android 11+ unused for a few months lose sensitive grants (app hibernation).
- Call log and SMS permissions require becoming the default handler first (Play policy).
- Notifications permission (`POST_NOTIFICATIONS`, Android 13+) follows the same contextual pattern: see Notifications.

---

## Per-app language

Source: https://developer.android.com/guide/topics/resources/app-languages

- Android 13 (API 33) lets users pick a language per app: Settings > System > Languages & input > App languages, or Settings > Apps > (app) > Language.
- Enable automatic support (Android Studio Giraffe / AGP 8.1+, `compileSdk` 33+): set `generateLocaleConfig = true` in `androidResources {}` and declare the default locale with `unqualifiedResLocale` in `res/resources.properties`. AGP generates `LocaleConfig` from your `values-*` folders (including library modules: make sure all are publish-ready). A manual `LocaleConfig` then breaks the build.
- Manual alternative: `res/xml/locale_config.xml` (include the ultimate fallback locale from `res/values/strings.xml`) referenced by `android:localeConfig`. Omitting it means users can't set a per-app language. `LocaleManager.setOverrideLocaleConfig` can change the list dynamically (per region, A/B tests, server-side localization).
- Locale names: ISO 639-2 language, optional ISO 15924 script, optional ISO 3166-1 alpha-2 or UN M.49 region, joined by dashes (for example `en-US`, `zh-Hant-MO`).
- Keep `resourceConfigurations` (Gradle) aligned so library translations for unsupported languages aren't bundled.

| Situation | Recommendation |
|---|---|
| No in-app picker | Enable automatic per-app language support; optionally add a picker using the APIs |
| Existing in-app picker | Enable automatic support and migrate picker logic to the public APIs (they sync with system settings) |

- In-app picker APIs: `AppCompatDelegate.setApplicationLocales(LocaleListCompat)` / `getApplicationLocales()` (AppCompat 1.6.0+, activity must extend `AppCompatActivity`, also for Compose) or framework `LocaleManager.setApplicationLocales` on Android 13+. Setting a locale recreates the activity unless you handle the config change; Compose recomposes and re-resolves `stringResource`.
- Android 12 and lower: set `autoStoreLocales=true` on `AppLocalesMetadataHolderService` (causes a main-thread disk read) or handle storage yourself and restore before `onCreate`; do a one-time handoff from any custom storage after upgrade to Android 13.
- IMEs can read `LocaleManager.getApplicationLocales` to match keyboard language.
- Pass language on outbound intents where supported (`RecognizerIntent.EXTRA_LANGUAGE`) and send an `Accept-Language` header via `Browser.EXTRA_HEADERS` for Custom Tabs.
- Adding per-app language doesn't translate anything: localize properly first.

---
## Notifications

Source: https://developer.android.com/design/ui/mobile/guides/home-screen/notifications

- Purpose: brief, timely, relevant information while the app is not in use. Steps: understand anatomy, choose a template, set channel and category.
- Checklist: know why you alert; decide where in the journey to ask for permission; pick a template; write header (summary) and content (preview); add image or media metadata when relevant; offer actions (text buttons, reply, media controls); set app icon and its color; set channels and categories; group multiple notifications. Templates live in the Android UI Kit (Figma). Rendering varies by manufacturer.

### Anatomy

| Element | Rule |
|---|---|
| App icon (small icon) | Monochrome in the status bar; if you send many kinds of notifications, use a purpose symbol instead of the app icon |
| Header text | Brief headline or source (for example the account name) |
| Timestamp | When it was sent |
| Expand indicator | Collapsed vs expanded state |
| Content text | Supporting information |
| Large icon (optional) | Only when imagery reinforces content: sender photo, content source logo (subscribed channel), meaningful symbol (direction arrow). Circular for people, square otherwise. Never for branding |

- Icon color: from Android 12 (API 31) the icon color comes from the notification color you set (`setColor`, `setColorized`), else the system theme color (previously gray). For most styles the color applies only to foreground service notifications; `MediaStyle` and `DecoratedMediaCustomViewStyle` with a media session are exempt. Reserve colored backgrounds for high-priority events (navigation, ongoing call).

### Actions
- Up to 3 actions in the expanded view: suggested replies, emphasized (pill) actions, standard text actions. Since Android 7.0 (API 24) actions show without icons, but still provide icons for Wear and Android 6.0 and lower.
- Don't add an action that duplicates tapping the body. Do let users act in place (Clock: pause, add a minute).
- Reply action for short text only; longer typing opens the app. Messaging apps keep the notification after a reply and auto-dismiss once the conversation pauses.
- Tapping a notification must open UI directly related to it, ready for immediate action (your turn in a game opens that game). On the lock screen users double-tap and authenticate.

### Templates

| Template | Use |
|---|---|
| Standard | Most notifications: short text, optional large icon, actions |
| Big text | Longer text block shown on expand |
| Big picture | Image: thumbnail collapsed, large preview expanded |
| Progress | User-initiated long tasks; progress bar plus a cancel action (non-cancelable work doesn't warrant a notification) |
| Media (`MediaStyle`) | Playback control: up to 3 actions collapsed; expanded up to 5 actions with image or 6 without; colors derived from artwork. Needs a valid `MediaSession` token to appear in Quick Settings media controls |
| Messaging (`MessagingStyle`) | Real-time conversations with inline reply |
| Call (`CallStyle`) | Incoming / outgoing calls, large format with large image |

### Permission (Android 13+)
- Most notifications are non-exempt and need user consent (`POST_NOTIFICATIONS`). Exempt from Android 13 (API 33): media sessions and apps managing phone calls; pre-existing apps may inherit consent if notifications were on.
- Before the system dialog, show contextual, dismissible UI (feed card, bottom sheet, onboarding screen) explaining benefits and the cost of declining. If the user dismisses your UI, don't show the system dialog. Users can be re-prompted from Android 13.
- Provide notification preferences in app settings.

### Foreground service notifications
- Required for foreground services (user-noticeable work consuming battery or data). Non-dismissible, so always include an action to stop the service (fitness workout tracking example).

### Don't send notifications
- For cross-promotion or ads of another product (prohibited by Google Play); if the user never opened the app; as the primary communication channel; to lure users back with no direct value ("Haven't seen you in a while!"); to ask for ratings; for work needing no user involvement (sync); for errors the app recovers from itself; for holiday or birthday greetings; to interrupt a task asking for feedback.

### Behavior
- Arrival: sound or vibration, status bar icon, heads-up peek. Users can override everything.
- Drawer order: reverse-chronological adjusted by importance, recent alerting, attached people (starred contacts), ongoing activities (calls, music), OS emphasis.
- Dismiss stale notifications that are no longer relevant.
- Notification dots on launcher icons (Android 8.0+, API 26) are automatic.
- Users can expand, swipe to dismiss (ongoing ones can't be swiped), swipe a heads-up up to snooze (no further pulses from that event for 1 minute), long-press or swipe for controls.
- Grouping: a parent summarizes children; children drop duplicate header info but must make sense alone (they may appear outside the group).

### Channels and importance (Android 8.0+, API 26, every notification needs a channel)

| Importance | Behavior | Use | Examples |
|---|---|---|---|
| `HIGH` | Sound and on-screen (heads-up) | Time-critical, act now | Messages, alarms, calls |
| `DEFAULT` | Sound | See soon, don't interrupt | Traffic alerts, task reminders |
| `LOW` | No sound | Everything else of moderate value | Subscribed content, social invitations |
| `MIN` | No sound or visual interruption | Non-essential | Nearby places, weather, promotions |

- Don't disguise unimportant notifications as urgent.

### Categories
`CATEGORY_CALL`, `CATEGORY_MESSAGE`, `CATEGORY_EMAIL`, `CATEGORY_EVENT`, `CATEGORY_PROMO`, `CATEGORY_ALARM`, `CATEGORY_PROGRESS`, `CATEGORY_SOCIAL`, `CATEGORY_ERROR`, `CATEGORY_TRANSPORT`, `CATEGORY_SYSTEM` (system use only), `CATEGORY_SERVICE`, `CATEGORY_RECOMMENDATION` (one specific timely item), `CATEGORY_STATUS`. Assign the closest one: the system uses it for ranking and filtering.

### Lock screen visibility

| Level | Shown on secure lock screen |
|---|---|
| Public | Full content |
| Private | App name and icon only, optional redacted text ("2 new messages") |
| Secret | Nothing |

### Writing

| Field | Limit | Rules |
|---|---|---|
| Content title | 30 characters, always one line | Most important info; no app name; avoid bare variables |
| Content text | 40 characters | Don't repeat the title |

- Paired Wear OS devices receive notifications automatically with expanded detail and actions.

---

## Live Updates

Source: https://developer.android.com/design/ui/mobile/guides/home-screen/live-updates

- Live Updates are promoted ongoing notifications summarizing progress (status bar chip plus prominent card) so users track without opening the app. Users can temporarily dismiss or demote one to a standard notification.
- Do use for finite, trackable, user-initiated experiences (rideshare, delivery, navigation). Don't use without a clear end time.
- Poor fit: information aggregated from multiple apps, recommendations, anything needing bespoke visuals, animations or custom data structures.
- **Alerts**: alert only on critical status changes ("driver arrived"), never minor ones (ETA shift). When you alert, the UI must immediately show why.
- **Progress**: glanceable; label discrete phases clearly; a continuous bar's fill must match remaining time or distance.
- **Timestamps**: same time or duration format in the status bar chip and the expanded card.
- **Templates**: rideshare, delivery and maps apps in the same vertical should use the same fields for the same data; the content title carries the most critical info. Templates are in the Android UI Kit.
- Platform side (Android 16): Live Updates use `Notification.ProgressStyle` and require promotion criteria; see Platform version changes below.

---

## Picture-in-picture

Source: https://developer.android.com/design/ui/mobile/guides/home-screen/picture-in-picture

- PiP is a multi-window mode for full-screen video (and continuous tasks like navigation): a small window pinned to a system-chosen corner on the top layer.
- Must be declared; not automatic. In PiP hide all UI except video and keep playback going. Minimal-UI playback activities work best. Disable seamless resizing for non-video content.
- Default controls: close, expand to full screen, settings, media controls (play, pause, next, previous with an active media session). Apps can add custom actions with icons. Users can't reach other app UI in PiP and small details are hard to see.

**When to enter PiP** (app decides)
- Home button or swipe-to-home (Google Maps keeps directions visible).
- Back from a video to browse other content.
- End of an episode while the main screen promotes the next one.
- While queuing more content in a selection screen.
- Avoid entering in ways that force extra effort (for example auto-PiP at the very end of an episode then needing to stop it).
- If the user picks a new video while PiP is playing, play it in the existing playback activity full-screen instead of launching a new activity.

| Gesture | Result |
|---|---|
| Drag | Move the window |
| Single tap | Show full-screen toggle, close, settings, custom actions |
| Double tap | Toggle between current and max / min size |
| Drag to left or right edge | Stash; tap the visible part or drag out to unstash |
| Pinch | Resize |
| Swipe down | Remove |

**Transitions**
- `PictureInPictureParams.Builder.setAutoEnterEnabled(true)` (Android 12+) gives smooth gesture transitions (swipe home); recommended for `ENTERTAINMENT`, `COMMUNICATION`, `VIDEO_PLAYER` apps. Without it, the window shrinks into the app icon first. It also disables seamless resizing for non-video content (maps).
- Set an accurate `setSourceRectHint` (video view bounds): from Android 12 the OS uses it for smooth enter and exit; otherwise a black overlay flashes.
- Android 12 transition improvements scale automatically to tablets and foldables.

---
## Widgets

Source: https://developer.android.com/design/ui/mobile/guides/widgets

Hub page: https://developer.android.com/design/ui/widget (Figma: Android UI kit, Widget Canonical Builder).

- Widgets are customizable home screen elements giving a clear, actionable, periodically refreshed view of app content or actions; users act in the widget or jump into the app.
- Process: pick ONE primary use case; start from the Figma widget templates; design within sizing guidelines; test multiple screen sizes and form factors (Android Auto); meet the widget quality guidelines.
- Build with Jetpack Glance. Google ships a "glance-canonical-layouts" Android skill (`android skills add glance-canonical-layouts`) and Glance samples in android/platform-samples.

### Canonical widget layouts

Source: https://developer.android.com/design/ui/mobile/guides/widgets/layouts

| Family | Layout | Use |
|---|---|---|
| Text | Text only | Title, status, one-line message |
| Text | Text and image / long text | Add an image for impact; adapt at breakpoints |
| Toolbar | Search toolbar | Search is the primary action, plus a few quick buttons |
| Toolbar | Toolbar (standard, expressive) | App branding then buttons for top tasks or toggles; at breakpoints add more 48dp minimum buttons, drop rare ones when small |
| List | Text and image list | News, playlists with art, messages |
| List | Checklist | Tasks with clear tap targets to mark done |
| List | Action list | Grouped controls with visible on / off states |
| List | Full-bleed image | Android 17+; snap scrolling so each child fills the widget height |
| Grid | Image only | Scrollable gallery; rows and columns adapt |
| Grid | Image and text | Gallery with labels and descriptions |

- Lists can be containerized or containerless. Lists on Android Auto widgets don't scroll (driver distraction).

### Sizing

Source: https://developer.android.com/design/ui/mobile/guides/widgets/sizing

- Cell sizes vary by device and orientation: design adaptive, resizable widgets, never fixed-size.
- Set `targetCellWidth` / `targetCellHeight` for handheld and tablet so the picker places and previews correctly; make minimum sizes meet the target span on most devices in portrait and landscape.
- Define breakpoints where layout changes; include or drop supplemental content per size.
- **Fill the bounds** (top reason users remove widgets is misalignment): container stretches edge-to-edge at every size; no custom outer padding; non-rectangular shapes must touch the grid on an axis; avoid fixed squares, use responsive rectangles.

**Quality thresholds that drive sizing** (from https://developer.android.com/docs/quality-guidelines/widget-quality)

| ID | Rule |
|---|---|
| WL-1 / 1.1 | Rectangular widgets touch all 4 grid edges; custom shapes touch all 4 edges of a square grid (a 4x1 search bar may touch only 2). Baseline tier: at least 2 opposing edges |
| WL-2 | Resizable to 2x1 plus at least two of 1x1, 2x2, 4x2, 4x4 |
| WL-3 | Header recommended for scrolling content or useful context (list name); optional for full-bleed widgets |
| WL-4 / 4.1 | Define min and max size; rearrange to show more content as it grows; don't scale text and icons linearly; cap size if growth only adds blank space |
| WL-4.2 | Minimum size shows a clear use case and 48x48dp touch targets (system may scale targets on desktop or car) |
| WL-5 | Collection / feed widgets scroll vertically and show more items and detail at 4x2 and 4x4 |
| WS-2 | Rectangular widgets use the system (OEM) corner radius |
| WD-1 | Preview shows target form-factor proportions with user content and / or system theme |

**Cell-to-dp sizes**

Source: https://developer.android.com/develop/ui/views/appwidgets/layouts ("Determine a size for your widget"). Measured on a Pixel 4 with a 5x4 grid; cell sizes and margins vary by device and launcher, so use these as minimum-size estimates.

| Cells (w x h) | Portrait (dp) | Landscape (dp) |
|---|---|---|
| 1x1 | 57 x 102 | 127 x 51 |
| 2x1 | 130 x 102 | 269 x 51 |
| 3x1 | 203 x 102 | 412 x 51 |
| 4x1 | 276 x 102 | 554 x 51 |
| 5x1 | 349 x 102 | 697 x 51 |
| 5x2 | 349 x 220 | 697 x 117 |
| 5x3 | 349 x 337 | 697 x 184 |
| 5x4 | 349 x 455 | 697 x 250 |
| n x m | (73n - 16) x (118m - 16) | (142n - 15) x (66m - 15) |

### Style

Source: https://developer.android.com/design/ui/mobile/guides/widgets/style

- **Color**: Material color roles and tokens for contrast and dynamic color; accent roles for hierarchy or highlighting new content; a custom brand theme is allowed.
- **Dynamic theme**: from Android 12 widgets can use device theme colors for buttons, backgrounds and components, staying consistent with icons, wallpaper and OEM themes.
- **Light and dark**: support both; a widget that ignores dark theme looks out of place.
- **Shape**: rectangular widgets use `system_app_widget_background_radius` (prevents clipping, consistent across devices). Minimal-content widgets (photo, weather, now playing) can be a whole expressive shape; complex ones can use expressive shapes for hierarchy or a call to action.
- **Type**: system fonts; hierarchy via weight, size, line height, letter spacing across five roles (display, headline, title, subtitle, body). Expressive option: bolder, larger headlines, labels and data.

### Configuration

Source: https://developer.android.com/design/ui/mobile/guides/widgets/configuration

| Situation | Configuration timing |
|---|---|
| Widget would be empty without a choice, or customization is central (email folder) | Open configuration during placement |
| A sensible default exists | Skip initial config; offer it after placement via touch and hold |

- Keep the flow to 1 to 2 screens, mirroring in-app configuration if you have one. Give a clear path that ends in adding the widget (tapping a category adds it). If the user abandons config, still add the widget and offer a restore / configure state inside it. Don't create dead ends or treat this as in-app settings (an ambiguous close "x").
- Provide an empty state (onboarding or sign-in reminder) when there's no preset.
- Prefer a desirable default; show a live preview while customizing; use progressive disclosure for advanced controls (a size slider only after choosing custom size).
- **Variations**: show popular or distinct configurations directly in the picker, limited to 6 to 8 previews; distinct use cases (steps vs streak) are separate widgets, cosmetic variants are config options.
- Build config screens with standard layouts and Material lists, switches, checkboxes, toggle buttons.

### Discovery and promotion

Source: https://developer.android.com/design/ui/mobile/guides/widgets/discovery-promotion

- Users find widgets in the widget picker (long-press home screen or app icon); some devices show a suggestions section of quality widgets.
- The default size is the shop window: show the functionality without clutter; set different defaults per form factor grid.
- Don't publish multiple widgets with the same purpose for colors or shapes: use a configuration activity.
- Always provide an accurate preview at the right size (without one the picker shows only the app icon). Use `android:previewLayout` for a layout-based preview; show dynamic colors if supported. Don't change shape or size when the widget is dropped.
- Write a concise description stating the value.
- In-app promotion: offer pinning at relevant moments (after completing a task tied to the widget, or repeated use of a feature); use subtle hints (icon, short animation); never block primary actions. API: request pin via `AppWidgetManager` (see "Let users pin a widget").

### Widgets across form factors

Source: https://developer.android.com/design/ui/mobile/guides/widgets/adapt

- Widgets are expanding to Android Auto, then cars with Google built-in, plus desktop and Wear.
- Build with Glance, responsive sizing (`SizeMode`), light and dark themes, dynamic theming, and full grid fill (WL-1).
- Cars: widgets must be glanceable with no manual scrolling. If you use a scrolling `LazyColumn`, provide an alternative widget with everything on one surface (otherwise only the first items show). For the auto scrollable segmented list, put the most valuable personalized content first.
- Tablets and desktops follow phone principles with different input expectations.

---
## App icons (adaptive and themed)

Source: https://developer.android.com/develop/ui/views/launch/icon_design_adaptive

- `AdaptiveIconDrawable` adapts to OEM masks (circle, squircle and others), launcher visual effects (parallax, pulse when placed or moved) and user theming. Used by the launcher, shortcuts, Settings, share sheets and Overview, on every form factor.

| Spec | Value |
|---|---|
| Layer canvas (foreground, background, monochrome) | 108 x 108dp each |
| Safe zone (never clipped by any mask) | Inner 66 x 66dp |
| Logo size | At least 48 x 48dp, at most 66 x 66dp |
| Reserved border | Outer 18dp on each side, for masking and effects |
| Visible masked viewport | Inner 72 x 72dp (from the splash spec: 288dp = 4 x 72dp) |
| Layers | Foreground + background (vector preferred, bitmap allowed); optional single monochrome layer |

- Clean edges; no masks or drop shadows baked into the layer outlines.
- Without proper layers your icon looks inconsistent and gets no visual effects.
- **Themed icons**: Android 13 (API 33) users can enable themed icons; the system tints your `monochrome` layer with wallpaper / theme colors. From Android 16 QPR 2 the system auto-themes icons of apps that don't provide a monochrome layer. Themed icon is not shown when the user hasn't enabled it, when the launcher lacks support, or when there's no monochrome layer on versions before Android 16 QPR 2.
- Implementation: `android:icon="@mipmap/ic_launcher"` (optional `android:roundIcon` for circular-mask launchers, lets you enlarge the logo and make the round background full bleed). Put `<adaptive-icon>` with `<background>`, `<foreground>`, `<monochrome>` in `res/mipmap-anydpi-v26/ic_launcher.xml`. Foreground and monochrome may share a drawable. Inline drawables can use an 18dp `<inset>`.
- Shortcuts: static shortcuts use `<adaptive-icon>`; dynamic shortcuts use `Icon.createWithAdaptiveBitmap()`.
- Legacy icons ship as PNG; adaptive layers as vector drawables (from Images and graphics). Tools: Android Studio Image Asset Studio, Figma app icon template. Google Play store icon has its own spec (512 x 512 px, see the Play listing reference).

---

## Splash screen

Source: https://developer.android.com/develop/ui/views/launch/splash-screen

- Since Android 12 every app launches with a system splash screen (a `Window` above the activity): enter motion, your icon, then transition into the app. Shown on cold and warm starts, never on hot starts.
- Use the Jetpack `SplashScreen` compat library (`androidx.core:core-splashscreen:1.2.0`, brings it to API 23+). Theme inherits `Theme.SplashScreen`, set `postSplashScreenTheme`, call `installSplashScreen()` before `super.onCreate()`. Migrate any custom pre-Android-12 splash activity.

**Elements** (each has light and dark versions)

| Element | Rule |
|---|---|
| App icon | Vector drawable, static or animated; launcher icon by default; one-third of the foreground is masked |
| Icon background | Optional, for contrast; adaptive icon background shows if contrast is sufficient |
| Window background | One opaque color |
| Branding image | Possible (bottom) but guidelines recommend against it |

**Dimensions**

| Asset | Canvas | Must fit inside |
|---|---|---|
| Branded image | 200 x 80dp | |
| Icon with icon background | 240 x 240dp | Circle 160dp diameter |
| Icon without icon background | 288 x 288dp | Circle 192dp diameter |
| Animated icon (AVD) | 432 x 432dp (4 x 108dp) | Visible inner 288dp (4 x 72dp) |

- Everything outside the circle is masked (a 300dp image keeps a 200dp circle).

**Animation**
- Sequence: system enter animation (not customizable), your splash (wait phase), exit animation (customizable via `SplashScreenViewProvider`; call `remove()` when done).
- Animated icon: `AnimatedVectorDrawable` XML; keep to 1,000 ms or less on phones; delayed start max 166 ms; if startup exceeds 1,000 ms consider a looping animation. Motion must be comfortably skippable (app may be ready early, or the splash times out).
- Dismiss only when the app is visually stable on first frame; no extra spinner screens after it.
- Animation lowers perceived startup time (user research cited by the source).

**Theme attributes**

| Attribute | Purpose |
|---|---|
| `windowSplashScreenBackground` | Single background color |
| `windowSplashScreenAnimatedIcon` | Center icon (static or AVD) |
| `windowSplashScreenAnimationDuration` | Icon animation duration (needed only on Android 12; inferred from AVD on 13+); readable via `iconAnimationDurationMillis` |
| `windowSplashScreenIconBackgroundColor` | Circle behind icon for contrast |
| `windowSplashScreenBrandingImage` | Bottom brand image (discouraged) |
| `windowSplashScreenBehavior` | `icon_preferred` always shows the icon on Android 13+ (never an empty splash) |

- `setKeepOnScreenCondition` holds the splash for small async loads (evaluated every frame, keep it fast). `setOnExitAnimationListener` for custom exit; compute remaining icon time with `iconAnimationStartMillis`.

---

## Haptics

Source: https://developer.android.com/develop/ui/views/haptics/haptics-principles

- Less is more: excess vibration annoys, numbs hands, distracts, and pushes users to turn haptics off.
- Use cases: notify an event needing attention (call, message, meeting); confirm a state change after a user action (button press, unlock, fingerprint accept / reject, camera); delight (scroll feedback, slider snap, sync with animation, sound, video, games).

| Class | Character | Guidance |
|---|---|---|
| Clear | Crisp, discrete, like a physical button | Default; use action-based `HapticFeedbackConstants` |
| Rich | Expressive textures, flutter, wobble, heaviness; needs wide-band actuators or sequenced primitives | Fewer devices support it: always plan a fallback |
| Buzzy | Noisy, long, ringing after-effect (old pager motors) | For touch feedback choose no haptics over buzzy; acceptable as fallback only for attention events (calls, notifications) |

**Rules**
- Prefer predefined constants and effects: `HapticFeedbackConstants` first (consistency, accessibility, automatic fallback), then predefined `VibrationEffect` and composition primitives.
- Scale strength with importance and frequency: very frequent events (scroll, text handle) very subtle; important events (refresh, form submit) stronger than a toggle; ramp amplitude of ticks as a drag approaches a snap target.
- Be consistent inside the app and with the system (same constants for time pickers, keyboards).
- Co-design haptics with visuals and sound; out-of-sync haptics feel broken.
- Avoid legacy one-shot vibrations (`VibrationEffect.createOneShot`, `Vibrator.vibrate(long)`, `Vibrator.vibrate(long[], int)`) for feedback. A good keyclick lasts 10 to 20 ms, yet actuators can ring 20 to 50 ms more after a 20 ms input.

### Haptics APIs

Source: https://developer.android.com/develop/ui/views/haptics/haptics-apis

| API | Availability | Notes |
|---|---|---|
| `HapticFeedbackConstants` via `View.performHapticFeedback` | Android 1.5+ (per constant) | No permission; honors `hapticFeedbackEnabled` and the user's Touch feedback setting; no fallback needed |
| Predefined `VibrationEffect` (`CLICK`, `TICK`, `DOUBLE_CLICK`, and others) | Android 10+ | Needs `VIBRATE`; platform fallback automatic; `areEffectsSupported` returns `VIBRATION_EFFECT_SUPPORT_YES / NO / UNKNOWN` only to know if it is device-optimized |
| `VibrationEffect.Builder` (preferred composition) | Android 16 (26Q4)+ | Timeline of `Preset` (`PRESET_CLICK`, `PRESET_TICK`, `PRESET_LOW_TICK`), `Envelope` and `Event`; strictly increasing `startTimeMillis`; `setRepeatingEffect`; automatic fallback (except `WaveformEnvelopeBuilder`) |
| Envelope effects (`BasicEnvelopeBuilder`, `WaveformEnvelopeBuilder`) | Check `areEnvelopeEffectsSupported()` | Start and end at intensity 0; devices handle at least 16 control points and 20 ms between points; query `VibratorEnvelopeEffectInfo` limits; Waveform uses Hz and Gs, keep within the device FOAM range |
| `VibrationEffect.Composition` primitives (`startComposition`) | Android 11+ | No fallback: one unsupported primitive fails the whole effect; check `arePrimitivesSupported` / `areAllPrimitivesSupported` (reliable from Android 12) |
| On-off, one-shot, waveform (`createOneShot`, `createWaveform`) | Android 1+ | Last resort; fine for notifications and ringtones (waveforms can repeat); amplitudes need `hasAmplitudeControl()` or they round to 100% |

- Constant names (Source: https://developer.android.com/reference/android/view/HapticFeedbackConstants): `HapticFeedbackConstants.CONFIRM`, `REJECT`, `CONTEXT_CLICK`, `LONG_PRESS`, `CLOCK_TICK`, `KEYBOARD_TAP`, `VIRTUAL_KEY`, `TEXT_HANDLE_MOVE`, `GESTURE_START`, `GESTURE_END`, `TOGGLE_ON`, `TOGGLE_OFF`, `DRAG_START`, `SEGMENT_TICK`, `SEGMENT_FREQUENT_TICK`, `GESTURE_THRESHOLD_ACTIVATE`, `GESTURE_THRESHOLD_DEACTIVATE`. Compose equivalent: `LocalHapticFeedback.current.performHapticFeedback(HapticFeedbackType.Confirm)` and similar types. Composition primitives: `PRIMITIVE_CLICK`, `PRIMITIVE_TICK`, `PRIMITIVE_LOW_TICK`, `PRIMITIVE_THUD`, `PRIMITIVE_SPIN`, `PRIMITIVE_QUICK_RISE`, `PRIMITIVE_SLOW_RISE`, `PRIMITIVE_QUICK_FALL`.
- Notification vibration per channel: `NotificationChannelCompat.Builder.setVibrationPattern`, `NotificationCompat.setVibrate`, `NotificationChannel.setVibrationPattern` (first entry is the delay before vibrating).
- Devices without a vibrator ignore calls (`hasVibrator()` to check). Custom touch feedback should respect `Settings.System.HAPTIC_FEEDBACK_ENABLED` (0 = disabled).
- Vibration attributes (`AudioAttributes`, content type `CONTENT_TYPE_SONIFICATION`; usage `USAGE_ASSISTANCE_SONIFICATION` for foreground touch, `USAGE_ALARM` for alarms) are required in the background, where only attention haptics are allowed.
- Without amplitude control, rich amplitude-varying effects degrade to on / off: consider disabling them.

---
## Themes (Android mobile guide)

Source: https://developer.android.com/design/ui/mobile/guides/styles/themes

- Adopt system preferences (light / dark, dynamic color, contrast); ship a custom theme as fallback when dynamic color is unavailable; consider type settings per theme; always check text and surface contrast.

| Theme type | Scope | Notes |
|---|---|---|
| Light / dark (system) | Whole device | Dark theme aids legibility in low light, reduces eye strain, saves battery, and is a top-requested feature. Users pick always on / off / scheduled. Reflect the system setting; in-app override is optional. Android can force dark; WebViews support light / dark. Locking to light is possible but discouraged |
| User-generated (dynamic color) | Device + apps | Android 12+ (Material You): wallpaper source color generates light and dark schemes. Font size settings must carry into apps (sp) |
| Manufacturer | Device | OEM proprietary theming |
| Baseline (app) | App | Material baseline: purple scheme plus Roboto, used when nothing is defined |
| Custom / brand (app) | App | Full or partial custom schemes; multiple schemes allowed (user-selectable, sub-brands) |
| Content (app) | Part of UI | Dynamic color taken from content (key art); best with one content source per view |

- Keep a hierarchy: one primary theme source (dynamic or custom) covers most UI; avoid many competing themes.
- Theme attributes: color scheme (tones mapped to roles), type (Roboto default, customizable), shape (rounded = soft / playful, cut = serious), icons (Material Icons styles Filled, Outlined, Sharp, Rounded, Two Tone: use one style app-wide). Extend with your own systems (gradients, spacing).
- Theme vs style: a style is reusable per element (Body Large); a theme applies across elements or the app (Light, Dark).
- Implement with `MaterialTheme` in Compose or theme XML in Views; generate with the Material Theme Builder Figma plugin (exports light and dark schemes).

---

## Color (Android mobile guide)

Source: https://developer.android.com/design/ui/mobile/guides/styles/color

- Accessibility: check contrast; avoid similar-tone pairs; red / green is a common but colorblind-unsafe pattern; never use color as the only affordance (add a button style, weight change or icon).
- Use a limited palette; repeat established patterns; keep semantic colors consistent (if purple means membership, use it everywhere; never red error in one field and purple in another).
- Build light and dark schemes, ideally contrast variants too. Assign colors through role tokens, never hard-coded hex. Avoid mixing many dynamic / static sources in one view; don't pull dynamic content color from several items at once.

| HCT dimension | Range | Meaning |
|---|---|---|
| Hue | 0 to 360 | The color name ("red", "electric violet") |
| Chroma | 0 to about 120 | Colorfulness, gray to vivid |
| Tone | 0 (dark) to 100 (light) | Luminance; drives contrast; equal tones are inaccessible pairs |

- Source color generates five key colors (primary, secondary, tertiary, neutral, neutral variant) via Material Color Utilities. Some hue / chroma / tone combos don't exist (yellow lacks chroma at low tones; blue peaks at dark tones).
- A color scheme assigns tones to roles (on-primary, primary-container...); container / on-container pairs guarantee contrast; light and dark schemes use different tone assignments.
- UI color = accent (primary, secondary, tertiary, each 4 to 8 tones), semantic (error plus custom colors, with harmonization toward dynamic color), surface (tonal surfaces for containers, sheets, panes; most of the UI).
- Dynamic color: Android 12 (API 31)+ from wallpaper or in-app content. Always ship a static fallback scheme, otherwise devices without dynamic color get baseline purple.
- Hierarchy: primary roles on key CTAs (FAB); use container and outline roles to avoid an oversaturated look; most vibrant colors for the most prominent actions.
- Hex: 6 digits RGB, prepend 2 digits for alpha (8-digit ARGB). Values live in `color.kt` (Compose) or `color.xml` (Views).

---

## Material components overview

Source: https://developer.android.com/design/ui/mobile/guides/components/material-overview

| Category | Components |
|---|---|
| Action | Buttons (priority levels), FAB, extended FAB, icon buttons, segmented buttons |
| Communication | Badges, progress indicators, snackbars, tooltips |
| Containment | Cards, dialogs, bottom sheets, lists, dividers (explicit containment) |
| Navigation | Navigation bar or drawer (primary on mobile), tabs, top app bar, rail, search |
| Selection | Checkboxes, radio buttons, chips, switches, sliders, pickers, menus |
| Text input | Text fields |

- Use Material 3 components for code-backed, accessible building blocks; see "Design systems in Compose" for theming and custom systems. Detailed component specs live in the components reference of this skill.

---

## Translate iOS designs to Android

Source: https://developer.android.com/design/ui/mobile/guides/foundations/translate-designs

Work with a flow map; iOS screens split into bars, views, controls; style last.

| Step | iOS | Android |
|---|---|---|
| 1 System UI | Status bar, home indicator | Delete them first |
| 2 Frame | iPhone sizes | 412dp compact frame; also test 360dp and every window class |
| 3 System bars | | Android status bar on top, gesture or 3-button nav at bottom |
| 4 Primary nav | Tab bar, "More" tab | Navigation bar, 5 items max, no "More"; move profile / settings to top app bar; primary action may become a FAB; present on parent views; no lateral motion between destinations |
| 5 Nav bars | Nav bar with large title | Top app bar: navigation + left-aligned title on left, actions on right; large titles map to large flexible app bar collapsing on scroll; child views show Up arrow (hierarchy) distinct from system Back; drawer icon on parent views only if using a drawer |
| 5b Modals | Cancel / Done text | Full-screen modal app bar with close icon |
| 6 Sheets, alerts | Sheet modals, action / activity sheets, alerts | Full-screen dialogs, bottom sheets (share sheet too), Material dialogs |
| 7 Siblings | Segmented control | Tabs (attached to the app bar, swipeable) |
| 8 Content | 8pt grid, table cells, toggles | 16dp margins, 8dp grid (4dp for type and icons); Material switches, checkboxes, radios, filled or outlined text fields; lists use dividers sparingly and no disclosure indicators |
| 9 Style | San Francisco, SF Symbols, iOS motion | Roboto or brand Google Font; Material Symbols; ripple touch feedback; motion patterns: container transform, shared axis, fade through, fade |
| 10 Tidy | | Rewire prototype: nav, app bars, Up vs Back, Android transitions |

- Bring an existing design system or a one-sheet style guide across with Material Theming (color, type, shape).

---

## Samples

Source: https://developer.android.com/design/ui/mobile/samples

- Now in Android (design case study + Figma), Jetchat (M3, dynamic color, animations), Jetcaster (podcasts), Reply (adaptive design study). Use them as reference implementations.

---
## Platform version changes (Android 15, 16, 17)

Sources:
- https://developer.android.com/about/versions/15/behavior-changes-15
- https://developer.android.com/about/versions/16/behavior-changes-16
- https://developer.android.com/about/versions/17/behavior-changes-17

Only UI / UX-affecting changes. "Trigger" is the `targetSdk` that activates the change on a device running that version (or newer) unless stated otherwise.

| Version | Change | Trigger | What it means for design |
|---|---|---|---|
| Android 12 | System splash screen for every app; notification icon color derived from `setColor`; PiP `setAutoEnterEnabled` and `sourceRectHint` animations; Material You dynamic color in widgets | Device runs 12+ | Design icon-based splash; see Splash screen, PiP, Widgets |
| Android 13 (API 33) | `POST_NOTIFICATIONS` runtime permission; themed icons from `monochrome` layer; per-app language settings; `revokeSelfPermissionOnKill` | Device 13+ (notification permission enforced per targetSdk 33, inference) | Contextual notification opt-in; supply monochrome icon layer; add LocaleConfig |
| Android 15 (API 35) | **Edge-to-edge enforced**: status bar transparent, gesture nav bar transparent, 3-button nav 80% opaque matching window background, no top / bottom offsets | targetSdk 35 | Every screen must handle insets; check low-traffic screens (onboarding, sign-in, settings) |
| Android 15 | `setStatusBarColor`, `statusBarColor`, gesture `setNavigationBarColor`, `navigationBarDividerColor`, `setDecorFitsSystemWindows` deprecated and disabled; `setNavigationBarColor` for 3-button and contrast-enforced APIs deprecated but working | targetSdk 35 | Draw your own protection behind bars using `WindowInsets.Type.tappableElement()` (3-button height) or `statusBars()` |
| Android 15 | Display cutout: non-floating windows forced to `LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS` (no black bar) | targetSdk 35 | Inset critical UI away from cutouts; splash crash fix: core-splashscreen 1.2.0-alpha01+ |
| Android 15 | `Configuration.screenWidthDp` / `screenHeightDp` now include system bars | targetSdk 35 | Use `WindowMetricsCalculator` / `computeCurrentWindowMetrics`, insets or layouts for sizing |
| Android 15 | `elegantTextHeight` defaults to true (readable font for Arabic, Lao, Myanmar, Tamil, Gujarati, Kannada, Malayalam, Odia, Telugu, Thai) | targetSdk 35 | Test layouts in those scripts |
| Android 15 | `TextView` allocates width for complex / cursive glyph overhang (`setUseBoundsForWidth`, `setShiftDrawingOffsetForStartOverhang`) | targetSdk 35 | Text widths may grow slightly |
| Android 15 | `EditText` reserves locale-preferred minimum line height (`useLocalePreferredLineHeightForMinimum`) | targetSdk 35 | Field heights vary by locale (ja, my taller) |
| Android 15 | Predictive back system animations (back-to-home, cross-task, cross-activity) no longer behind dev option | Opted-in apps on 15+ | Ship predictive back |
| Android 15 | Single-tap passkey creation; one-account sign-in goes straight to screen lock; branding on biometric prompt | Device 15+ | See Passkeys |
| Android 15 | Apps can't change global Do Not Disturb; use `AutomaticZenRule` | targetSdk 35 | DND features become rules |
| Android 15 | Audio focus only for top app or foreground service | targetSdk 35 | Background playback needs a foreground service |
| Android 16 (API 36) | **Edge-to-edge opt-out removed**: `windowOptOutEdgeToEdgeEnforcement` deprecated and disabled (still works on Android 15 devices) | targetSdk 36 on 16+ | No escape from edge-to-edge |
| Android 16 | **Predictive back on by default**: system animations enabled, `onBackPressed` no longer called, `KEYCODE_BACK` no longer dispatched | targetSdk 36 on 16+ | Migrate to `OnBackPressedCallback` / `PredictiveBackHandler`, or temporarily set `android:enableOnBackInvokedCallback="false"` |
| Android 16 | `PRIORITY_SYSTEM_NAVIGATION_OBSERVER` back callback to observe without consuming | API 36 | Log back events without killing animations |
| Android 16 | `elegantTextHeight` deprecated and ignored; compact "UI fonts" discontinued | targetSdk 36 | Adapt layouts for the listed scripts |
| Android 16 | **Orientation, resizability and aspect ratio ignored on displays with smallest width >= 600dp**: `screenOrientation` (portrait / landscape variants), `resizableActivity="false"`, `minAspectRatio`, `maxAspectRatio`, `setRequestedOrientation()` ignored; apps fill the window, no pillarboxing | targetSdk 36 | Design every screen to rotate and resize; preserve state across recreation. Exceptions: games (`android:appCategory`), user opted into app default in aspect ratio settings, screens < sw600dp. Temporary opt-out: `PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY` (activity or app). Compat flag for testing: `UNIVERSAL_RESIZABLE_BY_DEFAULT` |
| Android 16 | Live Updates: promoted ongoing notifications with status bar chip, built with `Notification.ProgressStyle` (inference: platform feature, not in the fetched behavior-change pages) | Device 16+ | Follow Live Updates design rules |
| Android 16 | `VibrationEffect.Builder` composition with automatic fallback (26Q4 release) | API 36 (26Q4) | Preferred rich haptics API |
| Android 16 QPR 2 | System auto-themes icons of apps lacking a monochrome layer | Device 16 QPR 2+ | Provide your own monochrome layer to control the result |
| Android 17 (API 37) | **Orientation / resizability opt-out removed** on sw >= 600dp | targetSdk 37 | Adaptive layouts mandatory on large screens |
| Android 17 | Widget `RemoteViews` bitmap memory capped at `6 x width x height` bytes of the active display (1.5x a full-screen ARGB_8888 buffer); over-limit updates throw `IllegalArgumentException` (warning only for targetSdk <= 36) | targetSdk 37 | Downsample to widget max size, prefer `RGB_565` for opaque photos, decode once outside Glance `provideContent`, use full `updateAppWidget` when swapping images, provide a zero-bitmap error layout (`onCompositionError`); check with `adb shell dumpsys appwidget` |
| Android 17 | Full-bleed image widget layout with snap scrolling | Device 17+ | New canonical widget layout |
| Android 17 | Password fields hide every character when typing on a physical keyboard (`show_passwords_physical`; touch uses `show_passwords_touch`) | targetSdk 37 | Don't rely on last-character echo; offer a show-password toggle (inference) |
| Android 17 | Screen reader feedback for CJKV IME composition (`TextAttribute`, `AccessibilityEvent.setTextChangeTypes`) automatic in `TextView` | targetSdk 37 | Custom `InputConnection` editors must send text change types |
| Android 17 | Background audio hardening: background playback, focus or volume changes need a while-in-use foreground service or exact-alarm + `USAGE_ALARM` | targetSdk 37 (some rules for all apps) | Media controls must start from user intent |
