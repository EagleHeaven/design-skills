# Inputs (Apple HIG reference)

Distilled rules for hardware and interaction inputs across Apple platforms. Current as of Nov 2026 (Liquid Glass era). Each section links its source page.

## Table of contents

1. [Action button](#action-button)
2. [Apple Pencil and Scribble](#apple-pencil-and-scribble)
3. [Camera Control](#camera-control)
4. [Digital Crown](#digital-crown)
5. [Eyes](#eyes)
6. [Focus and selection](#focus-and-selection)
7. [Game controls](#game-controls)
8. [Gestures](#gestures) (includes standard gesture tables)
9. [Gyroscope and accelerometer](#gyroscope-and-accelerometer)
10. [Keyboards](#keyboards) (includes standard keyboard shortcut tables)
11. [Nearby interactions](#nearby-interactions)
12. [Pointing devices](#pointing-devices)
13. [Remotes](#remotes)

Cross-cutting principles that recur across every input page:

- Never make one input the only path to a task. Offer alternatives (touch, keyboard, voice, Switch Control, pointer, game controller).
- Reuse standard gestures, shortcuts, and button mappings for standard actions; never repurpose them for app-unique actions.
- Never collide with system-reserved inputs (system gestures, Home/logo button, Digital Crown press, hand-roll overlay gesture, Control-based shortcuts).
- Give immediate, continuous feedback that maps directly to the input.
- Accidental inputs (double tap, squeeze, remote tap, hover) must never trigger destructive or data-losing actions.

---

## Action button

Source: https://developer.apple.com/design/human-interface-guidelines/action-button

Hardware button on supported iPhone and Apple Watch (Ultra) models. People assign it at device setup and change it in Settings. Assigned App Shortcuts run as if invoked by Siri or Spotlight. On Apple Watch Ultra it supports activity actions (workouts, dives).

### Best practices

- Expose a set of your app's essential, frequently used functions as App Shortcuts the button can run (e.g. "Start Egg Timer" in a cooking app).
- Do not ship an "open app" shortcut: the system already provides it, and app icon, widgets, and complications cover launching.
- Label each action for the Settings picker:
  - Title-style capitalization.
  - Start with a verb, present tense.
  - Drop articles and prepositions.
  - Max 3 words. Example: "Start Race" (not "Started Race" or "Start the Race").
- Let the system teach people how to configure the button. Do not duplicate Settings guidance or system tips in your own UI.

### Platform notes

- Not supported in iPadOS, macOS, tvOS, visionOS.
- **iOS:** keep people in context. Prefer Live Activities and custom snippets over launching the app (e.g. "Set Timer" asks for a duration, then starts a Live Activity countdown without opening Clock).
- **watchOS:**
  - First press can drop a waypoint, start a dive, or begin a specific workout. Later presses can do secondary actions (mark a segment, advance to next modality in a multi-part workout).
  - Offer a secondary function that supports or advances the primary one. People press without looking, so the next press must follow logically and fit the context. Think hard before adding more than one secondary function (cognitive load).
  - Use subsequent presses to add functionality, not to stop or end the task. Put "stop" in the UI (pausing is different from stopping).
  - Action button + side button pressed together = pause the current function. Exception: dive apps, where pausing could be dangerous (losing track of depth or time underwater). Otherwise always honor it.

---

## Apple Pencil and Scribble

Source: https://developer.apple.com/design/human-interface-guidelines/apple-pencil-and-scribble

iPad only. Apple Pencil gives pixel-level precision for notes, sketching, painting, markup, and also works as a pointer. Scribble converts handwriting to text in any text field with on-device, private recognition.

### Best practices

- Support what people naturally try with real pens and pencils (e.g. writing in document or book margins).
- Let people pick when to use Pencil vs finger. All controls must respond to Pencil too; a control that ignores Pencil looks broken or like a dead battery. (Scribble accepts Pencil input only.)
- Mark on contact. No button tap or mode switch before the first stroke.
- Use available sensor data to shape strokes: tilt (altitude), force (pressure), orientation (azimuth), barrel roll. Map pressure to continuous properties such as ink opacity or brush size; keep it simple.
- Pencil must appear to directly and immediately manipulate what it touches. No seemingly disconnected effects elsewhere on screen.
- Design for left- and right-handed use. Keep controls out of areas either hand may cover; let people reposition controls if occlusion is possible.

### Hover

- Use hover to preview what touching down will do (e.g. size and color of the mark).
- Avoid changing the preview continuously with Pencil height; it does not clarify the mark and is distracting.
- Never start an action on hover (it is imprecise; especially never a destructive one).
- Preview mid-range values of dynamic properties (opacity, flow). Max-pressure previews can occlude the work area; min-pressure previews can be invisible.
- Use hover to surface relevant UI near the marking spot (e.g. tool-size contextual menu shown on Squeeze or a keyboard modifier while hovering).
- Show hover previews for Pencil, not for a pointing device; restrict to Pencil if needed to avoid confusing identical feedback. See "Adopting hover support for Apple Pencil".

### Double tap

- Honor the user's system double-tap setting when it fits: default toggles current tool and eraser; alternatives are toggle current/previous tool, show/hide color picker, or nothing.
- If system settings don't fit, you may use double tap to switch interaction mode (e.g. raise vs lower mode in a 3D mesh tool).
- For custom behavior, provide a control to choose it, make it discoverable, show which mode is active, and keep it off by default.
- Do not use double tap to modify content. Accidental double taps happen; prefer easily undoable actions; never risk data loss.

### Squeeze (Apple Pencil Pro)

- People may map squeeze to an App Shortcut instead of your custom action; plan for that.
- Only available when the paired iPad screen is on and Pencil Pro is not touching the screen. Results may happen out of the person's view.
- Treat squeeze as a single, quick, discrete action (not continuous, not held, not rapid repeats; it can be tiring). Respond to one squeeze and show the result promptly.
- Show any UI it reveals (e.g. contextual menu) near the Pencil tip.
- Keep squeeze actions nondestructive and undoable.

### Barrel roll (Apple Pencil Pro)

- Use only to modify marking (e.g. rotate the highlighter angle in Notes). Never for navigation or showing controls.

### Scribble

- Available to all apps by default. Works in standard text components (text fields, text views, search fields, editable web fields) except password fields.
- Custom text fields: don't require a tap or selection before writing.
- Enable writing wherever text entry feels natural, even without a visible field (e.g. Reminders: write in the blank area below the last item to create one). API: `UIIndirectScribbleInteraction`.
- Don't distract while writing: no autocompletion suggestions overlaying handwriting; hide placeholder text the moment writing starts.
- Keep the field stationary while writing. If it must move or resize (e.g. search field making room for results), delay until the person pauses.
- No autoscrolling of transcribed text during writing or Pencil selection.
- Give enough room to write: enlarge the field before writing begins or during pauses, never mid-writing. API: `UIScribbleInteraction`.

### Custom drawing (PencilKit, PaperKit)

- PencilKit gives low-latency drawing, a tool picker, and an ink palette.
- Canvas colors adapt to Dark Mode by default. When drawing over existing content (PDF, photo), disable dynamic color adjustment so markup stays sharp and visible.
- In compact environments the tool picker lacks undo/redo: add undo/redo buttons (e.g. in a toolbar). Consider supporting the standard 3-finger undo/redo gesture everywhere.

### Platform notes

- Not supported in iOS, macOS, tvOS, visionOS, watchOS (iPadOS only).

---

## Camera Control

Source: https://developer.apple.com/design/human-interface-guidelines/camera-control

iPhone 16 and iPhone 16 Pro models. Opens your camera experience instantly. Light press shows an overlay extending from the bezel; light double-press lists available controls; sliding a finger adjusts the selected control's value.

### Anatomy

- **Slider:** a range of values (e.g. contrast amount).
- **Picker:** discrete options (e.g. grid on/off).
- System also provides optional standard controls for zoom and exposure, alongside your custom ones.

### Best practices

- Use SF Symbols for control icons. Custom symbols are not supported. Symbols describe the control, not its current state. See the Camera & Photos category in the SF Symbols app.
- Keep control names short. Labels follow Dynamic Type; long names can cover the viewfinder.
- Add units or symbols to slider values (EV, %, custom string). API: `localizedValueFormat`.
- Define prominent slider values (most chosen, or evenly spaced like major zoom steps). The system snaps more easily to them. API: `prominentValues`.
- Reserve space for the overlay: it occupies the area beside the Camera Control in portrait and landscape. Keep your UI out of that area. Maximize viewfinder size and let the overlay appear and disappear over it.
- Minimize viewfinder distractions. Don't duplicate overlay controls (sliders, toggles) in your own UI while the overlay shows.
- Enable or disable controls per camera mode (e.g. disable video controls in photo mode). You cannot add or remove controls at runtime.
- Order controls: most used in the middle, less used at the sides. The system remembers the last control used in your app.
- Ship a locked camera capture extension so people can launch your camera from the Lock Screen, Home Screen, or inside other apps. API: `LockedCameraCapture`.

### Developer APIs

- `AVCaptureControl` (AVFoundation), "Enhancing your app experience with the Camera Control".

### Platform notes

- Not supported in iPadOS, macOS, watchOS, tvOS, visionOS.

---

## Digital Crown

Source: https://developer.apple.com/design/human-interface-guidelines/digital-crown

### Apple Vision Pro (system only)

People use the Digital Crown to: adjust volume; adjust immersion in a portal, Environment, or Full Space app/game; recenter content in front of them; open Accessibility settings; exit an app to the Home View. visionOS apps do not receive direct Digital Crown information.

### Apple Watch

- Since watchOS 10 the Crown is the primary navigation input: Smart Stack widgets on the watch face, vertical app scrolling on Home Screen, switching vertically paginated tabs, scrolling lists and variable-height pages.
- Apps cannot respond to Crown presses; watchOS reserves presses for system functions (e.g. revealing the Home Screen). Only rotation is available.
- Most models give haptic detents: linear by default after a set rotation distance; some system controls (table views) tick as new items scroll in.

Rules:

- Anchor navigation to the Crown: use vertically oriented list, tab, and scroll views. Always back up Crown interactions with equivalent touch interactions.
- Where navigation isn't needed, use the Crown to inspect data (e.g. World Clock advances time of day at a location).
- Always give visual feedback for rotation (pickers update displayed value; if you track raw rotation, update UI programmatically). No feedback reads as "the Crown does nothing here".
- Match UI update speed to rotation speed for precise control; never update so fast that values become hard to select.
- Use default haptics when they fit. Turn detents off if they clash with your animation. For tables with very different row heights, switch from row-based to linear detents for consistency.
- API: `WKCrownDelegate` (WatchKit).

### Platform notes

- Not supported in iOS, iPadOS, macOS, tvOS.

---

## Eyes

Source: https://developer.apple.com/design/human-interface-guidelines/eyes

visionOS. Looking at an element targets it; the system shows a **hover effect** highlight to confirm, and people then tap (pinch) to act. The system can expand components after a look (tab bar reveals labels; a button reveals a tooltip). Hover effect is distinct from **focus effects**, which apply to connected keyboards and game controllers.

Privacy: visionOS never tells apps where people look before they tap. System components report the tap automatically.

### Best practices

- Always offer multiple interaction methods; support accessibility features (see Accessibility).
- Design for visual comfort: keep needed objects within the field of view. The system auto-places the first window or volume in front of the person in Shared Space or Full Space. In a Full Space you may request head pose to place 3D content.
- Avoid forcing many quick eye movements across large areas or multiple depth levels.
- Place content at a comfortable distance: aim for at least 1 meter for reading or sustained use. Only place content very close for brief interactions.
- Prefer standard components; they respond consistently to gaze. Custom visual cues are harder to learn.

### Making items easy to see

- Minimize visual noise and especially motion; peripheral movement pulls the eyes involuntarily (e.g. don't reveal content next to a button the person is looking at).
- Space interactive items: at least 16 pt margin around each item's bounds, or item centers at least 60 pt apart.
- Avoid repeating patterns or textures filling the field of view (eyes lock onto elements at seemingly different depths). Limit patterns to small areas.

### Encouraging interaction

- Use subtle cues to guide gaze to the most likely item: near center of view, gentle motion, higher contrast, color or scale variation. Noticeable, not flashy or harsh.
- Give interactive items rounded shapes; corners pull the eye away from the center. More rounded is easier to target.
- For multi-element components (e.g. image + label acting as one), define one containing shape/region so the whole thing highlights when either part is looked at.

### Custom hover effects

How they work: you define two states (with and without the effect); the system applies the effect out of process. Your app never learns when the effect is shown or what state it's in, so a hover effect cannot run code that depends on gaze (e.g. it can show a favorite/non-favorite symbol you pre-specified, but cannot perform the favoriting).

- Reserve custom hover effects for special moments. Too many dilute impact, distract, and can cause visual discomfort.
- Choose the delay:
  - **None (default):** subtle effects or ones inviting interaction (e.g. slider knob appears).
  - **Short:** lets people look and act immediately without waiting (e.g. tab bar expansion).
  - **Long:** extra information most people won't need each time (e.g. tooltip under a button).
- Keep at least one primary view unchanged across both states for visual stability; changing everything disorients.
- Test thoroughly, ideally while wearing Apple Vision Pro.

### Platform notes

- Not supported in iOS, iPadOS, macOS, tvOS, watchOS (visionOS only).

---

## Focus and selection

Source: https://developer.apple.com/design/human-interface-guidelines/focus-and-selection

Focus visually confirms the target of interaction when navigating with a remote, game controller, or keyboard. Focusing often selects, except where auto-selection would cause a disruptive context change (e.g. opening a view). tvOS requires a separate gesture to select a focused item. iPadOS/macOS show focus with a ring or highlight; tvOS mostly uses the parallax effect.

### Best practices

- Rely on system focus effects. Build custom ones only if absolutely necessary.
- Never move focus without user interaction. Exception: with discrete directional input (keyboard, remote, controller), if the focused item disappears, move focus to a nearby item one step away. With non-directional input, just hide the focus indicator when the focused item disappears.
- Match platform focus scope:
  - iPadOS and macOS: Full Keyboard Access reaches controls, so you only add focus for content elements (list items, text fields, search fields), not buttons, sliders, toggles.
  - tvOS: every onscreen element must be focusable via directional input.
- Match platform focus appearance. iPadOS/macOS focused list items: white text on accent-color highlight; unfocused: standard text color on gray highlight (`UICollectionView`, `NSTableView`).
- Use a focus ring for text and search fields; use a full-row highlight for lists and collections (a ring may suit a cell filled by a photo).

### Platform notes

- Not supported in iOS or watchOS.
- **iPadOS (15+):** focus system covers text fields, text views, sidebars, collection views, and custom views.
  - tvOS uses *directional focus* (same swipe/arrow to reach everything). iPadOS uses *focus groups* (sidebar, grid, list):
    - Tab moves between focus groups.
    - Arrow keys move directionally within the current group only.
  - Two focus appearances: **halo** (focus ring, a customizable outline for custom views and opaque cell content like images) and **highlighted** (text in accent color, automatic on selected collection cells with content configurations; not technically a focus effect).
  - Customize the halo when needed: match rounded corners or Bézier shapes, reposition if occluded or clipped (e.g. keep a badge above it). API: `UIFocusHaloEffect`.
  - Tab order follows reading order (leading to trailing, top to bottom). To make focus traverse a vertical stack before moving trailing, mark the stack as one focus group. API: `focusGroupIdentifier`.
  - Raise priority of the most likely item so it becomes the group's *primary item* and gets focus when the group does. API: `UIFocusGroupPriority`.
- **tvOS:**
  - In full-screen content, gestures act on content, not focus (full-screen items don't show focus).
  - Don't show a pointer for navigating menus/UI; use focus. A free pointer is acceptable in gameplay (hunting hidden objects, flying). If a pointer is required, make it highly visible and integrated.
  - Focusable items have up to five visually distinct states; supply assets at the larger focused scale so they stay sharp, and leave room so scaled items don't crowd neighbors.

| State | Meaning |
|---|---|
| Unfocused | Not focused; less prominent than focused items. |
| Focused | Stands out via elevation to foreground, illumination, animation. |
| Highlighted (pressed) | Instant feedback when chosen (e.g. button briefly inverts colors and animates). |
| Selected | Chosen or activated (e.g. favorite heart filled when selected, empty when deselected). |
| Unavailable | Cannot be focused or chosen; appears inactive. |

- **visionOS:** same focus system as iPadOS/tvOS for connected keyboards and game controllers. Gaze uses the hover effect, which is unrelated to focus.

---

## Game controls

Source: https://developer.apple.com/design/human-interface-guidelines/game-controls

Support physical controllers and the platform's default input (touch, remote, mouse and keyboard). Reasons: not every player owns a controller (all platforms except watchOS support them), and players like using the input they know.

### Touch controls (iOS, iPadOS)

Use the Touch Controller framework for virtual controls overlaid on gameplay.

- Decide whether overlays are needed. They suit games with many actions or movement control. Prefer direct interaction with game objects where possible (tap an object to select it instead of a "select" button).
- Placement:
  - Respect device bounds and safe areas; never overlap the Home indicator or Dynamic Island.
  - Frequent buttons near the thumb, outside the circular zones where players expect movement and camera input.
  - Secondary controls (menus) at the top of the screen.
- Minimum sizes: **44x44 pt** for frequently used controls, **28x28 pt** for less important controls (e.g. menus).
- Always show visible and tactile press states: a visual effect visible around the finger (e.g. glow), plus sound and haptics.
- Use artwork that depicts the action (e.g. a weapon for attack). Avoid abstract shapes or controller names (A, X, R1) as button art.
- Show and hide controls by context. Hide unavailable or irrelevant actions; consider hiding movement controls until the player touches the screen.
- Combine functions into one control. Avoid simultaneous or sequenced multi-button presses; use double tap or touch and hold for variants (e.g. hold for a powered-up attack); merge related actions (walk/sprint) into one control.
- Movement on the left side, camera on the right side, each with the largest possible input area. Movement: a floating virtual thumbstick that appears where the thumb lands (not fixed). Camera: direct touch panning, not a thumbstick.

### Physical controllers

- Always provide a fallback to the platform default input: touchscreen (iPhone, iPad), keyboard + trackpad/mouse (Mac), remote (Apple TV), eyes and hands (Apple Vision Pro).
- tvOS and visionOS games can require a controller; the App Store shows a "Game Controller Required" badge. The game can still be launched without one, so detect absence and gracefully prompt to connect. API: `GCRequiresControllerUserInteraction`.
- Auto-detect paired controllers and read their profile instead of manual setup (Game Controller framework).
- Match the connected controller's own labels, colors, and symbols in UI. The framework uses placement-based standard names that may differ from physical markings. API: `GCControllerElement`.
- With multiple controllers, use glyphs for the one the player is actively using; in multiplayer, use each player's controller labels; list several together if referring to buttons across controllers.
- Prefer symbols over text for controller elements; the Game Controller framework supplies SF Symbols for most buttons across brands.

Expected UI behavior outside gameplay (all Apple platforms):

| Button | Expected UI behavior |
|---|---|
| A | Activate a control |
| B | Cancel, or go back to previous screen |
| X | (none defined) |
| Y | (none defined) |
| Left shoulder | Navigate left to another screen or section |
| Right shoulder | Navigate right to another screen or section |
| Left trigger | (none defined) |
| Right trigger | (none defined) |
| Left/right thumbstick | Move selection |
| Directional pad | Move selection |
| Home/logo | Reserved for system |
| Menu | Open game settings or pause |

### Keyboards (key bindings in games)

- Prioritize single-key commands (easier while using a mouse/trackpad). Use first letters (I = Inventory, M = Map); map the main action to Space (large key).
- Test comfort on an Apple keyboard. Remap Control (^) bindings from non-Apple keyboards to Command (⌘), which sits next to Space and is easy to reach while on W, A, S, D.
- Use key proximity: put high-value commands near WASD; group related actions on adjacent keys (e.g. number keys for inventory categories).
- Let players customize key bindings, with reasonable defaults.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS. Not supported in watchOS.
- **visionOS:** supports wireless controllers and spatial controllers (e.g. PlayStation VR2 Sense). Mirror hand input: look at an object + press left/right trigger = indirect interaction; reach out + press trigger = direct interaction.

---

## Gestures

Source: https://developer.apple.com/design/human-interface-guidelines/gestures

Gestures happen on touchscreens, in the air (visionOS), or on trackpads, mice, remotes, and controllers with touch surfaces. Tap, swipe, and drag exist everywhere and people expect them everywhere.

### Best practices

- Always provide more than one way to do a task (voice, keyboard, Switch Control). Never assume a gesture is possible for everyone.
- Respond to gestures as people expect. Don't use familiar gestures (tap, swipe) for app-unique actions; don't invent gestures for standard actions (activating a button, scrolling).
- Respond immediately and give feedback that predicts the result and shows how much movement completes the action.
- Indicate when a gesture is unavailable (e.g. locked object that can't be dragged; disabled button must look clearly distinct). Otherwise people think the app froze.

### Custom gestures

- Add only when needed, for frequent specialized tasks not covered by standard gestures (games, drawing). A custom gesture must be:
  - Discoverable
  - Easy to perform
  - Distinct from other gestures
  - Never the only way to do an important action
- Make them easy to learn; teach in context; test in real scenarios. If you can't explain it with simple words and graphics, it's too hard.
- Shortcut gestures supplement, never replace, standard controls (e.g. keep the Back button in the top toolbar even if edge-swipe goes back).
- Never conflict with system UI gestures (watchOS edge swipe, visionOS hand-roll for overlays). Games and immersive experiences can defer system gestures in specific cases.

### Platform notes

**iOS, iPadOS** additional expected gestures:

| Gesture | Common action |
|---|---|
| Three-finger swipe | Undo (left), redo (right) |
| Three-finger pinch | Copy selected text (pinch in), paste (pinch out) |
| Four-finger swipe (iPadOS only) | Switch apps |
| Shake | Undo or redo |

- Allow simultaneous recognition only when it helps (mainly games: joystick + fire buttons at once).

**macOS:** primary input is keyboard + pointing device. Standard gestures work on Magic Trackpad, Magic Mouse, touch-surface controllers. On a Mac with a touch display, or iPad via Sidecar, touch is a secondary input.

- Keep layout and element sizes identical when touch is supported; people switch inputs often.
- Enlarge tap targets, not the controls; anticipate touches slightly outside visual bounds. Standard controls get optimal tap targets automatically.
- For small or dense controls, offer a temporary enlarged touch variant on tap; keep it easy to see while touched and leave it briefly after lift-off. Standard steppers, sliders, dials do this automatically.
- Never make touch the only route. Everything must work with keyboard and pointer. Conversely, provide touch equivalents for pointer-only actions (modifier-drag like shift-drag, hover-revealed menus).
- Reuse gestures people know from your iPhone/iPad app or Mac trackpad/Magic Mouse; test for conflicts with macOS system gestures.
- Make custom gestures work on both touch display and trackpad; use modifier keys where needed.

**tvOS:** standard gestures via Siri Remote, compatible remotes, or touch-surface controllers. See Remotes.

**visionOS:** two gesture categories.

- *Indirect:* look to target, then act from a distance (e.g. tap finger and thumb to select). Comfortable at any distance, minimal movement.
- *Direct:* physically touch the object (e.g. typing on the virtual keyboard). Best within reach and for infrequent use (raised arms tire). All standard gestures have direct versions.

| Direct gesture | Common use |
|---|---|
| Touch | Select or activate an object |
| Touch and hold | Open a contextual menu |
| Touch and drag | Move an object |
| Double touch | Preview an object or file; select a word when editing |
| Swipe | Reveal actions and controls; dismiss views; scroll |
| Two hands pinch and drag together/apart | Zoom in or out |
| Two hands pinch and drag in a circle | Rotate an object |

- Support standard gestures everywhere (tap is the first thing people try after looking).
- Offer both indirect and direct where possible. Prefer indirect for UI and common components; reserve direct and custom gestures for objects inviting close-up interaction or specific game motions.
- Don't require specific body movements or positions; provide alternative inputs.
- Custom gestures require a Full Space and permission to access hand data ("Setting up access to ARKit data").
  - Prioritize comfort; test ergonomics; avoid sustained raised arms and many repetitive similar motions.
  - Be careful with multi-finger or two-hand gestures; offer a lower-movement alternative.
  - Never require a specific hand (cognitive load; excludes strong hand dominance and limb differences).
- System overlays (visionOS 2+): looking at a palm and gesturing opens Home and Control Center; reserved systemwide. (visionOS 1 look-up behavior remains as an accessibility setting.)
  - Keep the area around a person's hand clear. Avoid anchoring content to hands or wrists; if a game must, place it outside the immediate hand area to avoid colliding with the Home indicator.
  - In immersive Full Space apps you can defer overlays so a tap is required before the Home indicator appears. API: `persistentSystemOverlays(_:)`. Apps built for visionOS 1 defer by default.
  - Be cautious with custom gestures involving hand/wrist/forearm rolling; that motion is reserved for overlays, which draw over your content without notifying you. Test for conflicts.

**watchOS double tap** (watchOS 11+): scrolls lists and scroll views, advances vertical tab views. You can set a toggle or button as the primary action in your app, widget, or Live Activity in the Smart Stack; double tap highlights then performs it. In notifications, it runs the first nondestructive custom action.

- Don't set a primary action in views with lists, scroll views, or vertical tabs (conflicts with default navigation).
- Pick the most commonly used button as primary in a nonscrolling view (e.g. play/pause in media controls). APIs: `handGestureShortcut(_:isEnabled:)`, `primaryAction`.

### Specifications: standard gestures

| Gesture | Supported in | Common action |
|---|---|---|
| Tap | iOS, iPadOS, macOS, tvOS, visionOS, watchOS | Activate a control; select an item |
| Swipe | iOS, iPadOS, macOS, tvOS, visionOS, watchOS | Reveal actions and controls; dismiss views; scroll |
| Drag | iOS, iPadOS, macOS, tvOS, visionOS, watchOS | Move a UI element |
| Touch (or pinch) and hold | iOS, iPadOS, macOS, tvOS, visionOS, watchOS | Reveal additional controls or functionality |
| Double tap | iOS, iPadOS, macOS, tvOS, visionOS, watchOS | Zoom in; zoom out if zoomed; open an item on a Mac touch display; primary action on Apple Watch Series 9+ and Ultra 2+ |
| Zoom | iOS, iPadOS, macOS, tvOS, visionOS | Zoom a view; magnify content |
| Rotate | iOS, iPadOS, macOS, tvOS, visionOS | Rotate a selected item |

### Specifications: macOS trackpad vs touch display

| Action | Trackpad | Touch display |
|---|---|---|
| Select | Primary click | Tap |
| Open | Double click | Double tap |
| Scroll | Two-finger slide up/down | One-finger slide up/down |
| Zoom | Pinch | Pinch |
| Rotate | Two fingers around each other | Two fingers around each other |
| Context menu | Secondary click | Touch and hold |
| Drag | Click and drag | Touch and hold, then drag |

Developer: Gestures (SwiftUI), `UITouch` (UIKit).

---

## Gyroscope and accelerometer

Source: https://developer.apple.com/design/human-interface-guidelines/gyro-and-accelerometer

Motion data available in iOS, iPadOS, watchOS; tvOS gets gyroscope data from the Siri Remote. Framework: Core Motion.

- Use motion data only for a tangible benefit (fitness feedback, enhanced gameplay). Never collect it just to have it.
- Required: purpose string explaining why you need motion data; the system shows it in the permission prompt on first access, where people grant or deny.
- Outside active gameplay, don't use motion to directly manipulate UI: hard to replicate precisely, physically hard for some people, drains battery.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS, watchOS.

---

## Keyboards

Source: https://developer.apple.com/design/human-interface-guidelines/keyboards

Physical keyboards connect to every device except Apple Watch. A *keyboard shortcut* = primary key + one or more modifiers (Control, Option, Shift, Command). In games a *key binding* is often a single key (game binding guidance lives in Game controls).

### Best practices

- Support Full Keyboard Access (iOS, iPadOS, macOS, visionOS): navigate and activate windows, menus, controls, system features by keyboard only. Test via Settings > Accessibility. APIs: `isFullKeyboardAccessEnabled`, "Support Full Keyboard Access in your iOS app".
- iPadOS: support keyboard navigation in text fields, text views, sidebars, collection views, and custom views, but NOT for controls (buttons, segmented controls, switches). Leave controls, full navigation, and gesture-like interactions (drag and drop) to Full Keyboard Access.
- Respect standard shortcuts. For a frequent unique action, create a custom shortcut rather than repurpose a standard one. Games: keep expected ones (Command-Q quits) but allow rebinding.

### Standard keyboard shortcuts

- Don't repurpose standard shortcuts. Only redefine when the standard action is meaningless in your app (e.g. no text editing, so Command-I can become Get Info instead of Italic).

| Primary key | Shortcut | Action |
|---|---|---|
| Space | Command-Space | Show/hide Spotlight search field |
| | Shift-Command-Space | Varies |
| | Option-Command-Space | Show Spotlight results window |
| | Control-Command-Space | Show Special Characters window |
| Tab | Shift-Tab | Navigate controls in reverse |
| | Command-Tab | Next most recently used open app |
| | Shift-Command-Tab | Move backward through open apps (by recent use) |
| | Control-Tab | Focus next group of controls in a dialog, or next table (when Tab moves to next cell) |
| | Control-Shift-Tab | Focus previous group of controls |
| Esc | Esc | Cancel current action or process |
| | Option-Command-Esc | Open Force Quit dialog |
| Eject | Control-Command-Eject | Quit all apps (after saving open documents) and restart |
| | Control-Option-Command-Eject | Quit all apps (after saving) and shut down |
| F1 | Control-F1 | Toggle full keyboard access |
| F2 | Control-F2 | Focus menu bar |
| F3 | Control-F3 | Focus Dock |
| F4 | Control-F4 | Focus active (or next) window |
| | Control-Shift-F4 | Focus previously active window |
| F5 | Control-F5 | Focus toolbar |
| | Command-F5 | Turn VoiceOver on/off |
| F6 | Control-F6 | Focus first (or next) panel |
| | Control-Shift-F6 | Focus previous panel |
| F7 | Control-F7 | Temporarily override keyboard access mode in windows and dialogs |
| F8, F9, F10 | (none) | Varies |
| F11 | (none) | Show desktop |
| F12 | (none) | Hide or display Dashboard |
| Grave accent (`) | Command-` | Activate next open window in frontmost app |
| | Shift-Command-` | Activate previous open window in frontmost app |
| | Option-Command-` | Focus the window drawer |
| Hyphen (-) | Command-Hyphen | Decrease selection size |
| | Option-Command-Hyphen | Zoom out (screen zoom on) |
| Left bracket | Command-Left bracket | Left-align selection |
| Right bracket | Command-Right bracket | Right-align selection |
| Pipe (\|) | Command-Pipe | Center-align selection |
| Colon (:) | Command-Colon | Show Spelling window |
| Semicolon (;) | Command-Semicolon | Find misspelled words |
| Comma (,) | Command-Comma | Open app settings window |
| | Control-Option-Command-Comma | Decrease screen contrast |
| Period (.) | Command-Period | Cancel an operation |
| | Control-Option-Command-Period | Increase screen contrast |
| Question mark (?) | Command-? | Open app Help menu |
| Forward slash (/) | Option-Command-/ | Toggle font smoothing |
| Equal sign (=) | Shift-Command-= | Increase selection size |
| | Option-Command-= | Zoom in (screen zoom on) |
| 3 | Shift-Command-3 | Capture screen to file |
| | Control-Shift-Command-3 | Capture screen to Clipboard |
| 4 | Shift-Command-4 | Capture selection to file |
| | Control-Shift-Command-4 | Capture selection to Clipboard |
| 8 | Option-Command-8 | Toggle screen zoom |
| | Control-Option-Command-8 | Invert screen colors |
| A | Command-A | Select all items, or all characters in a text field |
| | Shift-Command-A | Deselect all |
| B | Command-B | Bold / toggle bold |
| C | Command-C | Copy selection to Clipboard |
| | Shift-Command-C | Show Colors window |
| | Option-Command-C | Copy style of selected text |
| | Control-Command-C | Copy formatting settings to Clipboard |
| D | Option-Command-D | Show/hide Dock |
| | Control-Command-D | Show Dictionary definition of selected word |
| E | Command-E | Use selection for Find |
| F | Command-F | Open Find window |
| | Option-Command-F | Jump to search field |
| | Control-Command-F | Enter full screen |
| G | Command-G | Find next occurrence |
| | Shift-Command-G | Find previous occurrence |
| H | Command-H | Hide current app's windows |
| | Option-Command-H | Hide all other apps' windows |
| I | Command-I | Italic / toggle italic (or Info window where no text styling) |
| | Option-Command-I | Show inspector window |
| J | Command-J | Scroll to selection |
| M | Command-M | Minimize active window to Dock |
| | Option-Command-M | Minimize all app windows to Dock |
| N | Command-N | New document |
| O | Command-O | Open document dialog |
| P | Command-P | Print dialog |
| | Shift-Command-P | Page Setup dialog |
| Q | Command-Q | Quit app |
| | Shift-Command-Q | Log out current user |
| | Option-Shift-Command-Q | Log out without confirmation |
| S | Command-S | Save new document or save a version |
| | Shift-Command-S | Duplicate active document or Save As |
| T | Command-T | Show Fonts window |
| | Option-Command-T | Show/hide toolbar |
| U | Command-U | Underline / toggle underline |
| V | Command-V | Paste at insertion point |
| | Shift-Command-V | Paste as (e.g. Paste as Quotation) |
| | Option-Command-V | Apply style of one object to selection |
| | Option-Shift-Command-V | Paste and match surrounding text style |
| | Control-Command-V | Apply formatting settings to selection |
| W | Command-W | Close active window |
| | Shift-Command-W | Close file and its windows |
| | Option-Command-W | Close all app windows |
| X | Command-X | Cut selection to Clipboard |
| Z | Command-Z | Undo |
| | Shift-Command-Z | Redo (when Undo and Redo are separate commands) |
| Right arrow | Command-Right arrow | Switch to current Roman-script keyboard layout |
| | Shift-Command-Right arrow | Extend selection to next semantic unit (usually end of line) |
| | Shift-Right arrow | Extend selection one character right |
| | Option-Shift-Right arrow | Extend selection to end of word, then next word |
| | Control-Right arrow | Move focus to another value or cell in a view (e.g. table) |
| Left arrow | Command-Left arrow | Switch to current system-script keyboard layout |
| | Shift-Command-Left arrow | Extend selection to previous semantic unit (usually start of line) |
| | Shift-Left arrow | Extend selection one character left |
| | Option-Shift-Left arrow | Extend selection to start of word, then previous word |
| | Control-Left arrow | Move focus to another value or cell in a view |
| Up arrow | Shift-Command-Up arrow | Extend selection up to next semantic unit (usually start of document) |
| | Shift-Up arrow | Extend selection to line above, same horizontal position |
| | Option-Shift-Up arrow | Extend selection to start of paragraph, then next paragraph |
| | Control-Up arrow | Move focus to another value or cell in a view |
| Down arrow | Shift-Command-Down arrow | Extend selection down to next semantic unit (usually end of document) |
| | Shift-Down arrow | Extend selection to line below, same horizontal position |
| | Option-Shift-Down arrow | Extend selection to end of paragraph, then next (includes paragraph terminator in cut/copy/paste) |
| | Control-Down arrow | Move focus to another value or cell in a view |

Input-source shortcuts (localization, layouts, input methods; not menu commands):

| Shortcut | Action |
|---|---|
| Control-Space | Toggle current and last input source |
| Control-Option-Space | Next input source in list |
| [Modifier]-Command-Space | Varies |
| Command-Right arrow | Current Roman-script layout |
| Command-Left arrow | Current system-script layout |

### Custom keyboard shortcuts

- Define them only for the most frequent app-specific commands; too many makes the app feel hard to learn.
- Use modifiers as people expect: Command-drag moves items as a group; Shift while drag-resizing locks aspect ratio; holding an arrow key nudges selection by the smallest app unit until release.

| Modifier | Symbol | Recommended usage |
|---|---|---|
| Command | ⌘ | Preferred main modifier for custom shortcuts |
| Shift | ⇧ | Secondary modifier complementing a related shortcut |
| Option | ⌥ | Sparingly, for less common commands or power features |
| Control | ⌃ | Avoid; system uses it widely (focus movement, screenshots) |

- Some layouts need modifiers to type characters (French: Option-5 types "{"). Command is usually safe; avoid extra modifiers on characters not on all keyboards; if you need a non-Command modifier, use it only with letters.
- Order multiple modifiers: Control, Option, Shift, Command.
- Don't add Shift for the upper character of a two-character key; show the upper character (Help = Command-?, not Shift-Command-/; Hide Status Bar = Command-/).
- Let the system localize keys for the connected keyboard and mirror shortcuts in right-to-left layouts.
- Never build a new shortcut by adding a modifier to an existing one for an unrelated command (e.g. Shift-Command-Z must relate to undo/redo).

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS. Not supported in watchOS.
- **visionOS:** holding Command on a connected keyboard shows a shortcut interface organized like a menu bar (File, Edit, View), all categories in one view, listing only available commands that have shortcuts.
  - Write self-explanatory shortcut titles; submenu titles don't appear in this flat list. API: `discoverabilityTitle`.
  - With a physical keyboard, the system shows a virtual keyboard overlay with typing completion and other controls; account for it.

Developer: `KeyboardShortcut` (SwiftUI), Input events (SwiftUI), "Handling key presses made on a physical keyboard" (UIKit), Mouse, Keyboard, and Trackpad (AppKit).

---

## Nearby interactions

Source: https://developer.apple.com/design/human-interface-guidelines/nearby-interactions

Experiences using the presence, distance, and direction of nearby people and devices (e.g. bring iPhone near HomePod mini to hand off audio). Requires Ultra Wideband hardware and the Nearby Interaction framework. People grant permission before participating. Device identifiers are random and last only for the session (privacy).

### Best practices

- Start from the physical-world version of the task to find a natural interaction (bringing devices together beats tapping UI).
- Use distance, direction, and context. Prioritize nearby, relevant information (e.g. share sheet suggests the closest contact the person faces, using U1-chip devices plus recent/frequent contacts).
- Let changing distance shape feedback, sharpening as people get closer (Find My AirTag: arrow becomes pulsing circle).
- Give continuous, uninterrupted feedback that tracks movement.
- Blend visual, audio, and haptic feedback. Visual when looking at the screen; audio and haptic when engaging with the environment.
- Never make a nearby interaction the only way to complete a task.

### Device usage

- Encourage portrait orientation (landscape lowers accuracy and availability). If portrait-only while the feature runs, guide implicitly with visuals; avoid explicitly telling people to rotate.
- Design for the sensor's directional field of view (similar to the Ultra Wide camera on iPhone 11 and later). Outside it you may get distance but no direction.
- Explain in onboarding/tutorials that people, animals, or large objects between devices reduce accuracy and availability.

### Platform notes

- No additional considerations for iPadOS. Not supported in macOS, tvOS, visionOS.
- **iOS:** provides peer distance and direction.
- **watchOS:** provides peer distance only; participating watchOS apps must be in the foreground.

---

## Pointing devices

Source: https://developer.apple.com/design/human-interface-guidelines/pointing-devices

Trackpad or mouse. Mac users combine pointer with keyboard. On iPad and Apple Vision Pro, a pointer adds a way to interact without replacing touch, eyes, or gestures.

### Best practices

- Respond consistently to mouse/trackpad gestures (e.g. "Swipe between pages" behaves the same for documents, web pages, images).
- Never redefine systemwide trackpad gestures (Dock, Mission Control), even in games. Mac users can customize them.
- Keep the experience consistent across gestures, eyes, pointer, and keyboard; people switch fluidly.
- Let the pointer reveal and hide auto-minimizing controls (iPadOS Safari toolbar on pointer hover; video playback controls).
- Modifier-key behaviors must match across inputs (Option-drag duplicates via both touch and pointer).

### Platform notes

- No additional considerations for iOS. Not supported in tvOS or watchOS.

**iPadOS** (pointer adapts to context; adds to touch, never replaces it):

- Implement multiple selection in custom views if needed (click-drag draws a selection rectangle; standard non-list collection views do it by default). API: `UIBandSelectionInteraction`.
- Distinguish pointer from finger only when it adds value (e.g. click a precise seek point on a scrubber, while both can drag the playhead).

Pointer shape and content effects:

- Default shape is an arrow; it can morph to system or custom shapes (I-beam over text).
- Three content effects:
  - **Highlight:** materializes a Liquid Glass shape between pointer and control. Default for bar buttons, tab bars, segmented controls, edit menus.
  - **Lift:** subtle parallax, scale up, shadow below, soft specular highlight on top, so the element appears to float. Default for standalone Liquid Glass controls, app icons, Control Center buttons.
  - **Hover:** custom scale, tint, or shadow; doesn't transform the pointer shape.
- Pointer accessories: small secondary indicators combined with any pointer (e.g. resize arrows on an axis). API: `UIPointerAccessory`.
  - Use clear, simple, low-detail images.
  - Use animated accessory transitions to signal state changes (e.g. `plus` to `circle.slash` when add becomes unavailable).

Standard pointers and effects:

- Support system content effects, aligned to their intent:
  - Highlight for a group of controls in a Liquid Glass container.
  - Lift for a standalone Liquid Glass control or small opaque-background element.
  - Hover for large elements, tuning scale, tint, shadow.
- Use system pointer appearances for standard buttons and text areas.
- Hit-region padding: about **12 pt** around elements with a bezel; about **24 pt** around visible edges of elements without a bezel. Too small feels fiddly; too large feels sticky.
- Make hit regions of adjacent custom bar buttons contiguous so the highlight doesn't flicker out between them.

Customizing pointers:

- Use system effects for custom elements that behave like standard ones (custom toolbar buttons without highlight look broken).
- Apply pointer effects consistently across similar areas (every drawing area alike).
- No gratuitous or decorative pointer/content effects.
- Keep custom pointer shapes simple and instantly understandable.
- Consider useful annotations (X/Y values over a graph; Keynote shows width/height while resizing).
- Never attach instructional text to the pointer.
- Balance shadow, scale, spacing in custom hover: scale only where there's room (not table rows); in tight spaces use tint without scale and shadow; never shadow without scale (looks elevated but not closer).

**macOS** standard clicks and gestures (people can customize, enable/disable, choose secondary-click regions and finger combos):

| Click or gesture | Expected behavior |
|---|---|
| Primary click | Select or activate an item (file, button) |
| Secondary click | Reveal context menus |
| Scrolling | Move content up, down, left, right |
| Smart zoom | Zoom content such as a web page or PDF |
| Swipe between pages | Navigate forward/back between pages |
| Swipe between full-screen apps | Move between full-screen apps and spaces |
| Mission Control (two-finger double-tap on mouse, or three/four-finger swipe up on trackpad) | Activate Mission Control |
| Lookup and data detectors (one-finger force click or three-finger tap) | Lookup window above selected content |
| Tap to click | Primary click via tap |
| Force click | Click then press firmly for Quick Look or lookup; variable pressure drives pressure-sensitive controls (e.g. variable-speed media) |
| Pinch with two fingers | Zoom in or out |
| Two fingers in circular motion | Rotate content |
| Swipe from trackpad edge | Notification Center |
| Three/four-finger swipe down | App Exposé (current app's windows) |
| Pinch with thumb and three fingers | Show apps list |
| Spread with thumb and three fingers | Show Desktop |

macOS pointer styles:

| Pointer | Meaning | APIs |
|---|---|---|
| Arrow | Standard selection and interaction | AppKit `arrow`; SwiftUI `default` |
| Closed hand | Dragging to reposition content in a view | `closedHand`; `grabActive` |
| Context menu | Context menu available (usually only with Control held) | `contextualMenu` |
| Cross | Precise rectangular selection (e.g. Preview) | `crosshair`; `rectSelection` |
| Disappearing item | Dragged item will vanish on drop; original unaffected | `disappearingItem` |
| Drag copy | Drop duplicates the item (Option during drag) | `dragCopy` |
| Drag link | Drop creates an alias (Option + Command during drag) | `dragLink` |
| Horizontal I beam | Text selection/insertion, horizontal layout | `iBeam`; `horizontalText` |
| Open hand | Dragging to reposition is possible | `openHand`; `grabIdle` |
| Operation not allowed | Can't drop here | `operationNotAllowed` |
| Pointing hand | Content is a link | `pointingHand`; `link` |
| Resize up / down | Horizontal divider can move only up / only down | `rowResize(directions:)` |
| Resize up down | Resize a row via horizontal divider either way | `rowResize`, `rowResize(directions:)` |
| Resize left / right | Vertical divider can move only left / only right | `columnResize(directions:)` |
| Resize left right | Resize a column via vertical divider either way | `columnResize`, `columnResize(directions:)` |
| Resize north / south / east / west | Frame edge can move only in that direction (at min/max size) | `frameResize(position:directions:)` |
| Resize north south / east west | Drag top/bottom or left/right edge either way | `frameResize(position:directions:)` |
| Resize northeast / northwest / southeast / southwest | Corner can move only in that direction (at min/max size) | `frameResize(position:directions:)` |
| Resize northeast southwest / northwest southeast | Drag the corner either way | `frameResize(position:directions:)` |
| Vertical I beam | Text selection/insertion, vertical layout | `iBeamCursorForVerticalLayout`; `verticalText` |
| Zoom in / Zoom out | Magnify or reduce canvas or object | `zoomIn` / `zoomOut` (AppKit and SwiftUI) |

(Resize APIs exist under the same names in AppKit and SwiftUI.)

Touch support for hover-revealed controls on touch-display Macs:

- Add touch reveal only for essential controls. Skip static info (tooltips) and features already reachable by touch (swipe a carousel instead of revealing its arrows). Don't keep hidden controls permanently visible to accommodate touch.
- Reveal a hidden control when someone taps its general location. Show only controls relevant to the current content. Hide when done, or after a few seconds of nonuse (sidebar and tab-close exceptions below).
- Preserve the current selection when tapping to reveal and when tapping the revealed control.
- Put essential hidden controls in a short context menu (touch and hold opens it).
- Sidebars: tapping a section header or row does the same as a click (expand/collapse, select) and reveals that item's hidden controls (e.g. Finder Favorites disclosure button). Keep them visible until touch moves outside the sidebar or a pointing device is used. Tapping a hidden control's area reveals it without activating; a second tap activates.
- Tabbed windows: tapping anywhere in the window reveals the selected tab's close button; keep it until pointer use resumes; after closing a tab via touch, show the close button on the newly selected tab.

**visionOS:** external pointer and keyboard work alongside eyes and hands. Look at an element then move the pointer, and focus goes to the element under the pointer (automatic). Gaze sets pointer context (looking at another window moves the pointer's context there). While gesturing on a trackpad or mouse, the pointer hides, reappearing where the person looks when moved.

Developer: Input events (SwiftUI), Pointer interactions (UIKit), Mouse, Keyboard, and Trackpad (AppKit).

---

## Remotes

Source: https://developer.apple.com/design/human-interface-guidelines/remotes

The Siri Remote is Apple TV's primary input: dedicated buttons plus a clickpad with a touch surface (swipe, press).

### Best practices

- Use standard gestures for standard actions outside gameplay; don't redefine standard remote behavior.
- Stay consistent with tvOS focus: always move focus in the same direction as the gesture.
- Show clear feedback for gestures (e.g. resting a thumb shows where to swipe down for an info area).
- Define new gestures only where they make sense (fun in games; unwelcome elsewhere).
- Distinguish press (intentional: choose, confirm, gameplay action) from tap (navigation, extra info). Thumbs rest, pick up, and hand off the remote, causing accidental taps; usually ignore taps during live video playback.
- Use positional taps (up, down, left, right on the touch surface) only when intuitive and discoverable.
- Back button opens the parent of the current screen (at top level, the Apple TV Home Screen; within the app, the hierarchy parent, not necessarily the previous screen).
  - Exception in active gameplay: Back opens an in-game pause menu (to avoid accidental exits); Back again closes the menu and resumes. Navigate to the main menu via another control in the pause menu.
  - Press and hold Back always goes to the Home Screen from anywhere.
- Play/Pause must play, pause, or resume during media playback.

### Gestures

- **Swipe:** scroll with momentum (fast then slowing by swipe strength). Swiping up/down on the remote's edge speeds through items very quickly.
- **Press:** activate a control or select an item. Press then swipe enters scrubbing mode.

### Button behavior

| Button or area | In an app | In a game |
|---|---|---|
| Touch surface (swipe) | Navigate; change focus | Directional pad behavior |
| Touch surface (press) | Activate control or item; navigate deeper | Primary button behavior |
| Back | Previous screen; exit to Apple TV Home Screen | Pause/resume; previous screen, exit to main game menu, or exit to Home Screen |
| Play/Pause | Start playback; pause/resume playback | Secondary button behavior; skip intro video |

### Compatible remotes (live TV, EPG)

- If your live app has an electronic program guide (EPG), open it on "guide" or "browse" buttons; navigate it with "page up"/"page down". Don't map those buttons to anything else while in the EPG. Siri Remote and compatible remotes can also tap upper/lower touch areas to browse the EPG. Without an EPG, the system routes these presses to the device's default guide app. Developer: "Providing Channel Navigation".
- During playback, "page up"/"page down" change the channel (different from their EPG behavior).

### Platform notes

- Not supported in iOS, iPadOS, macOS, visionOS, watchOS (tvOS only).
