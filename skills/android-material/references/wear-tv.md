# Android & Material 3: Wear OS and TV

Distilled from developer.android.com Wear OS and Android TV / Google TV design guides, the Wear and TV app quality checklists, and m3.material.io "Design for watches" (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

Note on sources: `/design/ui/wear/guides/...` pages describe Material 3 Expressive for Wear OS (Compose Material 3, ProtoLayout Material3). `/design/ui/wear/guides/m2-5/...` pages describe the previous Wear Material (chips, ScalingLazyColumn, Horologist). Specs only found on m2-5 pages are labeled "(M2.5 spec)": useful for numbers and behavior, but prefer the M3 Expressive component when one exists.

## Contents

1. [Wear OS principles](#wear-os-principles)
2. [Material 3 Expressive on Wear OS](#material-3-expressive-on-wear-os)
3. [Wear quality tiers and levels of expression](#wear-quality-tiers-and-levels-of-expression)
4. [Wear app quality checklist (design-relevant)](#wear-app-quality-checklist-design-relevant)
5. [Wear screen sizes and breakpoints](#wear-screen-sizes-and-breakpoints)
6. [Wear layout: round screens and percentage margins](#wear-layout-round-screens-and-percentage-margins)
7. [Wear app layouts: scrolling and non-scrolling](#wear-app-layouts-scrolling-and-non-scrolling)
8. [Wear app best practices](#wear-app-best-practices)
9. [Clipping and truncation](#clipping-and-truncation)
10. [Wear components: buttons and edge-hugging buttons](#wear-components-buttons-and-edge-hugging-buttons)
11. [Wear components: chips, cards, toggles](#wear-components-chips-cards-toggles)
12. [Wear components: lists](#wear-components-lists)
13. [Wear components: pickers, steppers, sliders](#wear-components-pickers-steppers-sliders)
14. [Wear components: dialogs and confirmations](#wear-components-dialogs-and-confirmations)
15. [Wear components: progress, position indicator, time text, page indicator](#wear-components-progress-position-indicator-time-text-page-indicator)
16. [Wear typography](#wear-typography)
17. [Wear color](#wear-color)
18. [Tiles](#tiles)
19. [Complications](#complications)
20. [Watch faces](#watch-faces)
21. [Ongoing activities, notifications and surface priorities](#ongoing-activities-notifications-and-surface-priorities)
22. [Wear media apps](#wear-media-apps)
23. [Wear inputs: swipe to dismiss, swipe to reveal, rotary, buttons](#wear-inputs-swipe-to-dismiss-swipe-to-reveal-rotary-buttons)
24. [Wear one-handed gestures (Wear OS 7)](#wear-one-handed-gestures-wear-os-7)
25. [Wear launch, sign-in, permissions, offline](#wear-launch-sign-in-permissions-offline)
26. [TV principles](#tv-principles)
27. [TV layout, grid and overscan](#tv-layout-grid-and-overscan)
28. [TV navigation and D-pad](#tv-navigation-and-d-pad)
29. [TV focus system](#tv-focus-system)
30. [TV components](#tv-components)
31. [TV typography](#tv-typography)
32. [TV color](#tv-color)
33. [TV app icon and banner](#tv-app-icon-and-banner)
34. [TV app quality tiers (design-relevant)](#tv-app-quality-tiers-design-relevant)
35. [TV samples: Jet Stream and Jet Fit](#tv-samples-jet-stream-and-jet-fit)

---

## Wear OS principles

Source: https://developer.android.com/design/ui/wear/guides/get-started/design-for-wearables
Source: https://developer.android.com/design/ui/wear/guides/get-started/design-for-wearables/principles
Source: https://developer.android.com/design/ui/wear/guides/m2-5/foundations/design-principles
Source: https://m3.material.io/foundations/watches

Goal: glanceable, standalone watch experiences that let people finish a task in seconds and get back to their day, phone left in the pocket.

| Principle | Rule |
|---|---|
| Design for critical tasks | Focus on one or two tasks, never a full phone-app port. |
| Optimize for the wrist | Tasks complete within seconds to avoid arm fatigue. |
| Glanceable surfaces | Primary surfaces are complications and tiles; the app is the destination for richer work. |
| Always relevant | Adapt content to the user's time, place and activity. |
| Works offline | Design for slow or absent connectivity (exercise, commuting). |
| Better together | Watch for quick, frequent tasks; phone for long or complex ones. A task can be split across both devices. |

- Opportunities unique to the watch: input through body connection (sensors, motion), quick access to complications, notifications and tiles.
- Limits: small screen, lower information density, limited battery. Design for short interactions to save battery.
- Avoid complex, detailed apps (for example spreadsheets) that are hard to view or edit on a watch.
- Round screens have about 22% less usable space than square screens and need larger margins for legible text. Design round first.
- Test glanceability in motion and with divided attention (talking, gesturing, running for a bus).
- Always-on displays: ongoing experiences (timer, workout) can stay visible in ambient mode; limit illuminated pixels.
- Haptics (M3 watches page): use system patterns and tokens, sync haptics with motion and sound; stronger haptics for key moments (payment confirmation), subtler for precision interactions (list scrolling, volume).

---

## Material 3 Expressive on Wear OS

Source: https://developer.android.com/design/ui/wear/guides/get-started
Source: https://developer.android.com/design/ui/wear/guides/get-started/apply
Source: https://developer.android.com/design/ui/wear/guides/get-started/benefits
Source: https://m3.material.io/foundations/watches

M3 Expressive (2025 onward) is the current Wear design system, optimized for round screens. It replaces the M2.5 Wear Material (chips, gradients, Roboto, ScalingLazyColumn).

| Pillar | What changes on Wear |
|---|---|
| Embrace round | New shape framework uses the whole circular canvas; edge-hugging containers and buttons. |
| Premium motion and springs | Physics-based springs; motion spatially connects surfaces and tracks gestures more closely. |
| Shape morphing | Lists and select buttons morph corner radius in response to interaction and scroll. |
| Rich color | Deeper tonal palettes, wider token set, third accent (tertiary), container and dim roles. |
| Variable fonts | Roboto Flex replaces all Roboto; new Arc and Numeral type roles. |

Shape and containment:
- Edge-hugging containers maximize space inside the circle. The edge-hugging button is the signature M3 Expressive Wear pattern (Compose: `EdgeButton`, inference from naming).
- Use M3 corner shapes to create variety and relationships between containers; shapes extend to loading animations, shape-morphing buttons and adaptive button groups.
- Grouped containers distribute available space evenly (symmetry) or strategically (hierarchy, emphasis).

Variable type in motion: animate weight, width, or both to give expressive feedback.

Research (benefits page): expressive variants roughly doubled preference and raised aesthetics up to 170%; a strong minority preferred calmer designs, so start from user needs and keep function first.

---

## Wear quality tiers and levels of expression

Source: https://developer.android.com/design/ui/wear/guides/foundations/quality-tiers
Source: https://developer.android.com/design/ui/wear/guides/foundations/quality-tiers/ready-all-screens
Source: https://developer.android.com/design/ui/wear/guides/foundations/quality-tiers/responsive-optimized
Source: https://developer.android.com/design/ui/wear/guides/foundations/quality-tiers/adaptive-differentiated
Source: https://developer.android.com/design/ui/wear/guides/get-started/levels-expression

### Three adaptive quality tiers (meet all three)

| Tier | Bar | Do | Don't |
|---|---|---|---|
| 1. Ready for all screens | Minimum: no obvious visual or interaction bugs on any size; all task flows completable. | Test across sizes; use the M3 Compose library (built-in responsive behavior). | Awkward alignment or spacing; proportionally scaling the whole UI up to fill space. |
| 2. Responsive and optimized | Responsive layouts that show more content where space allows. | Use standard adaptive components; responsive layouts that fill available space smoothly. | Stretch text fields, buttons, dialogs to fill space; enlarge fonts (except primarily graphic numbers). |
| 3. Adaptive and differentiated | New layouts at the 225 dp breakpoint offer things small screens cannot. | Custom layouts at 225 dp and up; larger component options after the breakpoint; be bold. | Design for one size; rely only on responsive behavior; ship an unremarkable app or tile. |

Common tier 1 issues: top, bottom or side margin errors; clipped text, buttons or components; improper component adaptation; inconsistent scaling.

Tier 3 examples from the guide (all at 225 dp and up): media player gains bigger main controls and an extra bottom button; tile with button groups gains a row; picker numbers grow; card graphs and main numbers grow; tile with cards gains a card row; maps gain a card row; notifications get larger image, icon and text.

Hard rule: a larger display must never show less information than a smaller one. Growing components or text past the breakpoint so that less fits is a failure.

### Levels of expression (M3 Expressive)

Target "Excellent" or "Transformative".

| Area | Foundational (required in 2024) | Excellent (required) | Transformative (recommended) |
|---|---|---|---|
| Components | Baseline component migration | Multiple expressive components | Multiple expressive components plus customization |
| Color | Baseline palette | Dynamic palette themes | Dynamic themes and/or unexpected color combinations |
| Typography | Roboto Flex | Roboto Flex | Roboto Flex with morphing |
| Shape | None | Some shape library and containment | Shape library and expressive containment |
| Motion | Motion tokens | Tokens plus some expressive motion (shape morph, springs) | Same, used more broadly |
| Hero moments | None | Product-specific expressive moments | Plus dramatic hierarchy and customization |
| Adaptive | Responsive layouts and components, percentage margins | Plus add value after the 225 dp breakpoint | Plus large-screen-specific designs where possible |

---

## Wear app quality checklist (design-relevant)

Source: https://developer.android.com/docs/quality-guidelines/wear-app-quality

| ID | Requirement |
|---|---|
| WO-V1 | Respect user font size; at larger sizes text and controls must not overlap or be cut off by screen edges. |
| WO-V2 | Touch targets at least 48 x 48 dp. |
| WO-V3 | Swipe to close from almost all screens. Exempt: ongoing fitness and panning screens (maps), which need a clear call to action to close. |
| WO-V4 | Long-running operations use `OngoingActivity` or a Live Update notification. |
| WO-V5 | Preserve state; resuming within minutes (for example from recents) restores the previous state. |
| WO-V6 | Correct icon and name in the launcher. |
| WO-V8 | Show the scroll bar when the user interacts with a scrollable view. |
| WO-V9 | Tile shown while signed out prompts sign-in. |
| WO-V10 | Tiles provide a preview for the tile manager on watch and phone. |
| WO-V12 | Watch faces show the time clearly. |
| WO-V13 | Black background for all apps and tiles. |
| WO-V14 | Minimum 12 sp for essential text, 10 sp for non-essential text. |
| WO-V15 | Splash: 48 x 48 dp app icon on black, matching the launcher icon. |
| WO-V16 | Content fits the display, nothing overlaps, nothing cut off, works at a 192 dp circle and larger. |
| WO-P6 | Never ask for username or password input directly on the watch. |
| WO-P7 | Watch Face Format: ambient mode lights no more than 15% of pixels (averaged, white = 100%, black = 0%, checked about every 10 minutes). |
| WO-P8 | Watch face memory: 10 MB ambient, 100 MB interactive. |
| WO-P10 | At most 8 complication slots per watch face. |
| WO-G4 | Watch face Play icon (from July 15, 2026): centered circular watch face touching the asset edges, no extra text, graphics or device frames. |
| WO-G5 | Screenshots show only the app UI, no transparent background, masking or device frames. |

Dated changes: Watch Face Format required for installs on all devices from January 2026; 64-bit support required from September 15, 2026; new apps must target API 34+ (since August 31, 2025). WO-V7 (rotary scrolling) and WO-V11 (show time in apps) are no longer requirements. Test on the small round 1.2" (192 dp) and large round 1.39" (227 dp) emulators.

---

## Wear screen sizes and breakpoints

Source: https://developer.android.com/design/ui/wear/guides/foundations/screen-sizes
Source: https://developer.android.com/design/ui/wear/guides/foundations/adaptive-design
Source: https://developer.android.com/design/ui/wear/guides/foundations/adaptive-design/principles-adding-value

| Class | Width range | Notes |
|---|---|---|
| Smaller screens | 192 to 224 dp | Design here first. Smallest supported round emulator is 192 dp. |
| Larger screens | 225 to 240+ dp | Breakpoint at 225 dp. |

- Small first: design for the small round emulator (the adaptive-design page cites 204 to 216 dp as the working size); render dense layouts at 192 dp, including with the largest font size, to make sure nothing breaks.
- Design for scale: outer margins as percentages, never absolute values.
- Element heights change non-linearly with font scaling and bold text.
- Provide two designs in specs (below and above 225 dp) for tier 3 work.

Ways to add value on larger screens: more content at a glance, new content elements at the breakpoint, better glanceability (bigger containers, text, thicker rings, finer data viz), better usability (bigger targets, more spacing), updated component compositions.

---

## Wear layout: round screens and percentage margins

Source: https://developer.android.com/design/ui/wear/guides/foundations/adaptive-layouts
Source: https://developer.android.com/design/ui/wear/guides/foundations/canonical-adaptive-layouts
Source: https://developer.android.com/design/ui/wear/guides/foundations/common-layouts
Source: https://developer.android.com/design/ui/wear/guides/foundations/common-layouts/apps-scrolling
Source: https://developer.android.com/design/ui/wear/guides/foundations/common-layouts/apps-non-scrolling
Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/apps-layouts

| View type | Margin rule |
|---|---|
| Scrolling | All top, bottom and side margins in percentages (prevents clipping, scales proportionally). Spacing between elements in fixed dp. |
| Non-scrolling | All margins in percentages, plus vertical constraints so the middle content stretches to fill. Constrained in both axes, so more fragile on large screens. |

- Split non-scrolling screens into top, middle and bottom sections: inner margins on top and bottom sections avoid clipping; the middle uses full width.
- Scrolling views: top and bottom margins vary with whichever component sits first or last, because the curve clips more as content nears the edges.
- The position indicator appears while scrolling and always hugs the bezel regardless of size.
- Elements that hug the bezel (edge buttons, progress rings, position indicator) grow automatically with the screen.
- Use non-scrolling layouts only when content is known or controlled ahead of time; test with languages, font scaling, devices and variable content.
- When a non-scrolling experience needs more content, paginate (vertical or horizontal) instead of forcing a scroll.
- When space is tight, consider the rotary input to control elements instead of taps alone.

Canonical layout families:

| Family | Contents |
|---|---|
| Tiles (non-scrolling) | Fixed height, slot-based templates. |
| Apps, scrolling | Lists (`TransformingLazyColumn` in M3; `ScalingLazyColumn` in M2.5) and dialogs. Most app screens. |
| Apps, non-scrolling | Media players, pickers, switchers, some dialogs, confirmation overlays, fitness and tracking screens with progress indicators. |

Non-scrolling checklist: flexible layouts at all sizes; recommended margins; percentage margins where clipping is possible; constraints for balance; accommodate Time Text without overlapping the top section; consider edge-hugging buttons; consider the 225 dp breakpoint.

Scrolling checklist: recommended margins; percentage outer margins at start and end of the scroll container; fixed dp margins between elements; consider the 225 dp breakpoint (content above the fold may change, but everything below the fold stays available on every size).

Compose components fill the available width and gain text characters automatically as the screen widens. Icon buttons in non-scrolling screens use space better than wide pill buttons.

---

## Wear app layouts: scrolling and non-scrolling

Source: https://developer.android.com/design/ui/wear/guides/surfaces/apps
Source: https://developer.android.com/design/ui/wear/guides/surfaces/apps/layouts
Source: https://developer.android.com/design/ui/wear/guides/surfaces/apps/layouts/scrolling
Source: https://developer.android.com/design/ui/wear/guides/surfaces/apps/layouts/non-scrolling

App principles: focused (done within seconds), shallow and linear (no hierarchy deeper than two levels, inline content and navigation), scrolling is natural.

Standard screen elements:

| Element | Status | Notes |
|---|---|---|
| Time text | Optional, recommended | System places it; include it in mocks to show it is on. May carry app info. |
| Page title | Optional, recommended | Wayfinding. |
| Scroll indicator | Scrolling layouts only | Signals content below the fold. |
| Action buttons | Bottom, recommended | Confirm, conclude or continue the journey. |

| Section | Contents |
|---|---|
| Top | Time Text, optional compact button (search or action on very long pages), title. |
| Middle | Any non-fullscreen or custom components in a list, optional headings, scrollbar. Components fill width up to percentage margins; scrolling content scales and fades off screen. |
| Bottom | Primary and secondary actions or empty at journey end. Prefer an end-of-list edge-hugging button; multiple actions use a button stack or a two-icon button group. |

These sections do not apply to preset layouts (dialogs, confirmation overlays, pickers, switchers), which have their own margins.

Content container types: fixed height, variable height, larger than viewport, paginated. Full-screen takeovers cover sign-in states.

Preset non-scrolling components:

| Component | Use |
|---|---|
| Dialog | Transient full-screen overlay for one action, shown in response to a user task. |
| Confirmation overlay | Short-lived message after an action executes. |
| Open on phone | Progress indicator and instruction to check the phone. |
| Stepper | Full-screen value selection with buttons or crown and a curved level indicator. |
| Time picker | Up to 3 columns (seconds, 12 h or 24 h); one column interacted with at a time. |
| Date picker | Up to 3 columns (order varies); only one column visible at a time with a hint of neighbors. |

Custom non-scrolling examples: maps, emergency overlay, emergency alert. Preset scrolling layouts: dialog with bottom button stack, dialog with bottom double buttons. 

Stretch buttons, cards and margins to fill space for balance across sizes, while keeping the "never show less on larger screens" rule.

---

## Wear app best practices

Source: https://developer.android.com/design/ui/wear/guides/surfaces/apps/best-practices
Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/apps-principles

| Do | Don't |
|---|---|
| Vertical layouts, one scroll direction. | Mix vertical and horizontal scrolling (media playback is the exception). |
| Show time at the top of app screens. | Show time on dialogs, confirmation overlays or pickers (seen only briefly). |
| Inline actions with icon plus label, including settings entry points. | Rely on icons alone. |
| Pull unambiguous primary actions to the top. | Bury the primary action at the bottom of a long page. |
| Section breaks and labels in long mixed-content views. | Labels for single-content-type views. |
| Scroll indicator on every scrolling screen. | Scroll indicator on non-scrolling screens. |
| Content fills width; full-screen elements (progress, TimeText) adapt. | Fixed-width components that ignore available space. |
| Percentage margins plus extra top and bottom margins against clipping. | Components that scale to fill without margins. |

Paginated UIs suit gross gestures (workouts, media); vertical layouts are easier to navigate in general.

---

## Clipping and truncation

Source: https://developer.android.com/design/ui/wear/guides/m2-5/behaviors-and-patterns/clipping

- Layouts clip or truncate when users change language, text size, or enable Bold text. Test all three.
- Interactive elements must scroll fully into view, especially at the edges. Add top and bottom spacing to the list so first and last items are not permanently clipped (M2.5: Horologist `responsive()` layout factory).
- Dense layouts: use compact buttons or chips rather than cards; large card surfaces truncate and clip more easily.
- Percentage margins plus extra inner padding for items at the very top or bottom.
- Write critical text (calls to action) to fit the smallest screen without truncation. Larger screens may show more lines after the breakpoint.
- Plan for truncation of variable server-fetched text on small screens.

---

## Wear components: buttons and edge-hugging buttons

Source: https://developer.android.com/design/ui/wear/guides/get-started/apply
Source: https://developer.android.com/design/ui/wear/guides/foundations/quality-tiers/responsive-optimized
Source: https://developer.android.com/design/ui/wear/guides/surfaces/apps/layouts
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/buttons

### M3 Expressive

- Edge-hugging button: a container shaped to the bottom curve of the round screen, used as the end-of-list or bottom action on scrolling and non-scrolling screens. It grows with screen size. Primary color roles apply to edge-hugging buttons.
- Button groups adapt to available space; select buttons and list items shape-morph on interaction.
- Bottom area options: one edge-hugging button, a button stack, or a two-icon button group.
- Visual priority: primary color for the main action, secondary or tertiary for secondary actions, tonal fill for low-emphasis actions.

### Circular buttons (M2.5 spec)

Use for well-understood actions that need no text label. Content: one icon, or text of at most 3 characters; use a chip or labeled button if an icon cannot describe the action.

| Size | Icon | Container |
|---|---|---|
| Large | 30 x 30 dp | 60 x 60 dp |
| Default | 26 x 26 dp | 52 x 52 dp |
| Small | 24 x 24 dp | 48 x 48 dp |
| Extra small | 24 x 24 dp | 32 x 32 dp (pad tap area to 48 dp) |

- Compact buttons look smaller with a 48 x 48 dp tap area. Toggle buttons switch between two states (days of week, pause/restart).
- Hierarchy: high emphasis uses primary or secondary fill; medium uses surface fill or outlined (transparent, primary-variant stroke at 60% opacity); low emphasis has no fill (compact areas).
- Responsive: with 1 or 2 buttons, internal padding stays fixed and margins are percentages so buttons do not over-stretch. In IMEs, 1 or 2 button lockups stretch to side margins; 3 buttons stay circular below 225 dp and stretch above.

---

## Wear components: chips, cards, toggles

Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/chips
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/cards
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/toggle-chips
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/expandable-item

In M3 Expressive, pill "chips" become labeled buttons and the gradient fills are gone (inference from the M3 color and component pages). The sizing and line rules below remain valid guidance.

### Chips (M2.5 spec)

| Variant | Icon | Height | Tap area |
|---|---|---|---|
| Default chip | 24 dp | 52 dp | 52 dp |
| Compact chip | 20 dp | 32 dp | 48 dp |
| Image chip | n/a | 52 dp fixed recommended | |
| Avatar chip | avatar 32 x 32 dp | | |

- Lines: primary label 1 line when a secondary label exists, else up to 2; secondary label up to 3.
- One label alone is centered; with secondary label or icon, labels are start-aligned.
- One prominent chip per screen for the primary action. Low emphasis chips (transparent, text only) show a child relationship.
- Chips stretch to fill width on larger screens.

### Cards (M2.5 spec)

- Single slot; title card (title, optional time, content) and app card (icon, app name, time, title, content).
- Max card height 60% of the screen: round displays can clip up to 20% at top and bottom.
- Width defaults to the container; height follows content.
- Larger screens: title cards gain an extra body line; image cards get 24 dp bottom padding to show more image.

### Toggle chips and selection controls (M2.5 spec)

- Slots: label, secondary label (optional), icon (optional), control. Use for settings with many quick options.
- Switch for on/off, radio for single choice, checkbox for multi-choice.
- Split toggle: two tap areas (body and control), each a different color.

### Expandable items (M2.5 spec)

| Property | Expanding list | Expanding text |
|---|---|---|
| Default label | "Show more" | "More" |
| Default collapsed amount | 3 items | 8 lines |
| Height | 32 dp | 32 dp |
| Icon | 20 x 20 dp chevron, end-aligned (mirrors in RTL) | same |
| Stroke | 1 dp (required) | 0 or 1 dp |
| Label style | Caption 1, On Surface | same |
| Padding | 8 dp top, 16 dp bottom | same |

Center the chip. For expanding text the whole text area is the tap target.

---

## Wear components: lists

Source: https://developer.android.com/design/ui/wear/guides/foundations/common-layouts/apps-scrolling
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/lists

- M3 Expressive: `TransformingLazyColumn`, with shape-morphing list items and smooth scrolling on round screens. M2.5: `ScalingLazyColumn` (items shrink and fade toward top and bottom, anchored at center).
- Lists hold fixed or variable height items; margins must accommodate the circle.

Spacing (M2.5 spec; spacing grid of 4 dp):

| Between | Value |
|---|---|
| Top, middle and bottom sections | 16 dp |
| Titles and content | 12 dp |
| Slots in the middle section | 16 dp |
| Groups within a slot | 8 dp |
| Elements within a group | 4 dp |

Margins (M2.5 spec):

| Margin | Value |
|---|---|
| Side margin, all lists | 5.2% |
| Extra internal margin on titles | 7.3% |
| Bottom buttons above 225 dp | Fill width with 14.56% internal padding |
| Top and bottom | Vary by first and last element (title, 1 or 2+ buttons, other) |

Snapping: use when items are tall but shorter than the screen. `ItemCenter` centers one item; `ItemStart` uses the item edge (two items on screen). Set `anchorType`; for more control use `ScalingLazyColumnDefaults.snapFlingBehavior` and `RotaryScrollableDefaults.snapBehavior`.

---

## Wear components: pickers, steppers, sliders

Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/pickers
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/steppers
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/sliders
Source: https://developer.android.com/design/ui/wear/guides/foundations/quality-tiers/adaptive-differentiated

### Pickers

- For choosing among a finite set. Items loop infinitely by default; disable looping when order matters or users need to reach the ends fast.
- Multi-part values (time, date): `PickerGroup`, which coordinates focus across pickers.
- Column width fits the widest needed glyphs ("00" for numbers, "MMM" for months); the date picker fills width and bleeds off the edge.
- Use Numeral type roles with tabular spacing so scrolling digits do not jump (M3).

| Spec | Below 225 dp | 225 dp and up |
|---|---|---|
| Font, 2 columns | Display 2 | Display 1 |
| Font, 3 columns | Display 3 | Display 2 |
| Column gap, 2 columns | 4 dp | 6 dp |
| Column gap, 3 columns | 2 dp | 6 dp |
| Top and bottom fade gradient | 33% of column height | 33% of column height |

### Steppers

Full-screen value selection: increase button, label or chip, decrease button. Fills height and width; gaps depend on screen. Crown can drive it; the level shows on a curved indicator. Volume control is the canonical use.

### Sliders (inline)

- Select from a range with immediate effect (brightness, font size). Don't use when changes are not immediate.
- Anatomy: progress bar, track, container, decrease and increase icons, spacer.
- Segmented slider for 3 to 9 values; beyond about 8, segments become too small.
- Fills available width; icon 24 x 24 dp, container 52 dp tall.

---

## Wear components: dialogs and confirmations

Source: https://developer.android.com/design/ui/wear/guides/components/dialogs
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/confirmation-overlay

- Wear dialogs occupy the whole screen, layer over content, and support swipe to dismiss (reveals parent content).
- One slot holds an opinionated content type: Alert or Confirmation.

| Type | Behavior | Anatomy |
|---|---|---|
| Alert | Gets the user's response for important tasks; blocks app functionality until acted on. Interruptive, use sparingly. | Title, optional content, negative button, positive button, optional icon. |
| Confirmation | Short-lived message after an action executed; no choice offered (differs from phone Material). | Icon, label. |

- Alert text is centered; when content exceeds three lines, consider start alignment.
- Prefer showing the change in the UI itself; use a confirmation overlay only when the action has no visible effect (for example, add a message to history instead of confirming "sent").
- Confirmation text (M2.5 spec): max 3 lines, max 36 characters (30 for non-Latin scripts). Margin percentages apply universally.
- Larger screens: reduced scrolling, generous margins, larger tap targets; confirmations can gain an illustration or more information.
- Arc type roles (ArcLarge) serve curved headers on confirmation overlays (M3).

---

## Wear components: progress, position indicator, time text, page indicator

Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/progress-indicator
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/position-indicator
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/time-text
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/page-indicators
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/vignette

### Progress indicator

- Circular, animates clockwise along a track. Can wrap a component such as a play button.
- Leave a gap for important info such as the time by adjusting `startAngle` and `endAngle`. Full-screen gap stays 51 degrees; sweep length grows with screen size.
- Circumference fills the screen or host element proportionally; stroke width stays constant across breakpoints. Ring width and endpoints are customizable.
- Indeterminate spinner: use sparingly, it increases perceived wait.
- Full-screen progress adapts automatically; use percentage margins on the center content and consider a breakpoint for bigger or more components.

### Position indicator (scroll bar)

| Variant | Arc height | Notes |
|---|---|---|
| List position indicator | 50 dp fixed | Angle changes with screen size; margin can drop to 2 dp to match system UI. |
| Control / rotary (RSB) indicator | 76 dp fixed | Same margin option; can sit on left or right. |

Use it for lists and any context the rotary input controls (scrolling, settings, volume).

### Time text

- `TimeText` shows time (and optional leading label) at the top, curved on round screens, straight on rectangular ones.
- Leading content plus time must not exceed a quarter of the circumference.
- Fade time text away as lists scroll (M2.5: `Modifier.scrollAway`).
- Example: maps ETA as leading content. Arc type roles (ArcSmall) style it in M3.

### Page indicator

- `HorizontalPageIndicator`: curved on round displays, one active plus at least one inactive dot, max 6 dots on any size, oriented left to right.

### Vignette

Signals more content; scales proportionally to fill the screen in whole, top and bottom variants.

---

## Wear typography

Source: https://developer.android.com/design/ui/wear/guides/styles/typography
Source: https://developer.android.com/design/ui/wear/guides/styles/typography/apply
Source: https://developer.android.com/design/ui/wear/guides/styles/typography/type-scale-tokens
Source: https://developer.android.com/design/ui/wear/guides/styles/typography/fonts
Source: https://developer.android.com/design/ui/wear/guides/styles/typography/accessibility
Source: https://m3.material.io/foundations/watches

- Font: Roboto Flex everywhere (replaces Roboto). Key variable axes for product design: weight and width.
- 21 styles in six screen-size-agnostic roles: Display, Title, Label, Body, Numeral, Arc.
- Minimum sizes (quality): 12 sp essential text, 10 sp non-essential.

| Role | Styles | Use | Scales with user font size? |
|---|---|---|---|
| Display | Large, Medium, Small | Short hero info, key metrics, brand moments | No |
| Title | Large, Medium, Small | Page, section, sub-section headings; avoid on interactive components | Yes |
| Label | Large, Medium, Small | Text inside components. Medium is most common (button primary label); Small for secondary labels and compact buttons; Large for title buttons | Medium and Small yes, Large no |
| Body | Large, Medium, Small, ExtraSmall | Paragraphs, data viz text, timestamps, metadata | Yes |
| Numeral | ExtraLarge, Large, Medium, Small, ExtraSmall | Digits only, non-localized: charging screen and time picker (XL), countdowns (L), step counts (M), date/time pickers (S), in-workout metrics (XS). Tabular by default | No |
| Arc | Large, Medium, Small (top and bottom variants) | Curved text: Large for confirmation overlay headers, Medium for page titles, Small for time text (top) or call to action (bottom) | Yes |

- No style at 20 sp or above may scale with user font settings (limited space).
- User font size steps in increments of +/- 6%. Design for the largest and smallest settings.
- Arc styles use tailored axes to correct letter spacing at the top versus bottom of the circle; add tabular/mono spacing to curved text.
- Use tabular (monospaced) figures wherever values change or animate: timers, pickers, workout metrics.
- Weight cautions: too light at small sizes struggles on low-resolution screens (keep light weights for display sizes); too heavy at small sizes also hurts legibility.
- Width: narrow width fits more characters (names, long numbers); avoid wide styles in tight spots like page headers.
- Variable axis in motion: animate weight, width, or both for expressive feedback.
- Line height: about 1.1x the size on watch (1.2x is the general ideal). Compose adds extra height to the last line (about 1.25x):

| Style (size / line height) | Extra on last line | Effective last line |
|---|---|---|
| 40 / 44 | +7 | 40 / 51 |
| 24 / 26 | +4 | 24 / 30 |
| 20 / 22 | +3 | 20 / 25 |
| 16 / 18 | +2 | 16 / 20 |
| 14 / 16 | +2 | 14 / 18 |
| 10 / 12 | 0 | 10 / 12 |

This explains small misalignments in screenshot tests.

Differences from M2.5: M2.5 used Roboto (Medium for titles, Regular for body) and an 11-category scale (Display 1 to 3, Title, Button, Body 1 and 2, Caption 1 to 3). Tiles in M2.5 used Body 2 as smallest and Display 2 as largest.

---

## Wear color

Source: https://developer.android.com/design/ui/wear/guides/styles/color
Source: https://developer.android.com/design/ui/wear/guides/styles/color/system
Source: https://developer.android.com/design/ui/wear/guides/styles/color/roles-tokens
Source: https://developer.android.com/design/ui/wear/guides/styles/color/apply
Source: https://developer.android.com/design/ui/wear/guides/m2-5/styles/color

### Principles

- Build from black: watches use a pure black background (phones use tinted surfaces). Watch UIs must work day and night, so Wear tokens are tailored for that; Wear OS uses only a dark scheme.
- Semantic color: red for errors and destructive actions, green for success.
- What M3 Expressive adds: built-in accessible relationships, 28+ roles mapped to components, built-in dark colors for black backgrounds, improved disabled values, extra error colors, a static baseline scheme, and dynamic color from the watch face or from images.
- Fewer roles than phone: no need for many hover and focus states on a touch watch.

### Dynamic color

- Each watch face defines two seed colors: one for primary, one for tertiary. An algorithm generates five tonal ranges (primary, secondary, tertiary, neutral surfaces) and maps tones to roles through tokens; system UI, tiles and opted-in apps all apply it.
- The Wear theme meets WCAG AAA.
- Design first with the baseline scheme so roles map correctly, then preview across many seeds with Material Theme Builder.
- Brand themes: use the Wear-specific theme tools to generate full palettes and roles from a brand color.
- HCT model: hue 0 to 360, chroma 0 to about 120 max, tone 0 (black) to 100 (white). Tone difference drives contrast.

### Roles

| Group | Roles | Use |
|---|---|---|
| Primary | Primary / On-Primary | Most important actions, edge-hugging and prominent buttons, active states. |
| | Primary-Dim / On-Primary | Distinct from primary but less urgent. |
| | Primary-Container / On-Primary-Container | Cards, selected states, ongoing-activity highlights. |
| Secondary | Secondary / On-Secondary | Supporting actions in dense UI. |
| | Secondary-Dim (paired with Secondary) | Passive elements, subtle depth. |
| | Secondary-Container / On-Secondary-Container | Structure for secondary content in dense layouts. |
| Tertiary | Tertiary / On-Tertiary | Standout elements: badges, special actions, goal reached. |
| | Tertiary-Dim (paired with Tertiary) | Tertiary-related actions without urgency. |
| | Tertiary-Container / On-Tertiary-Container | Grouping tertiary content. |
| Error | Error / On-Error | Theme-tinted red for remove, delete, close, dismiss (for example swipe to reveal). |
| | Error-Dim / On-Error | High-priority errors and emergencies: safety alerts, failed overlays, stop buttons. |
| | Error-Container / On-Error-Container | Less prominent error state, active emergency sharing, failed overlay. |
| Surface | Surface-Container-Low | Expanded containers below Surface-Container (expanded notification card), non-interactive cards. |
| | Surface-Container | Default container. |
| | Surface-Container-High | High-emphasis containers above Surface-Container. |

Text on surfaces uses On-Surface or On-Surface-Variant. Container roles fill foreground elements and never color text or icons. "Variant" means a lower-emphasis alternative.

### Pairing rules

- Use only the intended pairs; with dynamic color, wrong pairs break contrast. Role pairs guarantee at least 3:1; correct on-pairs (on-primary on primary, on-primary-container on primary-container) reach AAA 7:1.
- Don't: primary-container on primary, or primary-dim on primary-container.

Recommended combinations:

| Combination | When |
|---|---|
| Primary + Primary-Dim | Main action plus complementary items. |
| Primary + Primary-Container | Main action plus complementary items with depth. |
| Primary-Dim + Tertiary | Highlight important elements; tertiary for standout feedback such as tap responses. |
| Primary-Dim + Tertiary-Dim | Highlight plus feedback such as a goal met. |
| Primary + Secondary-Container | Key element plus less prominent content. |
| Tertiary + Primary + Secondary-Container | Main action unclear: tertiary and primary for main actions, secondary-container for complementary. |
| Primary + Tertiary + Primary-Container | Same, with primary-container for complementary. |
| Secondary + Primary-Container | Two equally important options with contrast between them. |

### M2.5 dark theme rules still worth applying

Body text at least 4.5:1 on every surface; avoid saturated colors on black (contrast failures, optical vibration), prefer desaturated tones (200 to 50 rather than 900 to 500).

---

## Tiles

Source: https://developer.android.com/design/ui/wear/guides/surfaces/tiles
Source: https://developer.android.com/design/ui/wear/guides/surfaces/tiles/bestpractices
Source: https://developer.android.com/design/ui/wear/guides/surfaces/tiles/states
Source: https://developer.android.com/design/ui/wear/guides/surfaces/tiles/responsive-adaptive-design
Source: https://developer.android.com/design/ui/wear/guides/foundations/common-layouts/tiles
Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/tiles-principles
Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/tiles-design-system
Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/tiles-layouts

Tiles: fixed-height, non-scrolling glanceable surfaces reached by swiping from the watch face. Users pick which tiles appear (on watch or phone companion). Viewing time is around 7 seconds.

Principles: immediate (critical content, clear hierarchy), predictable (always one user-facing task), relevant (context-aware). Focused, concise, purpose-driven; no superfluous functionality.

### Best practices

| Do | Don't |
|---|---|
| Black background (battery, hides bezel). | Full-bleed image or block color backgrounds. |
| Let the system show the app icon (ProtoLayout Material3 `PrimaryLayout` opt-in). Provide a monochrome icon if the tile uses dynamic theming. | Draw the app icon into the tile (it may appear twice). |
| Hide the title slot below 225 dp when using two rows plus a bottom section, so rows keep 48 dp tap height; show it again at 225 dp+. | Keep the title with two rows on small screens (targets drop under 48 dp and clip). |
| One primary use case, a small set of options plus "see more". | Many options (decision paralysis). |
| At least one container; the whole tile tappable to a matching app screen. | Content with no visible tap affordance. |
| Each action's outcome obvious. | Ambiguous targets (album art vs "Play"). |
| Primary color on the primary action; secondary or tertiary on others; tonal fill for the bottom button. | Many filled buttons, all primary. |
| Fewer containers, one per distinct action. | Several containers leading to the same place. |
| Containers only for functional, tappable purposes. | Decorative containers that invite dead taps. |
| Glanceable graph or number, tap to see detail in the app. | Detailed statistics on the tile. |
| Focus each tile on one task; make separate tiles for separate tasks (goals tile, workout tile). | Multiple tasks on one tile. |
| Indicate data freshness; show "last updated" for cached data. | Unexplained stale data. |
| Animate to emphasize updates (progress toward steps goal). | Unexpected value toggling. |

- Refresh rate: balance freshness against battery; platform data (heart rate, steps) is rate-controlled by Wear OS. Don't update more than once a minute for ongoing activity tiles.
- Media tiles: data latency can reach 20 seconds, so avoid direct play/pause buttons controlling in-app functions; show selectable media and a fast path into the app.

### Layout structure

Three sections, each a slot:

| Section | Behavior |
|---|---|
| Top: app icon (system) and title slot | Title gains characters on wider screens; percentage inner margins. Title optional and hidden below 225 dp with two-row content. |
| Main slot | Components set width and height to "expand"; percentage inner margins (per row in some cases). Corner radius plus layout combos may need larger margins. |
| Bottom slot | Button or text; widens on larger screens; percentage inner margins. Without a bottom slot a default margin applies. |

- M3 tiles: one fully customizable layout with 60+ permutations; earlier guidance cites four canonical layouts with 80+ permutations. Slots are swappable, but don't break the template structure: consistency matters as users swipe the carousel.
- Non-customizable (M2.5 guidance): primary label style and position, progress indicator style and position, bottom compact chip style and position.
- At 225 dp and up: show the hidden title, enlarge or change component state, add component slots, or add content at the bottom. Don't just scale the design up.

### ProtoLayout templates (M2.5 names, still the structural basis)

| Template | Top | Middle | Bottom |
|---|---|---|---|
| `PrimaryLayout` | Primary label (optional) | Main content, secondary label (optional) | Primary chip (optional) |
| `EdgeContentLayout` | Primary label (optional) | Main content, secondary label (optional) | Edge content: progress ring |

Main-slot helpers: `MultiButtonLayout` (grid of round buttons: up to 6 on small screens, 7 with other templates, more on large), `MultiSlotLayout` (up to 3 columns of data), custom slots (images, graphs).

Canonical layout types:

| Type | Template | Use and small-screen rule |
|---|---|---|
| Text-centric | PrimaryLayout | News, events, reminders, sign-in, error, setup. Remove secondary label and chip on small screens to save height. |
| Button-centric (chips) | PrimaryLayout | With two standard chips, drop the secondary label on small screens. |
| Button-centric (buttons) | PrimaryLayout | Up to 5 related primary actions; two rows means no secondary label on small screens. |
| Info-centric | PrimaryLayout | Metrics with MultiSlotLayout; keep text short. |
| Info-centric with progress | EdgeContentLayout | Progress plus one key metric; no primary chip. |
| Data-centric | PrimaryLayout | Graphs; turn off secondary label and chip for a larger graphic. |

### M2.5 tile numbers

| Item | Value |
|---|---|
| Primary label top margin | 16.64% |
| Primary label side margin | 6.3% |
| Primary label color / type | On-Background-Variant (Gray 300), Button 15 sp Bold |
| Bottom compact chip | 2.1% from bottom (design system page also cites 6.3% above bottom), 8 dp padding above and below, 12 dp horizontal internal padding, 16.64% side margins |
| Bottom chip text below 225 dp | 1 line, max 8 characters, recommended 6, no truncation |
| Bottom chip text 225 dp+ | 1 line, max 9 characters, recommended 7, no truncation |
| Fallback CTA text | "More" |
| Progress indicator stroke | 8 dp or 5 dp default, full or with bottom gap |
| Icon/text buttons | Sizes standard, XS, S, L; up to 7 options |
| Standard chips | Up to 2 options |
| Brand color | Only primary, primary-variant, on-primary, surface, on-surface are customizable |

### States

- Every empty state has a clear call to action.

| State | Content |
|---|---|
| Sign-in | Ask to sign in or create an account on watch or phone (also a quality requirement, WO-V9). |
| Error | CTA that fixes the problem. |
| Empty (no data) | Explain why and how to fix. |
| Empty (content) | Often the most common state; add an image so it feels complete, or default text on a tonal background. |
| Empty / overflow progress | Components handle zero and over-goal values. |
| Ongoing reference | Indicate an activity is already running; tapping opens it, never starts a new instance. Users typically cannot stop it from the tile. |

Ongoing activity tile: required primary data and status label; optional icon or animation and a bottom CTA.

### Tile preview (quality WO-V10)

400 x 400 px, circular, solid black background, PNG or JPEG, localized for popular languages. No empty state, no pagination icon, no stroke around the tile.

---

## Complications

Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/complications
Source: https://developer.android.com/docs/quality-guidelines/wear-app-quality

A complication is a small watch face element with highly glanceable data the user checks often (weather, heart rate).

Principles: glanceable (simple, readable), content forward (value visible on wrist raise, no interaction needed), privacy first (the watch is visible everywhere; consider context).

- Tap can open a specific app destination or perform a self-contained action (tap to add a glass in a water counter).
- Wear OS adds an app shortcut complication automatically; don't build your own launcher shortcut.
- Watch faces support at most 8 complication slots (WO-P10).

| Type | Required fields | Optional fields | Class |
|---|---|---|---|
| SHORT_TEXT | Short text | Icon, burn-in protection icon, short title | `ShortTextComplicationData` |
| ICON | Icon | Burn-in protection icon | `MonochromaticImageComplicationData` |
| RANGED_VALUE | Value, min, max | Icon, burn-in icon, short text, short title | `RangedValueComplicationData` |
| LONG_TEXT | Long text | Long title, icon, burn-in icon, small image | `LongTextComplicationData` |
| SMALL_IMAGE | Small image | | `SmallImageComplicationData` |
| LARGE_IMAGE | Large image | | `PhotoImageComplicationData` |

Provide burn-in protection icons for ambient mode.

---

## Watch faces

Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/watch-faces
Source: https://developer.android.com/docs/quality-guidelines/wear-app-quality
Source: https://m3.material.io/foundations/watches

The most-used Wear surface. People check the time about 150 times a day.

Principles: time-telling first, expressive (personality, variety, customization), useful (complications for glanceable info).

- Glanceable: clear fonts, legible icons, simple layout.
- Include complications; allow customization (colorways, hands, complications).
- Use black as the primary color (battery, neutrality).
- Stay within the bezel so essentials are not cropped or covered.
- Ongoing activities can surface on the watch face (stopwatch, workout timer).

| Mode | Rule |
|---|---|
| Interactive | Shown while the user interacts. Memory budget 100 MB. |
| Always-on (ambient) | Max 15% of pixels lit (averaged luminance). Memory budget 10 MB. |

Watch Face Format is mandatory for installs from January 2026. Play icon: centered circular face touching the asset edges (from July 15, 2026). Screenshots show several permutations of customizable faces, no device frames.

---

## Ongoing activities, notifications and surface priorities

Source: https://developer.android.com/design/ui/wear/guides/m2-5/behaviors-and-patterns/ongoing-activities
Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/notifications
Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/interaction-types
Source: https://developer.android.com/design/ui/wear/guides/surfaces/tiles/states

### Ongoing activities

- Background activities (timers, media, workouts) must use `OngoingActivity` or a Live Update notification (WO-V4).
- Entry points: watch face, launcher (Recents), tile.
- Recents text states type and status:

| App type | Show in Recents |
|---|---|
| Media | Track, song or podcast name |
| Fitness | Workout duration or type |
| Navigation | ETA, destination, or travel mode |

- On tiles: a glanceable representation with tap-through; no detailed info or actions; update at most once a minute.

### Notifications

Principles: valuable (is it worth buzzing the wrist, does it need action now), glanceable (small chunks, clear hierarchy), timely (send as soon as relevant).

| Template | Use |
|---|---|
| Standard | Most notifications: succinct message, large icon if relevant, actions. |
| Big text | Longer preview when expanded. |
| Big picture | Picture shows for a second when scrolled to, then slips into the card. |
| Messaging | Chat history plus Smart Reply without extra code. |

Expanded notifications support actions such as reply, open map location, play. At 225 dp+, glanceable notifications can enlarge image, app icon and text. Surface-Container-Low suits expanded notification cards (M3 color).

### Prioritizing content across surfaces (example: weather)

| Surface | Priorities |
|---|---|
| Complication | P1: weather now |
| Notification | P1: weather advisory |
| Tile | P1: now; P2: today |
| App | P1: now; P2: today; P3: hourly breakdown, preferences |

Other entry points: launcher, voice actions.

---

## Wear media apps

Source: https://developer.android.com/design/ui/wear/guides/patterns/media
Source: https://developer.android.com/design/ui/wear/guides/patterns/media/controls
Source: https://developer.android.com/design/ui/wear/guides/patterns/media/principles
Source: https://developer.android.com/design/ui/wear/guides/patterns/media/use-cases
Source: https://developer.android.com/design/ui/wear/guides/patterns/media/color
Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/media-apps

Architecture: Browse (prioritize downloaded items) and Entity pages (download, play, shuffle readily available). Keep the hierarchy flat with thumbnails.

Principles: consistent and predictable (reuse system patterns), glanceable and critical (show live status: volume, output device), quick (no hidden gestures needing memorization; visible overflow button instead).

### Media controls screen

- Fixed-height, three sections: top (media details), middle (controls), bottom (configurable secondary buttons).
- 5-button layout keeps tap targets at minimum size. More than 5 actions: overflow (three dots) to another page.
- Bottom buttons: max 2 below 225 dp, max 3 at 225 dp+ (for example a playback queue shortcut).

| Spec | Below 225 dp | 225 dp and up |
|---|---|---|
| Main control progress ring | 64 x 64 dp, 3 dp stroke | 80 x 80 dp, 4 dp stroke |
| Main play/pause button | 54 x 54 dp, 26 dp icon | 70 x 70 dp, 32 dp icon |
| Side control tap area | 64 x 64 dp | 72.5 x 80 dp |
| Bottom buttons tap area | 68 x 60 dp (2 max) | 58 x 72.5 dp (3 max) |
| Header top margin | 12% | 13.2% |
| Song title side margin | 17.6% | 17.6% |
| Artist title margin | 12.5% | 14.5% |

- Minimum tap target 48 x 48 dp, icons centered in the target.
- Artist title truncates; long song titles marquee with 8 dp gradients; with an icon, add an 8 dp gap and the icon stays fixed.


### Volume and output

- Volume control is essential: include a volume button that opens the volume screen (stepper) and shows the output device icon.
- Use the rotating side button, bezel or hardware volume keys; show the volume indicator only while rotating.
- If the watch is the source, prompt output selection (headset, buds) before playback, then show the output icon.

### Other rules

- Playback queue: consistent patterns for queues with and without previous songs.
- Always-on: custom ambient layout with few lit pixels; remove frequently updating progress indicators that add no value at ambient refresh rates.
- Loading: placeholder state mirrors the final layout structure, then transitions to loaded.
- Downloads: show location, progress, time and size; show a remove action and storage used for downloaded items; surface recent downloads in Browse. Streaming drains battery, so prioritize downloads.
- Color: system seeds a theme from artwork (M3 Expressive dynamic algorithm makes secondary, tertiary, neutral palettes) and applies it to the rest of the app. No artwork: fallback to the watch face theme, or opt into a monochrome palette (artwork then hidden on controls).

---

## Wear inputs: swipe to dismiss, swipe to reveal, rotary, buttons

Source: https://developer.android.com/design/ui/wear/guides/components/swipe-to-dismiss
Source: https://developer.android.com/design/ui/wear/guides/m2-5/behaviors-and-patterns/navigation
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/swipe-to-reveal
Source: https://developer.android.com/design/ui/wear/guides/m2-5/behaviors-and-patterns/physical-buttons
Source: https://developer.android.com/design/ui/wear/guides/m2-5/surfaces/media-apps

### Swipe to dismiss (back)

- Left-to-right swipe closes the current view and goes back; Wear has no on-screen back buttons. Required on almost all screens (WO-V3).
- Keep other navigation on the vertical axis; avoid horizontal carousels.
- Compose: `SwipeDismissableNavHost` provides it; otherwise `BasicSwipeToDismissBox`. Views: `SwipeDismissFrameLayout`.
- With horizontally swipable content (pagers, maps), reserve the left 20% edge to trigger dismiss.
- Thresholds: drag past 50% of screen width completes; less snaps back; a fast fling ignores the 50% rule and completes.
- Motion: finger drives the animation up to 50%; the app view moves with resistance (squeeze) and never leaves the screen edge.

### Swipe to reveal

- Extra actions on list chips and cards: primary and optional secondary. Revealed actions appear on the same side in all locales.

| Swipe distance | Result |
|---|---|
| Under 50% | Snaps back, nothing happens |
| 50% to 75% | Stays open showing actions |
| Over 75% | Commits the primary action automatically |

- Committing expands the button across the width with a label, then fades.
- Destructive actions get an undo on the primary action; the undo chip fades after a short time, then the action completes.
- Components: `SwipeToRevealCard`, `SwipeToRevealChip` (M2.5 names). Error role colors suit delete actions (M3).

### Rotary input (crown, rotating side button, bezel)

- Use for scrolling lists, adjusting values (steppers, pickers, volume) and controlling non-scrolling screens with limited room. Show the position indicator when rotary controls a value.
- Rotary scrolling is no longer a hard quality requirement (WO-V7 removed in 2024) but remains expected behavior (inference: Compose lists support it by default).

### Physical buttons

- OS buttons (power, launcher) are reserved for the system.
- Multifunction buttons may be mapped when the action is binary (play/pause, start/stop) or the app is used eyes-free.
- Press types: single press; press and hold (500 ms or longer).

| Do | Don't |
|---|---|
| Single-press, immediately completed actions. | Multi-step actions (start a reply). |
| Reversible actions. | Destructive actions (delete, stop navigation). |
| Mirror every button action with an on-screen control (not every watch has the button). | Button-only actions, or unclear mappings (restart a stopwatch). |

---

## Wear one-handed gestures (Wear OS 7)

Source: https://developer.android.com/design/ui/wear/guides/patterns/gestures

New in Wear OS 7: an OEM gestures framework plus a Compose Gesture API. Adopted first by Pixel Watch 3 and newer; other OEMs can opt in.

| Gesture type | Pixel Watch mapping | Use |
|---|---|---|
| Primary action | Double pinch | Main task on the screen: answer call, play/pause, snooze alarm, optionally scroll. One UI element at a time on a scrollable page. |
| Dismiss action | Wrist turn | Defaults to system back. Overrides must still mean dismiss, silence or minimize (silence a call, close notifications). Never map to arbitrary actions. |

- Primary action fits best when users reach the element hands-free (voice, gesture, auto-launched screens like notifications and media controls).
- Disable wrist turn where accidental triggers are risky (active workout, emergency call) by subscribing with an empty handler.
- Guidelines: one-and-done interactions only; gesture scroll only for screens reached hands-free whose content is glanceable (workout summary) with at most one optional final button (for example a "done" edge button); no dead ends needing touch; never hide a gesture-only action: a visible tappable equivalent must exist (wrist-turn back excepted).
- Feedback sequence: hint animation shows which gesture and which element; short crisp haptic on success; replay the element's normal touch sound and visuals (camera shutter).
- Hints: button hint (animated icon temporarily replaces the button's icon or label, tinted `LocalContentColor`) or floating hint (bubble pointing to small targets such as the scroll bar, container `Tertiary`, icon `onTertiary`, can point in four directions).
- Cadence is global and user-set (Always, Daily, Monthly; default Always). Button hints show at least once on first launch or after an update adding a gesture. Floating hints show at most once per day per experience.
- No in-app gesture tutorial: the system tutorial and Pixel Tips cover onboarding; use in-context hints.

---

## Wear launch, sign-in, permissions, offline

Source: https://developer.android.com/design/ui/wear/guides/behaviors-and-patterns/launch
Source: https://developer.android.com/design/ui/wear/guides/m2-5/behaviors-and-patterns/sign-in
Source: https://developer.android.com/design/ui/wear/guides/m2-5/behaviors-and-patterns/permission
Source: https://developer.android.com/design/ui/wear/guides/m2-5/behaviors-and-patterns/permission-message
Source: https://developer.android.com/design/ui/wear/guides/m2-5/behaviors-and-patterns/disconnect

### Launch and latency

- Performance matters: holding the wrist up while waiting is uncomfortable.
- Build gradually: static elements (text, buttons, placeholders) first; avoid dynamic elements whose shape is unpredictable.
- Prefer static text or placeholder images over indeterminate spinners.
- Instant visual feedback: ripple on tap; for remote actions (phone volume), show the indicator before the change completes.
- Branded launch: black window background, centered circular 48 x 48 dp icon matching the launcher icon (WO-V15).

### Sign-in

- Build on Credential Manager (standalone on watch): passkeys first, then passwords and Sign in with Google. Offer at least two distinct methods in total, since "sign in on phone" fails without the phone.
- Automatic data layer auth may come first only if fully silent, backed by another method, and falling through to Credential Manager on failure.
- Sign-in required: show Credential Manager immediately. Otherwise delay until needed, explain the benefit in context, allow skipping. Never name "Credential Manager" in UI; keep users signed in; never ask for typed username or password on the watch (WO-P6).

### Permissions

- Request at the moment of need, after explaining why. Multiple requests appear sequentially. Some permissions also need acceptance on the phone.
- Message patterns: full-screen message opening the dialog; inline message opening a setting; message opening the setting on the phone.

### Offline

- Offline indicator at the top: some features unavailable (gray out or hide them). At the bottom of a list: no more content can load.

---

## TV principles

Source: https://developer.android.com/design/ui/tv/guides/foundations/design-for-tv
Source: https://developer.android.com/design/ui/tv
Source: https://developer.android.com/docs/quality-guidelines/tv-app-quality

TV is about content: find it and enjoy it with minimal friction.

| Consideration | Rule |
|---|---|
| 10 ft UI | Viewers sit about 3 m (10 ft) away, leaning back. Large text and elements; limit reading; avoid complex layouts and controls. |
| D-pad navigation | Most TVs use up, down, left, right and select. Give instant, distinct feedback on every press. |
| Communal device | Shared in households; apps showing personal info need privacy settings. |

Component categories: action, containment, navigation, selection, text input. TV components (Compose for TV): buttons, cards, featured carousel, immersive list, lists, navigation drawer, tabs.

---

## TV layout, grid and overscan

Source: https://developer.android.com/design/ui/tv/guides/styles/layouts
Source: https://developer.android.com/design/ui/tv/guides/components/cards

### Canvas

- TVs are fixed 16:9. Design at MDPI 960 x 540 px (1 px = 1 dp); everything scales proportionally to HD and 4K.
- Assets target 1080p (the system can downscale to 720p). Tier 2 quality expects 4K-ready assets (icons, banners, cards).
- Use dp like any Android device.

### Overscan safe area

| Edge | Value |
|---|---|
| Left and right | 48 dp (5% of 960); the grid uses 58 dp side margins |
| Top and bottom | 27 dp (5% of 540), rounded to 24 dp; the page also cites 28 dp |

- Keep important elements inside the safe area; no text or functionality may be cut off by screen edges (TV-OV).
- Fill the full screen: backgrounds and offscreen elements extend past the safe area; partially visible offscreen items are fine.
- Most modern TVs no longer overscan, but keep the margins.

### Grid

| Property | Value |
|---|---|
| Columns | 12 |
| Column width | 52 dp |
| Gutter | 20 dp |
| Side margins | 58 dp |
| Vertical spacing between lines | 4 dp |

Card widths with 20 dp spacing and peeking:

| Cards per row | Card width |
|---|---|
| 1 | 844 dp |
| 2 | 412 dp |
| 3 | 268 dp |
| 4 | 196 dp |
| 5 | 124 dp |

- Account for focused-state scale when spacing grid items so focused cards don't overlap neighbors.
- Orientation: landscape only, no vertical letterboxing or pillarboxing; black bars only for original-format video (TV-LO). Fill the screen with an opaque background (TV-TR).

### Layout patterns and structures

Patterns: horizontal stack (side-by-side groups), vertical stack (text, components, nested patterns), grid (browsable collections). Structures: single-pane (content-forward, critical info) and two-pane (hierarchical, task-forward).

- Few panels: put related content in one panel. Order panels by reading path and decision logic; never bounce focus back and forth between panels.
- Give each D-pad direction a clear purpose.

### Templates

Browse (vertical stack of horizontal rows), left overlay (navigation or actions tied to the background), right overlay (actions independent of the background), center overlay (urgent modal decision), bottom overlay (bottom sheet mini flows), actions (title left, options right), content details (title, metadata, description, quick actions, related clusters), compilation (item left, its episodes right), grid, alert (full-screen message needing an action).

---

## TV navigation and D-pad

Source: https://developer.android.com/design/ui/tv/guides/foundations/navigation-on-tv
Source: https://developer.android.com/docs/quality-guidelines/tv-app-quality

Principles: efficient (fewest clicks and screens), predictable (standard patterns), intuitive (no unnecessary layers).

### Controller

Every controller has a D-pad, select, home and back. Others vary.

| Button | Behavior |
|---|---|
| D-pad | Moves focus to the nearest element in that direction. |
| Select (center) | Activates the focused item; press and hold can show more options. During playback, pauses and resumes (TV-PC). |
| Home | Always returns to Google TV Home or the launcher; app suspends. Long press opens the system dashboard (Google TV) or app grid (Android TV), OEM-dependent. |
| Back | Returns to the previous destination. |
| Microphone | Google Assistant or voice input. |

- Never depend on a Menu button (TV-DM). Full functionality must work with a five-way D-pad (TV-DP), or standard gamepad keys if a controller is required.
- D-pad testing: every focusable element reachable; directions predictable; up and down scroll whole lists and every item selectable.
- Media: left and right rewind and fast-forward; play/pause key toggles (TV-PP).

### Back button

- Predictable: each press goes to the previous destination, eventually landing on Google TV Home (TV-DB).
- Top-navigation apps: back scrolls to the top and focuses the menu. Left-navigation apps: back opens the side menu with focus on the active item.
- No exit gating: no confirmation to leave, no loops.
- Don't show an on-screen back button.
- Show a Cancel button when the only visible actions are confirm, destructive or purchase.

### Architecture

- Fixed start destination: the launch screen is also the last screen before returning to the launcher. Exclude splash screens from the back stack.
- Deep links simulate manual navigation: back from a deep-linked details page leads to the app's home (except Live tab direct playback, which has its own rules, TV-DL).
- Clear straight path to every control; if a control is hard to reach (for example a search action wedged among other targets), move it.
- Axes: categories vertical, items within a category horizontal. Avoid nested hierarchies.

---

## TV focus system

Source: https://developer.android.com/design/ui/tv/guides/styles/focus-system

- Focus is the key TV state and the starting point of navigation. Only one element is focused at a time.
- Focusable elements (buttons, cards, list items, custom surfaces) live in focusable groups, which can nest, to create logical navigation.
- States: default, focused, pressed (held until the button releases), plus enabled, disabled and selected forming a matrix.

| Indicator | Parameters |
|---|---|
| Scale | Defaults 1.025x, 1.05x, 1.1x; larger elements use smaller factors. |
| Glow | Glow level 2 dp to 32 dp (elevation), color from image or brand. Common on cards. |
| Outline (border) | Width (outside the element), inset (gap to element), color. |
| Color | Background and content color change. |

- Mix and match indicators per context. Background stays static; surface color can change on focus.
- Tonal elevation: surfaces at levels +1 to +5 get primary-tinted overlays for depth, contrast and smoother transitions.
- Disabled: lower prominence through background and opacity.
- Component defaults: buttons scale 1.1x on focus keeping internal padding; immersive list cards scale 1.1x with a border; outlined buttons gain a fill plus outline on focus. Jet Stream uses a 3 dp outline focus.

---

## TV components

Source: https://developer.android.com/design/ui/tv/guides/components/buttons
Source: https://developer.android.com/design/ui/tv/guides/components/cards
Source: https://developer.android.com/design/ui/tv/guides/components/featured-carousel
Source: https://developer.android.com/design/ui/tv/guides/components/immersive-list
Source: https://developer.android.com/design/ui/tv/guides/components/lists
Source: https://developer.android.com/design/ui/tv/guides/components/navigation-drawer
Source: https://developer.android.com/design/ui/tv/guides/components/tabs

All have Figma sources; most have Compose for TV implementations (immersive list is a sample).

### Buttons

Six types: filled, outline, icon, outline icon, wide (long), image. States: default, focused, pressed.

| Type | Use | Shape |
|---|---|---|
| Filled | Highest emphasis, final actions (Save, Join now, Confirm, Download). Solid container. | Fully rounded |
| Outline | Medium emphasis, pairs with filled for alternatives. On focus gains fill plus outline. | Fully rounded |
| Icon / outline icon | Compact actions: overflow, search, toggles (favorite, bookmark), play/pause. Small, medium, large sizes. | Fully rounded |
| Wide | Higher emphasis than usual; leading icon, title, subtitle. Related ones grouped on a shared surface; width from the layout grid, content start-aligned. | 12 dp corners |
| Image | Thumbnails of next-level content; image plus gradient (from container color) plus state scrim. | 12 dp corners |

- Container scales 1.1x on focus with constant padding. Width follows content with consistent padding, or the grid for filled, wide and image buttons; icons and labels stay centered when a filled button widens.
- Icon on the leading side, vertically centered. Never two icons in one button.
- Labels: sentence case, single line, no wrapping. Use scrims for outlined buttons over images.
- Groups: one primary action per screen, usually a prominent wide button; focus lands on the first button, so it is the primary. Linear rows or columns. Column groups use a single variant; row groups may mix filled, outline, text and icon with clear hierarchy. Never mix long and image buttons.
- Don't overuse buttons.

### Cards

- One topic per card; cards never merge or split. Variants: standard, classic, compact, wide standard, wide classic (the page also lists inset).
- Content block: title, subtitle, description, extra text; same width as the image. Need more text: use a wide variant with only a few words of description; no long descriptions on stacked cards.
- Compact cards: text over image needs a semi-transparent black gradient scrim; keep titles short.

| Aspect ratio | Use |
|---|---|
| 16:9 | Most common; movies, video. |
| 1:1 | Visual balance: cast and crew, channel or team logos. |
| 2:3 | Taller, adds emphasis and breaks the grid: posters, trending books. |

Card widths per row and spacing: see TV layout (20 dp spacing, 844 / 412 / 268 / 196 / 124 dp).

### Featured carousel

- Highlights curated or personalized content, usually on the home page. Variants: immersive (full background) and card.
- Content block: overline, title, description, button. Pagination: background, active, inactive and total elements.
- Background: cinematic scrim, poster, background color. High-resolution, relevant images; no images containing text; always scrim so title, description and CTA stay readable.

### Immersive list

- A content row plus a large preview of the focused item; preview updates as focus moves (progressive disclosure).
- Focused card scales 1.1x with border and elevation cues; titles inside thumbnails stay legible.
- When the list gains focus its height grows to reveal background title and description.
- Backgrounds: 16:9, high quality, subject scaled and aligned top right for a cinematic look; avoid full-screen crops that hide the subject under content.
- Use for promoted content: new releases, top 10, exclusives.

### Lists

- One-line, two-line, three-line variants. Anatomy: icon, overline, title, subtitle, control.
- List items are not buttons: no container by default (add only if necessary), default unselected and unfocused.
- Controls (leading or trailing): checkbox (multi), radio (single), switch (toggle).
- Show selection with an icon indicator, never background color alone. No buttons inside list items (focus confusion).
- Omit icons when all items are the same content type; never repeat the same icon on every item. Circular crops for people or entities.

### Navigation drawer

- Unlike mobile, the TV drawer shows both collapsed (rail of icons) and expanded states. A collapsed rail is required for both variants.

| Variant | Behavior |
|---|---|
| Standard (`NavigationDrawer`) | Expanding pushes page content aside; moving between items updates the page immediately. |
| Modal (`ModalNavigationDrawer`) | Overlays content with a gradient or solid scrim; page updates on selection. |

- Anatomy: top section (logo; profile switch or search; icon only when collapsed), navigation items (icon plus text), rail of 3 to 7 destinations, bottom section with 1 to 3 actions (settings, help, profile).
- Order destinations by importance, group related ones; list only five to six primary destinations (avoid vertical scroll).
- Clear active indicator (distinct background shape). Dividers and badges sparingly.
- Labels short; truncate with ellipsis if unavoidable, never wrap. Always use icons, and never mix icon and non-icon items.

### Tabs

- Horizontal, scrollable, unlimited count; peers of equal importance.
- Pill indicator for page-level destinations; bar indicator within a content area for sub-sections.
- Anatomy: optional icon, label, active indicator, container. States: default, focused, selected.
- Content slides left or right with tab movement.

---

## TV typography

Source: https://developer.android.com/design/ui/tv/guides/styles/typography

- Default typeface Roboto; use it for utilitarian, non-branded UI. A distinctive brand font is fine where relevant.
- Prefer larger type for comfortable viewing at distance.
- Font choice: large counters and suitable optical size, distinguishable letters, adequate stroke width (thin strokes are hard to read at a glance), sans-serif for body and labels when pairing fonts, no decorative fonts that cannot work as body text. Personable fonts suit larger sizes.
- Type scale: 15 styles (M3 baseline).

| Role | Use |
|---|---|
| Display (L, M, S) | Main screen heading, short important text, numerals. Never for section or cluster headings. Consider an expressive font with optical size. |
| Headline | Short high-emphasis text; headings in featured carousels and immersive clusters. |
| Title | Medium-emphasis text; cards and lists, secondary regions. |
| Body | Longer passages; readable fonts, nothing decorative. |
| Label | Text in components and captions. Buttons use Label Large. |

---

## TV color

Source: https://developer.android.com/design/ui/tv/guides/foundations/color-on-tv
Source: https://developer.android.com/design/ui/tv/guides/styles/color-system

### Display realities

- Most TVs support sRGB; Standard picture mode is the most common setting. Design and test in sRGB and Standard mode.
- DCI-P3 content is more vivid but only advanced displays show it fully.
- Picture modes (Vivid, Dynamic, Game, Movie, Sports, Custom) shift saturation, contrast and brightness away from Standard.
- Display tech (LCD, LED, QLED, OLED) changes gamut and contrast (about 562:1 up to effectively infinite), so colors can look washed out on low-contrast panels.
- Test on as many devices and color settings as practical, in different lighting.

### Rules

- High contrast between text and background; larger readable fonts and spacing; never color alone for meaning; optimize for SDR and HDR.
- Accessibility first (young, elderly, low vision); color with purpose; a contrasting foundation.
- Darker colors save power; avoid white backgrounds unless necessary.
- Banding: use 10-bit or higher gradients, avoid sharp transitions, dither, or prefer solid colors and subtle patterns.

### Color system

- Material color guidelines optimized for TV. Build from dark themes for a cinematic feel; create themes with Material Theme Builder (generates matching dark and light schemes).
- Five key colors, each a tonal palette of 13+ tones, mapped to roles: primary (prominent buttons, active states, elevated surface tint), secondary (filter chips, less prominent components), tertiary (contrasting accents, at the maker's discretion), surfaces (neutral backgrounds, high-emphasis text and icons), outlines.
- No user dynamic color: Android TV has no wallpaper, so it broadcasts only base palettes. Use content-based schemes instead: extract a seed from posters, album art or hero images with Material Color Utilities and generate a scheme.

---

## TV app icon and banner

Source: https://developer.android.com/design/ui/tv/guides/system/tv-app-icon-guidelines
Source: https://developer.android.com/docs/quality-guidelines/tv-app-quality

- Both `android:icon` (1:1) and `android:banner` (16:9) are mandatory. `android:roundIcon` is deprecated; use adaptive icons. TV does not support themed (monochrome) icons.
- Quality: 320 x 180 px banner and at least 160 x 160 px (xhdpi) icon (TV-LB); the banner contains the app name (TV-BN).

| Density | Banner min | Launcher icon min | Ratio |
|---|---|---|---|
| mdpi | 160 x 90 px | 80 x 80 px | 1 |
| hdpi | 240 x 135 px | 120 x 120 px | 1.5 |
| xhdpi | 320 x 180 px | 160 x 160 px | 2 |
| xxhdpi | 480 x 270 px | 240 x 240 px | 3 |
| xxxhdpi | 640 x 360 px | 320 x 320 px | 4 |

- API 25 or lower: xhdpi 320 x 180 px banner resource.
- Banner text is part of the image; provide localized banners per supported language. Show the full logo (icon plus wordmark).
- Adaptive icon: foreground and background layers; keep the logo inside the 72 x 72 safe zone. Adaptive banners also have two layers.
- Don't: extra text or graphics conveying additional info, misleading elements, logos spilling outside the safe area, borders (they get cropped), cropped logos.
- Launcher icon appears in Settings, Now Playing cards, and the Your apps row on Google TV. Use the official Figma template.

---

## TV app quality tiers (design-relevant)

Source: https://developer.android.com/docs/quality-guidelines/tv-app-quality

| Tier | Name | Highlights |
|---|---|---|
| 3 | TV Ready (submission minimum) | Icon and banner with app name (TV-LB, TV-BN); landscape, full-screen, opaque (TV-LO, TV-TR); nothing cut off (TV-OV); D-pad navigable, no Menu button, back leads home (TV-DP, TV-DM, TV-DB); ads dismissable by D-pad, kept in context or via QR codes (TV-AD, TV-AN); center button pauses and resumes (TV-PC); PiP only on explicit user action, no controls or ads in it; 64-bit plus 16 KB pages from August 1, 2026. |
| 2 | TV Optimized | Baseline Profiles; 4K assets (TV-4K); Cast Connect; phone or Google Account sign-in and token persistence; voice search and MediaSession voice commands; full controller support for games. |
| 1 | TV Differentiated | Engage SDK continue watching and recommendations; picture profiles, audio output switching, frame-rate matching; pointer and touch with hover states (TV-TO); spatial audio; enhanced accessibility: audio description, subtitle styles, high-contrast UI, simplified navigation, playback speed (TV-AX); AppFunctions or in-app AI. |

May 2026: tiers 1 and 2 added; in-app search requirement (TV-SB) removed in favor of Engage SDK.

---

## TV samples: Jet Stream and Jet Fit

Source: https://developer.android.com/design/ui/tv/samples/overview
Source: https://developer.android.com/design/ui/tv/samples/jet-stream
Source: https://developer.android.com/design/ui/tv/samples/jet-fit

### Jet Stream (streaming, Figma plus Compose on GitHub)

| Area | Pattern |
|---|---|
| Theme | Color from the M3 theme generator; Inter typeface; subtle corner radius on cards and buttons; focus is a 3 dp outline. |
| Home | Card-style featured carousel; content rows of 2:3 standard cards in a 5-column layout; immersive list for highlights (top 10). |
| Categories | Genre grid; category details as a 2:3 card grid with header. |
| Movies / Shows | 16:9 featured cards on top, content grid below. |
| Library | Favorites with filter chips at top. |
| Search | Search bar with suggestions from recent searches; focusing the bar opens the keyboard and results update live. |
| Details | Cinematic view, brief synopsis, prominent watch CTA; cast and crew as classic cards with 2:3 images; ratings as a custom wide classic card. |
| Playback | Standard video player; closed-caption popover. |
| Settings | Two-column list plus card grid; dialogs on a contrasting background with left-aligned buttons; list rows with switches or labels; history with "clear all". |

### Jet Fit (fitness, Figma; IBM Plex Sans)

Screen set to borrow from: home (plus navigation and subscription variants), browse workouts with filters and sort, entity details with tabs, library, video and audio players, settings (units, language, subtitles).
