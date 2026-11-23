# Components: content, layout, menus and actions, navigation and search

Distilled from Apple's live Human Interface Guidelines (Liquid Glass era, current Nov 2026). Rules are paraphrased as imperative guidance; each page links to its source. Use with the other `apple-hig` references for foundations, patterns, and remaining components.

## Contents

- **Content**: [Charts](#charts) · [Image views](#image-views) · [Text views](#text-views) · [Web views](#web-views)
- **Layout and organization**: [Boxes](#boxes) · [Collections](#collections) · [Column views](#column-views) · [Disclosure controls](#disclosure-controls) · [Labels](#labels) · [Lists and tables](#lists-and-tables) · [Lockups](#lockups) · [Outline views](#outline-views) · [Split views](#split-views) · [Tab views](#tab-views)
- **Menus and actions**: [Activity views](#activity-views) · [Buttons](#buttons) · [Context menus](#context-menus) · [Dock menus](#dock-menus) · [Edit menus](#edit-menus) · [Home Screen quick actions](#home-screen-quick-actions) · [Menus](#menus) · [Ornaments](#ornaments) · [Pop-up buttons](#pop-up-buttons) · [Pull-down buttons](#pull-down-buttons) · [The menu bar](#the-menu-bar) · [Toolbars](#toolbars)
- **Navigation and search**: [Path controls](#path-controls) · [Search fields](#search-fields) · [Sidebars](#sidebars) · [Tab bars](#tab-bars) · [Token fields](#token-fields)

## Quick reference: numbers and hard limits

| Fact | Value | Page |
|---|---|---|
| Minimum button hit region | 44x44 pt (visionOS 60x60 pt) | Buttons |
| visionOS button sizes | Mini 28, Small 32, Regular 44, Large 52, Extra large 64 pt | Buttons |
| visionOS button spacing | Centers at least 60 pt apart; 4 pt padding around buttons 60 pt or larger | Buttons |
| macOS image button padding | About 10 px between image and button edge | Buttons |
| Prominent buttons per view | 1 to 2 | Buttons |
| Help buttons per window (macOS) | Max 1 | Buttons |
| Disclosure buttons per view | Max 1 | Disclosure controls |
| Tabs in a tab view (macOS) | Max 6 | Tab views |
| iPadOS default tab bar items when customizable | 5 or fewer | Tab bars |
| tvOS tab bar | 68 pt tall, top edge 46 pt from screen top (fixed) | Tab bars |
| Home Screen quick actions | Max 4 (expect at least 1) | Home Screen quick actions |
| Toolbar title length | Under 15 characters | Toolbars |
| Toolbar item groups | About 3 max; 1 primary (`.prominent`) action, trailing | Toolbars |
| Context menu groups | About 3 max; submenus 1 level | Context menus |
| Submenu length | About 5 items before making a new menu; 1 level deep | Menus |
| Pull-down menu length | At least 3 items | Pull-down buttons |
| iOS menu layouts | Small: 4 symbol-only top items; Medium: 3 symbol + label; Large (default): list | Menus |
| About item app name | 16 characters or fewer, no version | The menu bar |
| macOS menu bar height | 24 pt | The menu bar |
| Sidebar hierarchy depth | 2 levels max | Sidebars |
| macOS split view thin divider | 1 pt | Split views |
| tvOS split view default | 1/3 primary, 2/3 secondary (or 1/2 + 1/2) | Split views |
| Activity custom icon | Centered in about 70x70 px | Activity views |

## Liquid Glass behaviors in this file

- Buttons, toolbars, tab bars: never color labels like the content-layer background; over colorful content stay monochrome.
- Toolbars: no custom backgrounds or tinted controls; use `ScrollEdgeEffectStyle`; concentric corner radii.
- iOS tab bar floats on glass and can minimize on scroll; sidebars float on glass with `backgroundExtensionEffect()` beneath.

# Content

## Charts
Source: https://developer.apple.com/design/human-interface-guidelines/charts

Purpose: surface a few key insights so people can decide something. Build with Swift Charts.

**Anatomy**: *marks* (one per data value) are *plotted* in the *plot area*; a *scale* maps data to position, color, or height; *axes* (usually one horizontal, one vertical) carry *ticks* and *grid lines*; descriptive content includes labels, accessibility labels, titles, subtitles, annotations, and a *legend* for non-positional encodings (color, shape).

**Marks**
- Pick mark type by message:
  - Bar: compare categories, part-to-whole proportions, or time series where each value is a sum (daily step total).
  - Line: change over time within one series; slope shows magnitude and trend.
  - Point: individual values as distinct marks; relationships between two properties, outliers, clusters.
- Combine mark types when it clarifies (points on a line to highlight individual values while showing the trend).

**Axes**
- Choose fixed vs dynamic range by meaning. Fixed when min/max are inherently meaningful (battery 0% to 100%). Dynamic when values vary widely and marks should fill the plot (Health Steps: top bound tracks the max in the period).
- Set the lower bound by mark type and use: bars generally start at zero so heights compare honestly; avoid forcing zero when it hides meaningful differences far from zero (heart rate resting vs active).
- Use familiar tick sequences (0, 5, 10) and avoid odd ones (1, 6, 11).
- Tune grid-line density and label weight to the task: too many overwhelm, too few hinder estimation. When people can inspect points interactively, use fewer grid lines and lighter label colors.

**Descriptive content**
- Write titles and labels that explain the chart's purpose before people inspect it (critical for VoiceOver and cognitive accessibility).
- Summarize the main message in text (Weather: title + subtitle describe next-hour precipitation so no chart reading is needed).

**Best practices**
- Data most prominent; axes and descriptions support without competing.
- In compact layouts, maximize plot width: short vertical-axis labels, units in the title, long category labels inside the plot if nothing is obscured.
- Make every chart accessible: VoiceOver labels plus Audio Graphs (data as tones, plus text summaries).
- Allow interaction, but never require it for critical info (Stocks: scrub for detail).
- If marks are too small to hit, make the whole plot area the hit target and let people scrub.
- Keyboard, Full Keyboard Access, Switch Control: define a logical path (along the X axis) via accessibility APIs such as `accessibilityRespondsToUserInteraction(_:)`, or move focus between subsets for huge datasets.
- Animate mark and axis changes and also announce them for VoiceOver and Reduce Motion users (`UIAccessibility.Notification`, `NSAccessibility.Notification`).
- Align the chart's leading edge with surrounding views: grid-line labels on their trailing side, Y axis on the trailing side, anchor orphan labels with a tick.

**Color**
- Never rely on color alone for distinctions or essential info; add shapes or patterns (Health uses two different point shapes for systolic and diastolic blood pressure).
- Separate adjacent color areas (add separators between stacked bar segments).

**Accessibility specifics**
- Swift Charts provides default Audio Graphs and one accessibility element per mark (or group). Customize with a title and summary; without Audio Graphs, describe chart type, axis meanings, and bounds yourself.
- Label each important or interactive element (unlike an image's single label), per mark or per group by purpose: Maps elevation summarizes segments; Health Steps labels each bar. A single label suffices for a tiny chart in a button.
- Writing accessibility labels:
  - Give context (date, location) plus value; skip what the overview already says.
  - Use actual values, not subjective words (rapidly, gradually, almost).
  - Avoid ambiguous formats: "June 6" not "6/6"; "60 minutes" or "60 meters" not "60m".
  - Describe what elements represent, not their colors.
  - Refer to axes consistently (e.g. always X first).
- Hide visible axis and tick text labels from assistive tech; VoiceOver users get values via labels and Audio Graphs.

**Platform notes**
- iOS, iPadOS, macOS, tvOS, visionOS: no extra considerations.
- watchOS: avoid complex chart interactions; favor glanceable info and simple, valuable interactions. Push detail and deep interaction to the companion platform (Heart Rate on Watch shows today; Health on iPhone shows multiple periods and per-mark inspection).

## Image views
Source: https://developer.apple.com/design/human-interface-guidelines/image-views

Displays one image (or an animated image sequence) on a transparent or opaque background; supports stretch, scale, size-to-fit, or pin to a position. Normally non-interactive.

- Use an image view only when the job is showing an image. For an interactive image, use a system button configured with the image; do not bolt button behavior onto an image view.
- For icons, prefer SF Symbols or interface icons (template images whose opaque pixels take color) over image views; both can adopt the user's accent color.
- Supports PNG, JPEG, PDF and other formats.
- Text over images: ensure contrast; add a text shadow or background layer to keep both image and text legible.
- Animated sequences: keep all frames the same size and shape; prescale to the view size so the system does no scaling.

**Platform notes**
- macOS: editable image = *image well* (copy, paste, drag, Delete clears); clickable image = *image button*.
- tvOS: images often layer transparency for depth (Layered images).
- visionOS: image views show 2D, stereoscopic, and spatial photos; RealityKit can place images beside 3D content or make a spatial scene from 2D (`ImagePresentationComponent`).
- watchOS: animate with SwiftUI; `WKImageAnimatable` sequences if needed.

APIs: `Image` (SwiftUI), `UIImageView`, `NSImageView`.

## Text views
Source: https://developer.apple.com/design/human-interface-guidelines/text-views

Multiline, styled, optionally editable text of any height that scrolls when content overflows. Defaults: leading alignment, system label color. On iOS, iPadOS, visionOS an editable text view raises the keyboard when selected.

- Use a text view for long, editable, or specially formatted text. For small static text use a label; for small editable text use a text field.
- Keep text legible despite mixed fonts, colors, alignments. Adopt Dynamic Type; test with accessibility settings such as Bold Text.
- Make useful text (error messages, serial numbers, IP addresses) selectable and copyable.

**Platform notes**
- macOS, visionOS, watchOS: none.
- iOS, iPadOS: show the keyboard type matching the content (see Virtual keyboards).
- tvOS: text views display text; editable text uses text fields because tvOS minimizes text input.

APIs: `Text` (SwiftUI), `UITextView`, `NSTextView`.

## Web views
Source: https://developer.apple.com/design/human-interface-guidelines/web-views

Loads rich web content (embedded HTML, websites) in-app; e.g. Mail renders HTML messages in one.

- Back/forward navigation exists but is off by default. Enable it and provide matching controls when people may visit multiple pages.
- Do not build a web browser from a web view. Brief in-context visits to a site are fine; Safari is the browsing app.

**Platform notes**: iOS, iPadOS, macOS, visionOS: none. Not supported on tvOS or watchOS.

API: `WKWebView` (WebKit).

# Layout and organization

## Boxes
Source: https://developer.apple.com/design/human-interface-guidelines/boxes

Visually groups related information and controls using a border or background color, optionally with a title.

- Keep boxes small relative to their container; a box approaching window or screen size stops communicating grouping and crowds other content.
- Express subgroups inside a box with padding and alignment, not nested boxes (nested borders feel busy).
- Add a short title when it clarifies the relationship (also helps VoiceOver users anticipate contents).
- Title style: brief descriptive phrase, sentence-style capitalization, no ending punctuation, except in a settings pane where the title ends with a colon.

**Platform notes**
- iOS, iPadOS: boxes use secondary and tertiary background colors by default.
- macOS: title appears above the box by default.
- visionOS: none. Not supported on tvOS or watchOS.

APIs: `GroupBox` (SwiftUI), `NSBox`.

## Collections
Source: https://developer.apple.com/design/human-interface-guidelines/collections

Ordered set of items in a customizable, highly visual layout; best for image-based content.

- Prefer the standard horizontal row or grid layouts; avoid custom layouts that confuse or draw attention to themselves.
- For text content, use a table/list instead.
- Make items easy to reach and choose: pad around images so focus and hover effects stay visible and items do not overlap.
- Defaults: tap to select, touch and hold to edit, swipe to scroll. Add custom gestures only if required.
- Use standard (or custom) animations as feedback for insert, delete, reorder.

**Platform notes**
- iOS, iPadOS: be careful with dynamic layout changes; keep them understandable and avoid changing layout while someone is interacting unless they explicitly triggered it.
- macOS, tvOS, visionOS: none. Not supported on watchOS.

APIs: `UICollectionView`, `NSCollectionView`.

## Column views
Source: https://developer.apple.com/design/human-interface-guidelines/column-views

Also called a *browser*: navigates a hierarchy through successive vertical columns, one per level. Parent items show a triangle; selecting a parent shows its children in the next column.

- Use for deep hierarchies where people move back and forth between levels often and do not need table-style sorting (Finder column view).
- Put the root level in the first column so people can always restart from the top.
- When a leaf item is selected, consider showing details about it (Finder shows preview, creation/modification dates, type, size).
- Let people resize columns, especially when names exceed the default width.
- For hierarchical content on iPadOS or visionOS, use a split view instead.

**Platform notes**: macOS only. Not supported on iOS, iPadOS, tvOS, visionOS, watchOS.

API: `NSBrowser`.

## Disclosure controls
Source: https://developer.apple.com/design/human-interface-guidelines/disclosure-controls

Reveal or hide information and functionality tied to a control or view.

- Hide details until relevant: keep the most-used controls at the top level, advanced options collapsed by default.

**Disclosure triangle** (view or list content; Keynote export advanced options, Finder list view hierarchy)
- Points inward from the leading edge when collapsed, down when expanded; click/tap toggles and the view resizes.
- Always pair with a descriptive label saying what is revealed ("Advanced Options").
- API: `NSButton.BezelStyle.disclosure`.

**Disclosure button** (functionality tied to one control; macOS Save sheet next to Save As field)
- Points down when collapsed, up when expanded.
- Place it next to the content it controls.
- At most one disclosure button per view.
- API: `NSButton.BezelStyle.pushDisclosure`.

**Platform notes**
- iOS, iPadOS, visionOS: available via SwiftUI `DisclosureGroup`.
- macOS: none. Not supported on tvOS or watchOS.

## Labels
Source: https://developer.apple.com/design/human-interface-guidelines/labels

Static, uneditable (often copyable) text used in buttons, menu items, list rows, and views to explain context and next steps. SwiftUI offers `Label` and `Text`.

- Use labels for small non-editable text; small editable text = text field; large (optionally editable) text = text view.
- Prefer system fonts; labels support Dynamic Type by default. Keep custom styling legible.
- Use the four system label colors for hierarchy:

| Level | Use | iOS, iPadOS, tvOS, visionOS | macOS |
|---|---|---|---|
| Label | Primary information | `label` | `labelColor` |
| Secondary label | Subheading, supplemental text | `secondaryLabel` | `secondaryLabelColor` |
| Tertiary label | Describes an unavailable item or behavior | `tertiaryLabel` | `tertiaryLabelColor` |
| Quaternary label | Watermark text | `quaternaryLabel` | `quaternaryLabelColor` |

- Make useful label text (error messages, locations, IP addresses) selectable.

**Platform notes**
- iOS, iPadOS, tvOS, visionOS: none.
- macOS: uneditable label = `NSTextField` with `isEditable` false.
- watchOS: system date/time and timer (countdown or count-up) text components auto-fit available space and auto-update without app work; configurable formats, calendars, time zones. Good for complications.

APIs: `Label`, `Text` (SwiftUI), `UILabel`, `NSTextField`.

## Lists and tables
Source: https://developer.apple.com/design/human-interface-guidelines/lists-and-tables

Rows in one or more columns, optionally grouped or hierarchical; supports select, add, delete, reorder (iOS Settings hierarchy, Mail pane in a split view, sortable productivity tables).

**Best practices**
- Prefer lists for text; for widely varying sizes or many images use a collection.
- Allow editing where sensible; reordering alone is valued. On iOS/iPadOS, selection requires edit mode.
- Navigation tables keep the selected row highlighted; option tables flash briefly, then show a checkmark.

**Content**
- Keep row text short; for long items list titles only and show content in a detail view.
- In narrow or resizable tables, consider middle truncation (ellipsis in the middle) so start and end stay visible.
- Multicolumn headings: nouns or short noun phrases, title-style capitalization, no ending punctuation. A single-column table without a heading needs a label or header for context.

**Style**
- Match list style to data and platform (`ListStyle`): iOS/iPadOS *grouped* (headers, footers, extra spacing); watchOS *elliptical* (items appear to roll off a curved surface); macOS *bordered* with alternating row backgrounds for large tables.
- Pick a row style that fits (e.g. small leading image + short label). Use built-in row layouts such as `UIListContentConfiguration` (rows, headers, footers on iOS, iPadOS, tvOS).

**Platform notes**
- iOS, iPadOS, visionOS:
  - Info button in a row (*detail disclosure button*) only reveals more info about that row; it never navigates. To drill down, use the disclosure indicator accessory (`UITableViewCell.AccessoryType.disclosureIndicator`).
  - Do not add a section index (vertical alphabet on the trailing side) to a table whose rows have trailing controls like disclosure indicators; they collide.
- macOS:
  - Let people click a column heading to sort when valuable; clicking an already-sorted column reverses the order.
  - Let people resize columns.
  - Consider alternating row colors in multicolumn tables.
  - Use an outline view (not a table) for hierarchical data.
- tvOS: a focused row highlights, grows slightly, and may round its corners; check that adjacent images still look right and do not pre-mask images with your own rounded corners.
- watchOS:
  - Keep lists short when possible, but do not hide items people expect (large podcast libraries): show the most relevant items plus a way to see more.
  - Keep detail views short (non-scrolling) to support vertical page-based navigation between row details; scrolling detail views break it.

APIs: `List`, `Table` (SwiftUI), `UITableView`, `NSTableView`.

## Lockups
Source: https://developer.apple.com/design/human-interface-guidelines/lockups

tvOS only. Combine a content view, header (above), and footer (below) into one interactive unit; all three expand and contract together on focus. Four types: cards, caption buttons, monograms, posters.

- Leave enough spacing for the focused (enlarged) lockup so it does not overlap or displace neighbors.
- Use uniform width and height for lockups within a row or group.
- **Cards**: header + content + footer, for media ratings and reviews (`TVCardView`).
- **Caption buttons**: image or text, with optional title and subtitle below. They tilt with the swipe direction on focus: vertical stack tilts up/down, horizontal row tilts left/right, grid tilts both (`TVCaptionButtonView`).
- **Monograms**: circular photo + name for cast and crew; initials appear when no image exists. Prefer real images over initials (`TVMonogramContentView`).
- **Posters**: image with optional title and subtitle hidden until focused; any size appropriate to content (`TVPosterView`).

APIs: `TVLockupView`, `TVLockupHeaderFooterView` (TVUIKit). Not supported on iOS, iPadOS, macOS, visionOS, watchOS.

## Outline views
Source: https://developer.apple.com/design/human-interface-guidelines/outline-views

macOS only. Hierarchical data in a scrolling list of rows and columns; the primary column holds parents and children with disclosure triangles; extra columns show attributes (size, modified date). Finder list view is the model. Often sits on the leading side of a split view.

- Non-hierarchical data: use a table.
- Show hierarchy only in the first column; other columns hold attributes.
- Column headings: nouns or short noun phrases, title-style capitalization, no punctuation (especially no trailing colon). Always provide headings when there are multiple columns; a single-column outline without a heading needs other context.
- Consider click-to-sort headings; primary-column sort applies within each hierarchy level (Finder); clicking again reverses. Secondary sorts may run behind the scenes.
- Let people resize columns; consider alternating row colors.
- Click a triangle to expand one item; Option-click expands all descendants. Persist and restore expansion state.
- Editing: single-click edits a cell; double-click may open (files). Optionally reorder, add, remove.
- Prefer middle-ellipsis truncation over clipping; offer a toolbar search field for long outlines.

APIs: `OutlineGroup` (SwiftUI), `NSOutlineView`. Not supported on iOS, iPadOS, tvOS, visionOS, watchOS.

## Split views
Source: https://developer.apple.com/design/human-interface-guidelines/split-views

Adjacent panes showing several hierarchy levels at once (primary selection drives secondary, optionally tertiary); commonly a sidebar in the leading pane. Rarely, panes hold supplementary tools (Keynote macOS navigator, notes, inspector).

- Persistently highlight the current selection in every pane that leads to the detail view.
- Consider drag and drop of content between panes.

**Platform notes**
- iOS: prefer split views in regular width only; compact width (iPhone portrait) cannot show multiple panes legibly.
- iPadOS: two panes (Mail) or three (Keynote). Design for narrow, compact, and intermediate widths since windows resize fluidly, with logical navigation between panes at every width (`NavigationSplitView`, `UISplitViewController`).
- macOS:
  - Panes can be arranged vertically, horizontally, or both, with draggable dividers (`VSplitView`, `HSplitView`).
  - Set sensible min/max pane sizes so the divider never effectively disappears.
  - Let people hide panes when useful (Keynote hides navigator and notes for editing).
  - Offer multiple ways to restore hidden panes: toolbar button and menu command with a keyboard shortcut.
  - Prefer the thin divider (1 pt). Use thicker styles only for a specific need, e.g. strong row lines on both sides making a thin divider hard to see (`NSSplitView.DividerStyle`).
- tvOS: good for filtering (category in primary, results in secondary). Default one third / two thirds, or half-and-half; keep balanced. One title above the whole split view (no per-pane titles): centered when the secondary pane is a collection, above the primary pane when it is a single main view.
- visionOS: for supplementary info, prefer a split view over opening a new window. For a short task or small input before returning, use a sheet.
- watchOS: shows either the list or one detail view full screen. Launch into the most relevant detail (location, time, recent actions). For multiple detail pages, put them in a vertical tab view; the Digital Crown scrolls and a page indicator beside the Crown shows count and position.

APIs: `NavigationSplitView` (SwiftUI), `UISplitViewController`, `NSSplitViewController`.

## Tab views
Source: https://developer.apple.com/design/human-interface-guidelines/tab-views

Mutually exclusive panes in one area, switched with a tabbed control (macOS `NSTabView`; watchOS pages).

- Use for closely related content areas; the enclosure look signals relatedness.
- Controls inside a pane affect only that pane; keep panes self-contained.
- Label each tab with a noun or short noun phrase (a verb phrase occasionally), title-style capitalization, predicting its contents.
- Do not switch tabs with a pop-up button (two clicks vs one, choices hidden), except when there are too many panes for tabs.
- Maximum six tabs. If you need six or more, use another design (e.g. each pane as an option in a pop-up button menu).
- Anatomy: tabbed control sits on the top edge of the content area. You may hide it when switching programmatically; the content area is then borderless (solid or transparent), bezeled, or line-bordered.
- Inset the tab view with window-body margin on all sides; extending to the window edges is unusual.

**Platform notes**
- iOS, iPadOS: not supported; use a segmented control for similar behavior.
- tvOS, visionOS: not supported.
- watchOS: tab views render as page controls (`TabView`).

APIs: `TabView` (SwiftUI), `NSTabView`.

# Menus and actions

## Activity views
Source: https://developer.apple.com/design/human-interface-guidelines/activity-views

The *share sheet*: tasks for the current context, mixing sharing (Messages etc.), actions (Copy, Print), and quick access to frequent apps. Opened from the Share/Action button on a page or document, or after selecting an item. Appears as a sheet or popover depending on device and orientation.

- App-specific activities (Photos: Copy Photo, Add to Album, Adjust Location) list before cross-app/system actions (Add to Files, AirPlay) by default. People can edit and extend the action list.
- App extensions provide share/action activities usable in other apps. macOS has no activity view but supports share and action extensions.

**Best practices**
- Never duplicate system actions; title similar app-specific ones distinctly ("Print Transaction").
- Use SF Symbols; custom icons centered in about 70x70 px.
- Action titles: a verb or short verb phrase, no company or product name (share activities show a company name under the icon).
- You cannot reorder system tasks but can exclude irrelevant ones (Print) and choose which custom tasks appear.
- Open it from the Share button only.

**Share and action extensions**
- Share extensions send content to apps and services; action extensions run in-place tasks (bookmark, copy link, edit inline image, translate text).
- iOS/iPadOS: shown in the share sheet. macOS: share via toolbar Share button or context-menu Share; actions via hovering embedded content (image in Mail compose), a toolbar button, or a Finder quick action.
- Share extensions: prefer the system composition view. Action extensions: include your app name and app UI cues.
- Minimize steps (one tap to post). Do not stack modals over the extension (alerts excepted).
- Share extensions get your app icon automatically; action extensions use a task-specific symbol or icon.
- The activity view dismisses when the task finishes: continue long work in the background with status in the main app; notify only on problems, never for mere completion.

**Platform notes**: iOS, iPadOS, visionOS: none. Not supported on macOS (activity view itself), tvOS, watchOS.

APIs: `UIActivityViewController`, `UIActivity`, App Extension Support (Foundation).

## Buttons
Source: https://developer.apple.com/design/human-interface-guidelines/buttons

Initiates an instantaneous action. Defined by three attributes: **style** (size, color, shape), **content** (symbol/icon, text, or both), **role** (system semantic meaning that can change appearance). Related button-like controls: toggles, pop-up buttons, segmented controls.

**Best practices**
- Give buttons room to be distinguished and hit. Minimum hit region 44x44 pt (visionOS 60x60 pt) for finger, pointer, eyes, or remote.
- Every custom button needs a pressed state, or it feels unresponsive.

**Style**
- System styles give interaction states, accessibility, and appearance adaptation for free; platforms define styles to express action hierarchy.
- Use a prominent style (accent-colored background) for the most likely action. Limit to one or two prominent buttons per view.
- Distinguish the preferred option by style, not size. Same-size buttons signal a coherent set of choices; mixed sizes side by side look inconsistent.
- Liquid Glass: do not give button labels a color similar to content-layer backgrounds. When content is already bright and colorful, keep the default monochrome labels (see Liquid Glass color).

**Content**
- Each button must clearly communicate its purpose with a symbol, text, or both.
- macOS and visionOS show a tooltip after brief hover; write a short phrase explaining the action.
- Map familiar actions to familiar icons (`square.and.arrow.up` = share). Use existing or customized SF Symbols; see Standard icons.
- Use text when a few words are clearer than an icon: title-style capitalization, ideally starting with a verb ("Add to Cart").

**Roles**

| Role | Meaning | Appearance effect |
|---|---|---|
| Normal | No specific meaning | Default |
| Primary | Default button, most likely choice | App accent color |
| Cancel | Cancels the current action | System styling |
| Destructive | May destroy data | System red |

- Give the primary role to the most likely button: it responds to Return, and in temporary views (sheets, editable views, alerts) Return can confirm and close.
- Never make a destructive action primary, even if most likely; people tap prominent buttons without reading.

**Platform notes**
- tvOS: none.
- iOS, iPadOS: for non-instant actions, configure the button to show an activity indicator inline, optionally with an alternate label ("Checkout" becomes "Checking out…"); the indicator appears beside the label and hides any button image.
- macOS:
  - *Push button* (standard): text, symbol, icon, image, or combos; can be default; can be tinted. Flexible-height variant (`NSButton.BezelStyle.flexiblePush`) only for tall or two-line content.
  - Append an ellipsis when a push button opens another window, view, or app ("Edit…").
  - Consider spring loading (Magic Trackpad: drag items onto the button and force click to activate, then keep dragging).
  - *Square (gradient) button* (`NSButton.BezelStyle.smallSquare`): acts on a view (add/remove rows); symbols only, no text or introducing labels; in or beneath its view, never in toolbars or status bars.
  - *Help button*: system circular question-mark button. Open the topic for the current context (Mail Rules pane), else the help top level. Max one per window, in a view (not toolbar or status bar), no introductory text.

  | View style | Help button location |
  |---|---|
  | Dialog with dismissal buttons (OK, Cancel) | Lower corner opposite the dismissal buttons, vertically aligned with them |
  | Dialog without dismissal buttons | Lower-left or lower-right corner |
  | Settings window or pane | Lower-left or lower-right corner |

  - *Image button*: in a view, not the window frame. About 10 px padding to the (click-defining) edges, usually no border (`isBordered`), label below.
- visionOS:
  - Buttons usually have a visible background and play sounds (no haptics on visionOS, so use standard controls for familiar audio feedback).
  - Shapes: icon-only = circle; text-only = rounded rectangle or capsule; icon + text = capsule.
  - Four visual interaction states; custom hover effects are not supported. Looking at a button briefly can show a tooltip; text buttons usually need none.
  - Sizes: Mini 28 pt, Small 32 pt, Regular 44 pt, Large 52 pt, Extra large 64 pt (circular, capsule text-only, capsule text+icon, rounded rectangle).
  - Prefer a visible background shape and fill (not needed inside toolbars, context menus, alerts, ornaments). On glass use thin material; floating in space use glass.
  - Never use white fill with black text/icon on a custom button: reserved for the toggled state.
  - Prefer circular or capsule shapes (easier to gaze at steadily); standalone buttons are capsules.
  - Centers at least 60 pt apart; 4 pt padding around buttons 60 pt or larger; no rows or stacks of small or mini buttons.
  - Text buttons: rounded rectangles in vertical stacks, capsules in horizontal rows.
- watchOS:
  - Inline buttons are capsules with a contrasting material.
  - Corner buttons go in a toolbar (system shifts time and title, applies Liquid Glass); toolbar buttons offer navigation to related areas or contextual actions.
  - Primary actions use full-width buttons; two in a row share height and use images or short titles. Stacked one- and two-line buttons share one height.

APIs: `Button` (SwiftUI), `UIButton`, `NSButton`.

## Context menus
Source: https://developer.apple.com/design/human-interface-guidelines/context-menus

Item-specific commands without UI clutter; hidden by default. Revealed by touch-and-hold or pinch-and-hold (visionOS, iOS, iPadOS), Control-click (macOS, iPadOS), or secondary click on a Magic Trackpad (macOS, iPadOS).

**Best practices**
- Include only the most likely commands for that context, not advanced or rare ones (Mail message: reply, move). Keep it short.
- Support context menus consistently across the app.
- Every context menu command must also exist in the main UI (Mail toolbar in message view; macOS menu bar lists all commands).
- Submenus: one level max, with a title that predicts contents.
- Hide unavailable items rather than dimming them (unlike regular menus). macOS exception: Cut, Copy, Paste may appear dimmed.
- Put frequent items closest to where the menu opens (finger/pointer); if the menu opens above the content, consider reversing order.
- Do not show keyboard shortcuts in context menus; show them in main menus.
- Use separators; about three groups maximum.
- iOS, iPadOS, visionOS: place destructive items (Delete, Remove) at the end and mark them `destructive` (system may render red).

**Content**
- Usually no title. Add one only when it clarifies scope (Mail multi-select Mark menu titled with the selected message count).
- Every item needs a short, clear label.
- Use the same icons the system uses for common actions (Copy, Share, Delete); see Standard icons.

**Platform notes**
- tvOS: none. watchOS: not supported.
- iOS, iPadOS:
  - Offer a context menu or an edit menu for an item, never both.
  - iPadOS: consider context menus for creating objects (Files: New Folder in empty space).
  - Previews (tap to open, drag to move) should graphically show the real target (Notes, Mail). Match the clipping path to the preview's shape so corners stay stable as it animates out (`UIContextMenuInteractionDelegate`).
- macOS: also called a *contextual* menu.
- visionOS:
  - Consider a context menu instead of a panel or inspector window for frequent functions (fewer windows).
  - Keep menu height within the window height so it does not cover system components above and below the window (window controls, Share menu). Specialist apps may justify more commands; simple apps should stay short.

APIs: `contextMenu(menuItems:)` (SwiftUI), `UIContextMenuInteraction`, `popUpContextMenu(_:with:for:)` (AppKit).

## Dock menus
Source: https://developer.apple.com/design/human-interface-guidelines/dock-menus

macOS only: secondary-click an app's Dock icon to see system items (vary by whether the app is open; e.g. Safari window list, New Window) plus custom items. iOS/iPadOS equivalent is Home Screen quick actions.

- Label succinctly and organize logically (Menus rules apply).
- Every custom Dock item must also be available elsewhere (menu bar or UI).
- Choose high-value items: list open or recent windows; add a few actions useful when the app is not frontmost or has no windows (Mail: Get New Mail, New Message, plus open windows).

API: `applicationDockMenu(_:)`. Not supported on iOS, iPadOS, tvOS, visionOS, watchOS.

## Edit menus
Source: https://developer.apple.com/design/human-interface-guidelines/edit-menus

Commands for selected content (text, images, files, contact cards, charts, map locations): Copy, Select, Translate, Look Up, etc. On iOS, iPadOS, visionOS the system detects data types and may add actions (an address adds Get Directions).

| Platform | Behavior |
|---|---|
| iOS | Compact horizontal list after touch-and-hold or double-tap selection; trailing chevron expands to a context menu |
| iPadOS | Touch reveals the compact horizontal style; keyboard or pointer reveals it directly as a (vertical) context menu |
| macOS | Editing commands in a context menu during editing and in the menu bar Edit menu |
| visionOS | Standard pinch gesture shows a horizontal bar, or opens as a context menu |
| tvOS, watchOS | Not provided |

**Best practices**
- Use the system edit menu (`UIResponderStandardEditActions`), revealed by standard interactions (touch and hold, pinch and hold, secondary click).
- Show only applicable commands; remove or dim others (no Copy without selection, no Paste with empty pasteboard).
- Place few custom commands next to related system ones (custom formatting after system format items).
- Allow copying non-editable content text (captions, statuses), not control labels.
- Support undo and redo (no confirmation step). Avoid separate controls duplicating edit commands.
- Distinguish deletion types: Delete equals the Delete key; Cut copies to the pasteboard then deletes.
- Custom command labels: verbs or short verb phrases.

**Platform notes**
- visionOS: none. tvOS, watchOS: not supported.
- iOS, iPadOS: design for both the compact horizontal (Multi-Touch) and vertical (keyboard/pointer) styles. Default position is above or below the selection with a pointer to the target; you cannot change the menu's shape or pointer but can reposition it to avoid covering important content.
- macOS: follow the standard Edit menu item order (see The menu bar).

APIs: `UIEditMenuInteraction`, `NSMenu`.

## Home Screen quick actions
Source: https://developer.apple.com/design/human-interface-guidelines/home-screen-quick-actions

Touch and hold an app icon (or press firmly on 3D Touch devices) to get app actions plus system items (remove app, edit Home Screen). Mail: Inbox, VIP, Search, New Message. Each action has a title, an interface icon on the left or right (depends on the icon's Home Screen position), and optional subtitle; text is always left-aligned in left-to-right languages. Actions can be updated dynamically (Messages shows recent conversations).

- Offer high-value tasks (Maps: directions home). People expect at least one; maximum **four**.
- Dynamic actions (location, recents, time, settings) must change predictably.
- Titles state the result ("Directions Home", "New Message"); optional subtitle (Mail unread status). No app name; short; localizable.
- Icons: SF Symbols preferred; custom ones from the Quick Action Icon Template (Apple Design Resources). Never emoji (icons are monochrome and adapt to Dark Mode).

**Platform notes**: iOS, iPadOS only. Not supported on macOS, tvOS, visionOS, watchOS.

API: UIKit "Add Home Screen quick actions".

## Menus
Source: https://developer.apple.com/design/human-interface-guidelines/menus

Space-efficient list of *menu items* (commands, options, states) revealed on interaction. These rules apply to every menu type (pop-up, pull-down, context, menu bar, in-game).

**Labels**
- Clear, succinct label per item, optional clarifying symbol. Apps may show keyboard shortcuts; games rarely do.
- Action items: verb or verb phrase (View, Close, Select).
- Title-style capitalization (all words except articles, coordinating conjunctions, short prepositions; last word always capitalized). Games may deviate.
- Drop articles: "View Settings", not "View the Settings".
- Unavailable items appear dimmed and inert. If every item is unavailable, the menu itself stays openable so people can learn its commands.
- Append an ellipsis (…) when the command needs more input before completing (usually in another view).

**Icons** (updated June 2026)
- Use standard icons for common actions (Share, Print, Search); see Standard icons.
- Use icons sparingly and purposefully: highlight the most common actions and key features, file-system locations, connected devices, visual concepts (rotate, flip), user content (folders, documents). Skip the icon if none clearly fits.
- Within a group, give icons to all items or to none.

**Organization**
- List important and frequent items first.
- Group related items (Copy/Cut/Paste; Look Up/Look Down/Look Left) and separate groups with separators (horizontal line or gap depending on platform).
- Keep all related commands in one group even if usage differs (Paste and Match Style lives with Paste, Copy, Cut).
- Watch length: split long menus into separate menus or use a submenu (difficulty levels under New Game). Exception: user-defined or dynamic menus (Safari History, Bookmarks) may be long and scroll.

**Submenus** (indicated by a trailing chevron)
- Use sparingly. Good trigger: a term repeats in more than two items in one group (Sort by Date / Score / Time becomes "Sort by" with submenu Date, Score, Time); put the repeated term in the parent label.
- One level deep; if a submenu exceeds about five items, consider a separate menu.
- Keep the submenu item openable even when all its children are unavailable.
- Use submenus, not indentation, to express hierarchy.

**Toggled items**
- Prefer one item with a changing label (Show Map / Hide Map); add a verb if state vs action is ambiguous (Turn HDR On, not HDR On).
- Show both items when seeing both helps (Take Account Online / Offline, only the applicable one enabled).
- Checkmark attributes in effect (Format > Font); offer a reset item for multiple attributes (Plain).

**In-game menus**: navigate with the platform's default input (touch; visionOS direct and indirect gestures); keep text and tap targets legible and large enough when scaling to small screens.

**Platform notes**
- macOS, tvOS, watchOS: none.
- iOS, iPadOS: three layouts (`preferredElementSize`):

  | Layout | Top row | Rest |
  |---|---|---|
  | Small | 4 items, symbol only, no label | List below |
  | Medium | 3 items, symbol above short label | List below |
  | Large (default) | None | All items in a list |

  - Medium for three key frequent actions (Notes: Scan, Lock, Pin). Small only for tightly related grouped actions (Bold, Italic, Underline, Strikethrough) with instantly recognizable symbols.
- visionOS:
  - Supports the small and large layouts. Menus can be presented from 3D content via a SwiftUI view; an open menu may extend beyond the window bounds (as on macOS).
  - Place menus near the content they control; people look at an item before tapping and may miss distant effects.
  - Breakthrough effect (keeps menu visible when occluded): prefer *subtle* (default when `automatic` overlaps 3D content). *Prominent* shows the menu over the whole scene but can disrupt or cause discomfort. *None* lets 3D content fully occlude the menu (e.g. puzzle with barriers) at an accessibility cost.

APIs: `Menu` (SwiftUI), UIKit Menus and shortcuts, AppKit Menus.

## Ornaments
Source: https://developer.apple.com/design/human-interface-guidelines/ornaments

visionOS only. Controls and info related to a window, floating on a plane parallel to and slightly in front of the window along z. Moves with the window; unaffected by content scrolling. Can attach to any edge and host buttons, segmented controls, other views. The system builds toolbars, tab bars, and video playback controls as ornaments.

- Use for frequently needed controls or info in a stable spot (Music Now Playing controls).
- Keep ornaments visible in general; hiding is fine during immersive viewing (video, photo).
- With multiple ornaments, protect the window's visual balance; limit the count and move elements into the window if needed.
- Keep ornament width equal to or narrower than the window, or it may collide with a side tab bar or other vertical content.
- Consider borderless buttons: the ornament background is glass, and looking at a borderless button gets the system hover effect automatically.
- Use system toolbars and tab bars (they become ornaments automatically) unless you truly need a custom component.

API: `ornament(visibility:attachmentAnchor:contentAlignment:ornament:)`. Not supported on iOS, iPadOS, macOS, tvOS, watchOS.

## Pop-up buttons
Source: https://developer.apple.com/design/human-interface-guidelines/pop-up-buttons

Shows a menu of mutually exclusive options; after a choice the menu closes and the button can display the current selection.

- Use for a flat list of mutually exclusive options or states that affect content or the surrounding view. Use a pull-down button instead for actions, multiple selection, or submenus.
- Set a useful default that most people want.
- Make options predictable without opening: introductory label or a descriptive button label.
- Good when space is tight and options needn't be always visible.
- Optionally add a "Custom" item for occasional extra choices, and explanatory text below the list.

**Platform notes**
- iOS, macOS, visionOS: none. tvOS, watchOS: not supported.
- iPadOS: inside a popover or modal view, consider a pop-up button instead of a disclosure indicator for a list item with a small, well-defined option set (no detail-view navigation needed).

APIs: `MenuPickerStyle` (SwiftUI), `changesSelectionAsPrimaryAction` (UIKit), `NSPopUpButton`.

## Pull-down buttons
Source: https://developer.apple.com/design/human-interface-guidelines/pull-down-buttons

Shows a menu of items or actions directly related to the button's purpose; choosing one closes the menu and performs it.

- Use for commands tied to the button's action: Add button menu picks what to add; Sort button picks the attribute; Back button picks a specific earlier location. For non-command mutually exclusive choices use a pop-up button.
- Never bury all of a view's actions (especially primary ones) in a single pull-down.
- Length: at least three items to justify the extra tap; for one or two, use buttons, toggles, or switches. Avoid overly long menus.
- Menu title only if it adds meaning.
- Destructive items show red text; on selection, confirm with an action sheet (iOS) or popover (iPadOS).
- Add an interface icon after the label when it clarifies; SF Symbols stay aligned with text at every scale.

**Platform notes**
- macOS, visionOS: none. tvOS, watchOS: not supported.
- iOS, iPadOS: a pull-down can also be revealed by a gesture on a button (Safari Tabs button touch-and-hold since iOS 14: New Tab, Close All Tabs). A More (ellipsis) pull-down saves space for non-prominent items but hurts discoverability since the icon does not predict contents; balance the two.

APIs: `MenuPickerStyle` (SwiftUI), `showsMenuAsPrimaryAction` (UIKit), `pullsDown` (AppKit).

## The menu bar
Source: https://developer.apple.com/design/human-interface-guidelines/the-menu-bar

Top-level menus on Mac and iPad; iPad uses the same order, items, and shortcut patterns as Mac. General Menus rules apply.

**Anatomy: standard order**
1. *YourAppName* (short app name as title)
2. File
3. Edit
4. Format
5. View
6. App-specific menus (if any)
7. Window
8. Help

macOS also has the Apple menu at the leading edge and menu bar extras at the trailing edge.

**Best practices**
- Support system menus and their order; the system implements many standard items (Edit > Copy enables automatically for a text field selection).
- Always show the same items; disable unavailable ones rather than hiding them.
- Use system icons for common actions (Copy, Share, Delete); see Standard icons.
- Support the standard keyboard shortcuts for standard items (Copy, Cut, Paste, Save, Print). Add custom shortcuts only when necessary.
- Prefer short one-word menu titles; multiword titles use title-style capitalization.

**App menu** (app name shown bold). Typical order:

| Item | Action | Guidance |
|---|---|---|
| About *AppName* | About window with copyright, version | Short name, 16 characters or fewer; no version number in the title. First item, followed by a separator so it sits alone |
| Settings… | Opens Settings window (or app page in iPadOS Settings) | App-level settings only; document settings go in File |
| Optional app-specific items | Custom app-level configuration | After Settings, same group |
| Services (macOS) | Submenu of context-relevant services | |
| Hide *AppName*, Hide Others, Show All (macOS) | Hide this app (activating the last-used app), hide other apps, show all apps behind yours | Same short name as About |
| Quit *AppName* | Quits; Option turns it into Quit and Keep Windows | Same short name as About |

**File menu** (rename or remove if the app handles no files). Typical order:

| Item | Action | Guidance |
|---|---|---|
| New *Item* | New document, file, or window | Name the item type (Calendar: Event, Calendar) |
| Open | Opens selection or a chooser | Add ellipsis if a separate chooser appears |
| Open Recent | Submenu of recent files, usually with Clear Menu | Show recognizable names, not paths; most recent first |
| Close | Closes window/document; Option = Close All; Close Tab replaces it in tabbed windows | In tabbed windows consider a Close Window item |
| Close Tab | Option = Close Other Tabs | |
| Close File | Closes file and all its windows | When multiple views of one file are possible |
| Save / Save All | Saves current / all docs | Autosave periodically; prompt name and location for new docs; multiple formats via a pop-up in the Save sheet |
| Duplicate | Duplicates, both stay open; Option = Save As | Prefer over Save As, Export, Copy To, Save To (relationship clearer) |
| Rename…, Move To… | Rename or relocate the current doc | |
| Export As… | Name, location, format; original stays open, export does not open | Only for formats the app does not normally handle |
| Revert To | With autosave: submenu of recent versions plus version browser; chosen version replaces current | |
| Page Setup… | Paper size, orientation; saved per document | Only for document-specific print parameters; global (printer) or frequently changed (copies) settings belong in Print |
| Print… | Standard Print panel (print, fax, PDF) | |

**Edit menu** (useful even in non-document apps). Decide whether Find belongs here or in File (searching files/objects suggests File). Typical order:

| Item | Action / guidance |
|---|---|
| Undo / Redo | Name the target (Undo Paste and Match Style, Redo Typing) |
| Cut, Copy, Paste, Paste and Match Style | Standard Clipboard behavior; Paste leaves the Clipboard unchanged |
| Delete | Removes without Clipboard; call it Delete (not Erase or Clear) to match the Delete key |
| Select All | Selects all content in current doc or container |
| Find | Submenu: Find, Find and Replace, Find Next, Find Previous, Use Selection for Find, Jump to Selection |
| Spelling and Grammar | Submenu: Show Spelling and Grammar, Check Document Now, Check Spelling While Typing, Check Grammar With Spelling, Correct Spelling Automatically |
| Substitutions | Submenu: Show Substitutions, Smart Copy/Paste, Smart Quotes, Smart Dashes, Smart Links, Data Detectors, Text Replacement |
| Transformations | Submenu: Make Uppercase, Make Lowercase, Capitalize |
| Speech | Submenu: Start Speaking, Stop Speaking |
| Start Dictation | System-added at the bottom |
| Emoji & Symbols | Character Viewer; system-added at the bottom |

**Format menu** (omit if no formatted text editing)

| Item | Standard submenu items |
|---|---|
| Font | Show Fonts, Bold, Italic, Underline, Bigger, Smaller, Show Colors, Copy Style, Paste Style |
| Text | Align Left, Align Center, Justify, Align Right, Writing Direction, Show Ruler, Copy Ruler, Paste Ruler |

**View menu**: customizes appearance of all windows; never window navigation or management (that is the Window menu).
- Provide it even with only a subset (e.g. just Enter/Exit Full Screen).
- Show/hide titles reflect current state (Show Toolbar when hidden, Hide Toolbar when visible).
- Order: Show/Hide Tab Bar; Show All Tabs / Exit Tab Overview; Show/Hide Toolbar; Customize Toolbar; Show/Hide Sidebar; Enter/Exit Full Screen.

**App-specific menus** (between View and Window; Safari: History, Bookmarks)
- List every custom command in the menu bar, even if available elsewhere and even if rare or advanced: discoverability, keyboard shortcuts, Full Keyboard Access.
- Mirror app hierarchy (Mail: Mailbox, Message, Format).
- Order from most general/common to most specialized.

**Window menu**: navigate, organize, manage windows (not customize appearance or close; Close lives in File).
- Provide it even for single-window apps, including Minimize and Zoom for Full Keyboard Access.
- Consider show/hide items for panels (font and color panels already live in Format).

| Item | Action | Guidance |
|---|---|---|
| Minimize | To Dock; Option = Minimize All | |
| Zoom | Toggles content-fit size and user size; Option = Zoom All | Never use Zoom for full screen |
| Show Previous Tab / Show Next Tab | Tab navigation | |
| Move Tab to New Window | | |
| Merge All Windows | Combines windows into one tabbed window | |
| Enter/Exit Full Screen | | Only here if the app has no View menu; still keep separate Minimize and Zoom |
| Bring All to Front | Keeps position, size, layering; Option = Arrange in Front (tiled) | |
| *Open window names* | Brings window forward | Alphabetical; exclude panels and modal views |

**Help menu** (trailing end; Help Book format adds an automatic search field)
- Send *AppName* Feedback to Apple (opens Feedback Assistant); *AppName* Help (opens Help Viewer for Help Book content); additional items (registration, release notes) after a separator. Keep it short or link extras from the help content (`NSHelpManager`).

**Dynamic menu items** (change when a modifier key is held: Control, Option, Shift, or Command; e.g. Minimize becomes Minimize All with Option)
- Never the only way to do a task; they are hidden shortcuts.
- Use mainly in menu bar menus, not context or Dock menus.
- Require a single modifier key only (`isAlternate`).
- macOS sizes menu width to the widest item including dynamic ones.

**Platform notes**
- Not supported on iOS, tvOS, visionOS, watchOS.
- iPadOS: revealed by moving the pointer to the top edge or swiping down; occupies the status bar's space.

  | | iPadOS | macOS |
  |---|---|---|
  | Visibility | Hidden until revealed | Visible by default |
  | Alignment | Centered | Leading side |
  | Menu bar extras | Not available | System and custom |
  | Window controls | In menu bar when app is full screen | Never in menu bar |
  | Apple menu | Not available | Always present |
  | App menu | No About, Services, or visibility items | Full |

  - Make every function reachable in the UI (menu bar often hidden; dynamic items need a hardware keyboard). Not a dumping ground.
  - *AppName* > Settings opens your iPadOS Settings page only; in-app preferences go in a separate item beneath it.
  - Tab-based apps: list tabs in the View menu with key bindings. Rows are taller than on Mac, so use submenus more.
- macOS:
  - Apple menu is first, system-defined, unmodifiable. Under space pressure the system may tighten spacing and truncate titles. Hidden in full screen until the pointer reaches the top.
  - **Menu bar extras** (`MenuBarExtra`): trailing-side icon available while the app runs; the system may hide extras when crowded.
    - Use a black-and-clear symbol or icon so the system can tint it. Menu bar height is 24 pt.
    - Click shows a menu, not a popover, unless too complex.
    - People opt in (setting, optionally offered during setup); never depend on its visibility or position; mirror its functions elsewhere (Dock menu).

APIs: `CommandMenu` (SwiftUI), UIKit menu bar APIs, `NSStatusBar`.

## Toolbars
Source: https://developer.apple.com/design/human-interface-guidelines/toolbars

Horizontal sets of controls along the top or bottom edge of a view, grouped in logical sections. Content types: the current view's title; navigation (back, forward, search fields); actions/bar items (buttons, menus). Toolbars act on the view's content and orient people; tab bars, by contrast, navigate between app areas. In iOS a navigation-focused toolbar is also called a navigation bar.

**Best practices**
- Do not overcrowd; define which items overflow as width shrinks. macOS and iPadOS add the overflow menu automatically: never add one manually, and avoid layouts that overflow by default.
- Add a More menu for lower-priority actions only if everything cannot fit.
- iPadOS and macOS: consider toolbar customization for many items, advanced features, or long-session apps.
- Liquid Glass: minimize custom toolbar backgrounds and tinted controls (they fight system effects). Let the content layer drive color and use a `ScrollEdgeEffectStyle` to separate toolbar from content when needed.
- Do not color item labels like the content-layer background; with bright content, keep the default monochrome toolbar appearance (see Liquid Glass color).
- Prefer standard components: buttons, text fields, headers, footers have corner radii concentric with the bar's corners. Custom components must also be concentric.
- Consider temporarily hiding toolbars for distraction-free reading, contextually, with reliable ways to restore them (see Going full screen; visionOS: Immersive experiences).

**Titles**
- Give each window a useful title to confirm location and distinguish windows. Leaving it empty is fine when redundant (Notes single window), but separate windows get titled with the note's first line.
- Never use the app name as a title.
- Keep titles concise: a word or short phrase under 15 characters.

**Navigation**
- Use the standard Back and Close buttons with their standard symbols; do not use text labels reading "Back" or "Close". Custom versions must look and behave the same and be used consistently.

**Actions**
- Prioritize commands for the main tasks (most frequent, or tied to the most important objects).
- Make each item's meaning obvious. Prefer simple recognizable symbols over text, except for actions like Edit that symbols represent poorly.
- Prefer system symbols without borders (no outlined circle symbols): the section already provides a container, and the system handles hover and selection states, coloring, vibrancy.
- Use the `.prominent` style for the key action (Done, Submit): it separates and tints it. Only one primary action, on the trailing side.

**Item groupings**

| Area | Contents | Behavior |
|---|---|---|
| Leading edge | Back to previous document, sidebar show/hide, then the view title, then optional document menu (Duplicate, Rename, Move, Export) | Not customizable, always available |
| Center | Common useful controls; title if not at leading edge | Customizable on macOS/iPadOS; collapses into system overflow when narrow |
| Trailing edge | Must-stay-available items, inspector buttons, optional search field, More menu (also hosts customization), primary action like Done | Visible at all window sizes |

- Pin items to leading, center, or trailing and insert spacing as needed.
- Group by function and frequency (Keynote: presentation commands, playback, object insertion).
- Put navigation and critical actions (Done, Close, Save) in dedicated, familiar, visually distinct sections.
- Keep groupings and placement consistent across platforms.
- Minimize groups: about three maximum.
- Separate text-labeled actions from symbol actions (they can read as one combined button); separate multiple text buttons with fixed space (`UIBarButtonItem.SystemItem.fixedSpace`).

**Platform notes**
- tvOS: none.
- iOS: include only the most important items, rest in a More menu. Use a large title (`prefersLargeTitles`) that collapses to standard on scroll and returns at the top.
- iPadOS: a toolbar and a tab bar can share the same top horizontal space, keeping full width for content.
- macOS: the toolbar lives in the window frame, below or integrated with the title bar; titles may sit inline with controls; items have no bezel. Every toolbar item must also exist as a menu bar command (toolbars can be hidden or customized); not every menu command needs a toolbar item.
- visionOS:
  - System toolbar sits along the window's bottom edge, above window controls, slightly in front along z; a variable blur keeps items legible over scrolling content while the glass stays uniform. Looking at a symbol item reveals its text label. Prefer it (eye/hand optimized, auto-positioned).
  - No vertical toolbars (tab bars are vertical in visionOS).
  - Prevent windows from resizing narrower than the toolbar; there is no menu bar fallback.
  - In modal states (multistep photo edit), show contextual toolbar controls and restore standard ones on exit.
  - Avoid pull-down menus in toolbars: hard to discover, and they can cover window controls below the bottom edge.
- watchOS:
  - Toolbar buttons go in the top corners (`topBarLeading`, `topBarTrailing`) or along the bottom (`bottomBar`); above scrolling content they stay visible as content scrolls beneath.
  - A scrolling toolbar button (`primaryAction`) is hidden until people scroll up. Use it for an important action that is not the view's primary function (Mail Inbox New Message).

APIs: SwiftUI Toolbars, `UIToolbar`, `NSToolbar`.

# Navigation and search

## Path controls
Source: https://developer.apple.com/design/human-interface-guidelines/path-controls

macOS only. Shows the file-system path of a selected file or folder (Finder View > Show Path Bar at the bottom of the window; shows the window's folder if nothing is selected).

| Style | Behavior |
|---|---|
| Standard | Linear list: root disk, parent folders, selected item, each with icon and name. When too long, names between first and last items are hidden. If editable, dragging an item onto it selects it and shows its path |
| Pop up | Like a pop-up button showing the selected item's icon and name; clicking shows a menu of root, parents, item. If editable, the menu adds a Choose command, and drag-to-select works |

- Place path controls in the window body, never in the window frame (toolbars, status bars). Finder's sits at the bottom of the body, not in a status bar.

API: `NSPathControl`. Not supported on iOS, iPadOS, tvOS, visionOS, watchOS.

## Search fields
Source: https://developer.apple.com/design/human-interface-guidelines/search-fields

Editable text field with a Search icon, Clear button, and placeholder text; can add scope bars and tokens to filter. Entry-point patterns differ per platform. Systemwide search guidance lives in Searching.

**Best practices**
- Use placeholder text to state the search scope or what content is searchable.
- Start searching as people type when possible; refine results live.
- Offer suggestions: recent searches before typing, predictive suggestions while typing.
- Put the most relevant results first; consider categorizing results.
- Consider filtering results, e.g. a scope bar in the results area.

**Scope bars and tokens**
- *Scope bar*: control for filtering or adjusting search scope among clearly defined categories (Mail on iPhone: all mailboxes vs current mailbox).
- Default to the broader scope; let people narrow it.
- *Token*: an encapsulated, selectable, editable search term that filters other terms (a specific contact in Mail; photos in Messages). macOS counterpart: token fields.
- Pair tokens with search suggestions so people learn which tokens exist.

**Platform notes**
- visionOS: none.
- iOS: three entry points (choose by layout, content, navigation):
  1. **Search as a tab** in the tab bar (always available across sections).
     - *Standard tab*: looks like other tabs; opens a landing page with the field on top. Use for suggestions and discovery (Apple TV genres).
     - *Button appearance*: separate button that focuses the field with keyboard at once. Use for quick, transient lookups; exit returns to the previous tab.
  2. **Search in a toolbar**:
     - Bottom toolbar: expanded field or button by available space; tapping animates into a field above the keyboard. Top toolbar (navigation bar): a button that animates into a field above the keyboard, or at the top if no bottom space.
     - Prefer the bottom when there is room: alone (Settings) or beside other controls (Mail, Notes).
     - Use the top when bottom content must not be covered or there is no bottom toolbar (Wallet's pass stack at the bottom).
  3. **Inline field** with content: when searching within a single view and proximity clarifies scope (Music library filter while main search is a tab); useful with multiple search fields or location-dependent scope. At the top, place it above the list it searches and consider pinning it to the top toolbar on scroll.
- iPadOS, macOS (keep consistent across both):
  - Default: field at the trailing side of the toolbar, especially for split views (Mail, Notes, Voice Memos) or detail-view results (Freeform).
  - Top of the sidebar when filtering sidebar navigation (Settings).
  - Sidebar item or tab for a dedicated discovery area with suggestions, categories, recents (Music, TV).
  - In a dedicated search area, focus the field immediately on arrival, except on iPad with only a virtual keyboard (leave unfocused so the keyboard does not cover the view).
  - Handle window resizing: the iPad field resizes fluidly like on Mac; in compact iPad widths keep search where most useful (Notes, Mail move it above the content-list column).
- tvOS: a search screen is a specialized keyboard screen with fully customizable results beneath (`UISearchController`). Provide popular, contextual, and recent suggestions to minimize typing.
- watchOS: tapping the field opens a full-screen text input; returns only after Cancel or Search.

APIs: `searchable(text:placement:prompt:)` (SwiftUI), `UISearchBar`, `UISearchTextField`, `NSSearchField`.

## Sidebars
Source: https://developer.apple.com/design/human-interface-guidelines/sidebars

Leading-side navigation between app areas or top-level collections (folders, playlists). Needs lots of horizontal and vertical space; when space is tight, a tab bar may be better, and many apps can use a tab bar style that offers both.

**Best practices**
- Liquid Glass: on iOS, iPadOS, macOS sidebars float above content in the Liquid Glass layer. Extend rich content beneath the sidebar via horizontal scrolling or a *background extension effect* that mirrors adjacent content under the sidebar (`backgroundExtensionEffect()`).
- Let people customize which areas appear and their order when possible.
- Use disclosure controls to group large hierarchies and limit vertical length.
- Use familiar SF Symbols for items; for custom icons create custom symbols rather than bitmaps.
- Let people hide it with familiar interactions (iPadOS edge swipe; macOS button or View > Show/Hide Sidebar); rarely needed on visionOS. Never hidden by default.
- Max two hierarchy levels (deeper: split view with a content list); title groups with short labels.
- Icons use the accent color; on macOS they must follow the user's system accent. Fixed colors only sparingly for meaning (Mail VIP yellow).

**Platform notes**
- tvOS: none. watchOS: not supported.
- iOS, iPadOS:
  - `sidebarAdaptable` tab view style: choose whether the app opens with sidebar or tab bar; both include a toggle button; adapts per platform, rotation, and window width.
  - Sidebar only: `NavigationSplitView` (primary pane) or `UISplitViewController`.
  - Consider a tab bar first (more room for content); its convertible sidebar appearance can expose less-frequent areas.
  - Without SwiftUI, use `UICollectionLayoutListConfiguration.Appearance.sidebar`.
- macOS:
  - Row height, text, and glyph size follow sidebar size (small, medium, large), settable in code and by people in General settings (sidebar icon size).
  - Consider auto-collapsing/revealing the sidebar as the window resizes (Mail).
  - Do not put critical info or actions at the bottom of a sidebar; window bottoms often end up offscreen.
- visionOS: for deep hierarchies, consider a sidebar inside a tab for secondary navigation; sidebar selections must never switch the active tab.

APIs: `sidebarAdaptable`, `NavigationSplitView`, `sidebar` (SwiftUI), `UICollectionLayoutListConfiguration`, `NSSplitViewController`.

## Tab bars
Source: https://developer.apple.com/design/human-interface-guidelines/tab-bars

Navigates between top-level sections, communicates what the app offers, and preserves each section's navigation state when switching.

**Best practices**
- Navigation only, never actions (actions go in a toolbar).
- Keep it visible across sections; only a modal may cover it.
- Use as few tabs as needed; for complex structures use a sidebar or sidebar-adaptable tab bar.
- Avoid overflow: on iOS and iPadOS the trailing tab becomes a More tab that hides the rest.
- Never disable or hide tab buttons, even when content is unavailable; explain why an empty section is empty.
- Always include labels (beneath or beside the icon), single words when possible.
- Use SF Symbols for scalable, context-adaptive icons. Compact: icon above label; regular: icon and label side by side. Prefer filled symbols. Custom icon dimensions are in Apple Design Resources.
- Badges (red oval, white text, number or exclamation point) only for critical new or updated info; overuse dilutes them.
- Liquid Glass: do not color tab labels like content-layer backgrounds; with colorful content prefer a monochrome tab bar or a clearly differentiated accent color.

**Platform notes**
- macOS: none. watchOS: not supported.
- iOS:
  - Floats above content at the bottom of the screen on a Liquid Glass background that lets content show through.
  - With an attached accessory (Music MiniPlayer), you may minimize the tab bar on scroll down and move the accessory inline; tapping a tab or scrolling to top restores it (`TabBarMinimizeBehavior`, `UITabBarController.MinimizeBehavior`, accessory placement via `TabViewBottomAccessoryPlacement`).
  - May include a dedicated search tab at the trailing end (see Search fields).
- iPadOS:
  - Appears near the top of the screen, either fixed (`tabBarOnly`) or with a button converting it to a sidebar (`sidebarAdaptable`). For a sidebar with no tab-bar option, use a navigation split view.
  - Prefer a tab bar for primary navigation; offer sidebar conversion for complex apps.
  - Let people customize tabs (add favorites such as a Music playlist, remove rarely used). Keep the default to five or fewer tabs for continuity between compact and regular sizes (`TabViewCustomization`, `UITab.Placement`).
- tvOS:
  - Customizable: background tint/color/image, item fonts (distinct for selected), selected/unselected tints, icon buttons (settings, search). Translucent by default, selected tab opaque, with a drop shadow when focused.
  - Fixed metrics: height 68 pt, top edge 46 pt from the top of the screen (not changeable).
  - Too many items: rightmost item fades out from the right; if scrolling is needed, a fade also starts from the left.
  - Scrolling: with a single main view the tab bar scrolls offscreen (TV app Watch Now, Movies, TV Shows, Sports, Kids); with a split view (TV Library, Settings) it stays pinned. Pressing Menu on the remote always returns focus to the tab bar at the top.
  - Live-viewing apps order tabs: live content, then cloud DVR/recorded, then other content.
- visionOS:
  - Always vertical, fixed relative to the window's leading side; expands when looked at; look and tap to open a tab. Expanded, it may cover content temporarily.
  - Provide a symbol (always visible) and a short text label (revealed on look) for each tab.
  - For deep hierarchies, a sidebar inside a tab is fine; sidebar selections must not change the open tab.

APIs: `TabView`, `TabViewBottomAccessoryPlacement` (SwiftUI), `UITabBar`.

## Token fields
Source: https://developer.apple.com/design/human-interface-guidelines/token-fields

macOS only. A text field that converts text into selectable, draggable *tokens* (Mail address fields: recipients become tokens that can be reordered or dragged to another field). Can show suggestions while typing (Mail recipients); each token can carry a context menu (edit name, mark as VIP, show contact card). Tokens can also represent search terms (see Search fields).

- Add a context menu with useful info or options per token.
- Typing a comma creates a token by default; consider extra triggers such as Return.
- Suggestions appear immediately by default; consider adding a delay so they do not distract while typing.

API: `NSTokenField`. Not supported on iOS, iPadOS, tvOS, visionOS, watchOS.
