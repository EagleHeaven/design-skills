# Android & Material 3: Foundations

Distilled from m3.material.io (Foundations, M3 Expressive and I/O 2026 pages) and developer.android.com mobile design foundations (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

## Contents

1. [Material 3 Expressive overview](#material-3-expressive-overview)
2. [What's new at I/O 2026](#whats-new-at-io-2026)
3. [Material Android is Compose-first](#material-android-is-compose-first)
4. [Motion physics theming in Compose](#motion-physics-theming-in-compose)
5. [Accessibility principles and assistive technology](#accessibility-principles-and-assistive-technology)
6. [Designing accessibly: contrast, structure, flow, elements](#designing-accessibly-contrast-structure-flow-elements)
7. [Android accessibility (developer.android.com)](#android-accessibility-developerandroidcom)
8. [Building for all](#building-for-all)
9. [Usability](#usability)
10. [Layout overview](#layout-overview)
11. [Breakpoints](#breakpoints)
12. [Scaffold: bars, rails, panes](#scaffold-bars-rails-panes)
13. [Canonical layout examples](#canonical-layout-examples)
14. [Grids, spacing and density](#grids-spacing-and-density)
15. [Bidirectionality and RTL](#bidirectionality-and-rtl)
16. [Android system bars](#android-system-bars)
17. [Interaction states](#interaction-states)
18. [Gestures](#gestures)
19. [Inputs](#inputs)
20. [Selection](#selection)
21. [Content design and style guide](#content-design-and-style-guide)
22. [Global writing](#global-writing)
23. [Alt text](#alt-text)
24. [Notifications copy](#notifications-copy)
25. [Writing and text: truncation and resizing](#writing-and-text-truncation-and-resizing)
26. [Design tokens](#design-tokens)
27. [Customization](#customization)
28. [Design for desktop](#design-for-desktop)
29. [Glossary](#glossary)

---

## Material 3 Expressive overview

Source: https://m3.material.io/building-with-m3-expressive

Foundations hub: https://m3.material.io/foundations (accessibility standards plus the essential layout and interaction patterns).

### What it is
- M3 Expressive (announced May 2025, Google I/O 2025) is an evolution of Material 3: new features, updated components and design tactics for emotionally impactful UX. It is explicitly not a new version: M3 is not deprecated and there is no "M4".
- Backed by 46 research studies with 18,000+ participants. Findings: expressive designs are preferred across all ages, score higher on playfulness, energy, creativity and friendliness, make users more likely to switch products, and let participants spot key UI elements up to 4x faster.

### Expressive components (14 new or updated)

| Status | Components |
|---|---|
| New | Button groups, FAB menu, Loading indicator, Split button, Toolbars |
| Updated | App bars, Common buttons, Extended FAB, FABs, Icon buttons, Navigation bar, Navigation rail, Progress indicators, Sliders |

Updates add more configuration, shape options, emphasized text and other expressive styling.

### Expressive styles
- **Motion physics**: spring-based system. Spatial springs mirror real object movement (position, size, shape); effects springs handle color and opacity transitions.
- **Emphasized typography**: new type styles for variable and static fonts that reinforce hierarchy and draw attention to important actions ("begin recording") or information (unread messages).
- **Shape library**: 35 shapes for decorative detail (image crops, avatars), with built-in shape-morph animation between any two shapes (for example square to circle).
- **Vibrant color schemes**: wider color range to sharpen hierarchy and clarify key actions; supports personalization and dynamic color.

### Expressive tactics (each is one axis of expressiveness)
1. **Vary shapes**: mix classic and abstract shapes, round and square corner radii, to create tension or cohesion and direct focus.
2. **Rich, nuanced color**: mix primary, secondary and tertiary roles on key components; use surface tones for hierarchy.
3. **Guide attention with typography**: emphasized styles, heavier weights, larger sizes, color and spacing for headlines and actions; create editorial moments.
4. **Contain content for emphasis**: group into containers; give the most important content ample space and the brightest surface.
5. **Fluid, natural motion**: shape morph, surface effects, expressive springs, micro-animations.
6. **Component flexibility**: shift components to the context (environment, foldables, large screens, canonical layouts).
7. **Hero moments**: combine tactics for a brief, surprising, editorial moment on the most critical interaction. Limit to 1 or 2 per product; more becomes overwhelming. Ask: is it emotionally impactful? Is it a key interaction?

---

## What's new at I/O 2026

Source: https://m3.material.io/whats-new-at-io26

Announced at Google I/O 2026 (May 2026):
- **Expressive layout system**: new layout scaffold (bars, rails, panes) for mobile, desktop and spatial; updated layout overview, scaffold, grids and spacing, breakpoints, RTL and canonical examples pages.
- **New spacing system**: built on an 8dp scale, incorporated into Material components; adapts components and layouts to device type and density settings.
- **New form-factor guidance** for watches and XR.
- **Expressive lists and menus**: vibrant styles and flexible configurations, on Android.
- **Expressive search and search app bar**: new visual style, motion, more flexible trailing icons; available in Jetpack Compose.
- **Material Android is Compose-first** (see next section).
- Naming changes (May 2026): "window size classes" renamed **breakpoints**; "responsive layout" renamed **adaptive design**.
- Related: Jetpack Compose Glimmer is the design system for display AI glasses.

---

## Material Android is Compose-first

Source: https://m3.material.io/material-is-compose-first

- Material Android is "all-in" on Jetpack Compose, aligned with Android's official Compose-first announcement (May 2026).
- **Material Views 1.14.0 (MDC-Android) is the final stable Views release.** It brings M3 Expressive to Views: expressive themes, expressive list component, emphasized type scale, expressive styles for 11 existing components (buttons, sliders, progress indicators and more). The Views library is now in **maintenance mode**: critical bug fixes only, no new features.
- **Compose Material 3 1.5.0** (later in 2026) promotes the experimental M3 Expressive APIs to stable. Expressive APIs are an opt-in "expansion pack" to M3 (components, motion system and more).
- **Styles API** (Compose Styles) integration is ongoing: easier component customization, better performance because style updates skip the composition phase.
- **Material Adaptive library is integrated with Navigation3**: navigation understands screen intent through metadata and handles multi-pane adaptation for foldables, tablets and desktop.
- Figma Design Kit and guidelines track what is available in Material Compose.
- Migration: move screen by screen from Views to Compose; Google ships a migration Android skill (github.com/android/skills) usable from Android Studio, Android CLI or other AI tools.

---

## Motion physics theming in Compose

Source: https://m3.material.io/m3-expressive-motion-theming

- Old Material motion used fixed easing and duration values; M3 Expressive introduces a customizable **motion scheme** built on springs (damping and stiffness instead of time).
- First shipped in `androidx.compose.material3:material3:1.4.0-alpha` builds; Expressive APIs moved to 1.5.0-alpha when 1.4.0 went stable and become stable in 1.5.0. Updating the dependency alone applies the standard scheme to all Material components.

### Schemes
| Scheme | Feel | Use |
|---|---|---|
| Expressive | Bouncier, recommended | Most situations, especially hero moments and key interactions |
| Standard | Small amount of bounce, functional | Utilitarian products |

- Pick once at theme level: `MaterialExpressiveTheme(motionScheme = MotionScheme.expressive())` or `MotionScheme.standard()`. `MaterialExpressiveTheme` defaults to expressive. Most motion in a product should use one scheme; swap only to emphasize key moments.

### Spec types and speeds
| | Spatial (position, orientation, size, shape; overshoots then settles) | Effects (color, opacity; no overshoot) |
|---|---|---|
| Default | Partial-screen motion: bottom sheets, expanding navigation rail | Opacity of content inside a navigation rail |
| Fast | Small components: switches, buttons | Switch handle color change |
| Slow | Full-screen transitions | Full-screen content refresh |

- Speed tokens are relative to device: "fast" is always faster than "default", but exact values differ on watch, phone, tablet.
- Springs can be interrupted and retargeted using current velocity (smoother than tween) and adapt to screen size.
- Custom scheme: implement `MotionScheme` overriding `defaultSpatialSpec`, `fastSpatialSpec`, `slowSpatialSpec`, `defaultEffectsSpec`, `fastEffectsSpec`, `slowEffectsSpec` (example "playful" scheme: spatial `spring(dampingRatio = 0.6f, stiffness = 300f/700f/1400f)`, effects `DampingRatioNoBouncy` with stiffness 800/1600/3800). Annotated `@ExperimentalMaterial3ExpressiveApi`.
- Custom components: replace `tween()` with `MaterialTheme.motionScheme.defaultSpatialSpec<T>()` for scale/position and `defaultEffectsSpec<T>()` for color so they follow the theme's scheme.

---

## Accessibility principles and assistive technology

Source: https://m3.material.io/foundations/overview

- **Accessibility by default** is a core Material value. Components ship with accessibility built in. Design for low vision, blindness, hearing, cognitive and motor impairments, and situational disabilities (a broken arm).
- Principles:
  - **Honor individuals**: universal defaults rarely fit everyone; offer customization so people can adapt as their needs change.
  - **Learn before, not after**: research with people of diverse abilities before defining solutions.
  - **Requirements as a starting point**: WCAG minimums are a floor; constraints historically produced broadly useful features (dark mode, text-to-speech, speech-to-text).
- Assistive technologies to design for:

| Technology | What it does |
|---|---|
| Keyboard, D-pad, trackball | Linear movement from selection to selection |
| Screen reader (TalkBack on Android, or braille display) | Reads visible text plus hidden content (alt text, headings, labels) |
| Switch input / Switch Access | Scans items one at a time until the user selects; one or more switches replace touch |
| Also | Magnifiers, voice input, tracking input |

---

## Designing accessibly: contrast, structure, flow, elements

Source: https://m3.material.io/foundations/designing

Goal: translate a visual UI into a linear, text-based experience that maps to code. Use standard platform controls (and semantic HTML on web) to get assistive-technology support for free.

### Color and contrast
| Element | Minimum contrast |
|---|---|
| Small text | 4.5:1 against background |
| Large text (14 pt bold / 18 pt regular and up) and graphics | 3:1 |
| Non-text elements like button containers in a cluster | 3:1 container vs background |
| Disabled states | Exempt |

- Clustered elements (a group of buttons) need 3:1 against the background so each is distinguishable. Standalone prominent elements (a FAB) do not benefit from the 3:1 container rule.
- Prefer a dialog for confirming a destructive action (discard event) over a banner.

### Structure and hierarchy
- Simplify with clearly visible elements, sufficient contrast and size, a clear hierarchy, and key info readable at a glance.
- Put important actions at the top or bottom of the screen; place related items of similar hierarchy next to each other.
- Screen readers follow code order, so designers and developers must agree on reading order.
- Web only: define landmarks (navigation, search, main, banner, complementary, contentinfo, region, form). Only one main, one banner, one contentinfo. Label repeated landmarks and all regions; don't repeat the role name in the label.
- Headings: based on content hierarchy (not visual style), sequential H1 to H6 without skipping levels, ideally a single H1.

### Target sizes
| Target | Minimum |
|---|---|
| Touch target | 48 x 48dp (about 9 mm physical; recommended range 7 to 10 mm) |
| Pointer target (mouse, stylus) | 44 x 44dp |
| Spacing between targets | 8dp or more |
| iOS equivalent (for reference) | 44 x 44pt |

- A 24dp icon gets padding to reach the 48dp target. Consider larger targets for a wider range of users.

### Flow: focus order and key traversal
- All goals must be achievable with Tab, arrow keys and common navigation keys.
- Use default focus order (follows code order, left to right, top to bottom) unless a journey needs tailoring.
- Steps: group use cases into primary and secondary journeys; define initial focus per screen and per complex component (card, dialog); define any atypical key traversal.
- Dialogs: focus moves into the dialog (often to a field or main button); on close, focus returns to the triggering element.
- Keys: Tab moves between interactive elements, Shift+Tab reverses, arrows move within components, Enter activates or submits.

### Keyboard shortcuts
- Default to 2+ key combinations. Document all custom shortcuts (help page or list).
- If a shortcut uses a single key, offer (in order of preference): remap to include a non-printable key; activate only when the relevant component has focus; let users turn it off (temporary fallback only).

### Labeling elements
| Needs a label | No label needed |
|---|---|
| Icon-only or ambiguous interactive buttons (pencil edit) | Non-interactive UI text (read automatically) |
| Interactive images | Buttons with sufficient text ("Download image") |
| Visual cues: progress bars, errors | Decorative images (mark decorative to hide) |
| Meaningful icons (status) and images (diagrams, photos, illustrations) | |
| Generic links ("Learn more") and duplicate generic buttons ("Save") | |

- Labels describe purpose, concisely: a mic icon is "Voice search", not "Microphone".
- Never put the role in the label ("Got it button"): the role is announced automatically.
- Assign roles: ARIA roles on web; component type (button, slider, menu) on mobile. Elements that look alike but behave differently need different roles.

---

## Android accessibility (developer.android.com)

Source: https://developer.android.com/design/ui/mobile/guides/foundations/accessibility

About 15% of people (1 in 6) experience a significant or temporary disability (WHO / World Bank, 2011).

### Vision
- Specify text in **sp** so it follows the user's font size setting.
- Body text never smaller than **12sp** (matches the Material type scale default).
- Text vs background contrast at least **4.5:1**; surfaces vs non-text elements (icons) at least **3:1**.
- Give actions like links more than one visual affordance (color plus underline, for example).
- Use Material's tonal-palette color system, accessible by default.

### Screen readers (TalkBack)
- Test with TalkBack and the Accessibility Scanner.
- Describe UI in code: Compose `semantics` properties; provide text descriptions for icons and images (framework requirement); set decorative items' description to null.
- Group related elements so users can skip between blocks of content and actions.

### Voice and motor
- Voice Access lets users open apps, navigate and edit text by voice.
- Switch Access: test by exploring with switches.
- Never make a gesture the only way to complete an action; add custom accessibility actions (for example a trash icon button in addition to swipe-to-delete).
- All touch targets at least **48dp**, even when larger than the visual element.
- Consider haptic feedback as an extra real-time cue.

---

## Building for all

Source: https://m3.material.io/foundations/building-for-all

- Teams can't represent all users; partner with communities, organizations, experts and researchers.
- Dimensions of experience to consider in research, testing and marketing: age, culture, disability, education and literacy, ethnicity, gender, geography and global relevance, physical attributes, race, religion, sexual orientation, socioeconomic status, technology proficiency.
- **Co-design**: involve the people who use the product in creating it, early and continuously, especially overlooked communities. Let their feedback shape priorities, functionality and messaging.
- Ask: who else benefits? What are the risks of excluding overlooked groups? If the product uses ML/AI, how will you mitigate bias?

---

## Usability

Source: https://m3.material.io/foundations/usability

Usability = intuitive and easy for everyone (accessibility = perceivable, operable, understandable, robust for people with disabilities and assistive tech).

| Aspect (Nielsen Norman) | Meaning |
|---|---|
| Efficiency | Tasks completed efficiently |
| Errors | Design prevents mistakes; easy recovery |
| Learnability | First-time users succeed |
| Memorability | Returning users remember how |
| Satisfaction | Pleasant experience |

### Tactics (use in combination, not all at once)
- **Color and contrast**: contrasting roles (for example purple and green) over similar hues; dynamic color roles give accessible contrast automatically.
- **Containment and grouping**: subtle containers, spacing and headings break content into sections.
- **Motion**: emphasize key moments only; use sparingly.
- **Shape and shape morph**: 35 library shapes add emphasis, guide focus, differentiate containers and buttons, signal interaction, set tone. Shape morph communicates states (selected, tap, swipe, scroll, release, long press) and actions in progress.
- **Size**: the primary CTA should be the largest element; larger key actions reduce errors and improve efficiency and learnability.
- **Typography**: largest legible text can signal the primary action; smaller text for secondary; same style groups similar content.

### Design from primary goals
- Strongest emphasis on primary goals; secondary and tertiary goals stay discoverable but quieter.
- One primary task per page, empty space to focus attention, large reachable buttons for frequent actions, harmonious layout.
- Don't stack too many expressive tactics: it distracts.
- Test and iterate early and often with diverse users.

### Example takeaways (Aura breathing app)
- Primary CTA: extra large button, high-contrast primary color, placed low for thumb reach, generous spacing from secondary items.
- Hero moment: animated library shapes ("flower", "sunny") driven by Material spring motion tokens; hide the navigation bar during the focused task; pause/stop buttons smaller and at the bottom.
- Secondary screens use fewer tactics to reduce cognitive load.
- Do: one clear focal point, consistent color roles for actions vs data, uniform shapes with space between them, motion limited to the hero element. Caution: many equally prominent elements, overlapping containers, everything moving together.

---

## Layout overview

Source: https://m3.material.io/foundations/layout/layout-overview

- Layout organizes elements, signals hierarchy and draws attention to key actions. Applies to Android and web.
- Adapt across 5 breakpoints (compact, medium, expanded, large, extra-large); start from a canonical layout; support LTR and RTL.
- **May 2026 changes**: layout scaffold introduced; adaptive guidance for mobile, desktop and spatial; updated canonical examples; new spacing system; window size classes renamed breakpoints; responsive layout renamed adaptive design.
- Implementation: Compose canonical layouts, Compose Rulers, Compose Navigation3, MDC-Android canonical layouts; M3 Design Kit and spacing tokens in Figma.

### Layout terms
| Term | Meaning |
|---|---|
| Adaptive design | Interface responds to preferences, device type, state and breakpoints |
| Bars | Frame the page; hold app bar and bottom navigation bar |
| Rails | Perimeter space around panes for navigation rail, toolbars, pane controls |
| Pane | Layout container within one app: fixed, flexible, floating or semi-permanent |
| Column | Vertical block of content within a pane |
| Breakpoints | Opinionated window widths where layout changes |
| Drag handle | Component that resizes panes |
| Fold | Flexible area or hinge between displays on foldables |
| Spacer | Space between two panes (on foldables, across the fold) |
| Gap | Space between elements inside a container |
| Margin | Space between screen edge and content |
| Rulers | Global alignment lines |
| Safety region | Area reserved for system UI (status bar, gesture bar) |
| Scaffold | Standard structure assembling key screen components |
| Multi-window mode | Several apps share the screen |

### Parts of layout
- **Windows** frame an app; on desktop they resize and move freely.
- **Grid**: groups info in columns, applies spacing consistently, creates focal points, aligns bars, rails and panes.
- **Panes**: all content lives in a pane; 1 to 3 panes per layout, adapting to breakpoint and language direction (navigation goes on the right in RTL).
- **Containment**: implicit grouping (panes blend with the background) vs explicit grouping (distinct colors or outlines). In spatial environments panes need a container color to separate from passthrough.
- **Drag handles**: adjust flexible pane widths, or fully collapse/expand fixed panes to switch between 1 and 2 panes.

### Adaptive design
- Responsive scales one layout; adaptive customizes the experience per context: people (preferences), devices (watch, phone, foldable, tablet, desktop, XR), usage (resizing, rotation, device switching).
- Three experience types: **mobile** (phones, foldables, tablets; full-screen, split-screen, bubbles), **desktop** (free-form windows, tablets with keyboard and mouse, phones on external monitors), **spatial** (XR, multiple free-form windows, full space). Start with mobile, scale up to spatial.
- Design for all inputs (touch, pointer, physical keyboard) on every device.
- Pane adaptive strategies: **show and hide**, **levitate**, **reflow**. Navigation3 in Compose lets multiple destinations show at once.
- Component adaptation strategies: **resizing** (scale with container or hug content), **showing and hiding** (reveal descriptions as space grows), **presentation changes** (orientation, color, type, shape, configuration: FAB becomes extended FAB, rail auto-expands).

---

## Breakpoints

Source: https://m3.material.io/foundations/layout/breakpoints

Design for breakpoints, not devices: window space changes with multi-window and folding, and the same device lands in different breakpoints by orientation.

| Breakpoint | Width | Common devices | Margins | Spacer between panes |
|---|---|---|---|---|
| Compact | < 600dp | Phone portrait | 16dp | n/a (1 pane) |
| Medium | 600 to 839dp | Tablet portrait, unfolded foldable portrait | 24dp | 24dp |
| Expanded | 840 to 1199dp | Phone landscape, tablet landscape, unfolded foldable landscape, desktop | 24dp | 24dp |
| Large | 1200 to 1599dp | Desktop | 24dp | 24dp |
| Extra-large | 1600dp+ | Desktop, ultra-wide monitors | 24dp | 24dp |

- Height breakpoints (compact, medium, expanded) also exist on Android; rarely needed because most content scrolls vertically.
- Large and extra-large mainly serve laptop/desktop and web; some products can skip them.

### Recommended components per breakpoint
| Breakpoint | Panes | Navigation | Communication | Action |
|---|---|---|---|---|
| Compact | 1 | Navigation bar or modal expanded navigation rail | Simple or full-screen dialog | Bottom sheet |
| Medium | 1 (recommended) or 2 | Navigation bar or modal expanded rail | Simple dialog | Menu |
| Expanded | 1 or 2 (recommended) | Modal or standard expanded rail (or collapsed rail) | Simple dialog | Menu |
| Large | 1 or 2 (recommended) | Modal or standard expanded rail | Simple dialog | Menu |
| Extra-large | 1 to 3 (2 recommended) | Modal or standard expanded rail | Simple dialog | Menu |

### Five questions when moving to the next breakpoint
1. **Reveal**: show what was hidden (rail open by default when expanded; inbox plus conversation side by side). More space is not just bigger.
2. **Divide**: compact and medium = 1 pane; expanded and large = 2 panes; extra-large = consider 3. At medium, use 2 panes only for low-density content with clear actions. Keep a single pane for focused tasks (games, movies, video calls, creative apps).
3. **Resize**: cards, feeds, lists, panes grow; adjust margins and type to keep **40 to 60 characters per line** at every breakpoint.
4. **Reposition**: reflow, add a second column, move actions from bottom (compact) to leading edge (medium/expanded), add negative space, keep navigation reachable. Internal elements anchor left, right or center.
5. **Swap**: exchange functionally equivalent components (navigation bar to navigation rail; collapsed rail to expanded rail). Only swap for functional and ergonomic reasons. Don't swap a button for a chip or menu; be careful between list items and cards.

| Function | Compact | Medium | Expanded |
|---|---|---|---|
| Navigation | Navigation bar | Collapsed navigation rail | Collapsed navigation rail |
| Navigation (alt) | Modal expanded rail | Modal expanded rail | Standard expanded rail |
| Communication | Basic or full-screen dialog | Basic dialog | Basic dialog |
| Supplemental selection | Bottom sheet | Menu | Menu |

### Per-breakpoint rules
- **Compact**: navigation bar or modal expanded rail close to the screen edge; single pane; must transition when unfolding, rotating, leaving split-screen, resizing in multi-window or free-form.
- **Medium**: single-pane layouts use a navigation rail; two-pane layouts use a navigation bar so panes get full width. Two panes = 50% each; avoid custom widths; a drag handle can expand one to 100%. Rail can hide in secondary destinations if Back reaches the primary one.
  - Reachability on landscape tablets and unfolded foldables: the top 25% of the screen is likely out of reach; limit interactions there. Also avoid essential controls right at the bottom edge.
- **Expanded**: collapsed or expanded rail; tabs or in-pane components for sorting, filtering, secondary navigation. Two panes usually best; single pane fine for dense visual content like video. Fixed pane in fixed-and-flexible layout = **360dp** default. Split-pane centers the spacer.
- **Large / extra-large**: rail collapsed or expanded (expanded suits extra-large; collapse deeper in the hierarchy). Fixed pane = **412dp** default. Split-pane spacer stays visually centered even with an expanded rail. Extra-large allows a standard side sheet as third pane (max width 400dp); rail can stay, collapse or hide. Never more than 3 panes. Watch line length.

---

## Scaffold: bars, rails, panes

Source: https://m3.material.io/foundations/layout/scaffold

### Bars
- Frame the screen; hold an app bar (top: title plus 1 to 2 essential actions like search or back) or navigation bar (3 to 5 primary destinations at compact and medium).
- Can span one pane or the full window. Sit adjacent to the safety regions (system UI); safety regions must not hold primary content.

### Rails
- Perimeter space around panes, or floating above them.
- Compact: top and bottom rail regions hold toolbars, chat inputs, FABs and other screen-level primary controls.
- Larger screens add side rails: leading side usually holds the navigation rail; trailing side holds controls that act on pane content.
- In XR, rail components can become orbiters.

### Panes
| Breakpoint | Recommended panes | Also allowed |
|---|---|---|
| Compact | 1 | none |
| Medium | 1 | 2 |
| Expanded | 2 | 1 |
| Large | 2 | 1 |
| Extra-large | 2 | 1, 3 |

- **Fixed** panes keep their width; **flexible** panes grow and shrink. Every layout needs at least one flexible pane. Panes may be permanent or temporary.
- **Split-pane** (two flexible): spacer visually centered; best for foldables and dynamic layouts. A rail or drawer shrinks only one pane; the other stays at 50% of window width. With a navigation bar or no navigation, both are 50%.
- **Fixed-and-flexible**: common at expanded and above; either order. Fixed pane often temporary (side sheets, light lists).
- **Three panes**: extra-large only, third is a standard side sheet.

### Resizing
- Drag handles resize; in fixed-and-flexible they fully collapse/expand the fixed pane. Selecting the handle (tap, double tap or long press) should toggle layout sizes.
- Snap widths at expanded and above: **360dp**, **412dp**, or split with centered spacer.
- **Persistent resizing** (default for most): remembers the user's width, even across breakpoints (collapsed stays collapsed).
- **Temporary resizing**: resets to default when reopened; mainly supporting pane layouts.

### Displaying multiple panes
| Mode | Use |
|---|---|
| Co-planar | Side by side; persistent utilities like tool panels |
| Floating | Small pane above others; temporary tasks (dialogs) at any breakpoint |
| Docked | Pinned to a window edge (bottom sheet) |

### Adaptive strategies
- **Show and hide**: panes enter/exit as breakpoint or orientation changes.
- **Levitate**: floating or docked panes appear relative to their triggers. Floating is the default on large screens; scrim optional there; provide accessible controls for drag/resize. At medium and expanded, docked panes can become floating or co-planar; on large screens consider co-planar.
- **Reflow**: supporting pane moves below the primary in portrait; panes stack vertically when width runs out.
- XR spatial panels need clear explicit containment.

### Accessibility
- Co-planar and docked: focus order matches visual arrangement.
- Modal floating pane: blocks content behind; focus moves to its first element and returns to the trigger on close (if auto-triggered, return focus to the next logical element); dismisses when the user interacts behind it.
- Non-modal floating pane: rest of the app stays usable; focus can enter and leave; pane sits in logical reading order.

---

## Canonical layout examples

Source: https://m3.material.io/foundations/layout/canonical-examples

Three examples (feed, list-detail, supporting pane), each with compact, medium and expanded configurations, available in Compose and MDC-Android. Custom layouts build on these or layer scaffold elements (levitate for focused tasks: reviewing a basket, replying to comments, creating an event). All three mirror in RTL.

### Feed
- Grid of cards/lists for browsing and discovery (news, photos, social).
- Compact: vertical stack, items fill pane width. Medium: mixed widths, multiple columns. Expanded and up: column count usually increases.
- Items reflow on rotation, unfolding, multi-window; order follows position.

### List-detail
- Parent-child pairs: conversations + thread, files + folder, artist + album, settings + category, inbox + email.

| Breakpoint | Visible panes |
|---|---|
| Compact (0 to 599dp) | 1 (list or detail) |
| Medium (600 to 839dp) | 1 (recommended) or 2 |
| Expanded (840dp+) | 2 |
| Large (1200 to 1599dp) | 2 |
| Extra-large (1600dp+) | 2 |

- Medium: 1 pane for dense content or deep focus; 2 panes for fast switching, with a bottom navigation bar or modal rail to free width.
- Single pane: Back button only in detail view. Two panes: selected state shown in the list only; use implicit/explicit grouping to show focus.
- Transitions: no selection means list in 1 pane and placeholder detail in 2 panes. With a selection, going 1 to 2 panes shows both with details; going 2 to 1 usually shows detail plus app bar (or list with selection for multi-select). Be consistent: return to the view the user last saw. Persist state (read/unread) between details.

### Supporting pane
- Primary area (about two-thirds) plus secondary content meaningful only relative to the primary (productivity, document editing and comments, media browsing). Parent-child content uses list-detail instead.

| Placement | Width | Breakpoint |
|---|---|---|
| Below focus pane | Flexible | Compact, Medium |
| Leading or trailing | Fixed 360dp | Expanded |

- Compact: a bottom sheet keeps focus on the primary pane.

---

## Grids, spacing and density

Source: https://m3.material.io/foundations/layout/grids-spacing

### Grids (May 2026 guidance)
- Grid adapts across breakpoints: column count, width and spacing grow with size.
- Order of construction: place grid columns; place bars and rails nearest the usable edges (navigation bar/rail, toolbars, app bars); then panes.
- **Rulers** (Compose Rulers API): global alignment lines.
  - Bar and safety rulers reserve space for status bar and gesture navigation so actionable content is not covered.
  - Title ruler aligns screen titles, icons and app bar content.
  - Content rulers: the first anchors major blocks (hero image, headline); secondary rulers set where supplementary text/actions start.
  - Margin rulers can shift narrower or wider for tighter or looser feel; content can go full-bleed (photo grid) while components (search) keep wider margins.

### Spacing
- Spacing system on an 8dp scale; adapts to breakpoints and density settings. Dense feels serious and focused; spacious feels calm and open.
- **Explicit grouping**: outlines, dividers, shadows (also signals interactivity: list items between dividers, a card). **Implicit grouping**: proximity and open space (carousel items).
- Direct attention with rhythm (consistent spacing), similarity (same spacing/size for related items; always align leading thumbnails, avatars, icons), proximity (buttons near the content they affect), continuity (shared container, row or column).
- Expression: most important content gets generous spacing and the brightest surfaces; keep focal points consistent; use negative space for emphasis.

### Density
| Rule | Value |
|---|---|
| Minimum target, default | 48 x 48dp (48 x 48 CSS px on web) |
| Density scale | 0 = default; -1, -2, -3 = denser |
| Each density step | Typically minus 4dp of top/bottom padding or height |
| Text size when scaling density | Unchanged |

- Information density (layout margins, spacers, padding) is separate from component scaling (internal spacing).
- Dense layouts suit scanning/comparing (data tables, lists, long forms). Not every layout needs density; some people don't benefit.
- Density is **opt-in**: never apply component scaling by default if it pushes targets below 48dp; density controls themselves use default 48dp targets. Don't auto-change density across breakpoints or orientation.
- Center grouped elements within the scaled container. Don't densify menus to 38dp items or single-line snackbars. Caution at 40dp targets.

### Pixel density and dp
- 1dp = 1 physical pixel at 160 dpi. `dp = px * 160 / density`. Pixel density = pixels / inches.

| Physical width | Density | Pixels | dp |
|---|---|---|---|
| 1.5 in | 120 | 180 px | 240dp |
| 1.5 in | 160 | 240 px | 240dp |
| 1.5 in | 240 | 360 px | 240dp |

---

## Bidirectionality and RTL

Source: https://m3.material.io/foundations/layout/bidirectionality-rtl

- 2+ billion people use RTL languages (Arabic, Hebrew, Farsi, Urdu). Material components use "leading/trailing" naming and support RTL, but some cases need extra configuration.
- **Mirroring**: elements on the left in LTR move right; reading starts top right. Not everything mirrors: charts and graphs stay LTR for Persian and Urdu.
- **Text rendering** = alignment (edge placement) plus directionality (flow). Watch text entry, cursor position, punctuation, phone numbers, URLs, email addresses.

### What mirrors
| Element | RTL behavior |
|---|---|
| Directional icons (back, forward, arrows) | Mirror |
| Linear progress indicators | Right to left, except Hebrew (stays LTR) |
| Timelines and media controls in Hebrew | Stay LTR |
| Media player controls | Always LTR |
| Clocks, circular refresh icons, clockwise progress arrows | Never mirror; clocks turn clockwise |
| 12h clock AM/PM | Placed to the left |
| Circular time representations | Unchanged |
| List-detail, feed, supporting pane layouts | Mirror |
| Badges | Change position and alignment |
| Toolbars | Mirror tool order |
| App bars | Mirror layout; flip directional icons |
| Navigation rail, expanded rail | On leading edge (right in RTL) |
| Text field and chip leading/trailing icons | Swap sides; chip trailing icon on the left in RTL |
| Swipe actions | Mirror (swipe-from-right delete becomes swipe-from-left) |
| Predictive back | Mirrors LTR behavior |

- Icon meanings vary by culture; localize thoughtfully.

---

## Android system bars

Source: https://developer.android.com/design/ui/mobile/guides/foundations/system-bars

System bars = status bar, caption bar, navigation bar. Navigation and bars vary by manufacturer; older devices may have hardware buttons.

### Takeaways
- Account for safe zones, system gestures, input methods, display cutouts, status, caption and navigation bars across sizes and form factors.
- Go **edge-to-edge**: transparent or translucent bars with content drawn behind. Use `WindowInsets` so content and controls aren't obscured (a button under the navigation bar can't be tapped).
- Edge-to-edge is enforced when targeting **Android 15** (status bar transparent by default). Call `enableEdgeToEdge()` for backward compatibility. An "edge-to-edge" Android skill exists (`android skills add edge-to-edge`).
- Use canonical layouts for efficient space use.

### Status bar
- Holds notification and system icons; pulled down for the notification shade. Icons adapt to theme and context; your notification icon (app icon or channel symbol) appears there.
- Transparent: when UI doesn't sit beneath it, or an image draws beneath it (app bar color extends behind). Translucent: when content scrolls beneath it (gradient protection). Set icon style for contrast. Don't use opaque system bars.

### Navigation
- Controls: Back (previous view), Home (exit to home screen), Overview (recent apps). Support gesture navigation and button modes.
- **Gesture navigation**: edge swipes for back, swipe up for home, swipe up and hold for overview. Support edge-to-edge and **don't put touch targets under gesture insets**.
- After targeting Android 15 or calling `enableEdgeToEdge`, the system draws a transparent gesture bar with dynamic color adaptation (handle flips dark/light based on content). Always keep the gesture bar transparent; don't add a background.
- **Three-button mode**: system adds a translucent scrim; remove with `Window.setNavigationBarContrastEnforced(false)`. Use transparent when there's a bottom app bar or bottom navigation bar (pad it to draw beneath the system bar) or content doesn't scroll underneath; translucent for scrolling content.
- **Adaptive navigation**: switch navigation bar and rail by breakpoint; Compose adaptive navigation components keep system bars from interfering. Consider bar styling per window size and foldable posture.
- Keyboard: sync app motion with the IME using `WindowInsetsAnimationCompat`.

### Layouts, cutouts, immersive
- In large screens, foldables, multi-window and desktop windowing, use `WindowInsets` in adaptive layouts.
- Display cutouts vary by manufacturer: check content, orientation and edge-to-edge interplay.
- Immersive mode (movies, games) may hide system bars, but the user must be able to reveal them by tapping.

---

## Interaction states

Source: https://m3.material.io/foundations/interaction/states

- States: enabled, disabled, hover, focused, pressed, dragged (plus selected/activated, which can combine). Each state uses two visual indicators for accessibility. Apply consistently.

### State layers
- A semi-transparent overlay in the **content color** (the "on" color: icon color, or label color if no icon). Only one state layer at a time on an element; full element or circular shape.
  - Container `secondary container` with content `on secondary container` uses an `on secondary container` layer.
  - Container `surface` with `primary` content uses a `primary` layer.
- State layer size **40dp** inside a **48dp** target.
- Each state has a fixed opacity token. Values (Compose M3 token, StateTokens and component Disabled*Opacity tokens): hover 8%, focus 10%, pressed 10%, dragged 16%; disabled content 38%; disabled containers 10% to 12% (buttons and icon buttons 10%, tonal button, chips and outlines 12%) of on surface.

### Inheritance and behavior
| State | Emphasis | Inherited by | Not inherited by | Max at once |
|---|---|---|---|---|
| Disabled | Color change, reduced elevation; exempt from contrast | Buttons, cards, checkboxes, chips, list items, radios, switches, text fields | App bars, badges, dialogs, FABs, menus, nav bar/drawer/rail, sheets, tabs, tooltips | Any number |
| Hover | Lower emphasis overlay | Buttons, cards, checkbox, chips, date/time pickers, list items, slider, switch, text fields | App bars, badges, dialogs, menus, nav bar/drawer/rail, sheets, tabs | 1 |
| Focused | Higher emphasis overlay plus keyboard focus ring | Buttons, cards, checkbox, chips, pickers, list items, selection controls, text fields | App bars, badges, banner, dialogs, nav bar/drawer/rail, sheets | 1 |
| Pressed | High emphasis ripple; may add elevation (buttons, cards) | Buttons, cards, checkbox, chips, list items, text fields | App bars, badges, bottom navigation, dialogs, menus, sheets, tabs | 1 |
| Dragged | Low emphasis overlay; may add elevation (list items, chips, cards) | Cards, chips, list items, sliders | App bars, badges, buttons, dialogs, menus, nav bar/drawer/rail | 1 |

- Disabled components can't be focused, dragged or pressed and don't react to tap or hover. Don't show an unavailable action as a disabled FAB: hide it.
- Hover combines with focused, activated, selected, pressed. Focus combines with hover, activated, selected. Pressed combines with hovered, focused, activated, selected.
- Never apply hover/focus/pressed/dragged to a whole app bar.

---

## Gestures

Source: https://m3.material.io/foundations/interaction/gestures

UI should respond to gestures in real time.

| Gesture | Use |
|---|---|
| Tap | Navigate, interact |
| Double tap | Zoom in/out |
| Long press | Additional functionality |
| Scroll and pan | Move content in any direction |
| Swipe | Switch peer views (tabs), complete actions |
| Predictive back | Swipe left or right to preview and go back; user can cancel before completing |
| Drag | Move elements, slide surfaces in/out |
| Pick up and move | Long press plus drag to reorder |
| Pinch | Scale surfaces, navigate between screens |
| Compound | Fluid combinations (pan and pinch on a map) |

- Predictive back-compatible components: bottom sheet, navigation bar, navigation rail, search bar, side sheet.
- Always pair gestures with a visible alternative (see Android accessibility).

---

## Inputs

Source: https://m3.material.io/foundations/interaction/inputs

Support touch, keyboard, mouse, trackpad and stylus on every form factor (phones, tablets, foldables, TV, laptop, desktop).

| Input action | Expected behavior |
|---|---|
| Mouse/trackpad movement | Show a cursor |
| Primary click | Same feedback as touch (ripple), but handled distinctly from touch |
| Secondary click (or two-finger trackpad click) | Open a context menu |
| Hover | Change component state; show tooltips |
| Highlight | Select text with the cursor |
| Mouse wheel / two-finger drag | Scroll vertically and horizontally |
| Trackpad pinch | Zoom |
| Physical keyboard | Hide/show the on-screen keyboard |

- Devices that don't recognize mouse input treat it as touch.
- **Cursors**: pointer by default; hand on links and linked images; resize arrows on resizable edges; I-beam on text. Click places the caret, double click selects a word, triple click selects a paragraph. Stylus usually needs no cursor unless it conveys tool size/shape.
- **Text selection**: with mouse/trackpad/stylus, single-color highlight and no touch handles, plus I-beam and context menu even on touch devices. With touch, always show touch handles even if other inputs are connected. Touch-drag in a text area scrolls; mouse-drag selects.
- Horizontal scroll: mouse wheel or two-finger horizontal swipe.
- **Keyboard**: everything the virtual keyboard does, and more. Enter sends (for example messages); Space (or media keys) plays/pauses; Tab follows logical order (left to right, top to bottom) with a ring focus indicator; Escape dismisses, removes focus or clears selection.

---

## Selection

Source: https://m3.material.io/foundations/interaction/selection

- Shown with a check mark, a checkbox, a surface color change, or a combination. Whole component or parts can be selected, via tap, cursor, keyboard or voice.
- Selection inherited by: cards, checkboxes, chips, data tables, icon buttons, list items, menu items, pickers, radio buttons, segmented buttons, sliders, switch.
- Active indicator (one item at a time): navigation bar, navigation drawer, navigation rail, tabs.
- **Touch**: long press (or two-finger touch, or a shortcut like tapping an avatar) enters selection mode; tap to add items; exit by deselecting all or using a toolbar action. Long press plus drag selects ranges, but don't use it where long press plus drag already moves items (cards).
- **Desktop click**: when selection is primary, checkboxes always visible. When secondary, reveal a checkbox on hover, and show all checkboxes once one item is selected.

---

## Content design and style guide

Source: https://m3.material.io/foundations/content-design/style-guide

Overview (https://m3.material.io/foundations/content-design/overview): UI text should be clear to anyone; follow AP Style unless noted. Recent updates include new guidance on first-person pronouns.

### UX writing best practices
- **Explain consequences** neutrally and directly; avoid alarming, intimidating or condescending warnings. Do: title "Move to trash?" with body "[Item] will be deleted after 30 days". Avoid "Are you sure...?".
- **Scannable**: specific titles and headings to prevent mistakes when skimming.
- **Sentence case** everywhere (titles, headings, labels, menus, navigation, app bars, buttons). Products and brand terms may keep capitals.
- **Abbreviations sparingly**: spell out; no "e.g." or "etc." (use "for example", "and more"). AM/PM fine; don't abbreviate days/months when space allows.

### Word choice
- Address the user as **"you/your"**: "Your mail isn't available. Try checking your Wi-Fi connection." over "Mail not available".
- Don't mix "my" and "your" in the same context.
- Be cautious with "we" and "I" from a large company; rewrite from the user's view. Exception: legal consent like "I agree to the terms of service".

### Grammar and punctuation (English)
| Rule | Detail |
|---|---|
| Periods | Omit on single sentences in labels, tooltips, bullets, dialog body, links; use on multiple or long sentences |
| Contractions | Use ("You can't edit"); "do not" only for extra emphasis in cautions |
| Serial comma | Yes, except before an ampersand; commas inside quotes |
| Numbers | Commas from 1,000; none in addresses, frequencies, years; "23M" style rounding for volume, exact for counts like 1,185 reviews |
| Colons | None in headings of lists; use for lists within body text |
| Exclamation points | Rarely: greetings, congratulations |
| Ellipses | Only for in-progress or truncated text; no space before; not on buttons or menu items that open dialogs or start processes |
| Parentheses | Define acronyms, jargon, sources; not for side notes |
| Ampersands | OK in headlines, table/column headers, navigation labels, buttons; spell out "and" in sentences, before the last list item and in email subjects |
| Em dash | Avoid in UX writing; use comma, period or new sentence |
| En dash | Ranges without spaces (9 AM–Noon) |
| Hyphens | No surrounding spaces; hyphenate compound adjectives (best-in-class) and verb+adverb nouns (sign-off, check-in), never verb phrases (check in to the room); negative numbers (-100) |
| Italics | Rarely; bold for emphasis; italics only for a single name or title |
| Caps blocks | Never (not accessible) |

---

## Global writing

Source: https://m3.material.io/foundations/content-design/global-writing

For all localized American English.
- **Global examples**: "the holidays" over "Christmas". When a local reference is needed, explain it in the message description so translators can substitute (locations, names, currencies, temperatures, date formats, internet/cable providers).
- **Short, simple sentences**, bullets, sections. Other languages average **1.5x longer** than English.
- **Avoid abbreviations** (common time abbreviations are OK).
- **Clarify pronouns**: repeat the noun ("Couldn't move photo") since strings are translated in isolation and nouns carry gender.
- Don't start a sentence with "this" or "that" unless the noun follows immediately.
- **Avoid idioms, colloquialisms and polite filler** ("Please", "Sorry", "Thank you"), especially in errors. "Please" is acceptable when asking for something inconvenient.
- **Reduce jargon**; be simple, even literal.
- **Disambiguate** words that are both noun and verb ("traffic", "filter", "change"); don't use both senses in one string; add context for translators.

---

## Alt text

Source: https://m3.material.io/foundations/content-design/alt-text

- Alt text is read by screen readers and shown when images fail to load.
- **Decorative test**: if removing the image loses no information, mark it decorative (null alt, `alt=""` on web; null content description on Android).
- Describe meaning and context, not every detail (in a shopping app, the product, not the surroundings).
- **Length**: recommended max **140 characters** (the Writing page cites up to 125); long text may be cut off.
- Never start with "image of" / "picture of" (screen readers already say "image").
- Use adjacent text (body, captions, headlines) for context; don't repeat the caption; keep vocabulary consistent with the caption.
- The same image can need different alt text in different contexts.
- Captions should help sighted and screen reader users alike, supporting rather than duplicating the image.
- Naming the image type helps sometimes: chart, infographic, map, graph, screenshot, headshot, diagram.
- **Charts**: formula "Summary of [data type] + [reason for showing the chart]". Editorial charts: state the takeaway and key supporting numbers. Analysis charts: describe structure, give 1 to 2 key insights if clear, link to the source data, avoid biased summaries. Prefer interactive charts with tooltips for complex data.
- **Motion**: informative GIFs/animations need alt text (think of the title you'd give it); long-form video uses video description instead.

---

## Notifications copy

Source: https://m3.material.io/foundations/content-design/notifications

Notifications must be about the user, precise, timely, actionable, contextual and relevant; easy to opt out of; never unsolicited ads.

| Element | Suggested limit |
|---|---|
| Title | < 29 characters |
| Collapsed body | < 40 characters |
| Expanded body | < 80 characters (extend the collapsed text) |
| Buttons | 1 to 2 buttons, 1 to 2 words each |
| SMS, Latin scripts | < 160 characters |
| SMS, non-Latin scripts | < 134 characters |

- Lead with the most important information (users skim in an F pattern; ends get truncated).
- Make the CTA concise, specific, actionable; mention the motivation when known.
- Target segments and personalize (location, behavior); broad notifications become irrelevant.
- Avoid dynamic text in titles (breaks limits after translation; truncated titles don't expand even in expandable notifications). If unavoidable, pair with at most one extra word and prepare a short fallback.
- SMS only for important or urgent messages; hide sensitive info; tell translators the limits.
- Emoji sparingly: they may not translate; face and hand emoji perform better than generic ones; enhance, never replace words; never use negative emoji on bad news.
- Usefulness over cuteness; humor can read as creepy.
- **Name days of the week**; avoid "today", "tomorrow", "tonight" (about 20% of users see notifications on a later day), unless the notification auto-dismisses at a set time.
- Don't trigger onboarding notifications or emails during onboarding.
- Don't repeat the app name: the notification chrome already shows it.
- Offer in-context opt-out and explain what the user gains or loses.

---

## Writing and text: truncation and resizing

Source: https://m3.material.io/foundations/writing

### Accessibility text
- Screen readers (TalkBack on Android, VoiceOver on iOS, JAWS on desktop) read visible text and hidden alternative text.
- Put key image information in adjacent text and captions. Text embedded in images is unreadable by screen readers: repeat essential info in alt text.
- Alt text: short (up to 125 characters per this page), no "image of", useful also when images fail to load.
- Essential text in informative images: 3:1 for large text, 4.5:1 for small text.

### Truncation
- Content must never be lost when text grows (larger type, spacing, longer translations, zoom). Exceptions possible for non-Latin scripts.
- Options: wrap critical text (taller containers); let components grow vertically or horizontally; truncate with ellipsis only if the full text is reachable via tooltip or link. An ellipsis with no way to see the full text is not accessible. Don't truncate selectable list labels; don't clip dialog body without a way to expand.

### Text resizing
- Support at least **200%** text increase.
- When text scales: text and line height multiply by the scale; padding and inter-element spacing stay at 1x; icons and non-text components (progress indicators, checkboxes, radios) don't scale.
- If the OS doesn't control resizing, offer in-app multipliers (1.5x, 2x): font size = default size (density 0) x scale.
- Methods: grow containers; reflow side-by-side items into stacks; enable scrolling (vertical only, never both directions); for space-limited components (top app bar, navigation bar, navigation rail, fixed top tabs) keep label at 1x and show enlarged text in a touch-and-hold tooltip.

---

## Design tokens

Source: https://m3.material.io/foundations/design-tokens

- Tokens name style values (color, font, measurement, or another token) by usage. Use tokens instead of hardcoded values; names stay stable when values change.
- Name anatomy: system prefix `md`, class (`ref`, `sys`, `comp`), then descriptive role, from general to specific. Examples: `md.ref.palette.secondary90` = `#E8DEF8`; `md.sys.color.secondary-container`; `md.comp.fab.primary.container.color`.

| Class | Prefix | Role |
|---|---|---|
| Reference | `ref` | All available options (palettes, sizes); static; context-free |
| System | `sys` | Theme decisions (color roles, type, elevation, shape); where theming happens; point to reference tokens |
| Component | `comp` (in development) | Element properties of a component (container, label, icon, state); point to system/reference tokens, no hex codes |

- **Contexts** tag alternate values: form factor, dark theme, dense layout, RTL. A dark-theme-tagged value overrides the default in dark context.
- Component spec tables group tokens by state, then by element, with columns Name, Token ID, Description, Context/value.
- Tokens help when building from scratch or redesigning, sharing styles across products/platforms, wanting easy future updates or dynamic color. Less helpful for stable hardcoded apps or products without a design system.
- Workflow: baseline tokens downloadable as a Design System Package (DSP) from github.com/material-foundation/material-tokens; Material Theme Builder Figma plugin generates tokens as Figma styles, swaps them into the Design Kit, and exports for Android Views and Jetpack Compose.

---

## Customization

Source: https://m3.material.io/foundations/customization

- Dynamic color merges brand colors with user preferences (wallpaper or preset colors). It is both a user setting and a developer choice; apply selectively (for example only on a profile screen).
- Build a custom color scheme with the M3 color system and a custom theme that user-generated schemes map to; this also gives a fallback for users without dynamic color.
- The system handles accessible contrast, legibility, interaction states and component structure automatically; dynamic color also works for custom components.
- Material Theme Builder: input one source color (optionally 2nd and 3rd) or a full brand palette; it generates color and type tokens, exportable as code and DSP.
- Five key color groups: primary, secondary, tertiary, neutral, neutral variant. Each input color yields a tonal palette filling roles like primary, on-primary, primary container.

---

## Design for desktop

Source: https://m3.material.io/foundations/desktop

Any Android app may run on desktop: Chromebook or Googlebook, tablet docked to a folio, phone on an external monitor. Avoid a stretched mobile app.

### Principles
- Adaptive from the start (modular hierarchy).
- More screen, more done: denser layouts; don't just scale up to fill space.
- Refine motion: faster for small elements over short distances; slow or simplify large, long-distance moves.
- Multitasking within the app, not only across apps.
- Fewer steps for tasks, balanced with clear layouts.
- All inputs equal: touch, pointer and keyboard.

### Layout
- Desktop windows usually open at medium or large and can grow to extra-large; quality bar is higher.
- Use multi-pane layouts at medium and above. If staying single-pane, cap and center content width.
- Start from canonical layouts: feed (long scrolling content), list-detail (chat, email), supporting pane (tools, extra info).

### Components
- Don't stretch buttons and text fields to full pane width; keep default widths and padding.
- Navigation bar becomes navigation rail at medium and up; consider an expanded rail by default at extra-large.
- Replace bottom sheets: context menus (for press-and-hold or overflow triggers), side sheets without scrim (complex tools), dialogs (decisions). A bottom sheet kept on desktop must detach from the window's bottom edge.
- Carousels: show navigation targets on hover/focus; only hero carousels have built-in next/previous; add a "Show all" button; pagination dots for hero and full-screen carousels; mouse wheel scrolls vertical hero carousels, Shift+wheel scrolls horizontal ones, two-finger swipe on touchpad; always a single-pointer alternative.

### Interaction
- Provide single-click controls, keyboard shortcuts, clear hover and focus states.
- **Drag and drop**: dragged state plus elevation; translucent dragged item; highlight valid drop targets (border or insertion point); prohibitive cursor over invalid targets; failed drops return or dissolve; pointer drag starts instantly (no long press); always a single-click alternative (for example a + button opening a menu).
- **Zoom**: scroll-to-zoom for zoom-first content (maps); Ctrl/Cmd+scroll for pan-first content (canvas); +/- icon buttons; pinch on touchpad. **Pan**: click-drag when zoomed in; scroll, Shift+scroll, or two-finger swipe for pan-first content.
- **Secondary actions**: context menus via secondary click, long press or overflow button; hover-revealed actions allowed but never the only path.
- **Multi-select**: Ctrl/Cmd+click (individual), Shift+click (range), click+drag (group), Ctrl/Cmd+A (all).
- **Refresh**: Ctrl/Cmd+R plus a dedicated refresh button.

---

## Glossary

Source: https://m3.material.io/foundations/glossary
Source: https://developer.android.com/design/ui/mobile/guides/foundations/glossary

### Material history
| Version | Year | Notes |
|---|---|---|
| M1 | 2014 | Archived at material.io/archive/guidelines |
| M2 | 2018 | Material Theming, Material Components code |
| M3 | 2021 | Material You, dynamic color |
| M3 Expressive | 2025 | Evolution of M3 (not M4) |

### Color terms
- **Source color**: the single extracted color (from wallpaper or input) that defines all 5 key colors.
- **Key color**: hue/chroma transformation of the source color; basis of a tonal palette; not used in code.
- **Tonal palette**: 13 tones mapped to roles.
- **Tone**: lightness (L* from CIELAB). **Chroma**: colorfulness from gray to vivid. **Hue**: perceived color.
- **HCT**: hue, chroma, tone color space (CAM16 hue/chroma plus L* tone) that powers dynamic color.
- **Contrast rule of thumb**: tone difference of 40 guarantees WCAG >= 3.0; difference of 50 guarantees >= 4.5.
- **Scheme**: mapping of roles to tones (light/dark scheme). **Theme**: full set of styles (color, elevation, type, state) applied globally; a light scheme is not a light theme.
- **Baseline scheme**: default light/dark tones. **Extended color**: extra roles for brand or semantic meaning. **User-generated scheme**: from wallpaper or presets. **Dynamic color**: user scheme mapped into app color roles.

### Token and system terms
- **Design attribute**: style aspect a token sets (color, font). **Element**: component part (container, label text). **Role** (or slot): short name of a system token ("On surface", "Secondary container color"). **Context**: conditions for alternate values. **DSP**: Design System Package, open folder format created by Adobe.
- **Condition**: signal that triggers an adaptive change. **Mode**: binary system setting (focus, airplane, battery saver). **Customization**: app, OEM or user modification of the UI. **Libraries**: Android Views and Jetpack Compose (Flutter and web in progress).

### Layout and spatial terms
- **Pane**: layout building block. **Orbiter**: floating XR control for spatial panels. **Spatial**: UI placed in 3D XR space. **XR**: VR or passthrough-blended UI. **Canonical layout**: common adaptive compositions. **Containment**: grouping via whitespace or visible boundaries.

### Android terms
- **dp**: density-independent pixel, relative to 160 dpi (1dp about 1px there). **sp**: scalable pixel for fonts, equals dp by default but scales with the user's font setting.
- **Activity**: an app's UI plus its available actions. **Task**: stack of activities (back stack) toward a goal. **Intent**: request for another app's help (for example Share).
- **Status bar**: top system bar with notification and system icons. **Navigation bar (system)**: bottom system bar for gesture or button navigation (distinct from the Material navigation bar component). **Display cutout**: sensor area intruding into the display.
- **CTA**: call to action, the primary goal for the user.

### Component one-liners
| Component | Purpose |
|---|---|
| App bar | Info and actions at the top |
| Banner | Prominent message with optional actions |
| Bottom sheet / side sheet | Supplementary content anchored to bottom / side edge |
| Button, FAB, extended FAB | Actions; FAB = most important action; extended adds a label |
| Card | Content and actions about one subject |
| Checkbox, radio, switch | Multi-select; single-select; on/off toggle |
| Chip | Enter info, select, filter or trigger actions |
| Data table, list, image list | Rows/columns; vertical index; image grid |
| Dialog | Important prompts in a flow |
| Divider | Thin grouping line |
| Menu | Choices on a temporary surface |
| Navigation bar, drawer, rail | Primary destinations (rail for tablet and desktop) |
| Progress indicator | Unspecified wait or process length |
| Slider | Pick from a range |
| Snackbar | Brief process messages at the bottom |
| Tab | Organize content across views |
| Text field, date picker, time picker | Text entry; date/range; time |
| Toolbar | Navigation and key actions at the bottom of mobile screens |
| Tooltip | Informative text on hover, focus or tap |
