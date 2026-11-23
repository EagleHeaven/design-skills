# Apple HIG: Design principles and platforms

Distilled from Apple's Human Interface Guidelines (state as of Nov 2026, Liquid Glass era). Rules are paraphrased; follow the source links for the authoritative text.

## Contents

1. [Design principles](#design-principles)
2. [Designing for iOS](#designing-for-ios)
3. [Designing for iPadOS](#designing-for-ipados)
4. [Designing for macOS](#designing-for-macos)
5. [Designing for tvOS](#designing-for-tvos)
6. [Designing for visionOS](#designing-for-visionos)
7. [Designing for watchOS](#designing-for-watchos)
8. [Designing for games](#designing-for-games)
9. [Designing for iPhone Duo](#designing-for-iphone-duo)
10. [Cross-platform quick reference](#cross-platform-quick-reference)

---

## Design principles

Source: https://developer.apple.com/design/human-interface-guidelines/design-principles

Reintroduced June 8, 2026. Eight principles; use them as tools to weigh trade-offs, there is no single correct application.

| Principle | One-line rule |
|---|---|
| Purpose | Build something meaningful: find what matters most to the audience and make that great. |
| Agency | Let people act their own way, keep them informed, make recovery easy. |
| Responsibility | Act in people's interest: safety, privacy, transparency. |
| Familiarity | Reuse known physical and digital patterns, consistently. |
| Flexibility | Adapt to diverse people, devices, inputs and contexts. |
| Simplicity | Be clear and direct; every element must earn its place. |
| Craft | Care about every detail. |
| Delight | Make it human; target the right emotion. |

### Purpose
- Keep asking what the product is for and whether each design choice serves that purpose.
- Prioritize the most important features (matched to how people actually use the app) and polish them; a clear use beats breadth.
- Study existing solutions, avoid re-creating them, and define what differentiates your product.

### Agency
- Get people straight to their task or content; stay unobtrusive until needed.
- Avoid locking people into flows or modes. Any required guided flow must be easy to skip or exit.
- Build in forgiveness: undo, reverse, return to a prior state, without costing time or work.

### Responsibility
- Make intentions clear from the first interaction. Explain why when requesting permission; state what data you collect and how it is used.
- Collect only what the product needs. Anticipate misuse and harm, and add protections.

### Familiarity
- Draw on real-world knowledge and other software people already use.
- Once an element has a look or behavior, apply it everywhere.
- Give clear feedback: show availability of controls, signal content changes, use system patterns for alerts and choices.

### Flexibility
- Design for everyone; treat accessibility as a priority from day one.
- Preserve context across platforms and configurations: keep content and controls in predictable places; use natural animation for transitions.
- Support many inputs: voice, touch, keyboard and more.
- Give every supported platform equal care so the app feels native everywhere.

### Simplicity
- Simplicity is not minimalism: keep important things close, let the rest recede.
- Use exactly the words needed for a concept or label.
- Establish hierarchy with recognizable controls and consistent structure so people know where they are and what comes next.

### Craft
- Be deliberate about visuals, animation, wording and audio.
- Prototype early, discard what fails, test in real-world conditions for durability and performance.
- Shipping is not the end: keep up with new platform capabilities and patterns.

### Delight
- Decide the emotion (energize, calm, thrill) and let it drive design.
- Treat each interaction, even an error message, as a chance for character.
- Do not let decoration get in the way of the task; balance practical and whimsical.
- Delight is the sum of the whole experience: freedom, safety to explore, familiar metaphors, flexibility.

---

## Designing for iOS

Source: https://developer.apple.com/design/human-interface-guidelines/designing-for-ios

### Device characteristics
| Aspect | iPhone |
|---|---|
| Display | Medium size, high resolution |
| Ergonomics | Held in one or two hands; switches portrait/landscape; viewing distance up to 1 to 2 ft |
| Inputs | Multi-Touch, virtual keyboard, voice control; gyroscope, accelerometer, personal data, spatial interactions |
| Sessions | From 1 to 2 minutes (checks, messages) to an hour or more (web, games, media); frequent app switching |
| System features | Widgets, Home Screen quick actions, Spotlight, Shortcuts, Activity views |

### Best practices
- Limit onscreen controls so primary tasks and content dominate; keep secondary details and actions discoverable with minimal interaction.
- Adapt seamlessly to orientation, Dark Mode and Dynamic Type; let people choose their configuration.
- Place controls in the middle and bottom of the display for easy reach; support swipe-back navigation and swipe actions on list rows.
- With permission, use platform data instead of asking people to type it: payments (Apple Pay), biometric auth, location.
- Adopt the Liquid Glass design system (see "Meet Liquid Glass", "Get to know the new design system").

---

## Designing for iPadOS

Source: https://developer.apple.com/design/human-interface-guidelines/designing-for-ipados

### Device characteristics
| Aspect | iPad |
|---|---|
| Display | Large, high resolution |
| Ergonomics | Handheld, on a surface or on a stand; typically within about 3 ft |
| Inputs | Multi-Touch, virtual keyboard, attached keyboard, pointing device, Apple Pencil, voice; often combined |
| Sessions | Quick actions to hours of games, media, creation, productivity; multiple apps onscreen; drag and drop between apps |
| System features | Multitasking, Widgets, Drag and drop |

### Best practices
- Use the large canvas to elevate content; minimize modal views and full-screen transitions; keep controls reachable but out of the way.
- Choose content size and density from viewing distance and input mode.
- Support touch, hardware keyboard, trackpad and Apple Pencil; consider interactions combining several inputs.
- Adapt to orientation, multitasking modes (window resizing), Dark Mode and Dynamic Type, and to running on macOS.

---

## Designing for macOS

Source: https://developer.apple.com/design/human-interface-guidelines/designing-for-macos

### Device characteristics
| Aspect | Mac |
|---|---|
| Display | Large, high resolution; extendable with extra displays, including iPad via Sidecar |
| Ergonomics | Stationary, on desk or table. On a Mac with a touch display, people reach forward, so touch is for brief, intentional actions, not sustained work |
| Inputs | Primarily keyboard and pointing device; also trackpad gestures, touch display, Siri, Voice Control, game controllers |
| Sessions | Minutes to hours of deep focus; many apps open; smooth active/inactive window transitions expected |
| System features | Menu bar, file management, full-screen mode, Dock menus |

### Best practices
- Show more content with fewer nested levels and less modality, while keeping density comfortable.
- Let people resize, hide, show and move windows; support full-screen mode.
- Expose every command through the menu bar.
- Provide keyboard shortcuts and support keyboard-only workflows.
- Support high-precision input for pixel-accurate selection and editing.
- Touch (added Oct 28, 2026): support standard gestures on trackpads and touch-display Macs. Use larger tap targets and controls that expand on touch, but keep visual control size and density unchanged so the UI stays optimized for keyboard and pointer.
- Allow personalization: customizable toolbars, window configurations, user-chosen colors and fonts.
- AppKit adoption of the new design: see "Build an AppKit app with the new design".

---

## Designing for tvOS

Source: https://developer.apple.com/design/human-interface-guidelines/designing-for-tvos

### Device characteristics
| Aspect | Apple TV |
|---|---|
| Display | Very large, high resolution |
| Ergonomics | Viewer often 8 ft or more away; may move around the room |
| Inputs | Siri Remote, game controller, voice, companion apps on other devices |
| Sessions | Long immersion (hours); picture-in-picture to follow another app or video |
| System features | TV app integration, SharePlay, Top Shelf, TV provider accounts |

### Best practices
- Build on the fluid, familiar Siri Remote gestures.
- Embrace the focus system: let it highlight and enlarge items so people always know where they are.
- Use edge-to-edge artwork, subtle fluid animation and engaging audio; keep everything legible from across the room.
- Multiuser: make sign-in easy and rare, handle shared sign-in, switch profiles automatically when the viewer changes.

---

## Designing for visionOS

Source: https://developer.apple.com/design/human-interface-guidelines/designing-for-visionos

### Device characteristics
| Aspect | Apple Vision Pro |
|---|---|
| Space | Infinite canvas for windows, volumes and 3D objects |
| Immersion | Apps launch in the Shared Space (apps side by side; people open, close, move windows). An app can move to a Full Space where it runs alone: blend 3D with surroundings, open a portal, or enter another world |
| Passthrough | Live camera video of surroundings; people adjust amount via the Digital Crown |
| Spatial Audio | Models room acoustics automatically; with permission to surroundings data, apps can fine-tune |
| Eyes and hands | Mostly indirect: look at an object, then tap fingers. Also direct: touch with a finger |
| Ergonomics | Everything is seen through cameras, so visual comfort is paramount; system places content relative to the head regardless of posture; content comes to the person |
| Accessibility | VoiceOver, Switch Control, Dwell Control, Guided Access, Head Pointer and more; system components are accessible by default |

Safety: not for use while driving or operating heavy machinery, nor while moving near hazards (balconies, streets, stairs). Device is for ages 13 and up.

### Best practices
- Use space, Spatial Audio and immersion, integrating passthrough and eye/hand input naturally.
- For each key moment, pick the minimum immersion that suits it (windowed, fully immersive, or in between); not every moment needs full immersion.
- Use standard windows (planes in space with familiar controls) for contained, UI-centric tasks. The system's dynamic scaling keeps window content legible near or far.
- Comfort rules:
  - Keep content in the field of view, positioned relative to the head; avoid requiring head turns or repositioning.
  - Avoid motion that is overwhelming, jarring, too fast, or lacks a stationary frame of reference.
  - Support indirect gestures so hands can rest in the lap or at the sides.
  - If you use direct gestures, keep targets close and interactions short.
  - Avoid encouraging lots of physical movement in fully immersive experiences.
- Support SharePlay shared activities; participants appear as spatial Personas.

---

## Designing for watchOS

Source: https://developer.apple.com/design/human-interface-guidelines/designing-for-watchos

### Device characteristics
| Aspect | Apple Watch |
|---|---|
| Display | Small, high resolution, easy to read; Always On shows info on wrist-down |
| Ergonomics | Within about 1 ft; raise wrist, interact with the other hand |
| Inputs | Digital Crown (vertical navigation, data inspection; consistent across watch face, Home Screen, apps), tap/swipe/drag (usable in motion), Action button (essential action without looking), shortcuts; sensors: GPS, blood oxygen, heart, altimeter, accelerometer, gyroscope |
| Sessions | Many glances per day, interactions often under 1 minute; complications, notifications and Siri often used more than the app itself |
| System features | Complications, Notifications, Always On, Watch faces |

### Best practices
- Favor quick, glanceable, single-screen interactions with a gesture or two.
- Keep navigation hierarchy shallow; use the Digital Crown for vertical scrolling and switching screens.
- Anticipate needs with on-device data; surface what is relevant now or very soon.
- Use complications for relevant, possibly dynamic data on the watch face; tapping opens the app.
- Use notifications for timely, high-value info with actions that work without opening the app.
- Use background color to convey supporting info, and materials to express hierarchy and place.
- Make the app work independently (no iPhone dependency) and complement notifications and complications with detail.

---

## Designing for games

Source: https://developer.apple.com/design/human-interface-guidelines/designing-for-games

### Jump into gameplay
- Make the game playable right after install: keep initial download at 30 minutes or less, pack as much playable content as possible, download the rest in the background.
- Choose smart defaults from the device: best resolution, auto-detect paired accessories and controllers, honor accessibility settings; support the platform's common inputs.
- Teach through play: fold configuration and onboarding into a playable tutorial; keep any written tutorial as optional reference.
- Defer permission requests (sensors, hand tracking) to the moment the data is needed, in context (for example, between the opening cutscene and first hand-controlled action). Ask for ratings only after meaningful play time.

### Text and button sizes per platform
| Platform | Default text | Minimum text | Default button | Minimum button |
|---|---|---|---|---|
| iOS, iPadOS | 17 pt | 11 pt | 44x44 pt | 28x28 pt |
| macOS | 13 pt | 10 pt | 28x28 pt | 20x20 pt |
| tvOS | 29 pt | 23 pt | 66x66 pt | 56x56 pt |
| visionOS | 17 pt | 12 pt | 60x60 pt | 28x28 pt |
| watchOS | 16 pt | 12 pt | 44x44 pt | 28x28 pt |

### Look good on every display
- Keep text high-contrast and at least the minimum size above. iOS buttons must be at least 44x44 pt for touch.
- Prefer resolution-independent textures and graphics; otherwise match device resolution. In visionOS prefer vector art that survives dynamic scaling.
- Respect rounded corners and camera housings via platform safe areas.
- In-game menus must adapt to aspect ratios such as 16:10, 19.5:9 and 4:3 (and both orientations on iPhone/iPad if supported). Use dynamic layouts with relative constraints; avoid fixed layouts; build device-specific layouts only when necessary.
- Support full-screen play (macOS, iOS, iPadOS full-screen mode; visionOS Full Space).

### Interaction methods
| Platform | Default | Additional |
|---|---|---|
| iOS | Touch | Game controller |
| iPadOS | Touch | Game controller, keyboard, mouse, trackpad, Apple Pencil |
| macOS | Keyboard, mouse, trackpad | Game controller, touch |
| tvOS | Remote | Game controller, keyboard, mouse, trackpad |
| visionOS | Touch (eyes and hands, indirect and direct gestures) | Game controller, keyboard, mouse, trackpad, spatial game controller |
| watchOS | Touch | None |

- Support each platform's default input; watch control sizing and menu behavior when porting from pointer to touch.
- Support physical controllers (every platform except watchOS) but always offer alternatives.
- On iPhone/iPad, offer touch controls: direct manipulation of game elements plus virtual controls overlaid on content.

### Welcome everyone
- Prioritize perceivability via sight, hearing or touch: never rely on color alone; subtitle cutscenes.
- Let players customize type size, control mapping, motion intensity, sound balance; use Apple accessibility APIs (system frameworks or Unity plug-ins).
- Avatar and identity tools should cover a broad range of human characteristics.
- Remove stereotypes in characters and stories; reference real cultures and languages respectfully.

### Apple technologies
- Game Center (all platforms): progress, achievements, leaderboards, challenges, multiplayer (GameKit).
- GameSave: sync game state via iCloud across devices.
- Core Haptics: custom haptic patterns with audio; iOS, iPadOS, tvOS, visionOS and many controllers.
- Multichannel audio for automatic Spatial Audio.
- Also AR, ML, HealthKit, location, camera, microphone for unique mechanics.

---

## Designing for iPhone Duo

Source: https://developer.apple.com/design/human-interface-guidelines/designing-for-iphone-duo

New Sept 9, 2026. iPhone Duo is a folding iPhone with an outer display and an inner display, each with a front camera, joined by a center hinge. It is still iPhone: all iOS guidance applies. Apps built with standard components that support resizing adapt with little work. Preview poses with Device Hub in Xcode. Developer guide: "Preparing your app for iPhone Duo".

### Anatomy
- Outer display (device closed): system puts toolbars and tab bars on the side to maximize vertical space. Controls stay on the side when the device opens in landscape.
- Outer front camera sits in a corner, always visible, vertically aligned with the side controls. Inner camera is under the display, hidden until active.
- Hinge supports many poses (book-like partial fold, flat on a surface, standing on an edge) and reduces usable space as it folds.

### Poses and sizing
- Do not build a custom layout per pose. Use size classes: compact width for the outer display, regular width for the inner display.
- Let the existing layout expand into available space instead of reinventing the app on resize.

### Best practices
- Build to resize: size classes, layout margins, safe area insets; no fixed widths or display-specific dependencies (Split View multitasking also applies).
- Keep functionality and element state identical across displays; keep information hierarchy, optionally showing one extra level on the inner display (Mail: list or message when closed, both side by side when open).
- Same controls and content in every pose, even if controls overflow or content resizes.
- Follow the system's vertical layout for toolbars, tab bars and navigation controls.
- Games: may lock orientation but must fill the screen in every pose; keep text and control size stable; prefer changing aspect ratio over letterbox/pillarbox; if unavoidable, fill padding with artwork.

### Dynamic layouts and reserved regions
- Use `safeAreaInsets` (SwiftUI and UIKit) and layout margins; avoid fixed widths.
- Reserved regions (areas content avoids or components adapt to, similar to iPad window controls):
  - Outer front camera: always present; expands into the Dynamic Island for Live Activities; side controls account for it automatically.
  - Inner front camera: only when active; UI moves aside to reveal it.
  - Folding region: present when partially open; splits the inner display and excludes the center.
- Alerts, context menus and sheets move to avoid the fold; split views adjust column widths and margins to the inner display's symmetry.
- Custom components: use `ReservedRegion` (SwiftUI) or `UIView.ReservedRegion` (UIKit).
- Prefer self-adapting containers (Notes split view resizes panes on fold). In grids, use an even column count so content divides at the fold.
- Avoid dramatic rearrangement while folding; move only what must move to stay visible and tappable.

### Split views
- Expand on the inner display, collapse to one pane on the outer display (same as regular vs compact on other iPhones). Standard ones adapt to reserved regions. APIs: `NavigationSplitView`, `UISplitViewController`.

### Arrangement views
- Container holding a primary and secondary view, arranged by size, orientation and reserved regions. APIs: `ArrangementView` (SwiftUI), `UIArrangementViewController` (UIKit).
  - Split arrangement: horizontal split when wider than tall, vertical split when taller than wide; axes can be restricted.
  - Overlay arrangement: primary over secondary; when partially folded, each view takes one side; secondary can be collapsed.
- Map existing layouts: HStack/VStack to split, ZStack to overlay.
- Keep navigation containers (navigation split views, tab views) outside arrangement views, wrapping them.

### Vertical controls
- On iPhone Duo, toolbars, tab bars and navigation controls move to the side. Exception: inner display in portrait keeps horizontal bars.
- Side controls include the Dynamic Island, status bar, toolbar (with navigation buttons) and tab bar.
- In Split View multitasking on the inner display, each app puts controls on its outer edge (left app on the left).
- Side controls stay aligned to hardware: same position relative to the outer camera, and same side in right-to-left languages.

Rules:
- Account for asymmetric content space; use safe areas so controls (including those of a neighboring app) never cover content.
- Keep controls' relative positions as similar as possible across poses.
- Order toolbar items top-down: primary navigation (Back, Close) first, then prominent actions (Done); keep remaining items in their original groups. The system inserts a gap between items from the former top and bottom bars.
- Overflow goes bottom to top by default. Set visibility priority on groups, then items: `ToolbarItemVisibilityPriority` (SwiftUI), `UIBarButtonItemVisibilityPriority` (UIKit). Keep frequent actions (Compose, New Note) and badged/status items visible longest.
- Do not override default bar placement in general.
- Bar-less, non-scrolling immersive UIs may span full width (Calculator) if nothing collides with the Dynamic Island or status bar; you can mix full-width backgrounds/headers with inset scrolling content.
- Group items with `ToolbarItemGroup` / `UIBarButtonItemGroup`; never add fixed spacing.
- Keep controls next to the content they affect (Mail list controls stay above the leading pane).
- Give every non-text toolbar item both a title and a symbol (`Label`, `UIBarButtonItem`); titles are used in overflow and expanded forms.
- Minimize text-only buttons: text labels stay in a horizontal bar. Prefer symbols.
- When space is tight: navigation-focused views push toolbar items to overflow to keep the tab bar (default); task-focused views minimize the tab bar to keep the toolbar. APIs: `ToolbarVerticalCompressionBehavior`, `UIVerticalBarCompressionBehavior`.
- Use the system overflow menu (`ToolbarOverflowMenu`, `additionalOverflowItems`); move custom overflow actions into it. Reserve the ellipsis symbol for overflow only.

---

## Cross-platform quick reference

| Platform | Viewing distance | Primary input | Typical session | Default text | Default/min hit target |
|---|---|---|---|---|---|
| iOS | 1 to 2 ft | Touch | Minutes to 1 h+ | 17 pt | 44x44 / 28x28 pt |
| iPadOS | Up to ~3 ft | Touch, Pencil, keyboard, pointer | Minutes to hours | 17 pt | 44x44 / 28x28 pt |
| macOS | Desk | Keyboard and pointer (touch brief) | Minutes to hours | 13 pt | 28x28 / 20x20 pt |
| tvOS | 8 ft+ | Siri Remote | Hours | 29 pt | 66x66 / 56x56 pt |
| visionOS | Head-relative space | Eyes and hands | Varies | 17 pt | 60x60 / 28x28 pt |
| watchOS | Within 1 ft | Touch, Digital Crown | Under 1 min | 16 pt | 44x44 / 28x28 pt |
