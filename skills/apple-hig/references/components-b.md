# Components: presentation, selection and input, status, system experiences

Distilled from Apple's Human Interface Guidelines (live pages, current as of November 2026, Liquid Glass era). Rules are paraphrased as imperative, reviewable checks. Numbers, API names and platform availability are kept exact. Where a page has a change log, the most recent dated changes are noted so an agent can tell which guidance is new.

## Table of contents

- [Presentation](#presentation)
  - [Action sheets](#action-sheets)
  - [Alerts](#alerts)
  - [Page controls](#page-controls)
  - [Panels](#panels)
  - [Popovers](#popovers)
  - [Scroll views](#scroll-views)
  - [Sheets](#sheets)
  - [Windows](#windows)
- [Selection and input](#selection-and-input)
  - [Color wells](#color-wells)
  - [Combo boxes](#combo-boxes)
  - [Digit entry views](#digit-entry-views)
  - [Image wells](#image-wells)
  - [Pickers](#pickers)
  - [Segmented controls](#segmented-controls)
  - [Sliders](#sliders)
  - [Steppers](#steppers)
  - [Text fields](#text-fields)
  - [Toggles](#toggles)
  - [Virtual keyboards](#virtual-keyboards)
- [Status](#status)
  - [Activity rings](#activity-rings)
  - [Gauges](#gauges)
  - [Progress indicators](#progress-indicators)
  - [Rating indicators](#rating-indicators)
- [System experiences](#system-experiences)
  - [App Shortcuts](#app-shortcuts)
  - [Complications](#complications)
  - [Controls](#controls)
  - [Live Activities](#live-activities)
  - [Notifications](#notifications)
  - [Snippets](#snippets)
  - [Status bars](#status-bars)
  - [Top Shelf](#top-shelf)
  - [Watch faces](#watch-faces)
  - [Widgets](#widgets)

### Quick chooser: which modal or transient surface?

| Need | Use | Avoid |
|---|---|---|
| Critical, unexpected info that needs a decision now (problem, data loss, purchase confirm) | Alert | Popover (easy to miss), notification (for errors) |
| Choices that clarify an action the person just started (save or delete a draft) | Action sheet (`confirmationDialog`) | Alert (no extra choices), menu (people expect to open menus themselves) |
| Scoped task closely tied to the current context (attach file, pick save location) | Sheet | Stacking sheets, sheets for long multistep flows |
| Small amount of info or a few related controls, transient | Popover (regular width only) | Popover in compact width, popover for warnings |
| Supplementary controls that track the selection, Mac | Panel (inspector) or split view pane | Sheet when people must repeatedly act and observe results |
| Long or immersive task | Full-screen modal (iOS), new window or full screen (macOS), Full Space (visionOS) | Sheet |

---

# Presentation

## Action sheets

Source: https://developer.apple.com/design/human-interface-guidelines/action-sheets

A modal view offering choices tied to an action the person initiated.

APIs: SwiftUI `confirmationDialog(_:isPresented:titleVisibility:actions:)` (all platforms); UIKit `UIAlertController.Style.actionSheet` (iOS, iPadOS, tvOS). Destructive style: SwiftUI `destructive`, UIKit `UIAlertAction.Style.destructive`.

**Best practices**
- Use an action sheet, not an alert, when offering choices that follow from a deliberate action (example: cancelling a Mail draft offers delete or save). Alerts are for unexpected problems or state changes and offer no extra related choices.
- Use sparingly: every action sheet interrupts the task.
- Keep the title to one line; long titles truncate or force scrolling.
- Add a message only when the title plus context is not enough.
- When an action could destroy data, include Cancel. Place it at the bottom (upper-left corner of the sheet on watchOS). SwiftUI confirmation dialogs add Cancel automatically.
- Give destructive buttons the destructive style and put them at the top, where they are most noticed.

**Platform notes**
- macOS, tvOS: nothing extra. visionOS: not supported.
- iOS, iPadOS: prefer an action sheet over a menu for action-related choices (menus are expected only when people choose to reveal them). Do not let an action sheet scroll: more buttons means slower decisions and accidental taps while scrolling.
- watchOS: system style = title, optional message, Cancel, one or more buttons. Three button styles:

| Style | Meaning |
|---|---|
| Default | No special meaning |
| Destructive | Destroys user data or performs a destructive action |
| Cancel | Dismisses without acting |

- watchOS: max 4 buttons including the required Cancel, so at most 3 other choices.

## Alerts

Source: https://developer.apple.com/design/human-interface-guidelines/alerts

A modal view delivering critical information people need immediately: a problem, a warning before destroying data, a chance to confirm a purchase or other important action.

APIs: SwiftUI `alert(_:isPresented:actions:)`, UIKit `UIAlertController`, AppKit `NSAlert` (`accessoryView` for custom view).

**Best practices**
- Use sparingly; every alert must carry essential info and useful actions.
- Do not use an alert just to inform. Surface non-actionable info in context (Mail shows a tappable connection indicator instead).
- Do not alert for common, undoable actions even if destructive (deleting an email). Do alert for uncommon destructive actions that cannot be undone.
- Never show an alert at app launch. For startup problems (no network), show cached or placeholder content plus a nonintrusive label.

**Content**
- All platforms: title, optional informative text, up to 3 buttons.
- iOS, iPadOS, macOS, visionOS: can include a text field.
- macOS, visionOS: can include an icon and an accessory view.
- macOS: can add a suppression checkbox and a Help button.
- Tone: direct, neutral, approachable. Do not be vague, accusatory, or downplay severity.
- Title: say what happened, where and why, specifically and briefly. Never "Error" or "Error 329347 occurred". Max two lines. Full sentence title = sentence case plus ending punctuation; fragment = title case, no punctuation.
- Informative text: only if it adds value; short, complete sentences, sentence case, punctuated.
- Do not explain the buttons. If guidance is unavoidable, say "choose" (device-neutral) and use the exact button title without quotes.
- Include a text field only when input is required to resolve the situation (for example a secure field for a password).

**Buttons**
- One or two words describing the result; prefer verbs tied to the alert text ("View All", "Reply", "Ignore"). Sentence case, no ending punctuation.
- "OK" only in purely informational alerts. Never "Yes"/"No". Use specific verbs ("Erase", "Convert", "Clear", "Delete") for confirmations.
- Always title the cancelling button "Cancel".
- Placement: most likely choice on the trailing side of a row or top of a stack. Default button always trailing (row) or top (stack). Cancel usually leading (row) or bottom (stack).
- Destructive style only for a destructive action the person did not deliberately choose. If they explicitly chose "Empty Trash", do not style that confirm button destructive (Return to confirm is the convenience they want).
- With any destructive action, include Cancel as the safe exit. Never make Cancel the default. To force reading, make no button the default. If a single button must be default, title it "Done", not "Cancel".
- Support quick cancel paths:

| Action | Platform |
|---|---|
| Exit to the Home Screen | iOS, iPadOS |
| Escape (Esc) or Command-Period on an attached keyboard | iOS, iPadOS, macOS, visionOS |
| Menu on the remote | tvOS |

**Platform notes**
- tvOS, watchOS: nothing extra.
- iOS, iPadOS: use an action sheet for choices related to an intentional action. Avoid scrolling alerts: short titles, brief messages, test at large text sizes.
- macOS: app icon shown automatically (can substitute an icon or symbol). Can let people suppress repeating alerts, append an accessory view, include a Help button. Use a caution symbol (`exclamationmark.triangle`) sparingly, only for real risk such as unexpected data loss; not for routine overwrite or Empty Trash.
- visionOS: in the Shared Space the alert appears in front of the window, slightly forward on the z-axis, and stays anchored to the window if moved. In a Full Space it centers in the field of view. Accessory view: max height 154 pt, 16 pt corner radius.

## Page controls

Source: https://developer.apple.com/design/human-interface-guidelines/page-controls

A row of indicator dots, one per page of a flat ordered list; the solid dot is the current page. Dots are equidistant and clip when there are too many.

APIs: SwiftUI `PageTabViewStyle`; UIKit `UIPageControl`, `preferredIndicatorImage`, `setIndicatorImage(_:forPage:)`, `backgroundStyle`, `UIPageControl.InteractionState`.

**Best practices**
- Use only for ordered, sequential pages. For hierarchy or nonsequential content use a sidebar or split view.
- Center horizontally near the bottom of the view.
- Keep to about 10 dots or fewer; beyond that use another arrangement (grid) that allows any order.

**Custom indicators**
- Default is a system dot; you can set one default custom image and a distinct image for specific pages (Weather uses `location.fill` for the current location).
- Keep custom images simple: no negative space, text, or inner lines. Prefer simple SF Symbols.
- Customize the default image only when it adds meaning (`bookmark.fill` if every page is a bookmark set).
- Use no more than 2 different indicator image types.
- Do not color indicators; let the system color them for contrast.

**Platform notes**
- macOS: not supported.
- iOS, iPadOS: the control highlights the current dot and can shrink edge dots to suggest more pages. Tap (discrete) on either side of the current dot moves one page; scrub (continuous) by touch and drag moves sequentially, and scrubbing past an edge jumps to first or last. iPadOS pointer can target a specific dot. Do not animate page transitions during scrubbing (lag, flashes); animate only on tap.
- iOS, iPadOS background styles:

| Style | Behavior | Use when |
|---|---|---|
| Automatic | Background only during interaction | Page control is not the primary navigation |
| Prominent | Background always visible | Page control is the primary navigation on screen |
| Minimal | Never shows background | Only showing position; no scrubbing feedback needed |

- Do not support scrubbing with the minimal style (no feedback).
- tvOS: use for collections of full-screen peer pages; extra controls make focus hard.
- visionOS: indicators show pages but are not interactive.
- watchOS: appears at the bottom for horizontal paging, or beside the Digital Crown for a vertical tab view (where it shows position within the page and within the set). Prefer vertical pagination with distinct, purposeful pages navigated by the Crown. Aim for one screen height per page; put variable-height pages after fixed-height ones.

## Panels

Source: https://developer.apple.com/design/human-interface-guidelines/panels

macOS only. A panel floats above windows with supplementary controls, options, or info for the active window or selection. Less prominent than a window; can use a dark translucent HUD style. On other platforms use a modal view instead.

APIs: AppKit `NSPanel`, `hudWindow`.

**Best practices**
- Use for quick access to controls or info about the current content or selection.
- Use a panel for an inspector (contents follow the selection). For an Info window whose contents stay fixed, use a regular window. A split view pane is another inspector option.
- Prefer simple direct adjustment controls (sliders, steppers) over text entry or item selection.
- Give it a title bar and a short noun title in title case ("Fonts", "Colors", "Inspector").
- When the app becomes active, bring all its open panels forward; hide all panels when the app is inactive.
- Do not list panels in the Window menu's documents list (show/hide commands are fine).
- Generally do not enable the minimize button.
- In menus refer to panels by title without the word "panel" ("Show Fonts", "Show Inspector"). In help, use the title or title plus "window" ("Fonts window").

**HUD-style panels**
- Prefer standard panels. Use a HUD only in media apps (movies, photos, slides), when a standard panel would hide essential content, and when you need no controls (most system controls except the disclosure triangle do not match a HUD).
- Keep one panel style across modes (if HUD in full screen, keep HUD when leaving it).
- Use color sparingly; small high-contrast accents only.
- Keep HUDs small; never obscure the content being adjusted.

**Platform notes**: not supported in iOS, iPadOS, tvOS, visionOS, watchOS.

## Popovers

Source: https://developer.apple.com/design/human-interface-guidelines/popovers

A transient view appearing above content when people click or tap a control or area.

APIs: SwiftUI `popover(isPresented:attachmentAnchor:arrowEdge:content:)`, UIKit `UIPopoverPresentationController`, AppKit `NSPopover`.

**Best practices**
- Show a small amount of info or a few related tasks; the popover closes after interaction.
- Use popovers to save space when content is needed only temporarily (instead of sidebars or panels).
- Point the arrow directly at the source element; do not cover the source or essential content.
- Add Close, Cancel or Done only when it clarifies (save vs discard). Otherwise dismiss on outside tap or on selection. For multi-select, stay open until explicitly dismissed or outside tap.
- Always save work when a nonmodal popover auto-closes; discard only on explicit Cancel.
- One popover at a time; never cascade popovers. Close the current one before opening another.
- Nothing may appear over a popover except an alert.
- Let one click or tap close a popover and open another (important for bar buttons that each open popovers).
- Size to content; the system may resize to fit. Animate size changes so it does not look like a replacement.
- In help text, do not say "popover"; name the task or control.
- Never use a popover for warnings; use an alert.

**Platform notes**
- visionOS: nothing extra. tvOS, watchOS: not supported.
- iOS, iPadOS: do not show popovers in compact size classes; use a sheet or full-screen modal there and reserve popovers for regular width.
- macOS: popovers can be made detachable, turning into a panel when dragged. Consider allowing detach; keep the detached panel visually close to the original popover.

## Scroll views

Source: https://developer.apple.com/design/human-interface-guidelines/scroll-views

Lets people move content larger than the view. No appearance itself; shows a translucent scroll indicator once scrolling starts (position near start, middle, end on iOS, iPadOS, macOS, visionOS, watchOS).

APIs: SwiftUI `ScrollView`, `PagingScrollTargetBehavior`, `ScrollEdgeEffectStyle`, `look`, `ScrollInputKind`; UIKit `UIScrollView`, `UIScrollEdgeEffect.Style`; AppKit `NSScrollView`, `NSScrollEdgeEffectStyle`; WatchKit `WKPageOrientation`.

**Best practices**
- Support system scroll gestures and keyboard shortcuts. Custom scrolling must keep elastic indicator behavior.
- Signal scrollable content (show partial content at the edge).
- Never nest scroll views with the same axis. Horizontal inside vertical (or the reverse) is fine.
- Consider page-by-page scrolling; page = view height or width, optionally minus an overlap unit (a line of text, a row) to keep context.
- Auto-scroll only as far as needed to keep context, in these cases: an operation selects or places the insertion point offscreen (find results); typing starts while the insertion point is offscreen; the pointer drags past the edge while selecting; the selection was scrolled away before acting on it.
- With zoom, set sensible min and max scale.

**Scroll edge effects (Liquid Glass)**
- iOS, iPadOS, macOS: a scroll edge effect visually separates floating UI (toolbars) from content scrolling beneath. Add it manually for custom bars if the top layer needs clarity. Styles: automatic (default), hard, soft.
- Prefer automatic: it gives more opaque separation for dense top toolbars, text outside Liquid Glass controls, and pinned table headers. If you choose soft, test legibility across many backgrounds.
- Use only when the scroll view is behind floating UI. It is functional, not decorative; it does not darken or block like an overlay.
- One scroll edge effect per view. In iPad and Mac split views each pane may have one; keep their heights consistent for alignment.

**Platform notes**
- iOS, iPadOS: with page-by-page mode, consider a page control, and hide the scroll indicator on the same axis.
- macOS: indicator is called a scroll bar. In tight panels, small or mini scroll bars are fine; use the same control size throughout that panel.
- tvOS: no visible indicators; the system scrolls to keep the focused item visible.
- visionOS: indicator is small and fixed-size, vertically centered on the trailing edge for vertical scrolling, horizontally centered at the bottom for horizontal. Looking at it and dragging enables a jog bar that controls scroll speed with tick marks. It is slightly thicker than iOS; widen tight margins so it does not overlap content.
- visionOS Look to Scroll (scrolling by gaze near the scroll view's edges): off by default, enable per scroll view. Support it for reading and browsing views. Do not support it for secondary content, control-dense views, or views needing precise scrolling (Notes enables it for the note, not the list). Be consistent across similar views. Prefer full-width or full-height scroll areas, or give inset areas clear boundaries. Remove scroll-position-driven custom effects (parallax, animations) before enabling it.
- watchOS: prefer vertical scrolling driven by the Digital Crown. Use vertically stacked tab views for paged full-screen content; the page indicator beside the Crown expands into a scroll indicator for long pages. Aim for one screen height per page; put variable-height pages after fixed ones.

Change log: June 8, 2026 updated scroll edge effect guidance; March 24, 2026 added Look to Scroll; July 28, 2025 added scroll edge effects.

## Sheets

Source: https://developer.apple.com/design/human-interface-guidelines/sheets

A sheet supports a scoped task closely related to the current context (provide info for an action, attach a file, pick a save location).

APIs: SwiftUI `sheet(item:onDismiss:content:)`, `presentationDetents` (detents), UIKit `UISheetPresentationController`, `prefersGrabberVisible`, `UIModalPresentationStyle` (`.fullScreen`, page sheet, form sheet), AppKit `presentAsSheet(_:)`.

**Anatomy**
- Always modal on macOS, tvOS, visionOS, watchOS. On iOS and iPadOS a sheet can be modal or nonmodal (Notes text formatting sheet affects the note while open).
- Buttons: Cancel (or Close) dismisses without saving; Done dismisses after completing or saving; Back goes to a previous step or parent and does not dismiss.

**Best practices**
- For complex or long flows use alternatives: full-screen modal on iOS and iPadOS (video, photos, camera, multistep editing), a new window or full screen on macOS, a Full Space on visionOS.
- Only one sheet at a time from the main interface. If a sheet triggers another, close the first, then optionally reopen it after the second is dismissed.
- For supplementary items affecting the parent while it stays interactive: split view (visionOS), panel (macOS), nonmodal sheet (iOS, iPadOS).
- Never offer Done alone: pair it with Cancel, or with Back in a multistep flow. Never show Cancel, Done and Back together.

**Platform notes**
- tvOS: nothing extra.
- iOS, iPadOS: single-view sheet = Cancel at the leading edge of the top toolbar, Done at the trailing edge. Multistep flows vary placement per step (updated March 2026).
- iOS, iPadOS detents: a resizable sheet expands on scroll or by dragging the grabber. System detents: large (fully expanded) and medium (about half). Custom detents allowed. Large is supported automatically; adding medium lets it rest at both; medium alone prevents full expansion.
- On iPhone, consider the medium detent for progressive disclosure (share sheet). Skip medium when content needs full height (Messages and Mail compose).
- Include a grabber on resizable sheets: it signals resizability, tap cycles detents, and works with VoiceOver.
- Support swipe down to dismiss. If there are unsaved changes, confirm with an action sheet.
- iPadOS: prefer page or form sheet styles (default size, centered over a dimmed background).
- macOS: a rounded card floating over a dimmed parent window. Pick a sensible default size; support resizing when expanding helps. People must still be able to bring other app windows forward without dismissing. When opening, bring the parent window and its document panels to the front. Use a panel instead when people repeatedly act and observe results (find and replace).
- visionOS: floats in front of a dimmed parent window and takes interaction. Do not slide it up from the bottom edge; center it in the field of view. Default size should not cover most of the window; consider allowing resize.
- watchOS: full-screen, slides over content, semitransparent with a blurring, desaturating background material. Use only when the modal task needs a custom title or custom content; otherwise use an alert or action sheet. Keep it brief and occasional; never use it for navigation. If you change the default dismiss label, prefer an SF Symbol and avoid anything that looks like a page title or hierarchical back navigation.

## Windows

Source: https://developer.apple.com/design/human-interface-guidelines/windows

Windows hold an app's views. On iPadOS, macOS and visionOS they bound content, enable multitasking, and come with system frames and controls to open, close, resize and move. Types: primary (main navigation and content) and auxiliary (one task, no navigation elsewhere, usually a close button).

APIs: SwiftUI `Windows`, `WindowGroup`, `OpenWindowAction`, `DefaultWindowStyle`, `PlainWindowStyle`, `VolumetricWindowStyle`, `ornament(visibility:attachmentAnchor:contentAlignment:ornament:)`; UIKit `UIWindow`, `UIWindowScene.ActivationInteraction`, `collectionView(_:sceneActivationConfigurationForItemAt:point:)`, `QLPreviewSceneActivationConfiguration`; AppKit `NSWindow`.

**Best practices**
- Make windows adapt fluidly to any size for multitasking.
- Open new windows deliberately (Mail compose opens one so the message and inbox are both visible). Do not open new windows by default unless it clearly helps.
- Offer "open in new window" via context menu or File menu.
- Never build custom window frames or controls or imitate system ones.
- Call them "windows" in UI copy; never "scenes".

**Platform notes**
- iOS, tvOS, watchOS: not supported.
- iPadOS: two modes chosen in Multitasking & Gestures settings: Full screen (app switcher to move between windows) and Windowed (freely resizable, overlapping, size and position remembered). In windowed mode, window controls sit at the leading edge of the toolbar; shift leading toolbar buttons inward so they are not hidden. Consider a gesture (pinch to expand a Notes item) to open content in a new window. To show a single file you can skip creating your own window, but you must support multiple windows.
- macOS anatomy: frame (window controls, toolbar, rare bottom bar) and body. States: Main (frontmost, one per app), Key (active, accepts input, one onscreen; a panel can be key instead), Inactive (no material, subdued). Key windows show colored close/minimize/zoom; others gray. Some panels become key only on title bar click or text input. Custom windows must use the system state appearances. Never put critical info or actions in a bottom bar (often hidden off screen); limit it to small contextual info like Finder's status bar, else use an inspector.
- visionOS styles: window (default) and volume (volumetric); both can show 2D and 3D, in Shared Space and Full Space. Plain style = default without the glass background. The system sets the first window's position; people can move it.
- visionOS windows: upright plane with unmodifiable glass material, close button, window bar, resize controls; may add Share button, tab bar, toolbar, ornaments. Dynamic scale keeps apparent size constant with distance. Prefer windows for familiar UI-centric tasks. Keep the glass background (removing it hurts legibility and cohesion; opaque backgrounds feel heavy and hide surroundings). Default size 1280x720 pt, placed about 2 m away, apparently about 3 m wide; avoid empty space. Match initial shape to content (Keynote wide, Safari tall). Set min and max sizes. Minimize 3D depth inside windows; the system clips content that extends too far, so use a volume for deep 3D.
- visionOS volumes: show 2D or 3D content viewable from any angle; close button and window bar turn to face the viewer. Prefer volumes for rich 3D. Place 2D content so it reads from many angles; pin it to 3D content with attachments. Generally use dynamic scaling; fixed scaling (the default) suits real-world objects like retail products. visionOS 2+: the baseplate glows when looked at to show edges; disable it if content fills the volume or you draw a custom baseplate. visionOS 2+: a volume can add an ornament besides toolbar and tab bar; anchor it (`topBack`, `bottomFront`), do not share an edge with the toolbar or tab bar, and add at most one extra ornament. Choose alignment: parallel to floor for low-interaction content, tilting with gaze for content people use (works when reclining).

---

# Selection and input

## Color wells

Source: https://developer.apple.com/design/human-interface-guidelines/color-wells

A control that opens a color picker (system or custom) to set the color of text, shapes, guides and more.

APIs: UIKit `UIColorWell`, `UIColorPickerViewController`; AppKit `NSColorWell`.

- Prefer the system color picker: familiar, consistent across iOS, iPadOS and macOS, and lets people save colors usable in any app.

**Platform notes**
- iOS, iPadOS, visionOS: nothing extra. tvOS, watchOS: not supported.
- macOS: clicking highlights the well, then opens the picker; the well updates after selection. Supports drag and drop between wells and from the picker to a well.

## Combo boxes

Source: https://developer.apple.com/design/human-interface-guidelines/combo-boxes

macOS only (`NSComboBox`). A text field plus pull-down button: type a custom value or pick from a list. Custom entries are not added to the list.

- Prefill a meaningful default drawn from the list (need not be the first item).
- Add an introductory label in title case ending with a colon.
- List the most likely choices.
- Keep list items no wider than the field to avoid truncation.

**Platform notes**: not supported in iOS, iPadOS, tvOS, visionOS, watchOS.

## Digit entry views

Source: https://developer.apple.com/design/human-interface-guidelines/digit-entry-views

tvOS only (`TVDigitEntryViewController`). Full-screen view prompting for a series of digits (PIN) with a digit keyboard; optional title and prompt above the digits.

- Use secure digit fields (asterisks) for any sensitive data.
- Use the title and prompt to explain why digits are needed.

**Platform notes**: not supported in iOS, iPadOS, macOS, visionOS, watchOS.

## Image wells

Source: https://developer.apple.com/design/human-interface-guidelines/image-wells

macOS only (`NSImageView`). An editable image view: select to copy, paste or delete; drag a new image in without selecting.

- If an image is required, restore the default image when people clear the well.
- If copy and paste are supported, expose the standard Edit menu items and shortcuts.

**Platform notes**: not supported in iOS, iPadOS, tvOS, visionOS, watchOS.

## Pickers

Source: https://developer.apple.com/design/human-interface-guidelines/pickers

One or more scrollable lists of distinct values. Values and order depend on device language (date pickers: on device location). Date pickers add calendar and keypad entry.

APIs: SwiftUI `Picker`, `DatePicker`, `navigationLink` (watchOS); UIKit `UIDatePicker`, `UIPickerView`; AppKit `NSDatePicker`.

**Best practices**
- Use for medium to long lists. Short lists: pull-down button. Very large sets: list or table (adjustable height, index).
- Order values predictably (alphabetical countries) so hidden values can be anticipated.
- Show the picker in context (below or near the field, bottom of window, or popover); do not switch views to show it.
- Reduce minute granularity when useful; the interval must divide 60 evenly (0, 15, 30, 45). Default is 60 values (0 to 59).

**Platform notes**
- visionOS: nothing extra.
- iOS, iPadOS date picker styles: Compact (button showing value in accent color; opens a modal calendar and time editor, confirm by tapping outside), Inline (time only: wheels; date and time: inline calendar), Wheels (also accepts keyboard entry), Automatic (system chooses).
- iOS, iPadOS modes: Date (month, day, year); Time (hours, minutes, optional AM/PM); Date and time; Countdown timer (hours and minutes up to 23 h 59 min, not available in inline or compact).
- Use compact when space is tight.
- macOS: textual style (limited space, precise entry) or graphical style (browse calendar, select a range, clock face).
- tvOS: available via SwiftUI `Picker`.
- watchOS: navigate with the Digital Crown; wheels style for lists and date/time; optional outline, caption, scroll indicator. Long lists appear as a navigation-link button that opens the list; people can also scrub with the Crown without tapping.

## Segmented controls

Source: https://developer.apple.com/design/human-interface-guidelines/segmented-controls

A linear set of two or more segments, each acting as a button, usually equal width, with text or images and optional labels below. Single choice (macOS also allows multiple choice), or momentary action buttons without selection state (Mail's Reply, Reply All, Forward).

APIs: SwiftUI `segmented`; UIKit `UISegmentedControl` (`isMomentary`); AppKit `NSSegmentedControl` (`SwitchTracking.momentary`).

**Best practices**
- Use for closely related choices affecting an object, state or view.
- Use when grouping or visible selection state matters; segments keep their grouping at any size.
- Never mix action segments and selection segments in one control.
- Limit segments: about 5 to 7 in wide layouts, about 5 on iPhone.
- Keep segment widths (and icon and title widths) consistent.

**Content**
- Use either text or images in a control, not both.
- Keep content sizes similar across segments.
- Labels: nouns or noun phrases, title case. A text-labeled control needs no introductory text.

**Platform notes**
- watchOS: not supported.
- iOS, iPadOS: good for switching closely related subviews (Calendar New Event vs New Reminder). For separate app sections use a tab bar.
- macOS: consider introductory text; add per-segment labels for symbol-only segments; give each segment a tooltip if the app uses tooltips. For view switching in the main window use a tab view; segmented controls suit toolbars and inspectors. Consider spring loading (force click while dragging items over a segment).
- tvOS: for content filtering prefer a split view. Keep other focusable elements away, because segments select on focus, not click.
- visionOS: looking at an icon segment shows a tooltip with your descriptive text.

## Sliders

Source: https://developer.apple.com/design/human-interface-guidelines/sliders

A horizontal track with a thumb between min and max; the min-to-thumb portion fills with color; optional min and max icons.

APIs: SwiftUI `Slider`; UIKit `UISlider`; AppKit `NSSlider`.

**Best practices**
- Customize (track color, thumb image and tint, end icons) only when it clarifies intent (small image icon left, large right for image size).
- Directions: min leading and max trailing for horizontal; min bottom and max top for vertical.
- For wide ranges, pair with a text field (exact value) and a stepper (whole increments).

**Platform notes**
- tvOS: not supported.
- iOS, iPadOS: never use a slider for audio volume; use the system volume view (includes output device picker).
- macOS: tick marks available. Linear thumb is a narrow lozenge; circular slider thumb is a small circle with dot ticks. Give live feedback while dragging (Dock size). Horizontal for fixed endpoints (opacity 0 to 100 percent); circular for repeating or unbounded values (rotation 0 to 360 degrees, or spins where 4 spins = 1440 degrees). Introduce with a label in sentence case ending with a colon. Use tick marks for accuracy; label ticks only as needed (often min and max; periodic labels for nonlinear scales). Add a tooltip showing the thumb's value on hover.
- visionOS: prefer horizontal sliders (side-to-side gestures are easier).
- watchOS: discrete steps or continuous bar, with side buttons that change the value by a set amount. Default glyphs are plus and minus; provide custom glyphs if needed.

## Steppers

Source: https://developer.apple.com/design/human-interface-guidelines/steppers

A two-segment control to increment or decrement a value. It shows no value itself, so it sits beside a field.

APIs: UIKit `UIStepper`; AppKit `NSStepper`.

- Make obvious which value the stepper changes.
- Pair with a text field when large changes are likely (number of copies when printing).

**Platform notes**
- iOS, iPadOS, visionOS: nothing extra. watchOS, tvOS: not supported.
- macOS: for large ranges, support Shift-click to step by a larger amount (for example 10 times the default).

## Text fields

Source: https://developer.apple.com/design/human-interface-guidelines/text-fields

A rectangular area for entering or editing small, specific text.

APIs: SwiftUI `TextField`, `SecureField`; UIKit `UITextField`; AppKit `NSTextField`.

**Best practices**
- Use for small inputs (name, email); use a text view for longer text.
- Use placeholder text ("Email", "Password") as a hint, plus a separate label since the placeholder vanishes on typing.
- Always use a secure field for passwords and other sensitive data.
- Size the field to the expected amount of text.
- Space multiple fields evenly; stack vertically; use consistent widths per group.
- Ensure Tab order is logical (the system usually handles it).
- Validate at the right time: email on leaving the field; user name or password before leaving the field; alert on invalid characters (digits-only fields).
- Use a number formatter for numeric input (decimals, percent, currency); never assume a locale format.
- Choose line-break behavior: clip (default), wrap by character or word, or truncate with an ellipsis at start, middle or end.
- Show an expansion tooltip on hover for clipped text.
- iOS, iPadOS, tvOS, visionOS: show the keyboard type matching the content.
- tvOS, watchOS: minimize text entry; prefer buttons or lists.

**Platform notes**
- tvOS, visionOS: nothing extra.
- iOS, iPadOS: show a Clear button at the trailing end. Use the leading end for an image indicating purpose and the trailing end for extra features (Bookmarks button).
- macOS: use a combo box to pair text input with a list.
- watchOS: show a text field only when necessary; prefer a list of options.

## Toggles

Source: https://developer.apple.com/design/human-interface-guidelines/toggles

Switch between two opposing states with distinct appearances. Styles include switch and checkbox; all platforms also support buttons that behave like toggles.

APIs: SwiftUI `Toggle`, `ToggleStyle`, `switch`, `GroupedFormStyle`, `ControlSize`; UIKit `UISwitch`, `changesSelectionAsPrimaryAction`; AppKit `NSButton.ButtonType.toggle`, `NSSwitch`, `allowsMixedState`.

**Best practices**
- Use only for two opposing values affecting content or view state. For other actions (choose from a list) use another control such as a pop-up button.
- Make clear what the toggle affects (context, or a label, often on macOS). Toggle-like buttons use an icon and change background by state.
- Make state differences obvious beyond color alone (fill, background shape, checkmark or dot).

**Platform notes**
- tvOS, visionOS, watchOS: nothing extra.
- iOS, iPadOS: use the switch style only in list rows (no label needed; the row gives context). Change the default green only when needed (accent color is fine) with sufficient contrast against the off state. Outside lists use a toggle-like button (Phone's filter button with blue highlight), not a switch, and do not add a label explaining it.
- macOS: switch, checkbox, and radio buttons. Use them in the window body, never in the frame (toolbar, status bar).
- macOS switches: prefer for emphasized settings or a group of settings. In grouped forms use a mini switch per row for consistent row height; a regular switch for a primary setting with mini switches for subordinates. Do not replace an existing checkbox with a switch.
- macOS checkboxes: empty off, checkmark on, dash mixed; title usually trailing (can be untitled in editable checklists). Use checkboxes for hierarchies of settings (leading-edge alignment plus indentation). Use radio buttons for more than two mutually exclusive options. Label a group if the relationship is unclear, aligning the label baseline with the first checkbox. Show the mixed state when subordinate checkboxes differ.
- macOS radio buttons: small circle plus label, usually in groups of 2 to 5; filled = selected, empty = deselected; mixed state (dash) rarely useful. Use for mutually exclusive options; use checkboxes for multiple selection. More than about 5 options: use a pop-up button. For a single on/off setting prefer a checkbox (a labeled pair of radio buttons only if the checkbox is ambiguous). In horizontal layouts space by the longest label consistently.

## Virtual keyboards

Source: https://developer.apple.com/design/human-interface-guidelines/virtual-keyboards

System on-screen keyboards for devices without physical keyboards. Task-specific key sets (email keyboard includes "@", period, ".com"). No keyboard shortcuts. Apps can supply a custom input view; iOS, iPadOS and tvOS also allow a custom keyboard app extension.

APIs: SwiftUI `keyboardType(_:)`, `textContentType(_:)`, `submitLabel(_:)`, `ToolbarItemPlacement`; UIKit `UIKeyboardType`, `UITextContentType`, `UIReturnKeyType`, `inputViewController`, `inputAccessoryView`, `UIKeyboardLayoutGuide`, `playInputClick()`.

**Best practices**
- Match the keyboard to content; set a semantic content type so the system picks the keyboard and refines corrections.
- Customize the Return key when it clarifies (search Return key for search).

**Custom input views** (replace the keyboard inside your app; Numbers' numeric pad)
- Make the benefit obvious so people do not miss the system keyboard.
- Play the standard keyboard click (respects the Settings > Sounds toggle).

**Custom keyboards** (systemwide app extension; not used in secure text fields or phone number fields; people can install several)
- Build one only for systemwide value (novel input, unsupported language); otherwise use a custom input view.
- Provide an obvious way to switch keyboards, like the Globe key.
- Do not duplicate the Emoji/Globe and Dictation keys that the system may show below the keyboard.
- Put a tutorial in your app (enable, use, switch back), not inside the keyboard.

**Platform notes**
- macOS: not supported.
- iOS, iPadOS: use the keyboard layout guide to integrate the keyboard and keep key UI visible. Controls above the keyboard (input accessory view) must be relevant to the task. If the rest of the app uses Liquid Glass, or the bar looks out of place, apply Liquid Glass to the container; a standard toolbar adopts Liquid Glass automatically. Use the layout guide and standard padding for positioning.
- tvOS: linear keyboard with the Siri Remote; grid keyboard with other devices (layout adapts). Digit entry views get a digit keyboard.
- visionOS: keyboard appears in its own movable window and supports direct and indirect gestures; no layout accounting needed.
- watchOS: keyboard shown if the screen is large enough, else dictation or Scribble. Keyboard type cannot change, but set `textContentType(_:)` for suggestions. People can also type from a paired iPhone.

---

# Status

## Activity rings

Source: https://developer.apple.com/design/human-interface-guidelines/activity-rings

Show one person's daily progress toward Move, Exercise and Stand. watchOS always shows three rings. iOS shows three rings with a paired Apple Watch, or a single Move ring (approximated from steps and other apps' workouts) without one.

API: HealthKit `HKActivityRingView`.

**Best practices**
- Show rings when relevant (health or fitness apps, especially HealthKit contributors): workout metrics screens, end-of-workout summaries.
- Use only for Move, Exercise, Stand. Never repurpose, modify, or show other data in rings, and never show these metrics in another ring-like element.
- One person only; identify whose rings with a label, photo or avatar.
- Keep appearance identical everywhere: never change colors (no filters, no opacity changes); always on a black background; prefer enclosing rings and background in a circle by setting corner radius (not a circular mask); keep black visible around the outer ring (thin black stroke if needed; no gradient, shadow or effects); scale appropriately; adapt surrounding UI to the rings, never the reverse.
- Labels or values tied to a ring (Move, Exercise, Stand, current and goal values) must use the matching ring color (Move red RGB 250,17,79; Exercise green RGB 166,255,0; Stand blue RGB 0,255,246).
- Outer margin must be at least the gap between rings; nothing may crop or intrude.
- Separate other ring-like elements with padding, lines, labels, color or scale.
- Do not send notifications duplicating Activity app updates, and never show rings in notifications (referencing progress in your own way is fine).
- Never decorative (labels, backgrounds) and never branding (app icon, marketing).

**Platform notes**
- iPadOS, watchOS: nothing extra. macOS, tvOS, visionOS: not supported.
- iOS: history may mix three-ring and Move-only days depending on whether the Watch was paired.

## Gauges

Source: https://developer.apple.com/design/human-interface-guidelines/gauges

Shows a value within a range, optionally with range context (labels for min and max, color spectrum).

APIs: SwiftUI `Gauge`; AppKit `NSLevelIndicator`.

**Anatomy**
- Circular or linear path. Standard style: an indicator marks the value. Capacity style: a fill stops at the value.
- Accessory variant (circular and linear, standard and capacity) mimics watchOS complications; good for iOS Lock Screen widgets.

**Best practices**
- Write short labels for the current value and both endpoints; VoiceOver reads visible labels.
- Consider a gradient fill that communicates meaning (red to blue for hot to cold).

**Platform notes**
- iOS, iPadOS, visionOS, watchOS: nothing extra. tvOS: not supported.
- macOS level indicators: capacity, rating, or (rare) relevance. Capacity continuous = translucent track filled by a solid bar; discrete = row of equal rectangular segments equal to total capacity, filled whole, never partially. Use continuous for large ranges. Default fill is green; change the fill at meaningful thresholds or use the tiered state for multiple colors. Rating style: see Rating indicators. Relevance style: shaded bar, for example in search results.

## Progress indicators

Source: https://developer.apple.com/design/human-interface-guidelines/progress-indicators

Show that the app is working during loading or long operations; transient. Determinate (known duration: progress bar fills leading to trailing; circular fills clockwise) or indeterminate (activity indicator, spinning; macOS also has an indeterminate bar).

APIs: SwiftUI `ProgressView`; UIKit `UIProgressView`, `UIActivityIndicatorView`, `UIRefreshControl`; AppKit `NSProgressIndicator`.

**Best practices**
- Prefer determinate so people can decide to wait, come back, or abandon.
- Report progress accurately and evenly (never 90 percent in 5 seconds then 10 percent over 5 minutes).
- Keep it moving; a static indicator reads as frozen. If stalled, explain and suggest a fix.
- Switch indeterminate to determinate as soon as duration is known.
- Never switch between circular and bar styles.
- Optional description: accurate, brief; avoid vague words like "loading" or "authenticating".
- Show indicators in a consistent location.
- Offer Cancel when interrupting is harmless; add Pause too when cancelling loses work (partial download).
- If cancelling loses progress, confirm with an alert offering cancel or resume.

**Platform notes**
- tvOS, visionOS: nothing extra.
- iOS, iPadOS refresh control: hidden spinner revealed by pulling down a list. Still refresh automatically and periodically. Title optional; only if it adds value (Podcasts shows last update time), never instructions on how to refresh.
- macOS: indeterminate can be bar or circular. Prefer a spinner for background tasks or tight spaces (in a text field, next to a button). Do not label spinners.
- watchOS: indicators are white over the background by default; change via tint color.

## Rating indicators

Source: https://developer.apple.com/design/human-interface-guidelines/rating-indicators

macOS only (`NSLevelIndicator.Style.rating`). A horizontal row of symbols (stars by default) showing a rank. Rounds to whole symbols (no partials); fixed spacing, symbols never stretch to fill width.

- Let people change ratings inline in lists, without a separate edit screen.
- If replacing stars with a custom symbol, make its meaning obvious.

**Platform notes**: macOS nothing extra; not supported in iOS, iPadOS, tvOS, visionOS, watchOS.

---

# System experiences

## App Shortcuts

Source: https://developer.apple.com/design/human-interface-guidelines/app-shortcuts

Expose key app functions or content systemwide via Siri, Spotlight, the Shortcuts app, the Action button (iPhone, Apple Watch), or Apple Pencil squeeze. Available immediately after install (before first launch); can personalize with use (FaceTime recent contacts). Built with App Intents; each shortcut bundles one or more actions. Max 10 App Shortcuts per app. People can also compose custom shortcuts from your App Intents actions in the Shortcuts app.

APIs: App Intents, `AppShortcutPhrase`, `SiriTipUIView`, `LiveActivityIntent`, `init(full:supporting:systemImageName:)`; SiriKit.

**Best practices**
- For common domains, adopt app schemas (App schema domains) first so Apple Intelligence and Siri can surface features contextually without individual App Shortcuts (added June 2026). Use App Shortcuts for unique features or content outside schema coverage.
- Cover the most common, important tasks; best when completable without leaving context, but opening the app is fine for multistep tasks.
- Allow at most one optional parameter with predictable values ("Start [morning, daily, sleep] meditation").
- When an optional value is missing, ask: suggest the most recent or time-appropriate option as default plus a short list of alternatives.
- Keep phrases simple to say; ask for extra required info in a follow-up step rather than a two-parameter phrase.
- Make shortcuts discoverable with occasional in-app tips at relevant moments.

**Responding**
- Respond with Siri dialogue plus visuals: snippets (static info or options, such as weather or order confirmation) or Live Activities (ongoing, changing info like timers).
- Put all critical info in the full dialogue text for audio-only devices (AirPods, HomePod).

**Editorial**
- Phrases: brief, memorable, with natural variants; must include the app name (can be creative: "Create a Keynote", "Add a new presentation in Keynote").
- Write "App Shortcuts" and "Shortcuts" (the app) in title case, always plural "Shortcuts".
- Write individual shortcuts in lowercase ("run a shortcut").

**Platform notes**
- visionOS, watchOS: nothing extra. tvOS: not supported.
- iOS, iPadOS: appear in Spotlight Top Hit or the Shortcuts area below, each with an SF Symbol or a preview image of the linked item. Order by importance; the system later reorders by usage.
- macOS: App Shortcuts not supported, but App Intents actions are, for custom shortcuts in Shortcuts on Mac.

## Complications

Source: https://developer.apple.com/design/human-interface-guidelines/complications

watchOS only. Timely info on the watch face, seen at each wrist raise. Most faces show at least one; some show four or more. From watchOS 9, complications (accessories) are grouped in families (circular, corner, inline, rectangular) with recommended layouts; faces declare supported families per slot. Legacy templates exist for older watchOS (nongraphic styles that ignore the wearer's color).

APIs: build with WidgetKit for watchOS 9+ (see Migrating ClockKit complications to WidgetKit); ClockKit `CLKComplicationDataSource` for earlier versions; `WidgetRenderingMode`, `placeholder(in:)`, `WidgetFamily.accessoryRectangular`.

**Best practices**
- Show essential, dynamic, always-fresh data; a static complication tends to get removed.
- Support all families; where nothing useful fits, show an app-representing image (like the app icon) that still launches the app.
- Offer multiple complications per family (triathlon app: swim, bike, run circulars) to power shareable watch faces.
- Give each complication a distinct deep link to the most relevant area.
- Mind privacy with Always-On: others can see the face.
- Plan timeline entries carefully: limited daily updates and limited stored entries. Pick display times that maximize usefulness (meeting an hour ahead; forecast at the forecast time).

**Visual design**
- Ring or gauge styles: closed (percentage of a whole, battery); open (arbitrary min and max, speed); segmented (app-defined range, rapid changes, Noise).
- Tinted mode: system applies a solid color to text, gauges and images, desaturates full-color images unless you supply tinted versions (legacy templates: graphic complications only). Never rely on color alone; supply tinted alternatives for images that desaturate poorly. Expect many people to prefer tinted mode (grayscale plus tint from the wearer's chosen color).
- Lines 2 pt or thicker.
- Provide static placeholder images per complication (shown at install and in the selection carousel); placeholder size may differ from the live image size.

**Circular family** (Infograph, Infograph Modular; extra-large variants for X-Large face). Text can curve along the bezel for nearly 180 degrees before truncating. System applies a circular mask.

Regular circular image sizes:

| Image | 40mm | 41mm | 44mm | 45mm/49mm |
|---|---|---|---|---|
| Image | 42x42 pt (84x84 px @2x) | 44.5x44.5 pt (89x89 px) | 47x47 pt (94x94 px) | 50x50 pt (100x100 px) |
| Closed gauge | 27x27 pt (54x54 px) | 28.5x28.5 pt (57x57 px) | 31x31 pt (62x62 px) | 32x32 pt (64x64 px) |
| Open gauge | 11x11 pt (22x22 px) | 11.5x11.5 pt (23x23 px) | 12x12 pt (24x24 px) | 13x13 pt (26x26 px) |
| Stack (not text) | 28x14 pt (56x28 px) | 29.5x15 pt (59x30 px) | 31x16 pt (62x32 px) | 33.5x16.5 pt (67x33 px) |

Regular circular default text (SwiftUI): Rounded, Medium; 12 pt (40mm), 12.5 pt (41mm), 13 pt (44mm), 14.5 pt (45mm/49mm).

Extra-large circular (X-Large face; full-color images, text, gauges; some multicolor text; mask on circular, open and closed gauge images):

| Image | 40mm | 41mm | 44mm | 45mm/49mm |
|---|---|---|---|---|
| Image | 120x120 pt (240x240 px) | 127x127 pt (254x254 px) | 132x132 pt (264x264 px) | 143x143 pt (286x286 px) |
| Open gauge | 31x31 pt (62x62 px) | 33x33 pt (66x66 px) | 33x33 pt (66x66 px) | 37x37 pt (74x74 px) |
| Closed gauge | 77x77 pt (154x154 px) | 81.5x81.5 pt (163x163 px) | 87x87 pt (174x174 px) | 91.5x91.5 pt (183x183 px) |
| Stack | 80x40 pt (160x80 px) | 85x42 pt (170x84 px) | 87x44 pt (174x88 px) | 95x48 pt (190x96 px) |

Extra-large circular default text: Rounded, Medium; 34.5 pt (40mm), 36.5 pt (41mm), 36.5 pt (44mm), 41 pt (45mm/49mm).

Circular-family placeholder images (38mm: none):

| Layout | 40mm/42mm | 41mm | 44mm | 45mm/49mm |
|---|---|---|---|---|
| Circular | 42x42 pt (84x84 px) | 44.5x44.5 pt (89x89 px) | 47x47 pt (94x94 px) | 50x50 pt (100x100 px) |
| Bezel | 42x42 pt (84x84 px) | 44.5x44.5 pt (89x89 px) | 47x47 pt (94x94 px) | 50x50 pt (100x100 px) |
| Extra Large | 120x120 pt (240x240 px) | 127x127 pt (254x254 px) | 132x132 pt (264x264 px) | 143x143 pt (286x286 px) |

**Corner family** (corners of faces like Infograph; full-color images, text, gauges; some multicolor text; circular mask):

| Image | 40mm | 41mm | 44mm | 45mm/49mm |
|---|---|---|---|---|
| Circular | 32x32 pt (64x64 px) | 34x34 pt (68x68 px) | 36x36 pt (72x72 px) | 38x38 pt (76x76 px) |
| Gauge | 20x20 pt (40x40 px) | 21x21 pt (42x42 px) | 22x22 pt (44x44 px) | 24x24 pt (48x48 px) |
| Text | 20x20 pt (40x40 px) | 21x21 pt (42x42 px) | 22x22 pt (44x44 px) | 24x24 pt (48x48 px) |

Corner placeholders: 20x20 pt (40mm/42mm), 21x21 pt (41mm), 22x22 pt (44mm), 24x24 pt (45mm/49mm); none for 38mm. Corner default text: Rounded, Semibold; 10 pt (40mm), 10.5 pt (41mm), 11 pt (44mm), 12 pt (45mm/49mm).

**Inline family**: utilitarian small (rectangular corner area on Chronograph, Simple; image, icon, or circular graph) and utilitarian large (mostly text plus a leading icon, spanning the bottom of Utility, Motion).

Utilitarian small:

| Content | 38mm | 40mm/42mm | 41mm | 44mm | 45mm/49mm |
|---|---|---|---|---|---|
| Flat | 9-21x9 pt (18-42x18 px) | 10-22x10 pt (20-44x20 px) | 10.5-23.5x21 pt (21-47x21 px) | N/A | 12-26x12 pt (24-52x24 px) |
| Ring | 14x14 pt (28x28 px) | 14x14 pt (28x28 px) | 15x15 pt (30x30 px) | 16x16 pt (32x32 px) | 16.5x16.5 pt (33x33 px) |
| Square | 20x20 pt (40x40 px) | 22x22 pt (44x44 px) | 23.5x23.5 pt (47x47 px) | 25x25 pt (50x50 px) | 26x26 pt (52x52 px) |

Utilitarian large, Flat: 9-21x9 pt (38mm), 10-22x10 pt (40mm/42mm), 10.5-23.5x10.5 pt (41mm), N/A (44mm), 12-26x12 pt (45mm/49mm).

**Rectangular family**: full-color images, text, gauge, optional title in a large region; good for charts (Heart Rate: high-contrast white and red data, low-contrast gray grid and labels). watchOS 10+: may appear in the Smart Stack; optimize with a meaningful background color or content, relevance via intents, and a Smart Stack-specific layout.

| Content | 40mm | 41mm | 44mm | 45mm/49mm |
|---|---|---|---|---|
| Large image with title | 150x47 pt (300x94 px) | 159x50 pt (318x100 px) | 171x54 pt (342x108 px) | 178.5x56 pt (357x112 px) |
| Large image without title | 162x69 pt (324x138 px) | 171.5x73 pt (343x146 px) | 184x78 pt (368x156 px) | 193x82 pt (386x164 px) |
| Standard body | 12x12 pt (24x24 px) | 12.5x12.5 pt (25x25 px) | 13.5x13.5 pt (27x27 px) | 14.5x14.5 pt (29x29 px) |
| Text gauge | 12x12 pt (24x24 px) | 12.5x12.5 pt (25x25 px) | 13.5x13.5 pt (27x27 px) | 14.5x14.5 pt (29x29 px) |

Large-image layouts get a 4 pt corner radius automatically. Rectangular default text: Rounded, Medium; 16.5 pt (40mm), 17.5 pt (41mm), 18 pt (44mm), 19.5 pt (45mm/49mm).

**Legacy templates** (stack widths are maximums)

Circular small (corner of Color face):

| Image | 38mm | 40mm/42mm | 41mm | 44mm | 45mm/49mm |
|---|---|---|---|---|---|
| Ring | 20x20 pt | 22x22 pt | 23.5x23.5 pt | 24x24 pt | 26x26 pt |
| Simple | 16x16 pt | 18x18 pt | 19x19 pt | 20x20 pt | 21.5x21.5 pt |
| Stack | 16x7 pt | 17x8 pt | 18x8.5 pt | 19x9 pt | 19x9.5 pt |
| Placeholder | 16x16 pt | 18x18 pt | 19x19 pt | 20x20 pt | 21.5x21.5 pt |

Modular small (two stacked rows, ring, or one large item; bottom row of Modular):

| Image | 38mm | 40mm/42mm | 41mm | 44mm | 45mm/49mm |
|---|---|---|---|---|---|
| Ring | 18x18 pt | 19x19 pt | 20x20 pt | 21x21 pt | 22.5x22.5 pt |
| Simple | 26x26 pt | 29x29 pt | 30.5x30.5 pt | 32x32 pt | 34.5x34.5 pt |
| Stack | 26x14 pt | 29x15 pt | 30.5x16 pt | 32x17 pt | 34.5x18 pt |
| Placeholder | 26x26 pt | 29x29 pt | 30.5x30.5 pt | 32x32 pt | 34.5x34.5 pt |

Modular large (up to 3 rows; center of Modular). Columns, Standard body and Table all use: 11-32x11 pt (38mm), 12-37x12 pt (40mm/42mm), 12.5-39x12.5 pt (41mm), 14-42x14 pt (44mm), 14.5-44x14.5 pt (45mm/49mm).

Extra large (X-Large faces):

| Image | 38mm | 40mm/42mm | 41mm | 44mm | 45mm/49mm |
|---|---|---|---|---|---|
| Ring | 63x63 pt | 66.5x66.5 pt | 70.5x70.5 pt | 73x73 pt | 79x79 pt |
| Simple | 91x91 pt | 101.5x101.5 pt | 107.5x107.5 pt | 112x112 pt | 121x121 pt |
| Stack | 78x42 pt | 87x45 pt | 92x47.5 pt | 96x51 pt | 103.5x53.5 pt |
| Placeholder | 91x91 pt | 101.5x101.5 pt | 107.5x107.5 pt | 112x112 pt | 121x121 pt |

All legacy pixel sizes are @2x (double the pt values).

**Platform notes**: not supported in iOS, iPadOS, macOS, tvOS, visionOS (iPhone and iPad Lock Screen accessory widgets follow the same principles; see Widgets).

## Controls

Source: https://developer.apple.com/design/human-interface-guidelines/controls

A button or toggle giving quick access to an app feature from Control Center, the Lock Screen, or the Action button. Buttons perform an action, deep link, or launch a locked-device camera experience; toggles switch two states. Added via Control Center edit (press and hold empty area), Lock Screen customization, or Settings for the Action button.

APIs: WidgetKit (control widgets), `promptsForUserConfiguration()`, `controlWidgetActionHint(_:)`, `IntentAuthenticationPolicy`, `SymbolEffect`, `LockedCameraCapture`.

**Anatomy**: symbol (SF Symbol or custom), title, optional value (title = light name, value = on or off).
- Control Center: symbol; title and value at larger sizes.
- Lock Screen: symbol only.
- Action button on iPhone: press and hold shows symbol and value (if any) in the Dynamic Island.

**Best practices**
- Offer controls for actions valuable without opening the app (starting a Live Activity is a good fit).
- Update the control on interaction, on completion, and remotely via push; show in-progress state.
- Choose a symbol that conveys the action alone (title may be hidden). Toggles need on and off symbols (`door.garage.open` / `door.garage.closed`).
- Animate symbols: toggles animate between states; duration actions animate continuously until complete.
- Pick a brand-appropriate tint: applied to the toggle symbol when on and to symbol and value in the Dynamic Island for Action button use.
- If configuration is needed (which light), prompt at add time; allow reconfiguration anytime.
- Provide Action button hint text built from verbs (shown on press; press and hold performs).
- If title or value is situational, provide placeholder text (shown in the gallery and before assigning to the Action button).
- Redact title and value when locked if sensitive; optionally redact symbol state too (symbol then shows off state).
- Require authentication for security-affecting actions (door locks, starting a car).

**Locked camera experiences** (iOS 18+): a control can launch your capture UI while locked; anything beyond capture requires unlocking.
- Reuse the in-app camera UI so the transition into the app is seamless.
- Tell people how to add the control.

**Platform notes**: iOS, iPadOS, macOS nothing extra; not supported in watchOS, tvOS, visionOS.

## Live Activities

Source: https://developer.apple.com/design/human-interface-guidelines/live-activities

Track an activity, event or task at a glance with frequent updates over a few hours, plus interaction (delivery ETA, live match score, workout metrics with pause/cancel). Starts on iPhone or iPad and appears across devices:

| Platform or experience | Location |
|---|---|
| iPad and iPhone | Lock Screen, Home Screen; Dynamic Island and StandBy on iPhone |
| Mac | Menu bar |
| Apple Watch | Smart Stack |
| CarPlay | CarPlay Dashboard |

APIs: ActivityKit, WidgetKit, SwiftUI; `isDynamicIslandLimitedInWidth`, `ContainerRelativeShape`, `activitySystemActionForegroundColor(_:)`, `ActivityFamily.small`, `LiveActivityIntent`, `padding(_:_:)`.

**Presentations you must support**: compact, minimal, expanded, Lock Screen. The system derives other contexts from these (compact leading plus trailing are merged into one view for Apple Watch and CarPlay).
- Compact: Dynamic Island when one Live Activity is active; two parts, leading and trailing of the TrueDepth camera.
- Minimal: when multiple are active, up to 3 show in the Dynamic Island (one attached, others detached, circular or oval by content). Tap opens the app; touch and hold shows expanded.
- Expanded: shown on touch and hold of compact or minimal.
- Lock Screen: banner at the bottom of the Lock Screen, layout similar to expanded; on devices without the Dynamic Island, alerts show it briefly as a banner over other content.
- StandBy (iPhone): minimal presentation; tap shows the Lock Screen presentation scaled 2x full screen; a custom background color extends to fill the screen.

**Best practices**
- Use for tasks with a clear start and end, short to medium, not exceeding 8 hours.
- Show only the key glanceable info; tap opens the app for more.
- No ads or promotions.
- Avoid sensitive info (visible on Lock Screen and Always-On): show an innocuous summary, or redact and let people opt in.
- Match the app's look in light and dark.
- Logo mark: no container; never the full app icon.
- Never add in-app elements that point at the Dynamic Island.
- Text: large, medium weight or heavier; minimal small text.

**Layouts**
- Adapt to all screen sizes, scale factors and presentations (see Specifications).
- Use only the space needed; fit elements tightly together.
- Limited width (Dynamic Island on iPhone in landscape): compact and minimal must fit in a 28 pt diameter circle; use abbreviations or graphics. If both limited-width compact views do not make sense, provide a leading view only; the system hides the empty trailing view.
- Start from Apple Design Resources templates (system margins, recommended text sizes).
- Even, concentric margins; use `ContainerRelativeShape` for rounded elements near corners instead of hard-coded radii.
- Separate content blocks with an inset container shape or a thick line; never draw to the Dynamic Island's edge.
- Change height dynamically on the Lock Screen and in expanded (rideshare grows once driver details exist).

**Color**
- Compact, minimal and expanded backgrounds cannot be customized (Dynamic Island is black and opaque). Lock Screen background color or image can be custom; ensure contrast, especially tint colors on reduced-luminance Always-On.
- Use bold brand colors for text and objects to make the activity recognizable.
- Tint the key line (shown around the Dynamic Island on dark backgrounds) to match your content.

**Animation**
- Max 2 seconds for system and custom animations; no animation on reduced-luminance Always-On.
- Animate to reinforce updates: default content-replace transition, or custom scale, opacity, movement (numeric transitions for scores, fade a timer at zero).
- Animate layout changes by moving existing elements, not removing and re-adding them.
- Avoid overlaps: animate only the moving list item; fade others.

**Interactivity**
- Tap must deep link to the right place.
- Only simple, essential actions directly tied to the activity (playback, workout pause/resume, mic recording); prefer a single interactive element.
- Consider letting people respond to updates (contact the driver).

**Lifecycle**
- Start at expected moments (after ordering, requesting a ride, match start); offer in-app controls to stop or unfollow, or people may disable Live Activities in Settings.
- Offer an App Shortcut that starts the Live Activity (usable from the Action button).
- Update only when content changes.
- Alert only for essential updates (alerts light the screen, play the sound, show expanded or a banner); never also send a push notification for the same update.
- Track multiple events in one Live Activity that rotates through them rather than several activities.
- End immediately when done. The Dynamic Island and CarPlay remove it at once; Lock Screen, Mac menu bar and watchOS Smart Stack keep it up to 4 hours. Set a custom dismissal time proportional to duration, usually 15 to 30 minutes (rideshare: 30 minutes for receipt and tip).

**Per-presentation rules**
- Design iPhone first, then refine for StandBy, CarPlay, Apple Watch.
- Compact: only the most important dynamic info (two logos plus score); leading and trailing read as one unit with shared color and type; keep narrow and snug to the camera without padding; keep widths balanced (shorten units, reduce precision); both sides deep link to the same screen.
- Minimal: stay recognizable while showing live data (Timer shows remaining time, not an icon).
- Expanded: keep relative positions from compact; wrap content tightly around the camera.
- Lock Screen: do not mimic notification layouts; use custom background or tint sparingly to suit personalized Lock Screens; verify contrast in Dark Mode and reduced-luminance Always-On (default background is light in light mode, dark in dark mode; supply one color that works in both or one per appearance); verify the auto-generated dismiss button color; standard margin 14 pt (tighter only for graphics or buttons).
- StandBy: update assets and layout for the 2x scale; consider the default background (blends with the bezel and lets the system scale slightly larger since camera margins are not needed); keep standard margins and never bleed graphics to the edge; check Night Mode red tint contrast.

**CarPlay**: compact leading and trailing are combined automatically on CarPlay Dashboard. Your design serves both CarPlay and Apple Watch. For larger text or more info, declare the `ActivityFamily.small` supplemental family. Interactive elements are disabled in CarPlay; if people use it while driving, favor timely content over buttons and toggles.

**Platform notes**
- iOS, iPadOS: nothing extra. tvOS, visionOS: not supported.
- macOS: shown in the menu bar of a paired Mac using compact, minimal, expanded; click opens iPhone Mirroring.
- watchOS: appears at the top of the Smart Stack; default view merges compact leading and trailing. Tap opens your watchOS app, or a full-screen view with a button to open the iPhone app if none. Consider a custom watch layout (more info, a button or toggle), but it also drives CarPlay, where interaction is disabled, so skip controls if driving use is likely. Focus on progress, interactive timer controls, and significant updates.

**Specifications** (points)

CarPlay Live Activity sizes: 240x78, 240x100, 170x78. Test with the CarPlay simulator Smart Display Zoom settings: Widescreen 1920x720, Portrait 900x1200, Standard 800x480.

iOS:

| Screen (portrait) | Compact (leading and trailing) | Minimal (width range) | Expanded (height range) | Lock Screen (height range) | Limited width |
|---|---|---|---|---|---|
| 430x932 | 62.33x36.67 | 36.67-45x36.67 | 408x84-160 | 408x84-160 | 28x28 |
| 393x852 | 52.33x36.67 | 36.67-45x36.67 | 371x84-160 | 371x84-160 | 28x28 |

iPadOS Lock Screen: 1366x1024 -> 500x84-160; 1194x834, 1012x834, 1080x810, 1024x768 -> 425x84-160.

macOS: use iOS dimensions.

watchOS Smart Stack (same as watchOS widgets):

| Watch | Size (pt) |
|---|---|
| 40mm | 152x69.5 |
| 41mm | 165x72.5 |
| 42mm | 176x72.5 |
| 44mm | 173x76.5 |
| 45mm | 184x80.5 |
| 46mm | 194x80.5 |
| 49mm (Ultra 3, 4) | 198x81.5 |
| 49mm (Ultra 1, 2) | 191x81.5 |

Change log: October 13, 2026 added limited width guidance and updated platforms and specs; December 16, 2025 added macOS and CarPlay.

## Notifications

Source: https://developer.apple.com/design/human-interface-guidelines/notifications

Timely, high-value, glanceable information. Requires user consent first; people then choose styles and delivery timing by urgency.

APIs: User Notifications, User Notifications UI, `UNNotificationSound`, `hiddenPreviewsBodyPlaceholder`.

**Anatomy**: banner or view on Lock Screen, Home Screen, Home View or desktop; badge on the app icon; item in Notification Center. Communication notifications (calls, messages) show avatars and group names instead of the app icon.

**Best practices**
- Concise and informative.
- Never send repeats for the same thing, even when unanswered.
- Do not instruct people to do tasks in the app; offer notification actions for simple tasks instead.
- Show errors with an alert, never a notification.
- In the foreground, notifications do not appear; surface the info subtly (badge increment, insert data in view) as Mail does.
- No sensitive, personal or confidential info.

**Content**
- Title appears at top. Communication: sender name is the title automatically. Otherwise your app name appears if no title is given.
- Short title only when it adds context (headline, event name, subject). If it would be generic ("New Document"), let the app name show. Title case, no ending punctuation.
- Body: complete sentences, sentence case, punctuation; do not truncate yourself.
- Provide hidden-preview text (shown with app icon and default title "Notification" when previews are off): generic, sentence case ("Friend request", "New comment", "Reminder", "Shipment").
- Do not include your app name or icon; the system shows the icon (or the sender avatar badged with your icon).
- Optional sound: short, distinctive, professional custom or system sound; never the only carrier of important info. Vibration cannot be set programmatically.

**Actions**: up to 4 buttons in the detail view.
- Offer time-saving contextual actions (Calendar Snooze). Labels: short, title case, describe the result, no app name, localization-aware.
- No action that just opens the app.
- Prefer nondestructive actions; mark destructive ones (system styles them distinctly) with enough context.
- Give each action a simple interface icon (shown trailing the title; SF Symbols recommended).

**Badging**
- Badges count unread notifications only; never weather, dates, prices, scores.
- Never the sole channel for essential info (badges can be disabled).
- Update immediately when notifications are read. Setting the count to zero clears related notifications from Notification Center.
- Never fake a badge with custom UI.

**Platform notes**
- iOS, iPadOS, macOS, tvOS, visionOS: nothing extra.
- watchOS: two stages, short look and long look, plus Notification Center; double tap to respond on supported devices. Default interfaces can come from the iPhone companion.
- Short look: shown while the wrist is raised. Never the only path for critical info; keep it discreet with nothing sensitive in the title.
- Long look: scrollable by swipe or Crown, dismissed by tap or lowering the wrist. Static (message plus static text and images) or dynamic (full content, richer layout). Structure fixed: sash at top (app icon and name), Dismiss button at bottom below custom buttons. Consider rich animated long looks (SwiftUI animations, SpriteKit, SceneKit). Always provide static, preferably dynamic too; static is the fallback offline or when the iPhone app is unreachable, so bundle its assets. Sash: custom color or blurred (use blurred over a top photo). Content background is transparent by default; to match system notifications use white at 18% opacity, or a brand color. Up to 4 custom actions by notification type (shared from the iPhone app's registered types when available).
- Double tap triggers the first nondestructive action: put the most common action first (parking app: most common extension first).

## Snippets

Source: https://developer.apple.com/design/human-interface-guidelines/snippets

New June 2026. Compact views shown when someone acts via Siri, Spotlight or Shortcuts, attached to an App Intent. Two types: confirmation (confirm or cancel, may include options) and result (info, no further action). An intent with a snippet always ends with a result; confirmation is optional.

APIs: App Intents (Displaying static and interactive snippets), `ConfirmationActionName`.

**Anatomy**
- Dialogue: the spoken intent dialogue, shown above the custom view by default.
- Custom view: visual content, may include buttons to modify, get more, or act.
- System buttons: confirmation = secondary Cancel plus primary button with custom label; result = single Done.

**Best practices**
- Check contrast against the system background in light and dark; keep consistent margins.
- Keep content concise; custom view max height 400 pt; account for larger Dynamic Type. For more detail in a result, deep link into the app.
- Label the primary confirm button descriptively (pick from `ConfirmationActionName` or custom: "Order", not "OK" or "Proceed"). Default if unspecified: "Continue".
- Convey purpose visually; do not rely on the dialogue text. Prefer omitting the dialogue from the visual and letting the view carry the info (dialogue still matters for eyes-free use).

**Platform notes**: iOS, iPadOS, macOS nothing extra; not supported in tvOS, visionOS, watchOS.

## Status bars

Source: https://developer.apple.com/design/human-interface-guidelines/status-bars

Top-edge bar showing time, carrier, battery and other device state. iOS and iPadOS only.

APIs: UIKit `UIStatusBarStyle`, `preferredStatusBarStyle`; `ScrollEdgeEffectStyle`, `UIScrollEdgeEffect`.

- Its background is transparent: keep it readable and never imply that content behind it is interactive. Prefer a scroll edge effect to blur content behind it.
- Consider hiding it temporarily for full-screen media (Photos).
- Never hide it permanently; restore with a simple, discoverable gesture (single tap in Photos).

**Platform notes**: iOS, iPadOS nothing extra; not supported in macOS, tvOS, visionOS, watchOS.

## Top Shelf

Source: https://developer.apple.com/design/human-interface-guidelines/top-shelf

tvOS only. Area of the Apple TV Home Screen that showcases your content when your app is in the Dock and focused. Full-screen Top Shelf lets people swipe through full-screen previews, play trailers, and get info. Layout templates are in Apple Design Resources.

**Best practices**
- Get people into content fast. Carousel actions and Carousel details include 2 buttons by default: primary (play) and More Info (opens a detail view).
- Feature new content (releases, episodes, upcoming); do not promote what people already bought, rented or watched.
- Personalize: recommendations, resume playback, return to gameplay.
- No ads or prices (purchasable content is fine; show prices only on interest).
- Prefer dynamic content and layered images over static.
- Without full-screen content, provide at least one static fallback image: 2320x720 pt (2320x720 px @1x, 4640x1440 px @2x). tvOS flips and blurs it to fit 1920 px wide at 16:9.
- Static images are not focusable; never imply interactivity.

**Dynamic layouts**: full-screen carousel with 2 buttons and optional details; row of focusable content; scrolling banners.
- Carousel actions: full-screen video and images with minimal controls; best for content people know (user photos, franchise content). Provide a short title and optional subtitle (date range, show name).
- Carousel details: adds metadata (plot, cast). Title identifies the playing content near the top; optional attribution phrase above ("Featured on My App").
- Sectioned content row: one labeled row of focusable items; label appears on focus; Touch surface movement animates the focused image; multiple labels possible. Load enough images to span the full screen width and include at least one label. Mixed sizes scale up to the tallest (a 16:9 image becomes 500 px high next to poster or square).

| Shape | Actual size | Focused / safe zone | Unfocused |
|---|---|---|---|
| Poster 2:3 | 404x608 pt (808x1216 px @2x) | 380x570 pt (760x1140 px @2x) | 333x570 pt (666x1140 px @2x) |
| Square 1:1 | 608x608 pt (1216x1216 px @2x) | 570x570 pt (1140x1140 px @2x) | 500x500 pt (1000x1000 px @2x) |
| 16:9 | 908x512 pt (1816x1024 px @2x) | 852x479 pt (1704x958 px @2x) | 782x440 pt (1564x880 px @2x) |

(@1x px values equal the pt values.)

- Scrolling inset banner: near full-width images auto-advancing on a timer until focused, looping at the end. Focus plus circular Touch gesture triggers focus effect, lighting, and 3D for layered images; swipe pans. Use 3 to 8 images. No labels: bake text into the image (put it on its own top layer in layered images) and repeat it in the accessibility label.

| Banner | Size |
|---|---|
| Actual | 1940x692 pt (3880x1384 px @2x) |
| Focused / safe zone | 1740x620 pt (3480x1240 px @2x) |
| Unfocused | 1740x560 pt (3480x1120 px @2x) |

**Platform notes**: not supported in iOS, iPadOS, macOS, visionOS, watchOS.

## Watch faces

Source: https://developer.apple.com/design/human-interface-guidelines/watch-faces

watchOS only. The primary view people pick and customize with complications, possibly per activity. watchOS 7+: faces can be shared (from your app, website, Messages, Mail, social media).

API: ClockKit, Sharing an Apple Watch face.

- Share faces that showcase your complications; support several complications to curate an experience. Some faces also take an accent color, images or styles. If people add your face without your app, the system prompts installation.
- Show a preview of each shared face (email it to yourself from the iOS Watch app; it includes an illustrated bezel, or composite a hardware bezel from Apple Design Resources).
- Aim for faces available on all devices. Series 4 and later only: California, Chronograph Pro, Gradient, Infograph, Infograph Modular, Meridian, Modular Compact, Solar Dial. Explorer: Series 3 (cellular) and later. Offer an equivalent on a face available to Series 3 and earlier, and label each shared face with supported devices.
- Handle incompatibility gracefully: when Series 3 or earlier returns an error, offer a compatible alternative right away instead of an error, and set that expectation alongside previews.

**Platform notes**: not supported in iOS, iPadOS, macOS, tvOS, visionOS.

## Widgets

Source: https://developer.apple.com/design/human-interface-guidelines/widgets

Glanceable content and focused interactions from your app in other contexts: iPhone and iPad Home Screen and Lock Screen; Mac desktop and Notification Center; horizontal or vertical surfaces on Apple Vision Pro; Apple Watch Smart Stack; Apple HomeView Home Screen and Modular face.

APIs: WidgetKit, `WidgetRenderingMode` (`fullColor`, `accented`, `vibrant`), `widgetAccentable(_:)`, `ContainerRelativeShape`, `padding(_:_:)`, `supportedMountingStyles(_:)` on `WidgetConfiguration`, RelevanceKit, ActivityKit.

**Design inputs**: which sizes, which contexts, which rendering modes and color treatments. WidgetKit gives defaults, but design custom per context when it improves the content.

System family support:

| Size | iPhone | iPad | Mac | Apple Vision Pro |
|---|---|---|---|---|
| Small | Home Screen, Today View, StandBy, CarPlay, Apple HomeView | Home Screen, Today View, Lock Screen | Desktop, Notification Center | Horizontal and vertical surfaces |
| Medium | Home Screen, Today View | Home Screen, Today View | Desktop, Notification Center | Surfaces |
| Large | Home Screen, Today View | Home Screen, Today View | Desktop, Notification Center | Surfaces |
| Extra large | Not supported | Home Screen, Today View | Desktop, Notification Center | Surfaces |
| Extra large portrait | Not supported | Not supported | Not supported | Surfaces |

Accessory family support:

| Size | iPhone | iPad | Apple Watch |
|---|---|---|---|
| Accessory circular | Lock Screen | Lock Screen | Complications and Smart Stack |
| Accessory corner | Not supported | Not supported | Complications |
| Accessory inline | Lock Screen | Lock Screen | Complications |
| Accessory rectangular | Lock Screen | Lock Screen | Complications and Smart Stack |

**Appearances (Liquid Glass)**
- iPhone, iPad, Apple HomeView Home Screen: light, dark, clear, tinted. Light and dark are full color. Clear desaturates and adds translucency, highlights and the Liquid Glass material. Tinted desaturates and applies the person's tint.
- Apple Vision Pro: 3D object in a frame, full color with a glass or paper coating that reacts to lighting; optional tint from system palettes.
- iPad Lock Screen: monochrome, no tint.
- iPhone StandBy and HomeView Modular face: scaled up, background removed; red monochrome below an ambient light threshold.
- Rectangular accessory: monochrome without tint on iPhone and iPad Lock Screen; full color or tinted complication, plus Smart Stack, on Apple Watch.

Rendering modes:
- `fullColor`: system family widgets everywhere; your colors untouched.
- `accented`: system family widgets everywhere and accessory widgets on Apple Watch. Background removed and replaced by a tint effect (tinted) or Liquid Glass (clear); views split into accent and primary groups, each given a solid color.
- `vibrant`: iPhone and iPad Lock Screen, iPhone StandBy in low light. Desaturates text, images and gauges and colors them for the Lock Screen or macOS desktop; Lock Screen tint is user-customizable; StandBy low light is red.

| Platform | Full-color | Accented | Vibrant |
|---|---|---|---|
| iPhone | Home Screen, Today view, StandBy and CarPlay (background removed) | Home Screen, Today view | Lock Screen, StandBy Night Mode |
| iPad | Home Screen, Today view | Home Screen, Today view | Lock Screen |
| Apple Watch | Smart Stack, complications | Smart Stack, complications | Not supported |
| Mac | Desktop, Notification Center | Not supported | Desktop |
| Apple Vision Pro | Surfaces | Surfaces | Not supported |
| Apple HomeView | Home Screen, Modular face (background removed) | Home Screen, Modular face (background removed) | Modular face Night Mode |

**Best practices**
- Pick a simple idea tied to the app's main purpose (Weather: current high, low, conditions).
- Give real content, actions and deep links; a widget that just repeats the app icon gets removed.
- Prefer content that changes through the day.
- Look for moments of delight (special treatment on birthdays, holidays).
- Offer multiple sizes only when each adds value; never just stretch small content. One great size beats all sizes.
- Balance density: not sparse, not crammed; go larger or swap text for graphics if too dense.
- Stay on the main purpose at every size (Calendar always centers on events).
- Brand lightly (colors, typefaces, glyphs). Logo usually unnecessary; if needed (multi-source content), small, top-right corner.
- Decide between auto content (Podcasts) and configuration (Stocks).
- Do not mirror the widget's look inside the app.
- If signing in unlocks more, say so ("Sign in to view reservations").

**Updating**
- No real-time updates; refresh budgets are system-limited and variable.
- Pick frequency from how fast data changes and when people look (tides: hourly is enough). If checked more often than updated, show a last-updated time.
- Let the system render dates and times so you save update budget; show content fast, never hide stale data behind placeholders.
- Animate updates (SwiftUI default plus custom animations up to 2 seconds).

**Interactivity**
- Tap or click opens the app; buttons and toggles act in place (Reminders completion toggle); taps elsewhere open the app.
- Keep functionality simple and directly related.
- Deep link precisely (medium Stocks opens the tapped symbol).
- Stay glanceable: avoid app-like layouts, size targets for confident taps. Inline accessory widgets have exactly one tap target.

**Margins and padding**
- iOS resizes content designed for large devices down for small ones; iPadOS renders large then scales down. Use the Specifications and SwiftUI for flexibility.
- Standard margin 16 pt for most widgets; 11 pt for tighter groupings (graphics, buttons, background shapes). Mac desktop and Lock Screen (including StandBy) use smaller margins.
- Match inner corner radii to the widget using `ContainerRelativeShape`.

**Text**
- Prefer the system font, text styles and SF Symbols; a custom font sparingly (often for large text, SF Pro for small).
- Minimum 11 pt.
- Never rasterize text (scaling and VoiceOver).
- iOS, iPadOS, visionOS widgets support Dynamic Type from Large to AX5 when using `Font` or `custom(_:size:)`.

**Color**
- Color supports, never competes with, content. Asset catalog can set colors for the editing-mode UI.
- Never encode meaning by color alone (monochrome modes; watchOS may invert colors per face).
- Full-color images are desaturated in tinted and clear by default; you may opt out, but reserve full color for media (album art) and keep such images smaller than the widget.

**Per rendering mode**
- Full-color: support light and dark (light backgrounds in light, dark in dark), semantic system colors or asset variants.
- Accented: assign views to accent vs primary groups. iPhone, iPad, Mac tint both white; Apple Watch tints primary white and accent in the face color. (See "Optimizing your widget for accented rendering mode and Liquid Glass".)
- Vibrant: pixel opacity sets blur strength (transparent shows material), brightness sets vibrancy. Render content fully opaque; white or light gray for primary, darker grays for secondary; use opaque grays rather than white at reduced opacity; check grayscale contrast.

**Previews and placeholders**
- Gallery preview: realistic, showing each size's value; real data, or realistic simulated data if loading is slow.
- Placeholder while loading: static UI plus semi-opaque shapes (bars of varying width for text, circles or squares for images).
- Description: starts with an action verb ("See the current weather conditions..."), no "This widget shows", sentence case.
- Group all sizes under one widget with one description.
- Optionally color the gallery Add button with your brand.

**Platform notes**
- macOS: nothing extra. tvOS: not supported.
- iOS, iPadOS Lock Screen: behaves like complications; design both together; give useful info, not just a launcher. Styles: inline text above the clock; circular and rectangular below it. Support the iPhone Always-On display (reduced luminance; use grays with enough contrast).
- Use Live Activities, not widgets, for real-time tracking; build them together, sharing code and components.
- StandBy and CarPlay: two small widgets side by side, scaled up, background removed; supporting StandBy also covers CarPlay. Large text and glanceability matter in cars. Rely less on rich images or color; scale and rearrange text for distance. Mark the background removable. Low light renders red monochrome.
- Apple HomeView (added October 2026): small system family widgets with iPhone appearance, from HomeView or connected iPhone and iPad. Modular face holds up to 4 widgets, possibly from different household members, one Modular face per household, shown to everyone. Each household member has a personalized Home Screen.
- visionOS: widgets are 3D objects on surfaces that persist across restarts at real-world scale; size, mounting style and treatment style shape perception. Full color by default; accented when tinted from system palettes. People can change frame width (elevated) and widget-specific options (Music poster light or dark theme). Design for real rooms (Music poster readable across the room; small productivity widget on a desk). Test all tint palettes and lighting; untinted elements must stay legible.
- visionOS thresholds: simplified (at a distance: fewer details, larger type, no buttons or toggles) and default (nearby: more detail, smaller type). Keep shared elements across both. Choose sizes by placement context. People can scale 75 to 125 percent: use print-style hierarchy and high-resolution assets.
- visionOS mounting: elevated (default; horizontal surfaces tilt back with a soft shadow; vertical surfaces sit flush like a frame) suits standout content (reminders, media, data). Recessed (vertical only, set into the wall like a window) suits ambient content (weather, editorial). Opt out per widget; recessed-only widgets cannot go on horizontal surfaces. Declare with `supportedMountingStyles(_:)`; widgets with different style sets need separate configurations. Test elevated layouts at every system frame width (layout cannot react to it).
- visionOS treatment: paper (print-like, whole widget reacts to ambient light; Music poster) or glass (layered; foreground stays bright and full color regardless of light; suited to information-rich widgets like News headlines).
- watchOS: Smart Stack widgets default to black; use a meaningful custom background (Stocks red or green). Supply relevance (location, workouts) via RelevanceKit so the system surfaces your widget.

**Specifications**

iOS (pt):

| Screen (portrait) | Small | Medium | Large | Circular | Rectangular | Inline |
|---|---|---|---|---|---|---|
| 430x932 | 170x170 | 364x170 | 364x382 | 76x76 | 172x76 | 257x26 |
| 428x926 | 170x170 | 364x170 | 364x382 | 76x76 | 172x76 | 257x26 |
| 414x896 | 169x169 | 360x169 | 360x379 | 76x76 | 160x72 | 248x26 |
| 414x736 | 159x159 | 348x157 | 348x357 | 76x76 | 170x76 | 248x26 |
| 393x852 | 158x158 | 338x158 | 338x354 | 72x72 | 160x72 | 234x26 |
| 390x844 | 158x158 | 338x158 | 338x354 | 72x72 | 160x72 | 234x26 |
| 375x812 | 155x155 | 329x155 | 329x345 | 72x72 | 157x72 | 225x26 |
| 375x667 | 148x148 | 321x148 | 321x324 | 68x68 | 153x68 | 225x26 |
| 360x780 | 155x155 | 329x155 | 329x345 | 72x72 | 157x72 | 225x26 |
| 320x568 | 141x141 | 292x141 | 292x311 | N/A | N/A | N/A |

iPadOS (pt; Canvas = design size, Device = displayed size; asterisked screens in the source have identical canvas and device sizes):

| Screen (portrait) | Target | Small | Medium | Large | Extra large |
|---|---|---|---|---|---|
| 768x1024 | Canvas | 141x141 | 305.5x141 | 305.5x305.5 | 634.5x305.5 |
| | Device | 120x120 | 260x120 | 260x260 | 540x260 |
| 744x1133 | Canvas | 141x141 | 305.5x141 | 305.5x305.5 | 634.5x305.5 |
| | Device | 120x120 | 260x120 | 260x260 | 540x260 |
| 810x1080 | Canvas | 146x146 | 320.5x146 | 320.5x320.5 | 669x320.5 |
| | Device | 124x124 | 272x124 | 272x272 | 568x272 |
| 820x1180 | Canvas | 155x155 | 342x155 | 342x342 | 715.5x342 |
| | Device | 136x136 | 300x136 | 300x300 | 628x300 |
| 834x1112 | Canvas | 150x150 | 327.5x150 | 327.5x327.5 | 682x327.5 |
| | Device | 132x132 | 288x132 | 288x288 | 600x288 |
| 834x1194 | Canvas | 155x155 | 342x155 | 342x342 | 715.5x342 |
| | Device | 136x136 | 300x136 | 300x300 | 628x300 |
| 954x1373 * | Both | 162x162 | 350x162 | 350x350 | 726x350 |
| 970x1389 * | Both | 162x162 | 350x162 | 350x350 | 726x350 |
| 1024x1366 | Canvas | 170x170 | 378.5x170 | 378.5x378.5 | 795x378.5 |
| | Device | 160x160 | 356x160 | 356x356 | 748x356 |
| 1192x1590 * | Both | 188x188 | 412x188 | 412x412 | 860x412 |

visionOS:

| Widget | pt | mm at 100% scale |
|---|---|---|
| Small | 158x158 | 268x268 |
| Medium | 338x158 | 574x268 |
| Large | 338x354 | 574x600 |
| Extra large | 450x338 | 763x574 |
| Extra large portrait | 338x450 | 574x763 |

watchOS Smart Stack (pt): 40mm 152x69.5; 41mm 165x72.5; 42mm 176x72.5; 44mm 173x76.5; 45mm 184x80.5; 46mm 194x80.5; 49mm (Ultra 3, 4) 198x81.5; 49mm (Ultra 1, 2) 191x81.5.

Change log: October 13, 2026 added Apple HomeView and updated watchOS specs; December 16, 2025 added visionOS and CarPlay guidance; June 10, 2024 accented widgets for iOS 18 and iPadOS 18.
