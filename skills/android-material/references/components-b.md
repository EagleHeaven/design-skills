# Android & Material 3: Components B (menus to tooltips)

Distilled from m3.material.io component pages (menus, navigation bar, navigation drawer, navigation rail, progress indicators, radio button, scroll fields, search, segmented buttons, side sheets, sliders, snackbar, split button, switch, tabs, text fields, time pickers, toolbars, tooltips) plus developer.android.com window size classes and Compose Material 3 pages (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

## Contents

0. [Choosing navigation](#choosing-navigation)
1. [Menus](#menus)
2. [Navigation bar](#navigation-bar)
3. [Navigation drawer](#navigation-drawer)
4. [Navigation rail](#navigation-rail)
5. [Progress indicators](#progress-indicators)
6. [Radio button](#radio-button)
7. [Scroll fields](#scroll-fields)
8. [Search](#search)
9. [Segmented buttons](#segmented-buttons)
10. [Side sheets](#side-sheets)
11. [Sliders](#sliders)
12. [Snackbar](#snackbar)
13. [Split button](#split-button)
14. [Switch](#switch)
15. [Tabs](#tabs)
16. [Text fields](#text-fields)
17. [Time pickers](#time-pickers)
18. [Toolbars](#toolbars)
19. [Tooltips](#tooltips)
20. [Status summary: what M3 Expressive changed](#status-summary-what-m3-expressive-changed)

---

## Choosing navigation

Sources: https://m3.material.io/components/navigation-bar, https://m3.material.io/components/navigation-rail, https://m3.material.io/components/navigation-drawer, https://m3.material.io/components/tabs, https://m3.material.io/components/toolbars, https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes

### Window size classes (width)

| Class | Width range | Typical devices |
|---|---|---|
| Compact | < 600dp | Phones in portrait |
| Medium | 600dp to < 840dp | Tablets and unfolded foldables in portrait |
| Expanded | 840dp to < 1200dp | Tablets and unfolded foldables in landscape |
| Large | 1200dp to < 1600dp | Large tablets |
| Extra-large | >= 1600dp | Desktop |

Height classes: compact < 480dp (phones in landscape), medium 480 to < 900dp, expanded >= 900dp. A phone in landscape is often medium width but compact height: two-pane layouts are impractical there.

### Primary navigation by window size

| Window | Recommended | Allowed / alternatives | Avoid |
|---|---|---|---|
| Compact | Flexible navigation bar, vertical items, 3 to 5 destinations | Modal expanded navigation rail (opened from a menu icon) for more than 5 destinations | Collapsed (standard) rail; horizontal nav items; vertical floating toolbar |
| Medium | Navigation bar with horizontal items, or collapsed navigation rail (choose by whether vertical or horizontal space matters more) | Modal expanded rail for many destinations | Using bar and rail together |
| Expanded | Collapsed navigation rail (3 to 7 items) | Standard (non-modal) expanded rail if space allows; modal expanded rail for dense layouts | Navigation bar |
| Large / Extra-large | Navigation rail (collapsed or standard expanded) | Modal expanded rail | Navigation bar (never stretch it across a wide window) |

### M3 breakpoint matrix (from the layout breakpoints page)

Source: https://m3.material.io/foundations/layout/breakpoints

| Breakpoint | Panes | Navigation | Communication | Supplemental action / selection |
|---|---|---|---|---|
| Compact | 1 | Navigation bar, or modal expanded navigation rail | Simple dialog, full-screen dialog | Bottom sheet |
| Medium | 1 (recommended) or 2 | Navigation bar, or modal expanded navigation rail (collapsed rail also listed as the swap for the bar) | Simple dialog | Menu |
| Expanded | 1 or 2 (recommended) | Modal or standard expanded navigation rail (collapsed rail as the default swap) | Simple dialog | Menu |
| Large | 1 or 2 (recommended) | Modal or standard expanded navigation rail | Simple dialog | Menu |
| Extra-large | 1 to 3 (recommended) | Modal or standard expanded navigation rail | Simple dialog | Menu |

Common swaps when the window grows:

| Role | Compact | Medium | Expanded |
|---|---|---|---|
| Persistent navigation | Navigation bar | Collapsed navigation rail | Collapsed navigation rail |
| Full navigation (menu icon) | Modal expanded rail | Modal expanded rail | Standard expanded rail |
| Supplemental selection | Bottom sheet | Menu | Menu |

- The rail is collapsed by default on mobile-sized windows and can be open (expanded) by default on expanded windows, revealing more destinations.
- Shift actions from the bottom of compact windows to the leading edge in medium and expanded windows (ergonomics). The FAB keeps a fixed position at the top of the rail.
- Medium windows: two panes only for low-density content with clear actions.

### Component roles at a glance

| Component | Job | Destinations / items | Where | Status (Nov 2026) |
|---|---|---|---|---|
| Navigation bar (flexible) | Top-level destinations of equal importance | 3 to 5 | Bottom, full width, compact and medium | Flexible bar recommended; baseline bar not recommended |
| Navigation rail (collapsed) | Top-level destinations | 3 to 7, plus optional menu and FAB | Leading edge, medium and up | Replaces baseline rail |
| Navigation rail (expanded) | Top-level plus secondary destinations, account switching | Many | Leading edge; standard (beside content) or modal (over content) | Replaces the navigation drawer |
| Navigation drawer | Same as expanded rail | 5+ top-level or 2+ hierarchy levels | Start edge | No longer recommended (May 2025) |
| Tabs | Switch between related content at the same level inside a page | Ideally up to 4 fixed; more when scrollable | Under the top app bar (primary) or inside content (secondary) | Current |
| Docked toolbar | Global page actions | Several actions | Bottom, full width | Replaces bottom app bar |
| Floating toolbar | Contextual page actions; can act as tabs for related sub-pages | Many, overflow menu when full | Floats over content, horizontal or vertical | New in M3 Expressive |

### Combination rules
- One primary navigation component per breakpoint. Never show a navigation bar and a navigation rail at the same time; transform one into the other when the window resizes.
- Do not combine a navigation drawer with a navigation bar.
- The navigation bar and a toolbar both sit at the bottom: never show both. Navigation bar on primary pages, toolbar on subsequent pages that need actions.
- Do not stack a floating toolbar used for local navigation above a navigation bar.
- Tabs can sit alongside a navigation rail as an additional visible layer of navigation.
- When a vertical floating toolbar and a navigation rail coexist, place the toolbar on the opposite side and use the centered rail configuration.
- Compose: `NavigationSuiteScaffold` switches between bar and rail by window size (named in the Android edge-to-edge guide). Keep the `NavigationBar` visible during scroll (it has no `scrollBehavior`); `BottomAppBar` can collapse via `scrollBehavior`.

---

## Menus

Source: https://m3.material.io/components/menus

Purpose: show a temporary set of actions or options on a surface that opens from a trigger. For actions that must always be visible, use a toolbar.

### Variants and status

| Variant / config | M3 | M3 Expressive (Nov 2025) |
|---|---|---|
| Vertical menus | n/a | Available, recommended for new designs |
| Menu (baseline) | Available | Still available, lacks new shapes, colors, selection states, motion |
| Color: standard (surface-based) | Available | Available |
| Color: vibrant (tertiary-based) | n/a | Available, use sparingly |
| Layout: standard | Available | Available |
| Layout: grouped (gaps between groups) | n/a | Available (gaps on Android; not on web) |

- Differences from M2: dropdown menu and exposed dropdown menu are now both just "menu" (they differ only in the trigger element). New color mappings and dynamic color.
- Vertical menus add rounded corners, standard and vibrant colors, more selection states and submenu motion with shape morphing.

### Baseline menu measurements

| Attribute | Value |
|---|---|
| Container width | 112dp min, 280dp max |
| Corner radius | 4dp |
| List item height | 48dp |
| Left/right padding (with or without icon) | 12dp |
| Padding between elements in an item | 12dp |
| Divider top/bottom padding | 8dp |
| Divider height | 1dp (width dynamic) |
| Leading/trailing icon size | 24dp |
| Label alignment | Vertically centered, start-aligned |
| Slot / custom content targets | 48x48dp minimum |

### When to use
- Overflow menus, text field dropdowns, select menus, context menus.
- A menu takes less space than a set of radio buttons or chips (but costs an extra step).
- Context menus: actions for a specific element (image, selected text), opened with secondary click (right-click, two-finger tap) or press-and-hold.
- Triggers: icon buttons, buttons, split buttons, text fields, filter chips, selected text.

### Anatomy
- Menu items: label text, optional leading icon, trailing icon, keyboard shortcut text.
- Optional gaps and dividers for grouping.
- Slots: an item can host simple custom content (images, progress indicators, color swatches).

### Rules
- Show conditionally unavailable items as disabled; do not remove them.
- Gaps: more expressive than dividers. Keep gap size constant, limit to one or two gaps per menu, never use gaps in scrollable menus.
- Dividers: use for scrollable menus and for text field dropdowns where grouping does not fit. On web, use dividers.
- Slots: keep the menu accessible, keep the standard item padding, 48x48dp targets, one action per item. Do not put buttons, switches or other direct actions inside an item (breaks keyboard and screen reader navigation).

### Placement and behavior
- Positioned relative to the window edge, below, beside or over the trigger. If it would be clipped, reposition left, right or above automatically. Opened near the top, it expands downward.
- Submenus open next to the parent item without overlapping it. Best on large screens. Submenus are not available in Jetpack Compose (per source).
- Compact windows: consider a bottom sheet instead of a menu (more room for items and long labels). Medium and larger: menus in context work best and can use submenus.
- Motion: enter/exit transition linking menu to trigger; the trigger shows a pressed state while open (also when opened by keyboard shortcut). Dense desktop products can open menus instantly.
- Filtering (autocomplete): a text field filters the item list as the person types; items ease into new positions.
- Scrolling: long menus scroll with a persistent scrollbar.
- Single-select: selecting a new item unselects the previous one. Multi-select: stays open until dismissed.
- Focus with submenus: focus follows hovered or focused submenu; the focused submenu morphs to more rounded corners, the unfocused one less rounded.
- Density (web only): higher density reduces top/bottom padding.

### Accessibility
- Selected items change shape and color by default, with 3:1 contrast between selected and unselected; add a checkmark as a second cue.
- Initial focus: first menu item. Exit by selecting, Escape, tapping outside, or system Back.
- Disabled items are focusable but not selectable. Dividers and gaps never receive focus.
- Accessibility label = item text. Role: Menu item (web); generic actionable element (Views and Compose). Mark the icon of an icon-plus-text item as decorative.

| Key | Action |
|---|---|
| Tab | Focus lands on menu |
| Space / Enter | Closed: open menu or submenu. Open: select item |
| Up / Down | Closed: open menu. Open: move focus |
| Left / Right | Open or close a submenu |
| Letter keys | Jump to next item starting with that letter |
| Escape | Close menu |

### Compose
- `DropdownMenu`, `ExposedDropdownMenuBox`.

---

## Navigation bar

Source: https://m3.material.io/components/navigation-bar

Purpose: persistent bottom navigation between 3 to 5 top-level destinations of equal importance in compact and medium windows. Formerly "bottom navigation" (M2).

### M3 Expressive (May 2025)
- New **flexible navigation bar** replaces the baseline navigation bar (baseline: "not recommended").
- Shorter height; supports horizontal navigation items in medium windows.
- Active label color changed from on-surface-variant to **secondary**.
- Differences from M2: no shadow, taller container (baseline), pill-shaped active indicator in a contrasting color, dynamic color.

| Item layout | M3 | M3 Expressive |
|---|---|---|
| Vertical items (icon above label) | Available | Available, default, use in compact |
| Horizontal items (icon and label side by side inside the indicator) | n/a | Available, use in medium |

### Layout specs
- Container spans 100% of the window width, always at the bottom, with a color fill for separation.
- Vertical items stretch to share the width equally. Horizontal items have fixed width; extra space goes to the outer ends and items stay centered with the same padding at every breakpoint.
- Heights (Compose M3 token): container 64dp (flexible bar), 80dp TallContainerHeight (baseline); vertical item indicator 56x32dp with 4dp icon-to-label gap; horizontal item indicator 40dp high with 16dp side padding; icons 24dp; container surface container. Compose flexible bar is `ShortNavigationBar`; baseline is `NavigationBar` with `NavigationBarItem` (named in the Compose Material 3 guide).

### When to use / not
- Use for 3 to 5 main pages, on mobile or tablet only.
- Do not use for a single task (viewing one email).
- Do not use with more than 5 destinations (collisions, no room for translations). Use tabs within a page or a modal expanded navigation rail behind a menu icon instead.
- Do not use with only 2 destinations, without labels, or with horizontal items in a compact window.
- Do not use in expanded or larger windows (use a rail). Not intended for desktop.

### Anatomy rules
- Icons must symbolize the destination. Active: filled icon; inactive: outlined. If no filled version exists, use semibold weight for the active icon.
- Active and inactive icons need at least 3:1 contrast with the container.
- Exactly one active indicator (the current page).
- Every item needs a 1 to 2 word label. Do not truncate or shrink the type to fit.
- Badges (optional) sit at the upper-right of the icon, for dynamic info such as unread counts.

### Placement and behavior
- FAB sits above the bar, right-aligned, never overlapping it.
- The bar can be temporarily covered by dialogs, bottom sheets, drawers, the keyboard; never permanently obstructed.
- Selecting a new destination uses the top-level transition pattern. Choose to preserve state (scroll, tab, in-line search) or reset it; preserve when people switch sections often.
- Re-selecting the active destination scrolls to top.
- Do not swipe between destinations (reserve swipes for carousels, list actions).
- Scrolling: the bar may hide on scroll, but never hide it while a screen reader is active.
- Selection animation: icon fills and the indicator expands from the icon center, on one axis only.

### Accessibility
- Touch: indicator appears in place, ripple passes through it, icon goes outlined to filled and changes color. Cursor hover: indicator appears in a reduced state.
- Selected: filled icon plus bold label; unselected: outlined icon plus medium label.
- Text scaling: bar grows vertically, keeps default padding, labels may wrap; labels must stay fully visible up to 200% text size, may truncate beyond.
- Initial focus: first item. Tab moves between items; Space/Enter selects.
- Accessibility label = destination name; add context when the visible text is ambiguous (for example "Library"). On Android Views a more descriptive label is not available and the role is not announced.

---

## Navigation drawer

Source: https://m3.material.io/components/navigation-drawer

Status: **no longer recommended** in M3 Expressive (May 2025). Use the **expanded navigation rail**, which covers most drawer functionality and adapts better across breakpoints. Guidance below applies to existing products.

Purpose: list of destinations and app functions (such as account switching) in a side sheet, permanent or opened from a menu icon.

### Variants

| Variant | Use in | Behavior |
|---|---|---|
| Standard | Expanded, large, extra-large | Beside content; permanently visible (frequent switching) or dismissible via menu icon (content-focused apps) |
| Modal | Any, mainly compact and medium | Over content with a scrim; opened by an external action (menu icon); does not affect layout grid |

Differences from M2: two named variants, rounded corners on the ending edge, updated selected state color and shape, dynamic color.

### Measurements (standard and modal)

| Attribute | Value |
|---|---|
| Container height | 100% |
| Container width | 360dp |
| Container shape (standard) | 0, 16, 16, 0dp corner radii |
| Icon size | 24dp |
| Active indicator height | 56dp |
| Active indicator shape | 28dp (full pill) |
| Active indicator width | 336dp |
| Left / right padding | 28dp |
| Active indicator padding | 12dp |
| Padding between elements | 0dp |
| Label alignment | Start |

### When to use (legacy)
- 5 or more top-level destinations, 2 or more hierarchy levels, quick navigation between unrelated destinations, replacing rail or bar on large screens.
- Do not pair with a navigation bar. Bar for compact, rail for medium and expanded, standard drawer for expanded and up.

### Anatomy and rules
- A list inside a side sheet, plus optional headers, section labels (subheads) and dividers between groups (never between individual items).
- Opens from the start edge (left in LTR, right in RTL).
- Labels short enough to avoid cut-off; truncation is acceptable, wrapping or smaller text is not.
- Icons optional but all-or-nothing; always before text; reuse the same icons elsewhere in the app.
- Modal dismissal: select an item, tap the scrim, or swipe toward the anchoring edge.
- Responsive: transition between components (rail becomes drawer when rotating to landscape). On web below 320 CSS px, swap to a navigation bar. With a rail plus modal drawer, the drawer may repeat rail destinations if hierarchy levels are visually separated.
- Drawer content scrolls independently. Enter/exit transition when appearing.

### Accessibility
- Filled icon for selected, outlined for others; icon darkens (light theme) or lightens (dark theme) on selection.
- Initial focus: first destination. Tab lands on first destination; arrows move between destinations; Space/Enter selects and moves focus to the opened section.
- Label = destination name, more descriptive when ambiguous ("Recents"). Android Views cannot set a more descriptive label and does not announce the role.

### Compose
- `ModalNavigationDrawer`, `PermanentNavigationDrawer` (Compose Material 3 guide; it also shows them combined with `NavigationRail`). `DismissibleNavigationDrawer` exists. For new work prefer the expanded rail.

---

## Navigation rail

Source: https://m3.material.io/components/navigation-rail

Purpose: vertical navigation on the leading edge for medium, expanded, large and extra-large windows, with optional menu button and FAB.

### M3 Expressive (May 2025)

| Variant | M3 | M3 Expressive |
|---|---|---|
| Collapsed navigation rail | n/a | Available, replaces baseline rail |
| Expanded navigation rail | n/a (was navigation drawer) | Available, replaces navigation drawer |
| Navigation rail (baseline) | Available | Not recommended |

| Configuration | Options |
|---|---|
| Expanded layout | Standard (non-modal, default), modal |
| Expanded behavior | Transition to collapsed rail, or hide when collapsed |
| Color change | Active label on vertical items: on-surface-variant to secondary |

Differences from M2: predictive back, pill active indicator, dynamic color.

### Usage
- **Collapsed:** 3 to 7 destinations along the leading edge; never hidden. Medium to extra-large. In medium windows with few destinations, consider a navigation bar. Compact windows always use a navigation bar.
- **Expanded:** always opened from a menu icon; can reveal secondary destinations. Standard: beside body content, for large windows. Modal: over content, for information-dense layouts with limited space or many destinations. In immersive experiences the expanded rail can be fully hidden and shown only via the menu icon.
- Collapsed and expanded transform into each other via the menu button; the menu icon changes to show it can collapse.

### Anatomy and rules
- Container on the leading edge (left LTR, right RTL), always vertical. Fill can be removed if all items keep 3:1 contrast. Never horizontal (use a navigation bar for that).
- Items group-aligned to top or center; center on tablets for reach. Menu icon and FAB always top-aligned.
- FAB at the top of the rail (key action above destinations), resting elevation level 0 when nested. Not at the bottom.
- Logo at top allowed but must not look like a button; never use a logo as the expand/menu button.
- One active indicator. In the expanded rail it hugs the label; to mimic the old drawer, make it fill the container width.
- Target area always spans the full rail width, even when the item container hugs content.
- Icons: filled when active, outlined otherwise (semibold if no filled version).
- Labels: one word; avoid wrapping (line break between words or hyphenate if unavoidable); no truncation, no smaller type.
- Badges: on the icon's upper right in collapsed rails, next to the label in expanded rails.
- Optional vertical divider on the edge adjacent to content.

### Measurements (Compose M3 token)

| Attribute | Value |
|---|---|
| Collapsed rail width | 96dp (narrow 80dp) |
| Expanded rail width | 220dp min, 360dp max |
| Top space | 44dp |
| Vertical item indicator | 56x32dp, Full corner, 4dp icon to label |
| Horizontal item indicator (expanded) | 56dp high, 16dp side padding, 8dp icon to label |
| Item vertical space | 4dp |
| Modal expanded rail | surface container, level 2 (3dp), 16dp corner |

### Placement and adaptive
- Outside any panes, along the leading edge; never inside body content. When hidden, content can fill the space if the menu icon stays reachable.
- Large to small: rail transforms into a navigation bar. Never show both.
- More than 5 destinations in small windows: modal expanded rail.
- Expanding the rail resizes page content automatically; rail contents expand too (FAB becomes extended FAB, extra destinations appear).

### Behavior
- Destinations stay fixed during vertical scroll. With horizontal scrolling layouts, the rail may scroll away or stay fixed; use a divider or elevation to show content passing under.
- Selection: top-level transition; icon fills; indicator grows from icon center.
- Predictive back applies only to the modal expanded rail (previous screen previewed).

### Accessibility
- Feedback: ripple through indicator, outlined to filled icon, icon and text color change; hover state on cursor.
- Text scaling: items grow vertically, wrapping allowed; full label visible up to 200%.
- Initial focus: first interactive item (menu, FAB or first destination). Tab or arrows move between items; Space/Enter selects.
- Labels as navigation bar (descriptive when ambiguous; Views limitation applies).

### Compose
- Baseline: `NavigationRail` with `NavigationRailItem` (Compose Material 3 guide). Expressive collapsed/expanded rail: `WideNavigationRail`, `ModalWideNavigationRail`.

---

## Progress indicators

Source: https://m3.material.io/components/progress-indicators

Purpose: show status of an ongoing process (loading an app, submitting a form, saving). Two variants: linear and circular.

### Updates
- M3 Expressive (Aug 2024): configurable track thickness and optional **wavy** active indicator.
- Dec 2023 (non-text contrast): end **stop indicator** added, higher track/indicator contrast, new motion, rounded corners.
- Baseline separate linear and circular token sets are no longer recommended.

| Configuration | M3 | M3 Expressive |
|---|---|---|
| Determinate (default), indeterminate | Available | Available |
| Track thickness fixed 4dp | Available | Available |
| Track thickness configurable | n/a | Available |
| Shape flat (default) | Available | Available |
| Shape wavy | n/a | Available (defined by amplitude and wavelength; changes overall height) |

### Specs

| Attribute | Value |
|---|---|
| Default track thickness | 4dp |
| Stop indicator | 4dp circle at the end of a linear determinate track |
| Circular size range | 24dp to 240dp |
| Linear minimum host element | 40dp (do not place in smaller elements) |
| Linear end padding | 4dp minimum (adjustable) |

### Choosing by wait time

| Expected wait | Use |
|---|---|
| Under 200ms | No indicator |
| 200ms to 5s | Loading indicator |
| Over 5s | Progress indicator (consider letting people leave the page during very long waits) |

### Rules
- One indicator per group of loading items, not one per item (unless activated independently).
- Use the same variant for the same kind of process everywhere in the product.
- Determinate must reflect true progress; indeterminate when duration is unknown; switch from indeterminate to determinate once progress is known.
- At low percentages the active indicator shows as a dot so progress is visible.
- Wavy suits longer processes and expressive tone; at small sizes it is less visible, so use flat in very small buttons.
- Linear: along the edge of the loading container (the edge that animates if it changes shape), or mid-container; one at the top of the page for page-wide progress.
- Circular: centered on the loading element (button, card, page). For "load more", place it in the empty space where content will appear. For short loads prefer a loading indicator.
- In buttons: set the active indicator to the button's label/icon color and remove the track (keeps 3:1).
- RTL: mirror linear indicators; circular need no mirroring.
- Large screens: reserve very large circular indicators for large and extra-large windows.

### Accessibility
- Active indicator: at least 3:1 against background or host component.
- Stop indicator required when the track has less than 3:1 contrast with its container or the surface behind.
- Role: progress bar. Label describes process plus content: "Loading news article", "Refreshing page".

### Compose
- `LinearProgressIndicator`, `CircularProgressIndicator`; wavy: `LinearWavyProgressIndicator`, `CircularWavyProgressIndicator`.

---

## Radio button

Source: https://m3.material.io/components/radio-button

Purpose: select exactly one option from a visible list.

### Measurements

| Attribute | Value |
|---|---|
| Icon size | 20dp |
| State layer | 40dp |
| Target | 48dp |
| Adjacent label color | on surface (unchanged during interaction) |

### When to use
- Single selection from a set where all options should be visible.
- Five or fewer options; beyond that, or to save space, use a dropdown menu (costs extra taps and effort).
- Use checkboxes for multiple related options, switches for standalone on/off settings.
- Do not nest radio buttons or use them for multi-select. Nesting checkboxes under a radio option is fine.

### Rules
- Always pair with an adjacent label; each option has its own label.
- Stack vertically; side-by-side layout is a caution case.
- Tapping either the control or its label selects.
- A group can start with none selected, but once something is selected it cannot be cleared; offer a "Not applicable" option or a "Clear selection" control if opting out must be possible.
- Do not apply density by default (drops targets below 48x48); offer density as a user choice, and keep the controls that revert it at 48x48 or larger.

### Accessibility

| Key | Action |
|---|---|
| Tab | Into the group, on the selected radio (or first if none) |
| Shift + Tab | Into the group, on the selected radio (or last if none) |
| Arrows | Move focus and selection to previous/next, wrapping |
| Space | Select focused radio (no effect if already selected) |

- Group label = group title, role Radio group. Each button label = its adjacent text.

### Compose
- `RadioButton`.

---

## Scroll fields

Source: https://m3.material.io/components/scroll-fields

Purpose: new in M3 Expressive. Expressive picker that scrolls through a list of values (mainly numbers) with a switch to text input. Used for time, distance, weight, temperature and custom lists.

### Sizes

| Size | Digits | Minimum width |
|---|---|---|
| Small | 1 to 2 | 100dp |
| Medium | 3 | 144dp |
| Large | 4 | 186dp |

- Fields hug content down to the minimum width and height; in larger windows they can fill the container or use a custom fixed size.
- Custom corner radius never below 16dp. Visually crop inactive values to hint at more content.
- Inactive value targets at least 48dp tall (they extend outside the container by default).

### Rules
- Finite or infinitely looping lists. Multiple fields side by side are fine; label each when values differ.
- Recommended maximum 4 digits. Avoid very long lists (for example 5-digit consecutive numbers such as money amounts); add intervals or use a text field.
- For choosing time, use the time picker (which includes scroll fields).
- Combine with other controls (button groups) for richer filters.
- Placement: inline preferred; non-modal dialog if inline is impossible; modal dialog only when the UI is too cluttered.
- Larger screens: increase field height and width to fill containers comfortably.
- Behavior: swipe or tap the value above/below; values snap to vertical center; the active value is darker and larger.
- Input mode: numeric or standard keyboard; for strings auto-complete from the first character; errors appear below the fields and highlight the wrong value.
- High contrast mode supported.

### Accessibility
- Always provide keyboard text input: a toggle button near the field or a separate text field (built into the scroll time picker).
- Tab focuses the field; Space/Enter activates; Up/Down choose previous/next option.

---

## Search

Source: https://m3.material.io/components/search

Purpose: let people find content with queries, through a search bar and a container of suggestions and results.

### Naming and updates
- Feb 2025 (M3 Expressive): "search bar" and "search view" are now jointly called **search**. New visual style and motion, more flexible trailing icons; bar grows wider when focused; gaps can group results.
- Styles: **contained** (recommended, filled container separates bar from results) and **divided** (baseline, divider between bar and results; not recommended in Expressive).
- Layouts for focused search: **docked** and **full-screen**.
- Differences from M2: lower elevation, no shadow by default; formerly "open search bar".

### Search bar measurements

| Attribute | Value |
|---|---|
| Container width | 360dp min, 720dp max |
| Container height | 56dp |
| Margins / leading and trailing padding | Unfocused 24dp, focused 12dp (Expressive bar expands on focus) |
| Leading icon to label (from tap target) | 4dp |
| Label to trailing icon (from tap target) | 4dp |
| Avatar size | 30dp |
| Label alignment | Start |

### Focused search (contained) measurements

| Attribute | Value |
|---|---|
| Full-screen container | Full width, full height |
| Docked container width | 360dp min, 720dp max |
| Docked container height | 240dp min, 2/3 of screen height max |
| Search bar height | 56dp |
| Search view header height (Compose M3 token) | docked 56dp, full screen 72dp |
| Leading / trailing padding | 16dp |
| Icon to label padding (from tap target) | 4dp |

### Entry points
- Search bar: search within a specific view ("Search your messages").
- Search app bar: when search is the primary, global function.
- Search icon button: when search is secondary.
- If search is the main action, focused search can be its own destination in the navigation bar.

### Anatomy rules
- Container color: surface container high on a surface or white background. Do not place it on surface container (blends in); keep surface container roles more than one step apart.
- Contained style: container shape stays the same in unfocused and focused states.
- Leading: a navigation icon button (menu, back arrow) or a non-functional search icon.
- Trailing: one or two icons or icon buttons (voice search, location or profile action, overflow menu, decorative search icon). Examples: avatar, one or two trailing icon buttons, icon plus avatar.
- Hint text: short description of what can be searched ("Search replies"); replaced by input text when typing.
- Suggestions/results use the list component; add leading icons, category labels (Recent, Contacts), avatars, filter chips; separate groups with gaps.

### Placement, adaptive, behavior
- Usually at the top of the screen, close to the searchable content; stays inside its pane and scales with it, internal elements anchored left and right.
- Full-screen layout is the default in compact windows; docked (list under the bar with a scrim over content) for medium and expanded. Switch from full-screen to docked as the window grows.
- Focused search may show history before typing, live suggestions or results while typing, or wait until the query is submitted.
- Back icon releases focus, dismisses suggestions/results and restores the bar.
- Scroll: bar scrolls away and returns on scroll-up, or stays fixed.
- Execute by pressing Enter or picking a suggestion. Results list scrolls beneath the bar. After querying, input text stays visible but unfocused.
- Provide a clear status cue that search is active (search icon or "Results" label).
- Predictive back: the full-screen search detaches from the screen edge and shrinks, previewing the previous screen.

### Accessibility
- Screen reader must announce when suggestions/results appear.
- Initial focus: first interactive element (often the leading icon button or the field).
- Label = hint text. Field role: Text field on Android, Search field on iOS. Icon buttons follow icon button guidance; results follow list guidance.

| Key | Action |
|---|---|
| Tab / Shift+Tab | Move between interactive elements |
| Space / Enter | Activate the text field |
| Arrows | Move between result items |

### Compose
- `SearchBar(SearchBarState, ...)` is linked from the source page. Related: `DockedSearchBar`, `TopSearchBar`, `ExpandedFullScreenSearchBar`.

---

## Segmented buttons

Source: https://m3.material.io/components/segmented-buttons

Status: **no longer recommended** in M3 Expressive (May 2025). Use the **connected button group** (same function, updated visuals).

Purpose: select options, switch views or sort, among 2 to 5 choices. For more items or complex choices use chips.

### Variants
- Single-select: exactly one of up to five options (sizes, views, sorting). Behaves like a radio group.
- Multi-select: zero to all of 2 to 5 options (price range filters). Behaves like checkboxes.

### Measurements

| Attribute | Value |
|---|---|
| Height | 40dp (density reduces height only) |
| Container width | Dynamic, based on labels |
| Segment width | Container width / number of segments |
| Outline width | 1dp |
| Left/right padding | 12dp min |
| Padding between elements | 8dp |
| Target | 48dp |
| Shape | Fully rounded ends |

Differences from M2: was "toggle buttons"; 40dp height; optional check icon; sentence case labels; full rounding.

### Rules
- 2 to 5 segments, never 6 or more, never wrapping to a second line.
- Short labels; if a label does not fit, use an icon alone. Do not mix icon-only and text segments. Icon-only options must be unambiguous.
- When a segment with icon plus label is selected, the checkmark replaces its icon.
- Keep margins from the viewport edge; on large screens cap segment padding so it does not span the full width.
- Can sit on bottom sheets or full-screen dialogs.

### Accessibility
- Outline 3:1 against the surface; selection shown by checkmark plus color (never color alone).
- Tab reaches the component; arrows move between segments; Space/Enter toggles. Initial focus on the first segment (leftmost in LTR, rightmost in RTL) regardless of selection.
- Labels from visible text; icon-only segments describe the meaning ("Inexpensive"). Single-select role Radiogroup; multi-select role Checkbox.

### Compose
- `SingleChoiceSegmentedButtonRow`, `MultiChoiceSegmentedButtonRow`. New work: button groups (see the buttons reference).

---

## Side sheets

Source: https://m3.material.io/components/side-sheets

Purpose: supplementary content and actions (filters, details, supplemental features) without interrupting main content. Variants: standard and modal.

### Measurements (standard and modal)

| Attribute | Value |
|---|---|
| Start/end padding | 24dp |
| Start padding with icon (modal) | 16dp |
| Padding between top elements | 12dp |
| Bottom actions area height | 72dp |
| Bottom actions top padding | 16dp |
| Bottom actions bottom padding | 24dp |
| Bottom actions alignment | Left (start) |
| Max width | 400dp |
| Margins when detached | 16dp |
| Modal corner radius | 16dp |

### Usage
- Standard: mostly medium and expanded windows; stays visible next to primary content; opening it shrinks the body area while keeping a trailing margin.
- Modal: preferred in compact windows; must be dismissed before interacting with underlying content.
- Fixed width, usually full screen height; size follows the app's region layout.

### Anatomy
- Container (only required element), optional back icon button, close icon button, action buttons (Save, Edit, Download; use elevation, fill and tone for emphasis), dividers (actions vs content, user vs system content), content.

### Behavior
- Scrolls vertically independent of the page; never horizontally.
- RTL: sheet appears on the left edge with everything mirrored.
- Predictive back: sheet detaches from top and bottom edges, scales in the gesture direction, previous screen previews.

### Accessibility
- A close affordance (close icon button) is required.
- Tab focuses enabled icon buttons; Space/Enter activates. Role: Dialog.

### Compose
- No Compose API named in the source.

---

## Sliders

Source: https://m3.material.io/components/sliders

Purpose: select a value (or range) along a track, with immediate effect: volume, brightness, filter intensity.

### Variants and updates

| Variant | M3 | M3 Expressive |
|---|---|---|
| Standard | As "continuous" | Available |
| Centered | Web only | Available |
| Range | Available | Available |
| Discrete | Available | Now the "stops" configuration |

- M3 Expressive (May 2025, Views and Compose): vertical orientation, optional inset icon, five sizes XS (default), S, M, L, XL. S to XL are presets on Views and token-only elsewhere (swap `md.comp.slider.xsmall.*` tokens for the target size).
- Dec 2023: centered and range configs, new track and handle shapes, handle narrows on press, track adapts near edges.

### Measurements

| Attribute | XS | S | M | L | XL |
|---|---|---|---|---|---|
| Track height | 16dp | 24dp | 40dp | 56dp | 96dp |
| Handle height | 44dp | 44dp | 52dp | 68dp | 108dp |
| Track shape (corner) | 8dp | 8dp | 12dp | 16dp | 28dp |
| Inset icon size | none | none | 24dp | 24dp | 32dp |

| Common | Value |
|---|---|
| Handle width | 4dp |
| Value label container | 48dp wide x 44dp tall |

### When to use which
- Standard: one value from a range starting at zero or the sequence start.
- Centered: value in a negative-to-positive range where zero/default is in the middle.
- Range: min and max values with two handles. Avoid vertical range sliders.
- Show the full range of values. Changes apply immediately.
- XL only for hero moments where the slider is the main element. Larger sizes give bigger targets and emphasis.

### Anatomy rules
- Track: active (min to handle, or between handles) and inactive parts, same thickness. Values increase left to right in LTR, reversed in RTL.
- Handle changes shape when pressed (narrows), value label appears while interacting; for range sliders show one value at a time. The label is optional if the value is shown elsewhere.
- Alternative: a linked text input next to the slider, kept in sync, reachable by Tab right after the slider.
- Stop indicators: mark selectable values; handle snaps to nearest stop; avoid too many. End stops on the inactive track guarantee 3:1 contrast and can be removed if the track already has it. Icons or text at the ends can replace them.
- Inset icon: standard M, L, XL only (never XS or S, never centered or range). Moves to the inactive track at low values; consider swapping the icon at zero (volume to mute).

### Behavior
- Drag the handle, tap the track to jump, or use the keyboard.

### Accessibility
- Initial focus on the handle. Role: slider; label = adjacent text label.
- End of inactive track needs 3:1 contrast (stop indicator or end icons).

| Key | Action |
|---|---|
| Tab | Focus handle |
| Arrows | Change by one value or one stop |
| Space + Arrows | Change by a larger interval |
| Home / End | Jump to first / last value |

### Compose
- `Slider`, `RangeSlider`, `VerticalSlider` (the source confirms Compose support for the Expressive update).

---

## Snackbar

Source: https://m3.material.io/components/snackbar

Purpose: brief, low-priority message about a process the app performed or will perform, near the bottom, without blocking interaction.

### Snackbar vs dialog

| Component | Priority | User action |
|---|---|---|
| Snackbar | Low | Optional; can auto-dismiss |
| Dialog | High | Required; blocks the app until handled |

### Specs

| Attribute | Value |
|---|---|
| Height in compact windows | 48dp (1 line) to 68dp (2 lines) (Compose M3 token: SingleLineContainerHeight 48dp, TwoLinesContainerHeight 68dp; the M3 page text gave 64dp for two lines) |
| Max text lines (compact) | 2 |
| Ideal line length on wide screens | 40 to 60 characters |
| Auto-dismiss (no action) | 4 to 10 seconds, platform dependent |
| Concurrent snackbars | 1 |
| Actions | 1 text button max (dismiss/cancel optional) |

### Rules
- Text relates directly to the process. No bold or hyperlinks in the text. Icons are a caution case.
- Container fully opaque (slight transparency is a caution case). Action color must differ from supporting text; do not use an elevated button style for the action.
- A long action label may go on its own line (third line).
- Never make the snackbar the only path to a core use case.
- Placement: bottom of the UI, in front of content; nudge up to clear FABs or docked toolbars. Never over navigation or frequently used targets. Appears above the FAB (neither covering nor behind it); the FAB should not jump around.
- Full-width snackbars only when there is no persistent navigation (app bar, navigation bar); they may push the FAB up.
- Medium and expanded windows: grow horizontally, aim for a single line plus optional button, consistent left or center alignment at the bottom; never two side by side.
- Actionable snackbars stay until acted on or dismissed. Consecutive snackbars appear one at a time; an updated message can replace an outdated one immediately.
- Web: auto-dismissing snackbars need equivalent inline feedback (button label "Save" becomes "Saved") or an action so they persist.

### Accessibility
- Announce on appearance without moving or trapping focus; use a polite live region (Android, web). iOS 17+ is polite by default. On launch, announce after the page title.
- Actionable snackbars must not auto-dismiss.
- On web provide a documented shortcut to reach actionable snackbars (for example Alt+G). Tab moves focus; Esc dismisses when focused.
- After dismissal, return focus to the trigger or the next logical element; in Compose focus may go to the nearest visible or first actionable element.

### Compose
- `SnackbarHost` with `SnackbarHostState` in `Scaffold`.

---

## Split button

Source: https://m3.material.io/components/split-button

Purpose: new in M3 Expressive (May 2025). A primary action button joined to a trailing menu button that opens related actions.

### Configurations

| Category | Options |
|---|---|
| Size | XS, S (default), M, L, XL (same scale as buttons and icon buttons) |
| Color | Elevated, filled, tonal, outlined |

### Specs and anatomy
- Leading button: icon, label, or both; label of one or two words with a matching icon.
- Trailing button: always the expand/collapse (menu) icon, which rotates; do not replace it.
- Gap between the two buttons always 2dp; inner corner radius depends on size.
- Heights (Compose M3 token): XS 32dp, S 40dp, M 56dp, L 96dp, XL 136dp; resting inner corners 4dp (XS, S, M), 8dp (L), 12dp (XL); trailing icon 22 / 22 / 26 / 38 / 50dp.
- Inner corners change shape on hover, focus and press; trailing icon becomes centered when selected.
- Text and icons are optically centered when the halves are asymmetrical.
- Colors match standard buttons; selection only adds a state layer (unlike toggle buttons).
- Menu sits 4dp from the split button, aligned with the trailing button when possible, else with one side edge.
- Menu button rotates 180 degrees inward on open/close using the standard motion scheme.
- RTL: layout mirrored.

### Usage
- Hide secondary options behind a main action to reduce clutter. Works alone or with buttons, icon buttons and button groups; may differ in size from neighbors.
- Scale up in large windows or for emphasis.
- Usually opens a menu (can open cards). Use standard menu styling (vibrant scheme is fine); avoid irregular selected-item shapes.

### Accessibility
- Each half needs a 48x48dp target; XS and S are shorter, so extend their target areas to 48dp tall.
- Focus: leading then trailing button. Tab moves; Space/Enter activates.
- Leading label as a normal button. Trailing label states expanded/collapsed and signals more options related to the main action ("More watch options" for "Watch later").

### Compose
- `SplitButtonLayout`.

---

## Switch

Source: https://m3.material.io/components/switch

Purpose: toggle a single standalone setting on or off with immediate effect.

### Measurements

| Element | Attribute | Value |
|---|---|---|
| Track | Height x width | 32 x 52dp |
| Track | Outline width | 2dp |
| Track / handle / state layer | Shape | `md.sys.shape.corner.full` |
| Handle | Unselected | 16 x 16dp |
| Handle | Unselected with icon | 24 x 24dp |
| Handle | Selected | 24 x 24dp |
| Handle | Pressed | 28 x 28dp |
| Icon | Selected / unselected | 16dp |
| State layer | Size | 40dp |
| Target | Size | 48dp |
| Adjacent label | Color | on surface |

Configurations: no icon, icon on selected only, icon on both states. Differences from M2: taller, wider track, optional handle icon, contrast-compliant colors.

### When to use
- Binary settings (on/off, true/false) that apply immediately without a save step.
- Not for opposing options (list view vs map view): use a connected button group.
- Checkboxes for multiple related list options, radio buttons for one option from a list, switches for standalone or verbose options such as settings. Do not use a switch as a submit control for a list.

### Rules
- Always pair with an inline label describing what is controlled. Do not use "On"/"Off" as the label.
- Handle icons must clearly convey state (check for on, X for off); avoid ambiguous pairs.
- Usually stacked in lists. Toggled when the handle slides across; handle size changes on interaction.
- No default density (keeps 48x48 targets); offer density as an opt-in that can be reverted via 48x48 controls.

### Accessibility
- Handle grows on touch, press, and the hover area grows on cursor hover.
- Initial focus on the handle. Tab focuses; Space/Enter toggles.
- Label from adjacent text; add context when ambiguous ("Photo album"), ideally by improving the visible label.

### Compose
- `Switch`.

---

## Tabs

Source: https://m3.material.io/components/tabs

Purpose: organize related content at the same hierarchy level into switchable groups.

### Variants
- **Primary tabs:** top of the content pane under the top app bar; main content destinations. Use when there is one set of tabs.
- **Secondary tabs:** inside a content area for a further level; always placed below primary tabs; simpler indicator.

### Measurements

| Attribute | Value |
|---|---|
| Container height, label only | 48dp |
| Container height, icon and label | 64dp |
| Icon size | 24dp |
| Divider height | 1dp |
| Primary active indicator height | 3dp |
| Secondary active indicator height | 2dp |
| Active indicator shape | 3, 3, 0, 0 (rounded top) |
| Active indicator minimum length | 24dp |
| Inline icon to text | 8dp |
| Inline text to badge | 4dp |
| Badge overlap on stacked icon | 6dp |
| Scrollable tabs leading offset | 52dp |

Differences from M2: icons and labels vertically centered; dynamic color.

### Rules
- Use for related content, not sequential content (chapters).
- Container spans full window width, divided equally for fixed tabs, with a bottom divider; content may scroll under it.
- Icons optional but consistent (all tabs or none). Icons alone communicate less than text.
- Labels in one row; a second line with truncation if needed, or use scrollable tabs. Avoid truncation that changes meaning and inconsistent padding.
- Badges: max 4 characters including "+"; update or clear after the tab is viewed.
- Active tab: underline indicator plus color change of text and icon.
- Fixed tabs: max width per tab = widest tab; fluid margins, centered or leading-aligned. Avoid more than four fixed tabs.
- Scrollable tabs: when tabs do not fit; widths follow label length; good for browsing on touch.
- Fixed tabs: switch by tapping or swiping the content area; be careful with swipeable content inside (maps, swipe-to-delete).
- Vertical scroll: tabs stay pinned or scroll off and return on scroll-up; they should not slide behind the app bar.

### Accessibility
- Touch ripple; indicator slides into place.
- Do not loop scrollable tabs infinitely (traps linear screen reader navigation).
- Arrow or Tab moves through tabs; Space/Enter activates. Focus indicator on keyboard focus.
- No default density (48x48 targets).
- Add descriptive labels for icon-only tabs.

### Compose
- `PrimaryTabRow`, `SecondaryTabRow`, `PrimaryScrollableTabRow`, `SecondaryScrollableTabRow`, `Tab`.

---

## Text fields

Source: https://m3.material.io/components/text-fields

Purpose: let people enter and edit text (forms, dialogs, contact or payment info). Variants: filled and outlined, functionally identical.

### Measurements

| Attribute | Filled | Outlined |
|---|---|---|
| Container height | 56dp | 56dp |
| Target size | 56dp | 56dp |
| Top/bottom padding | 8dp | n/a |
| Left/right padding, no icons | 16dp | 16dp |
| Left/right padding, with icons | 12dp | 12dp |
| Icon to text | 16dp | 16dp |
| Supporting text / counter top padding | 4dp | 4dp |
| Supporting text to counter | 16dp | 16dp |
| Populated label side padding (in outline notch) | n/a | 4dp |
| Icons and unpopulated label | Vertically centered | Vertically centered |
| Corners | Rounded top, square bottom | All rounded |
| Inline image height | 24dp | 24dp |

### Choosing a variant
- Pick by visual style, distinction from buttons and surroundings, and UI goals.
- Outlined has lower emphasis; good for dense forms.
- Both variants on one screen only in separate regions (filled form plus outlined field in a dialog), never mixed within one section.

### Anatomy rules
- Container with fill and stroke (full outline or bottom line); stroke color and thickness change on focus.
- Every field has a label, aligned with input, always visible, short, single line, never truncated. An adjacent label (aligned to the leading edge) can replace it.
- Required fields: asterisk after the label, explained in supporting text or a form-level note; mark all required fields; asterisk shares the required-text color.
- Input modes: single line, multi-line (grows), text area (fixed height).
- Prefix (currency) and suffix (units, email domain).
- Supporting text ideally one line, persistent or on focus. Character or word counter when limits exist.
- Error text replaces supporting text (no layout jump). Describe how to fix the error (the most likely one if several). Error icon strongly recommended.
- Icons: input method (microphone), clear (only when text exists), dropdown arrow, valid/error, signifiers that open nested pickers (calendar opens date picker). Icons swap sides in RTL.
- Read-only fields look like regular fields and are labeled as read-only.

### Adaptive
- Use min/max values for margins, padding and container size; text fields should not span the full width of large screens.
- No default density; offer it as a user option (keep 48x48 targets for reverting).

### Accessibility
- Outlined containers benefit from 3:1 outline contrast with the background.
- Tab focuses enabled fields.
- Label = field label (include the asterisk when required). Interactive trailing icons get state labels ("Show password" / "Hide password"); non-actionable error icon label "Error".
- Prefix/suffix need unique ids and spoken names (currency name for a symbol).
- On error, apply the alert role and expose the message; when both supporting and error text exist, read supporting text first, then error.
- Counter label states how many characters can be entered. Supporting text is its own label.

### Compose
- `TextField`, `OutlinedTextField`.

---

## Time pickers

Source: https://m3.material.io/components/time-pickers

Purpose: select hours and minutes. Variants: **scroll** (new), **input**, **dial**.

### Updates
- M3 Expressive: scroll time picker added; input and dial pickers restyled; higher-contrast hour/minute fields and dial selector; expressive AM/PM buttons; "Select time" label removed. Source changelog dates this "Oct 2026". In Jetpack Compose the expressive styling is called "vibrant".
- Baseline input and dial variants are no longer recommended (use expressive styling).

| Behavior / config | M3 | M3 Expressive |
|---|---|---|
| Inline | Input only | Input and scroll |
| Modal | Available | Available (dial is modal only) |
| 12-hour / 24-hour | Available | Available |
| Dial orientation horizontal / vertical | Available | Available |

### Baseline measurements

| Element | Value |
|---|---|
| Container padding (all sides) | 24dp; width and height dynamic; headline left-aligned |
| Input field (input picker) | 96 x 72dp |
| Period selector (input picker) | 52 x 72dp |
| Dial time selector | 96 x 80dp (114dp wide for 24h vertical) |
| Period selector, vertical layout | 52 x 80dp |
| Period selector, horizontal layout | 216 x 38dp |
| Clock dial | 256dp |
| Dial selector handle | 48dp |
| Dial selector center | 8dp |
| Dial selector track | 2dp wide |

### Choosing
- Scroll: compact, inline with content (or on sheet, menu, dialog); use when surrounding content should stay visible.
- Input: keyboard entry, inline or modal; every scroll and dial picker must toggle to it.
- Dial: most engaging but largest; modal only; not for granular units (milliseconds).
- Use a time picker only when any minute can be chosen. For preset times or intervals use button groups, menus or a combo box.
- 24-hour format auto-adjusts: no AM/PM, inner dial for 12 to 23 (outer 0 to 11, back to 00 for the 24th hour); narrower modal.

### Rules
- Prefer inline placement; on touch devices without inline space, a scroll picker in a menu; modal dialogs rarely.
- Toggle icons: keyboard to input, clock back to dial, swipe icon back to scroll. A toggle must always exist (place one nearby if not using the built-in one).
- Custom typography allowed (stretched, rounded); with large narrow type use taller fields so neighbors stay half-visible. Custom colors must keep contrast for active and inactive values.
- Modal: container above a scrim; OK confirms and closes; Cancel or tapping the scrim discards. Dialog enter/exit transitions.
- Adaptive: scroll and input pickers resize evenly. Dial pickers switch to horizontal on larger windows or landscape phones, and to scroll or input when vertical space is very limited or zoomed. Never make a dial picker scroll.
- Behavior: dial opens on hours, then advances to minutes; tapping a field reactivates its dial. Input errors appear below and highlight the invalid field.

### Accessibility
- Direct text entry is required (built in).
- Targets: inactive scroll values 48dp tall; AM/PM, toggle and each dial item 48x48dp.
- Initial focus on the hour field. Dial keyboard: Tab through hour, minute, AM/PM; arrows switch AM/PM; Enter on a field enables number selection; on the dial, focus starts at minute 0 or hour 12, Right/Down clockwise, Left/Up counter-clockwise, Enter confirms.

| Element | Label | Role (Compose) |
|---|---|---|
| Hour / minute input | Hour / Minute | Text input |
| Hour scroll | Hour | Rotor |
| Hour dial | Hour | Toggle |
| AM/PM | AM, PM | Radio group |
| Picker toggle | Toggle input / dial / scroll picker | Button |
| OK / Cancel | OK / Cancel | Button |
| Dial value | "Hour 7 of 12", "Hour 23", "Minute 24 of 60" | Button |

### Compose
- `TimePicker`, `TimeInput` (the source notes Compose calls the expressive style "vibrant").

---

## Toolbars

Source: https://m3.material.io/components/toolbars

Purpose: show actions for the current page. M3 Expressive variants: **docked toolbar** and **floating toolbar**.

### Status
- **Bottom app bar: no longer recommended**, replaced by the docked toolbar (shorter, more flexible). Still supported.
- Floating toolbar added: horizontal or vertical, standard or vibrant, many elements, can pair with a FAB.
- Differences from M2 (bottom app bar): no shadow, taller, FAB contained in the bar.

| Variant / config | M3 | M3 Expressive |
|---|---|---|
| Docked toolbar | n/a | Available |
| Floating toolbar | n/a | Available |
| Bottom app bar | Available | Not recommended |
| Color standard | As bottom app bar | Available |
| Color vibrant | n/a | Available |
| Floating layout horizontal / vertical | n/a | Available |
| With FAB | As bottom app bar | Available (fully supported in Compose; added separately elsewhere) |

### Measurements

| Attribute | Value |
|---|---|
| Height (all toolbars) | 64dp |
| Alignment | Center, equal spacing between items |
| Default spacing between items (docked) | 32dp |
| Minimum outer padding | 16dp |
| Horizontal floating toolbar margin from window edge | 16dp min |
| Vertical floating toolbar margin | 24dp min |
| Element targets | 48x48dp min |

### Usage
- Docked: full window width, global actions repeated across pages. Bottom only. Square corners (rounding implies it expands); can be rounded on web and large screens. Not with a navigation bar or other bottom-aligned bars.
- Floating: above content, contextual actions for the page. Fully visible on screen; extra actions go into an overflow menu. Elevated by default; remove elevation if content beneath is visually distinct.
- Color: standard (low emphasis, keeps focus on content) or vibrant (draws attention, or signals a temporary mode such as edit mode). Other color roles allowed.
- Floating toolbars can act as tabs between related subsequent pages.
- Slots can hold icon buttons, buttons, text fields, images, custom components.

### Emphasis rules
- Emphasize at most one action: filled/tonal vs standard icon buttons, a custom color role, wide vs narrow icon buttons, or a paired FAB.
- Do not combine a primary emphasized action in the toolbar with a FAB, and do not mix different control designs.
- No square icon buttons in floating toolbars (clash with full rounding); fine in docked.
- Vertical toolbars: use narrow or default icon buttons, not wide.
- Avoid too many controls.

### Position and adaptive
- Floating vertical toolbars on either side in larger windows, opposite the navigation rail (use the centered rail configuration with it).
- Docked: 100% width; evenly spaced in compact; medium and up: center all items or center a key action and push others to the edges. Shrink height and use XS buttons only when vertical space is limited.
- Floating: only as large as needed before the 16dp margin; overflow in the trailing slot; reveal more actions as the window grows; width can be capped.
- Compact: avoid vertical toolbars (except simple screens with few controls) and multiple toolbars (use one).
- Larger windows: several floating toolbars on opposite edges can group actions (undo/redo vs editing tools).
- RTL: mirror icons and text that need it; flip action order if order matters.

### Behavior
- Docked: stays or animates off screen on scroll.
- Floating: stays, animates off, or collapses into a single high-emphasis action (in Compose it can collapse to a FAB or key action). Never collapse and scroll away at the same time.

### Accessibility
- Interactions belong to the contained elements; ripple on touch, hover state on cursor.
- Focus on the first interactive element; Tab or arrows navigate; Space/Enter activates.
- Web role: toolbar. Mobile: generic container; each control follows its own guidance.

### Compose
- `HorizontalFloatingToolbar` (linked from the source), `VerticalFloatingToolbar`, `FlexibleBottomAppBar` for the docked toolbar, `BottomAppBar` baseline.

---

## Tooltips

Source: https://m3.material.io/components/tooltips

Purpose: add context to an element. Variants: **plain** (short label, mainly for icon-only controls) and **rich** (longer explanation with optional subhead, link and buttons).

### Measurements

| Attribute | Plain | Rich |
|---|---|---|
| Container height | 24dp | Dynamic |
| Padding | 8dp | Top 12dp, bottom 8dp, sides 16dp |
| Buttons | none | Up to 2 text buttons |
| Distance from element | 4dp with visual boundary, 8dp without | Bottom-right by default |

Differences from M2: rich tooltips have more rounded corners; dynamic color.

### Rules
- Plain: label icon-only buttons and fields ("Present now", "Settings"). Do not repeat a visible label ("Edit" on an "Edit" button). Keep text short; avoid multiline personal data.
- Rich: definitions, feature explanations. Not for destructive-action warnings (use a dialog).
- Subhead one line; required when the tooltip appears automatically (page load).
- Buttons short and side by side; avoid stacking.
- Plain placement: above the element (below for elements in an app bar). Rich: bottom-right; repositions in 8dp steps to stay on screen; never covers the parent element. Desktop may center below and stay visible while the pointer stays in the target region.

### Behavior
- Show on hover (desktop) or long press (mobile). Persistent rich tooltips appear on click/tap or on page load to introduce a feature.
- Transient tooltips disappear 1.5 seconds after leaving the target region. Opening a new tooltip closes any other; never show two at once.
- Persistent rich tooltips stay until the person interacts with another element; hover does not trigger them; avoid them on icon buttons.

### Accessibility
- Stay on screen long enough to read; may appear on hover or focus but must not hide crucial information.
- Do not trap focus; focus order inside a rich tooltip runs top to bottom.
- Tab reaches buttons; Space/Enter activates. Role: Tooltip.

### Compose
- `TooltipBox` with `PlainTooltip` / `RichTooltip`.

---

## Status summary: what M3 Expressive changed

### Quick choosers across this file (compiled from the pages above)

Selection controls:

| Need | Use | Not |
|---|---|---|
| One option from 5 or fewer, all visible | Radio buttons (vertical list) | Switches, nested radios |
| One option from many, or space is tight | Menu (select / dropdown on a text field) | Long radio lists |
| Several related options in a list | Checkboxes | Switches as list selectors |
| Standalone setting, immediate effect | Switch | Radio, switch for opposing options |
| Opposing views (list vs map), 2 to 5 options | Connected button group (formerly segmented buttons) | Switch |
| Value along a continuous range | Slider (standard, centered, or range) | Scroll field for 5+ digit values |
| Numeric value from a short list, expressive | Scroll field (with text input toggle) | Scroll field for time (use time picker) |
| Any minute of the day | Time picker (scroll inline, dial in modal, input always available) | Time picker for preset slots (use button group or menu) |
| Main action plus related alternatives | Split button | Two separate unrelated buttons |
| Temporary actions for an element | Menu or context menu | Toolbar (persistent actions) |
| Persistent page actions | Docked or floating toolbar | Bottom app bar (legacy) |

Messaging and overlays:

| Need | Use | Key timing / rule |
|---|---|---|
| Low-priority confirmation of a process | Snackbar | Auto-dismiss 4 to 10 s if no action; one at a time |
| High-priority, blocking decision | Dialog | Requires action |
| Name an icon-only control | Plain tooltip | Hover or long press; hides 1.5 s after leaving |
| Explain a feature or term | Rich tooltip | Up to 2 text buttons; persistent variant on click or page load |
| Ongoing process 200 ms to 5 s | Loading indicator | Under 200 ms show nothing |
| Ongoing process over 5 s | Progress indicator (linear or circular) | Determinate when progress is known |
| Supplementary panel beside content | Standard side sheet (medium+) or modal side sheet (compact) | Close button required, max width 400dp |

Shared accessibility numbers in this file:

| Rule | Value |
|---|---|
| Minimum target | 48 x 48dp (text fields 56dp) |
| Non-text contrast (icons, tracks, outlines, selected vs unselected) | 3:1 |
| Navigation labels must stay fully visible up to | 200% text size |
| Density | Never on by default for radio, switch, tabs, text fields; opt-in only |

### What changed per component

| Component | Change | Date (per source) | Replacement / action |
|---|---|---|---|
| Navigation bar | Baseline not recommended; flexible bar (shorter, horizontal items in medium); active label to secondary | May 2025 | Flexible navigation bar |
| Navigation rail | Baseline not recommended; collapsed and expanded rails; modal and hide-when-collapsed configs | May 2025 | Collapsed rail |
| Navigation drawer | No longer recommended | May 2025 | Expanded navigation rail |
| Bottom app bar | No longer recommended | M3 Expressive | Docked toolbar |
| Toolbars | Docked and floating toolbars added, vibrant color | M3 Expressive | n/a |
| Segmented buttons | No longer recommended | May 2025 | Connected button group |
| Split button | New component, 5 sizes, 4 color styles | May 2025 | n/a |
| Sliders | Continuous renamed standard; discrete becomes stops; sizes XS to XL; vertical; inset icon | May 2025 | n/a |
| Progress indicators | Wavy shape, configurable thickness | Aug 2024 | n/a |
| Search | Unified naming; contained style recommended over divided; bar widens on focus | Feb 2025 | Contained style |
| Menus | Vertical menus with vibrant color, gaps, submenu shape morphing | Nov 2025 | Vertical menus for new designs |
| Scroll fields | New component | M3 Expressive | n/a |
| Time pickers | Scroll picker added; expressive ("vibrant" in Compose) styles; baseline not recommended | Oct 2026 | Expressive variants |
| Radio, switch, tabs, text fields, snackbar, side sheets, tooltips | No Expressive change stated in source | n/a | n/a |
