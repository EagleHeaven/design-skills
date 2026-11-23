# Android & Material 3: Components A (actions, containment, selection, communication)

Distilled from m3.material.io component pages and developer.android.com "Material Components" (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

Conventions used in this file:
- "Expressive" means the M3 Expressive update (May 2025 onward, with later additions such as Nov 2025 carousel and Dec 2025 lists).
- "Not recommended" means the source still ships the variant or token set but tells you to use the replacement in new designs.
- Compose names were checked against the `androidx.compose.material3` source (androidx-main, 2026-11-19); Views names are MDC-Android classes.
- Touch target floor everywhere in this file: 48x48dp per interactive element, even when the visible element is smaller.

## Contents

1. [Choosing a component](#choosing-a-component)
2. [Components overview](#components-overview)
3. [All buttons (choosing a button)](#all-buttons-choosing-a-button)
4. [Buttons](#buttons)
5. [Button groups](#button-groups)
6. [Icon buttons](#icon-buttons)
7. [Floating action button (FAB)](#floating-action-button-fab)
8. [Extended FAB](#extended-fab)
9. [FAB menu](#fab-menu)
10. [App bars](#app-bars)
11. [Badges](#badges)
12. [Bottom sheets](#bottom-sheets)
13. [Cards](#cards)
14. [Carousel](#carousel)
15. [Checkbox](#checkbox)
16. [Chips](#chips)
17. [Date pickers](#date-pickers)
18. [Dialogs](#dialogs)
19. [Divider](#divider)
20. [Lists](#lists)
21. [Loading indicator](#loading-indicator)
22. [Cross-component deprecations (Expressive)](#cross-component-deprecations-expressive)

---

## Choosing a component

Quick map from a need to the component in this file. Read the linked section before shipping.

| Need | Use | Avoid / instead of |
|---|---|---|
| The single most important, constructive action on a screen (Create, Compose) | [FAB](#floating-action-button-fab) (medium size by default) | Several FABs; FAB for destructive or minor actions |
| Primary screen action where an icon alone is ambiguous, long scrolling screen | [Extended FAB](#extended-fab) (small, medium, large) | Two extended FABs; extended FAB inside a row of actions |
| 2 to 6 related actions behind one primary action (Share to...) | [FAB menu](#fab-menu) | Speed dial, stacked small FABs, menu from an extended FAB |
| Final or unblocking action in a flow (Save, Confirm, Done) | [Button](#buttons), filled | More than one filled button per screen |
| Secondary action that still needs some weight (Next in onboarding) | Button, tonal | |
| Alternative or escape action next to a filled button | Button, outlined | Outlined on images or video |
| Lowest priority action, actions in dialogs, cards, snackbars | Button, text | Underlined text buttons (use a hyperlink in body text) |
| Button that must separate from a busy or patterned background | Button, elevated | Elevated as default style (shadows overused) |
| Binary on/off action with a label (Save / Saved, Favorite) | Toggle button (Expressive) | Changing the label length a lot between states |
| Compact supplementary action (Bookmark, Star, Share) | [Icon button](#icon-buttons) | Icon buttons with ambiguous glyphs |
| Several key actions shown together with shared motion (Back, Pause, Next) | [Standard button group](#button-groups) | Text or standard icon buttons inside groups |
| Switch views, sort, select 1 or many options inline (Walk / Bike / Drive) | [Connected button group](#button-groups) | Segmented button (no longer recommended) |
| Title, navigation and 1 to 2 page actions at the top | [App bar](#app-bars): small, medium flexible, large flexible | Baseline medium and large app bars |
| Search is central on a home page | Search app bar | Logo that opens the navigation rail |
| Many page actions | Toolbar (other reference file) | Overflow menu in the app bar |
| Unread dot or count on a navigation destination or icon | [Badge](#badges) (small or large) | Custom badge colors; counts over 4 characters |
| Supplementary content or long action list on phones | [Bottom sheet](#bottom-sheets) (modal or standard) | Bottom sheets as the main content; on desktop prefer a side sheet |
| Content and actions about one topic, entry point to detail | [Card](#cards) (elevated, filled, outlined) | Buttons on a card that is itself tappable |
| Browsing visual items (photos, media) horizontally | [Carousel](#carousel) | Carousel for text-heavy items (use cards or uncontained) |
| Select several related options in a list | [Checkbox](#checkbox) | Several switches in a list |
| Contextual, dynamic actions or filters in a set | [Chips](#chips): assist, filter, input, suggestion | Chips for Save or Cancel; single chip on its own |
| Pick a date or a range | [Date picker](#date-pickers): docked, modal, modal input | Modal calendar for a date of birth (use input) |
| Critical info or a decision that must block the flow | [Dialog](#dialogs) (basic or full-screen) | Dialog for low-priority info (use snackbar or inline) |
| Group sections or show hierarchy with a line | [Divider](#divider) | A divider after every item |
| Vertical scannable set of items, selection, settings rows | [List](#lists) (expressive: standard or segmented) | Baseline list for new designs |
| Short unknown wait 200ms to 5s, pull-to-refresh | [Loading indicator](#loading-indicator) | Indeterminate circular progress for short waits; indicator for waits over 5s |

Emphasis ladder for actions (from All buttons): FAB / extended FAB / FAB menu > filled button > split button > standard button group > tonal > elevated > outlined > connected button group > text > icon button.

---

## Components overview

Source: https://m3.material.io/components

Source: https://developer.android.com/design/ui/mobile/guides/components/material-overview

- A design system breaks down into primitives (color, type, shape) that compose into components (an icon plus a label form a button; buttons plus a surface form a card), with guidance and patterns on top. Material 3 is the latest iteration of Google's open-source design system.
- M3 groups components by purpose. The DAC page lists five categories; m3.material.io adds communication as a sixth:

| Category | Purpose | Components |
|---|---|---|
| Action | Help people achieve an aim | Buttons, FAB, extended FAB, icon buttons, segmented buttons (now connected button groups) |
| Communication | Provide helpful information | Badges, progress indicators, loading indicator, snackbars |
| Containment | Hold information and actions, including other components | Cards, dialogs, bottom sheets, side sheets, carousels, tooltips, lists, dividers |
| Navigation | Move through the UI | Navigation bar, navigation drawer / rail, tabs, bottom app bar, app bar |
| Selection | Let people specify choices | Checkbox, radio button, chips, switch, sliders |
| Text input | Enter and edit text | Text fields |

- m3.material.io catalog groupings: Buttons, Date & time pickers, Loading & progress, Navigation, Sheets, All other components.
- Lists can use implicit containment (spacing) or explicit containment (visible dividers or segmented containers).
- For Compose implementation, theming and component APIs live in "Design systems in Compose" and `androidx.compose.material3` (see the Compose Material 3 reference file).

---

## All buttons (choosing a button)

Source: https://m3.material.io/components/all-buttons

M3 has 10 button types. Pick by emphasis level.

| Emphasis | Component | When | Example labels |
|---|---|---|---|
| High | FAB, extended FAB, FAB menu | Largest, most prominent; the page's primary action. Extended FAB is best on large screens; FAB menu offers several options | Create, Compose, New thread, New file |
| High | Button (filled) | Most prominent after the FAB; final or unblocking actions in a flow | Save, Confirm, Done |
| High | Split button | Primary color plus a menu affordance; key action with several options | Send, Add, Create |
| High | Button group (standard) | Color, motion and shape draw attention to several key actions | Back, Pause, Next |
| Medium | Button (tonal) | Secondary palette; less prominent than filled. Final, unblocking or supporting actions | Save, Confirm, Done |
| Medium | Button (elevated) | Secondary palette plus shadow; only when a button needs separation from a patterned background | Reply, View all, Add to cart |
| Medium | Button (outlined) | Needs attention but is not the primary action; also the button for changing one's mind or leaving a flow | Reply, View all, Add to cart, Take out of trash |
| Low | Connected button group | Several related options that change the visible content | Walk, Bike, Drive |
| Low | Button (text) | No outline or fill; actions not essential to the journey | Learn more, View all, Change account, Turn on |
| Low | Icon button | Most compact, subtle; optional supplementary actions | Add to favorites, Print |

Hierarchy and placement:
- One high-emphasis button per screen for the primary action; layout must make other buttons read as less important.
- Several buttons can coexist; use different color styles to show relative importance.
- Do: text button to the left of a filled button; outlined to the left of filled; text to the left of outlined; a single filled button at the bottom of a mobile screen.
- Don't: stack a filled button above a text button.

---

## Buttons

Source: https://m3.material.io/components/buttons

Purpose: communicate an action people can take (in dialogs, modal windows, forms, cards, toolbars, button groups).

Compose: `Button` (filled), `FilledTonalButton`, `ElevatedButton`, `OutlinedButton`, `TextButton` (named in the Compose M3 guide); Expressive toggle buttons as `ToggleButton` and its styled variants. Views: `MaterialButton`.

### Variants and configurations

| Category | Options | M3 baseline | Expressive |
|---|---|---|---|
| Variant | Default | Yes | Yes |
| Variant | Toggle (selection) | No | Yes |
| Color style | Elevated, filled (default), tonal, outlined, text | Yes | Yes (now configurations, no longer separate variants) |
| Size | Small (default) | Yes | Yes |
| Size | XS, M, L, XL | No | Yes |
| Shape | Round (default) | Yes | Yes |
| Shape | Square | No | Yes |
| Small button side padding | 24dp | Yes | Not recommended |
| Small button side padding | 16dp | No | Yes (recommended, matches new sizes) |

- Optional leading icon; labels concise and in sentence case.
- Toggle buttons have no text style.

### Specs

| Attribute | XS | S | M | L | XL |
|---|---|---|---|---|---|
| Round corner | Full | Full | Full | Full | Full |
| Square corner | 12dp | 12dp | 16dp | 28dp | 28dp |
| Pressed corner (both shapes) | 8dp | 8dp | 12dp | 16dp | 16dp |
| Container height (Compose M3 token) | 32dp | 40dp | 56dp | 96dp | 136dp |

| Attribute | Value |
|---|---|
| Leading / trailing icon size (standard) | 20dp |
| Small button horizontal padding | 16dp (Expressive), 24dp legacy |
| Target size | at least 48x48dp (XS and S need extra target area) |
| Elevated style elevation | level 1 at rest, 0 disabled |
| Contrast | container (elevated, filled, tonal) or label (outlined, text) at least 3:1 vs background |

Color roles (container / icon and label):

| Style | Default | Toggle unselected | Toggle selected |
|---|---|---|---|
| Elevated | surface container low / primary | surface container low / primary | primary / on primary |
| Filled | primary / on primary | surface container / on surface variant | primary / on primary |
| Tonal | secondary container / on secondary container | secondary container / on secondary container | secondary / on secondary |
| Outlined | outline variant stroke / on surface variant | outline variant stroke / on surface variant | inverse surface / inverse on surface |
| Text | label primary | n/a | n/a |

- Other roles (for example tertiary / on tertiary) are allowed if container and text keep 3:1 contrast. Filled buttons may use tertiary colors in some cases.
- Outlined and text containers are invisible at rest, but state layers and disabled opacity behave like the other styles.

### Shape morph (Expressive)
- Pressed: buttons morph toward square; round and square buttons share the same pressed radius (table above).
- Selected (toggle): resting shape flips round (unselected) to square (selected). If the unselected shape is square, the selected shape is round.

### Usage rules
- Buttons are one of several ways to show actions; too many break hierarchy. Move extras into a navigation rail, chips, text links or icon buttons.
- Do: one button bottom right; filled button as wide as the layout grid. Don't: three buttons side by side at the bottom; label overflowing the container.
- Filled: most impact after the FAB; for important final actions (Save, Join now, Confirm). Ideally one per page.
- Tonal: lower priority that needs more than an outline (Next in onboarding); secondary color mapping.
- Elevated: tonal plus shadow; only when separation from a prominent background is truly needed. For high emphasis prefer filled.
- Outlined: medium emphasis, pairs with filled for the alternative action. Place on simple backgrounds; avoid images or video.
- Text: lowest priority, especially among several options. Simple backgrounds only. Never underline; use hyperlinked body text for links. Common in cards (keeps focus on content), dialogs and snackbars. In dialogs align to the trailing edge (right in LTR, left in RTL).
- Outlined and text styles rely on color to read as buttons; be careful next to chips or large text.

### Toggle buttons (Expressive)
- For binary choices (Save, Favorite). Pressing can change color, shape and label.
- Icon: outlined when unselected, filled when selected; if no filled glyph exists, increase weight.
- Default selected shape change: round to square.
- Keep label lengths similar across states (Do: Start / Reset. Don't: Start / Reset back to beginning).

### Anatomy
- Label text: most important element; 1 to 3 words; sentence case (keeps proper nouns distinguishable); never truncate or wrap, always one line.
- Container: round = fully rounded corners; square = subtler rounding that scales with size. Text style shows a container only on hover, focus, press.
- Icon (optional): leading side, before the label (mirrors in RTL). Don't put the icon above the label; don't use two icons.

### Adaptive
- Icon and label stay centered and grouped as width changes; never push them to opposite edges.
- Constrain width in large windows or place buttons beside other elements; avoid over-stretched buttons.
- Keep button order identical across screen sizes (screen reader and keyboard consistency).

### Accessibility
- Use cases: perform an action; navigate to and activate a button.
- 200% text: on Android, labels should still fit within two lines at 200% text size; if truncated, give a one-tap way to the full content.
- Web only: a modified motion curve avoids resonance on rapid repeated clicks.
- Keyboard: Tab to focus, Space or Enter to activate.
- Accessibility label = visible label (Done, Send, Reply); may add context.

### Differences from M2
- New color mappings, dynamic color; icon and label share one color; neutral text button no longer recommended.
- Icons 20dp; fully rounded corners and more height options.

---

## Button groups

Source: https://m3.material.io/components/button-groups

Purpose: an invisible container that spaces buttons and icon buttons and makes them react to each other through shape, width and motion.

Compose: `ButtonGroup` for standard groups; connected groups built from toggle buttons with connected shapes. Legacy segmented: `SingleChoiceSegmentedButtonRow` / `MultiChoiceSegmentedButtonRow`.

### Expressive update (May 2025)
- New component. Two variants: standard and connected.
- Connected button group replaces the segmented button (no longer recommended).
- Works with all button sizes XS, S, M, L, XL; applies a default shape (round or square) to all buttons.
- Selection modes: single-select, multi-select, selection-required.

| Variant | M3 baseline | Expressive |
|---|---|---|
| Standard button group | n/a | Available |
| Connected button group | Available as segmented button | Available |

### Specs

| Attribute | Value |
|---|---|
| Container height, small groups (Compose M3 token) | 40dp (standard and connected) |
| Standard group gap, small (Compose M3 token) | 12dp |
| Connected group inner padding | 2dp between buttons, all sizes |
| Standard group padding | varies with button size so each target is at least 48dp |
| XS and S connected groups | 48dp target and 48dp minimum width per button |
| Per-button target | at least 48x48dp |
| Color | none of its own; uses button / toggle button styles |
| Density | follows the density of contained buttons |

### Standard vs connected

| | Standard | Connected |
|---|---|---|
| Press / select effect | Pressed or selected button changes width, shape and padding; adjacent buttons move and temporarily change width | Only the pressed or selected button changes shape; neighbors unaffected |
| Width | Hugs its buttons | Spans the page or surface width (add a max width in large windows) |
| Use for | Several key actions with emphasis (Back, Pause, Next) | Select options, switch views, sort (single or multi-select with toggle buttons) |
| Colors | Mix styles, widths and colors to emphasize | Don't mix color styles (selection becomes unclear) |

### Rules
- All buttons in a standard group should share size and shape by default. Mixed sizes only for hero moments; avoid frequent size mixing. A different shape only when selected or to add meaning or contrast.
- A selected toggle button flips shape (round to square or square to round) and changes color per button specs.
- Connected groups are for toggle selection; avoid them when no button toggles.
- Avoid standard icon buttons and text buttons inside groups (they have no container to morph).
- Primary actions in a group get higher emphasis via size, color or shape.
- Groups stay on one line; never wrap. Stack several groups if needed (they don't interact vertically).
- Resizing: fixed (set width narrow to wide, size XS to XL, padding per breakpoint) or flexible (buttons grow until all flexible buttons reach their max width). Don't stretch icon buttons beyond the wide setting.
- Compact windows: smaller, narrower buttons. Large and XL windows: larger, wider buttons. Keep the primary action the most prominent at every breakpoint.
- Trailing buttons may collapse into an overflow menu at small breakpoints; put the overflow at the trailing end.

### Accessibility
- Container is not focusable and needs no label; focus lands on the first button, then each button.
- Keyboard: Tab into the group / between buttons, Arrow keys move within the group, Space or Enter activates.
- Don't reduce the larger inner padding of XS and S groups (it guarantees targets).
- Users must be able to tell which buttons are selected.

---

## Icon buttons

Source: https://m3.material.io/components/icon-buttons

Purpose: compact buttons for common actions using a system icon with a clear meaning.

Compose: `IconButton` (standard), `FilledIconButton`, `FilledTonalIconButton`, `OutlinedIconButton`, `IconToggleButton` and filled / tonal / outlined toggle variants.

### Variants and configurations

| Category | Options | M3 baseline | Expressive |
|---|---|---|---|
| Variant | Default, toggle (selection) | Yes | Yes |
| Size | Small (default) | Yes | Yes |
| Size | XS, M, L, XL | No | Yes |
| Shape | Round (default) | Yes | Yes |
| Shape | Square | No | Yes |
| Color | Filled (default), tonal, outlined, standard | Yes | Yes |
| Width | Default | Yes | Yes |
| Width | Narrow, wide | No | Yes |

- Default icon buttons can open other elements (menu, search). Toggle icon buttons represent binary on/off (favorite, bookmark). Don't use a toggle icon button to open an overflow menu.
- Baseline filled, tonal and outlined icon button token sets are deprecated in favor of the new token sets.

### Specs

| Size | Container | Round corner | Square corner | Pressed corner |
|---|---|---|---|---|
| XS | 32dp | Full | 12dp | 8dp |
| S (default) | 40dp | Full | 12dp | 8dp |
| M | 56dp | Full | 16dp | 12dp |
| L | 96dp | Full | 28dp | 16dp |
| XL | 136dp | Full | 28dp | 16dp |

| Attribute | Value |
|---|---|
| Target | at least 48x48dp (XS and S must extend their target), also when nested in other components |
| Widths | narrow, default, wide |
| Icon contrast | at least 3:1 vs surface or background |

Color roles (container / icon):

| Style | Default | Toggle unselected | Toggle selected |
|---|---|---|---|
| Filled | primary / on primary | surface container / on surface variant | primary / on primary |
| Tonal | secondary container / on secondary container | secondary container / on secondary container | secondary / on secondary |
| Outlined | outline variant stroke / on surface variant | outline variant stroke / on surface variant | inverse surface / inverse on surface |
| Standard | icon on surface variant | icon on surface variant | icon primary |

- Standard style: container invisible at rest, visible once a state layer applies.
- Shape morph: pressed morphs toward square with the same pressed radius for round and square; toggles go round (unselected) to square (selected), or square to round if the resting shape is square.

### Usage
- Emphasis order: filled > tonal > outlined > standard. Filled for key, high-emphasis actions (use sparingly). Tonal as the middle ground for secondary actions next to a high-emphasis one (Raise hand next to a filled End call). Outlined for medium emphasis when the button is not the focus (browsing card sets). Standard for low emphasis or on colorful surfaces.
- Use filled, tonal or outlined when the button needs separation from the background.
- Use size and width for hierarchy: the main action (play / pause, start / stop) is the most prominent. Buttons of similar importance share the same size.
- Place on backgrounds or in containers (cards, app bars, toolbars). Use only a few at once; in dense layouts group them in a toolbar or button group.

### Anatomy and icons
- Default icon buttons use filled icons. Toggles: outlined icon unselected, filled icon selected.
- If no filled glyph exists for a selected toggle, increase icon weight to semibold, then bold if still not distinct. Selection must be shown through at least two properties, never color alone.

### Accessibility
- Accessibility label describes the action (Add to favorites, Bookmark, Send message), never the icon name.
- On hover (web) show a tooltip describing the action.
- Keyboard: Tab to a non-disabled icon button, Space or Enter activates.
- Don't apply density by default (drops targets below 48x48); offer density as a user choice, and keep density controls themselves at 48x48 or larger.

### Differences from M2
- Former "toggle buttons" became icon buttons with default and toggle variants; new color mappings and dynamic color.

---

## Floating action button (FAB)

Source: https://m3.material.io/components/floating-action-button

Purpose: the most common or important action on a screen; appears in front of all content and persists while content scrolls.

Compose: `FloatingActionButton` (named in the Compose M3 guide); `MediumFloatingActionButton`, `LargeFloatingActionButton`; `SmallFloatingActionButton` exists but is not recommended.

### Expressive update (May 2025)
- Added medium FAB; small FAB no longer recommended; FAB and large FAB unchanged. Variants now defined by size, not color.
- New tone color styles primary, secondary, tertiary. Former primary / secondary / tertiary renamed primary container / secondary container / tertiary container (values unchanged).
- Surface color FABs no longer recommended.

| Variant | M3 baseline | Expressive |
|---|---|---|
| FAB | Yes | Yes |
| Medium FAB | No | Yes (most recommended) |
| Large FAB | Yes | Yes |
| Small FAB | Yes | Not recommended, use a larger size |

### Specs

| Size | Container (Compose M3 token, square) | Best for |
|---|---|---|
| FAB | 56dp | Compact windows with other actions on screen |
| Medium FAB | 80dp | Most situations, compact and medium windows, mobile default |
| Large FAB | 96dp | Clear, prominent primary action; best in expanded and larger windows, tablets |

| Attribute | Value |
|---|---|
| Icon to container contrast | at least 3:1 |
| Container to surface contrast | sufficient (container must stand out) |
| State layer with non-default color | same color as the icon (for primary style: `md.sys.color.primary`) |
| Margins (from FAB menu page) | 16dp, increasing to 24dp in large and XL windows |

### Usage
- One FAB per screen; a screen may have none (photo feed). Three FABs make the primary action unclear.
- Promote constructive actions: create, favorite, share, start a process. Avoid minor or destructive actions: archive, trash, alerts or errors, cutting text, toolbar-type controls (volume, font color).
- FAB can trigger an action on the current screen or open a new screen.
- Alignment left, center or right; above the navigation bar or nested in it.
- A FAB can become an extended FAB on larger screens or open a FAB menu.

### Anatomy
- Container: typically square-ish; never covered by other elements such as badges.
- Icon: clear and understandable, filled style. Web: tooltip on hover. No notifications in a FAB, no actions duplicated elsewhere on screen.

### Placement and adaptive
- Compact and medium: lower right (reachable, covers less content).
- Expanded: consider the upper left, for example inside the navigation rail, so it is among the first elements reached. Test placement with users.
- Medium FAB for mobile, large FAB for tablets and large screens.
- Don't give each of many cards its own FAB.

### Behavior
- Appears by expanding outward from a central point; icon can animate.
- FABs are not attached to the content surface; they move independently.
- Screen transitions: FAB disappears and reappears; reappear only if relevant, in the same position if possible.
- Can expand via container transform into any surface (including full screen or a full-screen dialog), or into a FAB menu.
- Stays in place on scroll. Across tabs: briefly disappears then reappears as new content settles; never slides with tab content.

### Accessibility
- Never disable a FAB; if the action is unavailable, hide the FAB.
- Focus order: prioritize it (on mobile: app bar, navigation bar, then skip content to the FAB).
- Web: tooltip on focus; don't fully obscure another element's focus indicator (partial cover is acceptable).
- Keyboard: Tab focuses, Space or Enter performs the action.
- Label describes the action (Compose a new message).

---

## Extended FAB

Source: https://m3.material.io/components/extended-fab

Purpose: the primary action with a text label, for when an icon alone is ambiguous or extra emphasis is needed.

Compose: `ExtendedFloatingActionButton` (named in the Compose M3 guide).

### Expressive update (May 2025)
- Three sizes aligned with FAB sizes, each with larger type: small 56dp, medium 80dp, large 96dp.
- Baseline extended FAB (56dp, label large) no longer recommended: use small extended FAB (type title medium, reduced inner padding).
- Surface extended FAB color styles no longer recommended.

| Variant | M3 baseline | Expressive |
|---|---|---|
| Small extended FAB | No | Yes (56dp) |
| Medium extended FAB | No | Yes (80dp) |
| Large extended FAB | No | Yes (96dp) |

| Expressive size (Compose M3 token) | Height | Icon | Icon to label | Side padding | Corner |
|---|---|---|---|---|---|
| Small | 56dp | 24dp | 8dp | 16dp | 16dp |
| Medium | 80dp | 28dp | 16dp | 26dp | 20dp |
| Large | 96dp | 32dp | 20dp | 28dp | 28dp |
| Extended FAB (baseline) | Yes | Not recommended |

Baseline measurements (for reference when migrating):

| Attribute | Value |
|---|---|
| Container height | 56dp |
| Container width | dynamic, 80dp minimum |
| Corner radius | 16dp |
| Icon size | 24dp |
| Padding | 16dp |

- Color: any color / on-color pair (primary / on primary, etc.) with equal legibility; choose by preference. State layer color must equal the icon color for non-default mappings.

### Usage
- Long scrolling screens needing persistent access to one action (checkout); when a label clarifies the action or adds emphasis.
- One per screen. Never as one option in a set of actions (use a filled button next to Back instead).
- Size: large extended FAB fits compact windows with one prominent action; medium or large in larger breakpoints.

### Anatomy
- Container: rounded rectangle hugging content; grows and shrinks with the label.
- Icon optional; a label is mandatory (no icon-only extended FAB). Icon and label must clearly relate.
- Label: 1 to 2 words; plan for localization growth; never wrap (Don't: "Save draft in folder").

### Placement
- Do: above the navigation bar. Don't: over a docked toolbar, below a top app bar, inside a dialog as the confirm action, next to a floating toolbar or other floating components.
- Compact and medium: bottom of the screen, centered or trailing-aligned.
- Expanded and larger: bottom right of the window (in both LTR and RTL), or inside the navigation rail.
- Mirror elements in RTL.

### Behavior
- Appears with enter-and-exit expansion; can container-transform into any surface.
- Collapses into a FAB on scroll down, re-extends on scroll up or at the bottom of the view (shape changes, icon moves left, label fades in).
- In a collapsed navigation rail use a FAB; it can become an extended FAB when the rail expands.

### Accessibility
- Icon and label are one focusable element; no tooltip needed (label is visible).
- Prioritize in focus order like the FAB. Large web screens: upper left (expanded rail); small windows: lower right.
- Accessibility label must start with the same first word as the visible label (visible "Create", label "Create a new invite").
- Keyboard: Tab focuses, Space or Enter activates.

### Differences from M2
- Same height as the FAB; boxier shape with smaller corner radius; new color mappings.

---

## FAB menu

Source: https://m3.material.io/components/fab-menu

Purpose: opens from a FAB to show 2 to 6 related actions floating on screen.

Compose: `FloatingActionButtonMenu` with `ToggleFloatingActionButton` and `FloatingActionButtonMenuItem`.

### Expressive update (May 2025)
- New component; replaces speed dial and any stacked small FABs.
- One menu size pairs with any FAB size; never used with extended FABs.
- Color sets: primary, secondary, tertiary; contrasting close button and item colors; dynamic color.

### Specs

| Attribute | Value |
|---|---|
| Items | 2 to 6 |
| Menu item measurements | same as medium button specs |
| Close button | always 56dp (Compose M3 token: 56x56dp, Full corner, 20dp icon) |
| Menu item height (Compose M3 token) | 56dp, Full corner, 24dp icon, 24dp side padding, 4dp between items |
| Gap between FAB and menu | variable, 4dp recommended |
| Margins | 16dp, 24dp in large and XL windows |
| Targets | at least 48dp |
| Animation origin | top trailing corner of the FAB (larger FABs place the menu slightly higher with larger bottom margin) |

| FAB color style | FAB menu color set |
|---|---|
| primary or primary container | primary |
| secondary or secondary container | secondary |
| tertiary or tertiary container | tertiary |

### Rules
- Opens only from a FAB, in the FAB's place; never from an extended FAB or another component.
- Align to the trailing edge (left edge in RTL, layout mirrored); stays anchored to the same corner at every window size.
- Items must be closely related under one action (Share). Don't group unrelated actions; don't use a one-item menu.
- Don't use a FAB menu when the FAB is paired with a floating toolbar or navigation rail.
- Each item has label text and keeps its icon (icon-only is a don't, text-only is a caution).
- Items hug their content, look consistent, are fully rounded; no truncation, no fixed equal widths, no square items.
- Pick a FAB size suited to the window size class; larger FABs for larger windows. On web the FAB menu uses the standard menu component.

### Behavior
- The FAB transforms into the menu's close button; items enter with the enter-and-exit pattern from a trailing corner, preferably the top one.
- Short windows (landscape phone): items scroll behind the close button, never over it; close button always unobstructed.
- Any item can container-transform into a surface or full screen.
- Web: don't fully obscure another element's focus indicator.

### Accessibility
- On open, focus stays on the close button (which replaced the FAB), then moves top item to bottom item.
- Android close button: label "Toggle menu", role Button, state Expanded / Collapsed. Items: label matches UI text (Reply all), role Button.
- Web: FAB plus menu; the FAB's label describes the menu it opens.
- Keyboard: Tab to next element, Space or Enter activates.

---

## App bars

Source: https://m3.material.io/components/app-bars

Purpose: top-of-page bar with the page title, navigation control and 1 to 2 essential actions. Page actions beyond that belong in a toolbar.

Compose: `TopAppBar`, `CenterAlignedTopAppBar`, `MediumTopAppBar`, `LargeTopAppBar` (named on the DAC insets page; they apply top and horizontal system bar insets as padding automatically). Expressive: `MediumFlexibleTopAppBar`, `LargeFlexibleTopAppBar`, and a search app bar (`AppBarWithSearch` / `SearchBar`).

### Expressive update (May 2025)
- Renamed "top app bar" to "app bar".
- Added search app bar (icons inside and outside the search field, centered text option; opens the search view).
- Added medium flexible and large flexible: reduced height, larger title, subtitle, leading or centered text, text wrapping, room for images and filled buttons. They replace medium and large (no longer recommended).
- Small app bar gained subtitle, centered text option, images and filled buttons. Center-aligned app bar merged into small (centered-text configuration).

| Variant | M3 baseline | Expressive |
|---|---|---|
| Search app bar | No | Yes |
| Small | Yes | Yes |
| Center-aligned | Yes | Merged into small (centered text) |
| Medium (baseline) | Yes | Not recommended, use medium flexible |
| Medium flexible | No | Yes |
| Large (baseline) | Yes | Not recommended, use large flexible |
| Large flexible | No | Yes |

| Configuration | Baseline | Expressive |
|---|---|---|
| Text leading-aligned (default) | Yes | Yes |
| Text centered | No | Yes |

### Specs

| Attribute | Value |
|---|---|
| Width | always 100% of the window |
| Height | always the default height for the variant; never reduce it |
| Corners | square; never round the container or move it |
| Trailing actions | up to 2 icon buttons (mobile) |
| Search app bar trailing | up to 2 icons plus an avatar on mobile, up to 4 on larger screens |
| Search field width | fills 100% of the space between leading and trailing elements up to 312dp, then grows to fill 50% of that space |
| Scrolled container color | surface container |
| Search container | surface container (default), surface bright on darker backgrounds; text vs container at least 3:1 |
| Search label color | on surface variant |
| Heights (Compose M3 token) | small 64dp; medium flexible 112dp (136dp LargeContainerHeight variant); large flexible 120dp (152dp LargeContainerHeight variant); baseline medium 112dp, large 152dp |

### Variant choice
- Search app bar: home pages where search is key. Field text always contains "Search" (Search, Search inbox, Search Photos).
- Small: dense layouts or scrolled pages.
- Medium flexible: larger headline; collapses into small on scroll.
- Large flexible: emphasize the page headline.

### Usage rules
- Content and actions are contextual to the page; global controls (search, notifications) are allowed.
- One action, two if necessary. The primary action alters or exits the whole page (Send, Save, Edit).
- Many actions go in a toolbar; avoid an overflow menu in the app bar when possible.
- Boost the primary action by making its icon button filled or tonal, optionally wide; use only one filled or tonal button (Don't: two filled side by side).
- Leading button navigates: a menu icon (opens modal expanded navigation rail) or a back arrow.
- Search app bar leading element may be a product logo (cosmetic, or returns to / refreshes home). Don't use the logo to open an expanded navigation rail.
- Images or logos are allowed (in small app bars an image may replace the title); keep them relevant and high quality.

### Headline and subtitle
- Headline describes the page, section or product; brief.
- Medium flexible and large flexible headlines can wrap to two lines; small app bar headlines don't wrap. Never truncate.
- Headline and subtitle align leading or centered; don't customize their type size. Type style varies by variant.

### Trailing icon buttons
- Up to two, trailing-aligned; most-used action closest to the leading edge.
- Don't use them to open a menu of more actions (use a toolbar).
- Prefer filled icons for visibility; outlined is fine for unselected toggles.

### Adaptive and behavior
- Trailing actions may collapse into an overflow menu at small breakpoints and reappear at larger ones.
- RTL: layout mirrors automatically.
- Scrolling: starts the same color as the background, fills with surface container on scroll (no drop shadow, unlike M2). Can stay fixed or hide and reappear on scroll.
- Optional transparent-on-scroll style so buttons float over content: then icon buttons need a container fill; narrow icon buttons (Back) save space.
- Medium flexible and large flexible can shrink to small on scroll and stay small until scrolled back to the top. Never transform into a search app bar.
- Selecting the search bar opens the search view.
- Can animate on and off screen together with another bar of controls (for example a row of chips).

### Accessibility
- Use cases: know the current page; act or navigate; keep access to actions when content scrolls.
- Initial focus: the leading button. Keyboard: Tab to next element, Space or Enter activates.
- Title accessibility label = title text, with extra context if needed; screen readers read text then role.
- Label icon buttons per icon button guidance.

### Differences from M2
- No shadow on scroll (color fill instead); larger default type; smaller default height; dynamic color.

---

## Badges

Source: https://m3.material.io/components/badges

Purpose: indicate a notification, item count or status on a navigation destination or icon.

Compose: `BadgedBox` wrapping an icon, with `Badge` (empty for small, with content for large).

### Variants
- Small badge: a dot, signals an unread notification.
- Large badge: contains a count or short label.

### Specs

| Attribute | Value |
|---|---|
| Small badge size | 6dp (H and W) |
| Small badge corner | 3dp |
| Large badge, one digit | 16x16dp |
| Large badge, max characters | 16dp high x 34dp wide |
| Large badge corner | 8dp |
| Large badge text padding | 4dp |
| Small badge offset: icon top-trailing corner to badge bottom-leading corner | 6x6dp |
| Large badge offset (same measure) | 14dp H x 12dp W |
| Max characters | 4, including "+" (for example 999+) |
| Contrast | badge vs surroundings at least 3:1 |

### Rules
- Anchor inside the icon bounding box at the upper trailing edge; large badges grow in width while keeping the anchor.
- Mirror to the leading side in RTL; never place at random positions.
- Keep the default color mapping (red error-like role); avoid custom colors that clash.
- Condense big counts (4-digit to "999+"); never let digits overflow and clip.
- Common hosts: navigation bar, navigation rail, app bars, tabs. On tabs, place the badge after the label, never overlapping icon and text. Badge on an app bar icon button is a caution.
- Hide an unread-notification badge once its destination is selected.
- Don't place badges over a FAB.

### Accessibility
- Badge announcement follows the destination label. Numeric badges read their number; dot badges announce "New notification".
- Users can act on the announcement by selecting the destination.

---

## Bottom sheets

Source: https://m3.material.io/components/bottom-sheets

Purpose: supplementary content and actions anchored to the bottom of a compact or medium screen.

Compose: `ModalBottomSheet` (named on the DAC insets page; applies bottom insets automatically); standard sheets via `BottomSheetScaffold`.

### Variants

| | Standard | Modal |
|---|---|---|
| Scrim | No | Yes |
| Interaction with main UI | Both regions usable at once | Blocks app until confirmed, dismissed or action taken |
| Typical use | Complementary content (audio player in music app, place info over a map) | Alternative to inline menus or simple dialogs; long action lists, items with descriptions and icons |
| Full height | Shows a collapse icon in an app bar to return | Shows a close affordance |
| Platform | | Mobile apps only |

### Specs

| Attribute | Value |
|---|---|
| Width | full window width up to max 640dp |
| Top corner radius | 28dp |
| Top margin | 72dp |
| Top margin, window wider than 640dp | 56dp |
| Side margins, window wider than 640dp | 56dp |
| Height | variable (content) |
| Drag handle | optional, horizontally centered, 22dp padding top and bottom, 48dp hit target |
| Interactive top area | top 48dp when user resizing and drag handle are present |
| Modal initial height | capped at 50% of screen height |
| Drag handle visual (Compose M3 token) | 32x4dp |

### Anatomy
- Only the container is required; size follows content. Optional: list items, dividers, thumbnails, images, video.

### Behavior
- Modal sheets taller than 50% can be pulled to full screen and scroll internally.
- Modal dismissal: tapping an item or action, tapping the scrim, swiping down, or a close affordance in the sheet's app bar (required when full screen).
- Optional expanded / collapsed toggle with preset heights, set by system or user.
- Drag handle: drag or select to change height. Selecting the handle cycles preset heights or closes; selecting the scrim always closes. Sheets must reach every preset height and close without dragging.
- Content can scroll horizontally independently of the screen.
- Predictive back (Android): swipe from either edge; sheet detaches from the side edges to signal closing and the previous screen previews.

### Adaptive
- Compact: full width, elevated above content.
- Medium and expanded: default 640dp max width (overridable). For complex tasks prefer a non-transient surface (floating sheet). On large expanded windows (desktop) swap for a side sheet.
- Content should be secondary; never the app's main content.

### Accessibility
- Must be resizable without touch gestures: the drag handle is focusable in tab order, role "button", and is the only element that needs a label.
- Keyboard: Tab focuses the drag handle; Space or Enter toggles heights.
- If multiple preset heights exist but no drag handle, add a single-pointer control (button) to change height.

### Differences from M2
- 28dp top corners; 640dp max width; optional drag handle with 48dp target; dynamic color.

---

## Cards

Source: https://m3.material.io/components/cards

Purpose: contain content and actions about a single topic; entry point to more detail.

Compose: `Card` (named in the Compose M3 guide, shape customizable via `MaterialTheme.shapes`); `ElevatedCard`, `OutlinedCard`.

### Variants
- Elevated, filled, outlined. Same legibility and function; choose by style alone.

### Specs

| Attribute | Value |
|---|---|
| Corner radius | 12dp |
| Elevation (Compose M3 token) | elevated level 1 (1dp); filled and outlined level 0; outlined stroke 1dp outline variant |
| Left / right padding | 16dp |
| Gap between cards | 8dp max |
| Label text alignment | start |
| Default elevation (M3 vs M2) | lower, no shadow by default (elevated variant adds it) |

### Usage
- Easy to scan; text and image placement shows hierarchy.
- Collections: grid (customizable to staggered or mosaic), vertical list, or carousel. Cards in a collection are coplanar (same resting elevation) unless picked up or dragged.
- Filtering or sorting applies to every card and its controls sit outside the collection.
- Compact windows: consider replacing cards with a list (more compact), keeping all controls.
- Expanded windows: multiple columns, rows or carousels; avoid stretching cards across the screen. A horizontal card on compact can become a vertical card on expanded.

### Anatomy
- Container required; everything else optional. Elevation lives on the container.
- Content blocks with varying emphasis; dividers to separate regions or mark expandable areas.
- Media: thumbnail (avatar, logo), image, video.
- Text: headline (subject), subhead (byline, location), supporting text (summary).
- Text or icons on images: avoid; if necessary, add a translucent scrim or bounding shape to reach accessible contrast.
- Actions: whole-card primary action area, buttons (Learn more, Add to cart), icon buttons (Save, Heart), selection controls (chips, sliders, checkboxes), linked text, overflow menu (upper-right or lower-right corner).

### Behavior
- Expanding: container transform, reserved for expressive hero moments. Show all expanded content at once; on mobile avoid internal scrolling (the page scrolls instead). Desktop may scroll within a card.
- Content taller than the max card height is truncated and revealed by expanding.
- Navigation between hierarchy levels: forward and backward transition (simpler than container transform).
- Swipe: one card at a time, anywhere on the card, to dismiss or change state (flag, archive). Don't assign a swipe to only part of a card.
- Pick up and move: the moved card elevates above others; it must not bump other cards around.

### Accessibility
- A card is either a non-actionable container holding actions, or directly actionable with no inner buttons or links. Never stack an action on an actionable surface.
- Directly actionable cards: ripple on tap, hover state, tab stop, role button or link. Non-actionable cards: no ripple or hover, no role, not a tab stop; each inner action is a tab stop visited before the next card.
- Keyboard: Tab moves to next actionable element (next card for actionable cards); Space or Enter activates or opens a secondary menu; Arrow keys inside the menu, Tab exits.
- Drag and swipe need a single-pointer alternative (tap or long press opens a menu with Move and Delete). Avoid menus over a card in drag state.
- Hide purely decorative images from screen readers.

### Differences from M2
- Three official variants; lower elevation, no default shadow; dynamic color.

---

## Carousel

Source: https://m3.material.io/components/carousel

Purpose: a scrollable row of mostly visual items (images, video) with optional brief text; items change size as they move.

Compose: `HorizontalMultiBrowseCarousel`, `HorizontalUncontainedCarousel`, `HorizontalCenteredHeroCarousel`. Views: `CarouselLayoutManager` with strategies.

### Updates
- Nov 2025: new uncontained multi-aspect ratio layout.
- 2023: uncontained, full-screen, centered carousels, hero and multi-browse layouts.
- New in M3 (no M2 equivalent): items change shape on scroll, parallax between item and content, snap behavior.

### Layouts

| Layout | Shows | Best for | Scrolling |
|---|---|---|---|
| Multi-browse | At least one large, one medium, one small item | Browsing many visuals (photos, event feeds) | Snap |
| Uncontained | Same-size items flowing past the edge | Customized or text-heavy items, traditional carousel | Default or snap |
| Uncontained multi-aspect ratio | Items of various widths (9:16 to 16:9) | Only when items genuinely differ in width | Default or snap |
| Hero | At least one large and one small item | Spotlighting large visuals (movie, featured app) | Snap, one item at a time |
| Center-aligned hero | One large centered item, small items both sides | Centered large visuals | Snap |
| Full-screen | One edge-to-edge item | Vertical immersive video or image feeds, portrait only (compact, medium) | Snap only |

### Specs

| Attribute | Multi-browse | Uncontained (both) | Hero / center hero | Full-screen |
|---|---|---|---|---|
| Leading / trailing padding | 16dp | 16dp leading | 16dp | 0dp |
| Top / bottom padding | 8dp | 8dp | 8dp | 0dp |
| Gap between items | 8dp | 8dp | 8dp | 16dp |
| Item corner radius | 28dp | 28dp | 28dp | n/a |
| Large item width | dynamic or user-set max | single size | dynamic | full |
| Small item width | 40 to 56dp | n/a | 40 to 56dp | n/a |
| Alignment | vertically centered | vertically centered | vertically centered | centered |

- Item widths: large (adjustable max width, drives how many items fit), medium (dynamic), small (40 to 56dp).

### Rules
- Items must be fully visible on screen, except in uncontained layouts. Never squeeze a small item until the image is unrecognizable.
- Compact windows: up to three items with text comfortably; more only with simple, recognizable images. Larger windows show more and larger items. Full-screen always shows one.
- Item text optional and brief; adapt labels to item size. If items need lots of text, use the uncontained layout or cards.
- Full-screen: never in landscape; items snap to container edges, never stop halfway.
- Research: about 10 items expected in multi-browse; a peeking or squished item signals more content.

### Accessibility
- On vertically scrolling pages provide a way to see all items without horizontal scrolling (not required for full-screen): a "Show all" button below that opens a vertical page, or an arrow icon button next to the carousel header (repeat the header on that page).
- Don't add arrows inside, beside or on top of the carousel.
- Focus: Tab lands on the first item; Tab or Arrow keys move between items; Up / Down arrows leave to the next element (Show all). Space or Enter activates.
- Container role "container"; label announces total item count and current position.
- Touch: item shape changes slightly with a ripple.
- Reduced motion: no parallax, no growing items; all items same size; carousel reaches window edges to avoid clipping; hero shows the small item partially.

---

## Checkbox

Source: https://m3.material.io/components/checkbox

Purpose: select one or more options from a list, sub-selections, or toggle an item on desktop.

Compose: `Checkbox`, `TriStateCheckbox` (parent with indeterminate state).

### Specs

| Attribute | Value |
|---|---|
| Container | 18dp |
| Container corner | 2dp |
| Icon (check / dash) | 18dp, centered |
| State layer | 40dp |
| Target | 48dp |
| Adjacent label color | on surface (unchanged on interaction) |

- States: unselected, selected, indeterminate, each with an error state (new vs M2).

### Choosing a selection control

| Control | Use |
|---|---|
| Checkbox | Multiple related options in a list (groups well, takes less space than switches) |
| Radio button | A single option in a list |
| Switch | Standalone or verbose on/off options, such as settings |

- Don't use a list of several switches where checkboxes fit.

### Behavior
- Parent-child: checking the parent checks all children; unchecking clears all; a partial set makes the parent indeterminate; selecting an indeterminate parent checks all children.
- Selection state is communicated instantly; when a checkbox turns something on or off, apply it immediately.
- Expanded breakpoints: group related checkboxes in a contained region such as a side sheet.

### Accessibility
- Tapping the label or the box toggles it.
- Don't apply density by default (targets drop below 48x48); offer density as a user choice with 48x48 controls to revert.
- Label = adjacent text; screen readers read the text then the role when linked.
- Keyboard: Tab to focus, Space toggles (the source's table is copied from chips: Tab, Space or Enter, Arrows).

---

## Chips

Source: https://m3.material.io/components/chips

Purpose: compact elements that help people enter information, make selections, filter content or trigger contextual actions within the current task.

Compose: `AssistChip` / `ElevatedAssistChip`, `FilterChip` / `ElevatedFilterChip`, `InputChip`, `SuggestionChip` / `ElevatedSuggestionChip`.

### Updates
- Aug 2024: stroke color changed from outline to outline variant.
- M2 to M3: action chips split into assist and suggestion; choice chips became a subset of filter chips; rounded rectangle shape.

### Variants

| Purpose | Variant | Represents | Example |
|---|---|---|---|
| Action | Assist | Smart or automated actions, possibly across apps; as if an assistant did it | Add to calendar |
| Filter | Filter | Filters for a collection | Platform selector |
| Info, user-authored | Input | Discrete info the person entered | Contact in a To field |
| Info, product-authored | Suggestion | Dynamically generated suggestions narrowing intent | Suggested chat reply |

### Specs

| Attribute | Assist | Filter | Input | Suggestion |
|---|---|---|---|---|
| Height | 32dp | 32dp | 32dp | 32dp |
| Corner | 8dp | 8dp | 8dp | 8dp |
| Icon | 18dp | 18dp | 18dp | 18dp |
| Side padding, no icon | 16dp | 16dp | n/a | 16dp |
| Side padding with icon | 8dp | 8dp | 8dp | 8dp |
| Gap between elements | 8dp | 8dp | 8dp | 8dp |
| Avatar | | | 24dp, 12dp corner (circular) | |
| Avatar padding | | | 4dp left, 8dp right | |
| Close icon target | | | min 48dp | |

| Attribute | Value |
|---|---|
| Space between chips | 8dp minimum |
| Target | 48dp minimum regardless of density (may extend beyond container) |
| Min chip width with a secondary trailing action | 88dp (or 42dp label) so the 48x48 trailing target doesn't overlap the primary action |
| Label length | 20 characters or fewer, button type style |
| Default elevation | 0; elevate only over images or dynamic backgrounds |
| Label contrast | at least 3:1 with background |

### Chips vs buttons
- Chips are dynamic and contextual and appear as a set; buttons are persistent and drive linear progress. Chips = forking paths, buttons = linear steps.
- Do: "Reserve a table" and "Order delivery" chips. Don't: Save / Cancel chips in a dialog; a "Save task" chip.
- Chips appear together in a set (no lone chip); at most 3 buttons in one arrangement. Chip sets can scroll horizontally.

### Anatomy
- Container 8dp corners; elevated style only on images or dynamic backgrounds (never all-elevated on blank backgrounds, never elevated in pressed state).
- Label: brief, drop articles ("Walking", not "Walking navigation session").
- Leading icon, logo or circular image (images larger than icons). Unselected icon default color primary; on surface variant for less emphasis.
- Trailing icon only on input chips (required, removes the chip) and filter chips (optional, menu or remove).

### Per variant
- Assist: start with a verb, update text with state (Save to Saved); show after primary content (below a card) or persistently at the bottom. Buttons are the persistent alternative.
- Filter: nouns describing what to include (avoid "Exclude images"). Tap adds a leading checkmark. Multi- or single-select (single-select replaces segmented buttons, radios or single-select menus). Don't mix single and multi-select sets on one page. Trailing icon in medium and expanded windows; in compact windows rely on the whole chip being tappable. Can open a menu of options. Don't show a single filter chip under a category.
- Input: convert typed text into chips (Gmail contacts); can be edited (reverts to text), reordered, moved between fields, expanded with container transform. Placement inline with the cursor, stacked list, or horizontal scrolling list. Trailing icon always at the end side.
- Suggestion: nouns or short phrases, 20 characters max where possible.
- Placement: rows inline, overflowing chips wrap to the next line; a one-row field scrolls horizontally. Labels truncate when wrapped or wider than the window.

### Accessibility
- Action chips expose button semantics.
- Horizontal overflow: offer a way to see all chips without scrolling. Reflow method (leading filter chip expands the list and pushes content down) or menu method (leading button lists options in a menu; not for chips with a second action).
- Don't apply density by default; keep 48x48 targets.
- Keyboard: Tab to chip or chip group; Space or Enter activates, selects, deselects; Backspace or Delete removes a focused input chip; Arrows move between chips.
- Show interactivity with a secondary indicator: a preceding label (Select type), page context (Filter results), outline role instead of outline variant (3:1), or an action label / leading icon.

| Element | Label | Role web | Role Android Views | Role Compose |
|---|---|---|---|---|
| Icon or image in chip | hidden | | | |
| Basic chip (one action) | chip text | gridcell | button | button |
| Selectable chip | chip text | gridcell | radio button | checkbox |
| Remove icon only | "Remove {chip}" | | | |
| Two actions (select + remove) | chip text, then "Remove {chip}" | button or checkbox | button or checkbox | button or checkbox |

- A chip with only a remove action is one focusable element; with a second action, content and remove icon are two focusable elements. On mobile, when remove is the only action, the icon can be omitted and Delete key removes the selected chip.

---

## Date pickers

Source: https://m3.material.io/components/date-pickers

Purpose: select a date or date range, past, present or future.

Compose: `DatePicker`, `DateRangePicker`, `DatePickerDialog`, with `DisplayMode.Picker` / `DisplayMode.Input`.

### Variants

| Variant | What | Best for |
|---|---|---|
| Docked | Text field with a dropdown calendar under it; both usable | Medium and expanded windows; near and distant dates |
| Modal | Calendar in a dialog | Compact windows; nearby dates |
| Modal date input | Keyboard entry of a date or range in a dialog | Distant dates (date of birth), precise entry |
| Full-screen modal (compact) | Modal covering the screen | Phones: bigger targets and readability |

- M2 renames: desktop picker became docked; mobile picker and date input became modal date picker and modal date input.

### Behavior
- Embed in dialogs on compact windows; in text field dropdowns on medium and expanded.
- Docked: month and year navigable with previous / next arrows or dropdown menus.
- Modal: swipe horizontally for months, scroll vertically for years, tap the year to open the year picker. Never use for distant dates such as birth dates.
- Range: tap start and end; scroll vertically across months. Start and end are selected; in-between dates show a subtle connected highlight. Use cases: flights, hotels.
- Switch modal picker and modal input with the edit / calendar icon.
- Exit by OK (confirm) or Cancel (dismiss); tapping outside dismisses. Full-screen mobile pickers add a close (X) icon and Save.
- Docked pickers appear just below the input field.
- Picker sizes don't scale responsively; never enlarge them on large screens.

### Specs

| Attribute | Value |
|---|---|
| Modal container (Compose M3 token) | 360x568dp, 28dp corner, header 120dp high (128dp for range selection) |
| Date cell (Compose M3 token) | 40x40dp, Full corner; year cell 72x36dp |
| Date input modal (Compose M3 token) | 328x512dp |
| Targets | all elements meet 48x48dp; don't increase density |
| Date text vs background contrast | at least 4.5:1 |
| Default helper text | "MM/DD/YYYY" (customizable) |

### Accessibility
- Always allow manual text entry without the calendar (docked text field; modal edit icon).
- The calendar icon is the only entry point to the picker; each input is its own tab stop.
- Format the date after Enter or blur; never use input masks that insert slashes while typing. Accept many separators (dash, space, slash, dot) and leading zeros.
- Remove the Clear button if not needed (fewer tab stops).
- Put keyboard shortcuts in tooltips and hint descriptions.
- Weekday headers are not focusable; abbreviations get a hover tooltip.
- Field label states the purpose (Event date) and matches placeholder; helper text states the format.
- Read full dates ("Monday, August 17").

| Key | Action |
|---|---|
| Enter / Return | Close calendar and save selected date |
| Page Up / Down | Same date next / previous month |
| Home / End | First / last day of the month |
| Shift + Page Up / Down | Same date next / previous year |
| Shift + M | Month dropdown |
| Shift + Y | Year dropdown |

| Element | Label | Role |
|---|---|---|
| Previous / next month and year | label | Button |
| Month and year dropdowns | label | Button |
| Days of week | | Column header |
| Month grid | | Grid |

### Differences from M2
- Larger titles and labels with more spacing for 48dp targets; dynamic color; device-neutral naming.

---

## Dialogs

Source: https://m3.material.io/components/dialogs

Purpose: a modal window in front of content that provides critical information or asks for a decision, blocking the app until resolved.

Compose: `AlertDialog`, `BasicAlertDialog`; full-screen dialogs via `Dialog` with full-size content. Views: `MaterialAlertDialogBuilder`.

### Variants
- Basic: urgent info, alerts, quick selection, confirmation; can hold lists, date and time pickers.
- Full-screen: multi-step tasks (create a calendar entry). Compact windows only; on medium and expanded use a basic dialog.

### Specs

| Attribute | Basic | Full-screen |
|---|---|---|
| Corner | 28dp | 0dp |
| Width | min 280dp, max 560dp | container width, max 560dp |
| Height | dynamic | dynamic |
| Padding | 24dp top, sides, bottom | 24dp top and sides |
| Title to body | 16dp | |
| Icon to title | 16dp | |
| Body to actions | 24dp | |
| Between buttons | 8dp | 8dp between elements |
| Icon | 24dp | close icon 24dp |
| Alignment | centered with icon, start-aligned without | headline start-aligned |
| Header height | | 56dp |
| Bottom action bar height | | 56dp |
| Divider | 1dp | 1dp |

### When to use

| Component | Importance | Action |
|---|---|---|
| Snackbar | Low | Optional; may auto-dismiss |
| Dialog | High | Required; blocks content |

- Use sparingly: purposefully interruptive. Prefer a dropdown menu, inline content or tooltip for less critical info.

### Content rules
- Purpose is clear from headline and actions. Headline: brief statement or question (Use location service?). Avoid apologies, alarm ("Warning!") or ambiguity ("Are you sure?"). Can wrap to two lines or truncate; in full-screen dialogs put long or variable headlines in the content area.
- Max two actions. One action = acknowledgement (OK). Two = confirm plus dismiss. Avoid a third (Learn more) because it leaves the task unfinished; use inline expansion or provide info before the dialog.
- Buttons trailing-aligned; confirm closest to the edge (left edge in RTL). Side by side preferred; stacking is a caution.
- Basic dialog confirm may be disabled until a required choice is made.

### Full-screen dialog rules
- For forms with keyboard input, changes not saved instantly, or nested dialogs. Only dialog type over which other dialogs may appear.
- FAB to full-screen dialog uses container transform.
- App bar navigation is only the close X. Save confirms; close or Cancel / Back dismisses.
- Confirm label states what happens (Send, Create); avoid Done, OK, Close. Don't disable the confirm button. Don't add a confirmation dialog on success; show a basic dialog only if the action fails.
- Dismissing with unsaved changes shows a basic dialog to keep editing or discard.
- Field errors inline, all shown at once with cause and fix; general errors (network) in a basic dialog when confirm fails.

### Adaptive and behavior
- Variants can swap with breakpoint (full-screen becomes basic on larger windows).
- Medium: centered by default, position overridable. Expanded: modal over a scrim, custom position allowed within margins.
- Enter and exit transition. Retain focus until dismissed; never obscured or partially off screen (except full-screen).
- Avoid scrolling; if needed, title pinned top and buttons pinned bottom. Background doesn't scroll with the dialog.

### Accessibility
- 200% text: Android headlines should fit within four lines; else provide one-tap access to the full content.
- Initial focus on the first interactive element.
- Keyboard: Tab / Shift+Tab cycle within the dialog (wrap), Space or Enter commits, Escape closes.
- Dialog label = its headline. Web role: alert dialog.

### Differences from M2
- Larger corner radius and padding; larger, darker headline; optional custom positioning; dynamic color.

---

## Divider

Source: https://m3.material.io/components/divider

Purpose: a thin line that groups content and shows hierarchy.

Compose: `HorizontalDivider`, `VerticalDivider` (replace M3 `Divider`).

### Specs

| Attribute | Value |
|---|---|
| Full-width divider | 100% |
| Inset divider margins | 16dp left, 0dp right |
| Middle-inset divider margins | 16dp left, 16dp right |
| Space to supporting text | 4dp |
| Right margin | 8dp |
| Bottom margin | 8dp |
| Thickness (Compose M3 token) | 1dp, outline variant color |

### Rules
- Visible but not bold. Use only when open space can't group items; group things, don't separate every item.
- Full-width: separate larger unrelated sections; separate interactive from non-interactive areas (card body vs Read more link). Caution: a full-width divider after every piece of content.
- Inset: separate related content within a section; equally indented by default.
- Both on one screen: full-width for different kinds of content, inset for nested items, reinforcing hierarchy.
- Repetitive list items can rely on margins only.
- Vertical divider: arrange content on larger screens (text beside media). New vs M2.
- Accessibility: decorative, no contrast minimum.

---

## Lists

Source: https://m3.material.io/components/lists

Purpose: vertical groups of text, icons, images and controls that help people find an item and act on it.

Compose: `ListItem` (linked from the source as the Jetpack Compose implementation). Views: MDC-Android List docs, "M3 Expressive" section.

### Expressive update (December 2025)
- Added the expressive list (recommended for new designs). Baseline list still available but not recommended.
- New visual styles: standard or segmented; highlighted selection states; flexible slots.
- Supported on Android Views (MDC-Android) and Jetpack Compose. On web, expressive lists build on baseline lists.

| Variant | M3 baseline | Expressive |
|---|---|---|
| Lists (expressive) | n/a | Available |
| Lists (baseline) | Available | Not recommended |

| Category | Options | Baseline | Expressive |
|---|---|---|---|
| Style | Standard | Yes | Yes |
| Style | Segmented | No | Yes |
| Selection mode | Single-action, multi-action, single-select, multi-select | Yes | Yes |
| Interaction | Expand, swipe (swipe-to-reveal on Android Views only) | Yes | Yes |

- Standard vs segmented is purely visual; behavior is identical.
- One selection mode per list at a time (a single-action list may switch to multi-select, never both at once).

### Specs (expressive)

| Attribute | Value |
|---|---|
| Unselected item corners (segmented) | 4dp inner, 16dp outer |
| Selected item corners | 16dp (shape morph on selection) |
| Target | at least 48x48dp, including custom slots |

### Specs (baseline list)

| Attribute | Value |
|---|---|
| Item heights (set by the tallest element) | 56dp (one line), 72dp (two lines), 88dp (three lines) |
| Label alignment | center; top when 88dp or taller |
| Label left padding | 16dp |
| Leading element alignment | center; top when 88dp or taller |
| Leading element left padding | 16dp |
| Leading icon top padding | 8dp; 12dp when 88dp or taller |
| Trailing element alignment | center; top when 88dp or taller |
| Trailing element left padding | 16dp |
| Trailing element right padding | 24dp |
| Padding above / below divider | 0dp |
| Targets | 48dp |
| Divider | full width 100%, inset 16dp left / 24dp right |

- Baseline configurations: leading avatar, leading image or thumbnail, leading video, leading icon, text only, leading checkbox, leading radio button, trailing switch.
- M2 to M3 baseline: elements middle-aligned in most cases; top-aligned at 88dp or three or more lines of text.

### Slots (leading, content, trailing)
- Leading: avatar, icon, image, video thumbnail; checkbox, radio, switch; badge or larger image.
- Content: the widest slot; label and supporting text plus optional badge, icon, inline label or more text. Avoid long lines.
- Trailing: icon, icon button, trailing text (price, count); checkbox, radio, switch.
- Leading and trailing slots stay narrower than content.
- Slots are not accessible by default and need custom code you maintain: follow list rules and structure, use standard padding, 48x48dp targets, avoid interactive extras that complicate screen reader navigation.
- Selection lists: one selection interaction per item (Don't: leading checkmark plus trailing bookmark).

### Usage and anatomy
- Order items logically (alphabetical, numerical); keep them short and scannable; consistent format.
- Keep visuals and primary text in the same position in every item; never vary element positions.
- Label can wrap or truncate; supporting text limited to 1 to 3 lines, truncated by screen size.
- Leading icon: quick visual cue matching the label. Trailing icon: status or action (Show more).
- Leading media anchored to the leading edge (images mid-row hurt alignment). Avatars circular or expressive shapes for people and entities; square or rectangular for products and videos. Leading video can open a player or play inline.
- Items with images may use a content-based color scheme for the container (enabled or interaction state).
- Selection controls: checkboxes for multi-select, switches for on/off settings, radios for single select; leading or trailing.
- Separation: gaps for contained (segmented) lists; dividers only for uncontained or complex lists needing stronger separation.

### Selection modes

| Mode | Rules |
|---|---|
| Single-select | Radio-type control; no multi-actions, no nested secondary actions, no checkboxes |
| Multi-select | Pairs with checkboxes and switches; no nested secondary actions, no radios |
| Single-action | Whole item does one thing (navigate); no nested actions; no persistent selected state |
| Multi-action | Primary action fills leading and content area; supplementary actions (bookmark, menu) trailing |
| Non-interactive | Informational only; no actions or selection |

- The selected state applies to the whole item (item and its checkbox both show selection).

### Interactions
- Expand / collapse: folder-like reveal of nested items; container transform vertically across the screen.
- Swipe (Android): reveals buttons with mixed styles; the primary action is the final end-aligned option and a full swipe triggers it. Always provide another path (more icon).

### Adaptive
- Compact: edge to edge; selecting an item opens a detail page.
- Medium and expanded: list and detail side by side; lists can become two-column layouts, carousels or cards; items may reveal more content.
- Line length: ideal 40 to 60 characters; up to 120 on large screens (raise line height near 120). Adjust margins or go multi-column to avoid long lines.

### Accessibility
- Don't show selection by color alone: add radios or checkboxes, leading or trailing icons, or a non-color style.
- Touch ripple on tap; hover state on cursor.
- Focus: first item gets focus unless an item is selected (then the selected item). Arrow keys move within the list and wrap at the ends; Space or Enter activates or selects.
- Multi-action: the item as a whole is not selectable; Tab focuses the first element, Arrow keys (all four) move between focusable elements, Space or Enter activates.
- Swipe alternatives: single tap, double tap, long press or other single-pointer action.
- Label = label text plus supporting text. Unselectable lists read text without a role.

| Trait | Web | Android Views | Compose |
|---|---|---|---|
| Single-select role | listbox container, option items | radio button item | radio button item (applies to whole item) |
| Multi-select role | listbox container, option items | checkbox item | checkbox item |
| State | selected / not selected | checked / not checked | checked / not checked |
| Item label | matches visible label | matches visible label | matches visible label |

- Web: the container label describes the selection type.

---

## Loading indicator

Source: https://m3.material.io/components/loading-indicator

Purpose: an animated shape-morph indicator for short processes of unknown duration and for pull-to-refresh.

Compose: `LoadingIndicator`, `ContainedLoadingIndicator`; pull-to-refresh via `PullToRefreshBox` (the source links the Compose pull-to-refresh guide).

### Expressive update (May 2025)
- New component; replaces most uses of the indeterminate circular progress indicator for waits under 5 seconds.
- Used for pull-to-refresh; contained or uncontained; shape and motion; scalable.

| Configuration | Value |
|---|---|
| Containment | default (uncontained) or contained |

### Choosing an indicator

| Expected wait | Use |
|---|---|
| Under 200ms | No indicator |
| 200ms to 5s | Loading indicator |
| Over 5s | Progress indicator (consider letting people leave the page) |

- Never decorative; always reflects an ongoing process.
- Don't use it for processes that become determinate. For indeterminate-to-determinate, transition between progress indicators; never morph a loading indicator into a progress indicator.

### Specs

| Attribute | Value |
|---|---|
| Default size | 48dp (Compose M3 token; active indicator 38dp) |
| Size range | 24dp to 240dp, never outside |
| Container / indicator ratio | constant when resized |
| Active indicator | looping morph through 7 Material 3 shapes |
| Active indicator color | primary; on primary container when contained |
| Indicator contrast | at least 3:1 vs background (container itself has no requirement) |

### Placement and behavior
- Loading a page or container: center it on that element.
- Loading more items: place it where new content will appear, without overlapping existing content.
- Can sit inside components such as buttons (validating a form, checking for updates); keep 3:1 against that component.
- Use the container when placed over other content, and always for pull-to-refresh; skip it directly on a surface.
- Scale with the empty space in larger windows; reserve very large sizes for large and XL windows.
- Pull-to-refresh (Jetpack Compose only): for frequently updated content at the top of lists, grids and card collections. Requires passing a threshold. Stays visible until the refresh completes and new content shows or the user navigates away; never scrolls off screen.

### Accessibility
- Users must be able to reach it, understand what it reports, and refresh without a gesture: add a refresh button in a menu or beside the content.
- Role: progress bar. Label describes the purpose (loading news article, refreshing page).

---

## Cross-component deprecations (Expressive)

Summary of what the sources in this file mark "no longer recommended" and the replacement.

| No longer recommended | Use instead | Since |
|---|---|---|
| Segmented button | Connected button group | May 2025 |
| Speed dial, stacked small FABs | FAB menu | May 2025 |
| Small FAB | FAB, medium FAB (default) or large FAB | May 2025 |
| Surface color FABs and extended FABs | Primary / secondary / tertiary (or container) styles | May 2025 |
| Baseline extended FAB (56dp, label large) | Small extended FAB (title medium) | May 2025 |
| Medium and large app bars | Medium flexible and large flexible app bars | May 2025 |
| Center-aligned app bar as a separate variant | Small app bar with centered text | May 2025 |
| Small button with 24dp side padding | 16dp side padding | May 2025 |
| Baseline filled / tonal / outlined icon button tokens | New icon button token sets | May 2025 |
| Indeterminate circular progress for short waits | Loading indicator | May 2025 |
| Neutral text button (M2) | Text button with primary label | M3 |
| Baseline list | Expressive list (standard or segmented) | Dec 2025 |
| Chip stroke color outline | Outline variant (use outline when you need 3:1 to show interactivity) | Aug 2024 |

New in the period: uncontained multi-aspect ratio carousel (Nov 2025); toggle buttons, five button and icon button sizes, square shape and shape morph (May 2025); narrow and wide icon button widths (May 2025).
