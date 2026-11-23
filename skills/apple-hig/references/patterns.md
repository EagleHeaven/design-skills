# Apple HIG: Patterns

Distilled, actionable rules from Apple's Human Interface Guidelines "Patterns" pages (Liquid Glass era, checked Nov 2026). Rules are paraphrased; consult each Source link for artwork and full context.

## Table of contents

1. [Charting data](#charting-data)
2. [Collaboration and sharing](#collaboration-and-sharing)
3. [Drag and drop](#drag-and-drop)
4. [Entering data](#entering-data)
5. [Feedback](#feedback)
6. [File management](#file-management)
7. [Going full screen](#going-full-screen)
8. [Launching](#launching)
9. [Live-viewing apps](#live-viewing-apps)
10. [Loading](#loading)
11. [Managing accounts](#managing-accounts)
12. [Managing notifications](#managing-notifications)
13. [Modality](#modality)
14. [Multitasking](#multitasking)
15. [Offering help](#offering-help)
16. [Onboarding](#onboarding)
17. [Playing audio](#playing-audio)
18. [Playing haptics](#playing-haptics)
19. [Playing video](#playing-video)
20. [Printing](#printing)
21. [Ratings and reviews](#ratings-and-reviews)
22. [Searching](#searching)
23. [Settings](#settings)
24. [Undo and redo](#undo-and-redo)
25. [Workouts](#workouts)

### Quick numbers cheat sheet

| Fact | Value | Page |
|---|---|---|
| Drag image appears after drag distance of | about 3 pt | Drag and drop |
| Tooltip max length | 60 to 75 characters | Offering help |
| Tip complexity ceiling | feature needing more than 3 actions is too complex for a tip | Offering help |
| Tip cadence example | once every 24 hours | Offering help |
| Time Sensitive notification relevance window | happening now or within 1 hour | Managing notifications |
| System rating prompt cap | 3 times per app per 365 days | Ratings and reviews |
| Gap between your rating requests | at least 1 to 2 weeks | Ratings and reviews |
| TV app loading screen threshold | show black screen + centered spinner only if loading exceeds 2 s | Playing video |
| tvOS interactive overlay | pause media with minimum 0.5 s delay before showing | Playing video |
| visionOS scrubbing thumbnails | 160 px wide each | Playing video |
| watchOS video clip length | 30 s or less | Playing video |
| watchOS audio | 64 kbps HE-AAC | Playing audio / video |
| Aspect-fill default | wide video 2:1 through 2.40:1 | Playing video |
| Aspect (fit) default | up to 2:1 (4:3, 16:9) and ultrawide above 2.40:1 | Playing video |
| macOS full screen shortcut | Control-Command-F | Going full screen |
| Settings shortcut | Command-Comma (games: Esc) | Settings |
| Undo / Redo on Mac | Command-Z / Shift-Command-Z | Undo and redo |

---

## Charting data

Source: https://developer.apple.com/design/human-interface-guidelines/charting-data

Charts suit tasks like spotting trends (historical or predicted), showing the current state of something that changes over time, and comparing items or the same item across time or categories. If people only need the raw values (no insight or analysis), use a scrollable, searchable, sortable list or table instead.

**Best practices**
- Use a chart to spotlight what matters in a dataset; charts draw the eye, so make the takeaway obvious.
- Keep charts simple. Do not cram data in; reveal detail progressively (let people pick levels of detail or subsets). For complex interactive charts, consider offering several versions with increasing functionality so people learn gradually.
- Make every chart accessible: provide accessibility labels for values and components and accessibility elements for interaction (see "Enhancing the accessibility of a chart").

**Designing effective charts**
- Default to familiar chart types (bar, line) so people already know how to read them.
- For a novel chart type, teach how to read it (example: Activity animates each ring separately on first pairing to map rings to Move, Exercise, Stand).
- Inspect the data at macro (totals, averages), mid (useful subsets), and micro (individual notable values) levels to find details worth surfacing.
- Add descriptive text: titles, subtitles, annotations, and a headline summary of the key takeaway (example: Weather's "chance of light rain in the next hour" above the hourly chart). Summary text helps but never replaces accessibility labels.
- Size the chart to its function and detail level: large enough for legible labels and the interactions you support; small charts work for glanceable item info or as a preview that expands elsewhere.
- Keep charts that serve similar purposes consistent in type and style; deviate only to signal a meaningful difference.
- When several charts show one dataset from different angles, keep chart type, colors, annotations, layout, and text consistent (example: Health Trends small charts expand to a full chart with identical style, colors, marks, annotations).

**Platform notes**: none beyond the above for iOS, iPadOS, macOS, tvOS, visionOS, watchOS.

**APIs**: Swift Charts.

---

## Collaboration and sharing

Source: https://developer.apple.com/design/human-interface-guidelines/collaboration-and-sharing

People start sharing or collaborating via the share sheet or by dropping a document into a Messages conversation. Once collaboration starts, the Collaboration button lets them communicate, run custom actions, and manage details; Messages can notify them of mentions, edits, joins, and leaves. Works with CloudKit, iCloud Drive, or a custom backend; a custom backend must also support universal links. For real-time shared activities, use SharePlay.

**Best practices**
- Put the Share button somewhere convenient, typically a toolbar. iOS 16 share sheet (and iPadOS 16 / macOS 13 sharing popover) includes file-sharing method and permission choices for new collaborations. In SwiftUI, `ShareLink` opens the system share sheet.
- Customize the share sheet or popover to expose the sharing types you support:
  - CloudKit: pass both the file and the collaboration object; the sheet detects the file and enables "send copy".
  - iCloud Drive: "send copy" works by default.
  - Custom: include a file (or a plain-text representation) in the collaboration object to enable "send copy".
- Write short permission summaries ("Only invited people can edit", "Everyone can make changes"); the system shows this on a button that opens the sharing options.
- Keep custom sharing options few and grouped clearly: who can access, edit vs read-only, whether collaborators can invite others.
- Show the system Collaboration button prominently as soon as collaboration begins; place it next to the Share button.
- The Collaboration popover has three sections: top (collaborators plus Messages/FaceTime buttons), middle (your custom items), bottom (manage button). Add custom items only when essential (example: Notes shows recent updates and buttons for more activity).
- Optionally retitle the management button (default "Manage Shared File"). CloudKit sharing provides the management view; otherwise build your own.
- Consider posting collaboration events to Messages (content change, membership change, mention) with a universal link to the relevant view (`SWHighlightEvent`).

**Platform notes**
- tvOS: not available.
- visionOS: the system streams the current window for screen sharing in the Shared Space; if someone moves the app to a Full Space, the stream pauses for others until it returns to the Shared Space.
- watchOS: use `ShareLink` in SwiftUI to present the share sheet.

**APIs**: `ShareLink`, Shared with You, `SWHighlightEvent`, Activity views.

---

## Drag and drop

Source: https://developer.apple.com/design/human-interface-guidelines/drag-and-drop

Content moves from a *source* to a *destination*, within one container, across containers, or across apps. Default semantics: same container = move; different container = copy; between apps = always copy.

Input methods: visionOS pinch-and-hold and drag in any direction including z-axis; iOS/iPadOS touch, pointer, Full Keyboard Access; Universal Control between Mac and iPad; Mac pointer, Full Keyboard Access, VoiceOver, or touch display.

**Best practices**
- Support drag and drop broadly; people try it everywhere. System text fields and text views include it.
- Always provide alternatives (menu commands to copy/move). On iOS/iPadOS expose sources and destinations to assistive tech with `accessibilityDragSourceDescriptors` and `accessibilityDropPointDescriptors`.
- Decide move vs copy deliberately; keep the default (same container moves, different container copies) unless people clearly expect otherwise, and choose the option least likely to cause data loss.
- Support multi-item drags. iOS, iPadOS, macOS, visionOS allow dragging a selected group; macOS allows gathering items from several apps; iPadOS lets people add items to a drag already in progress.
- Support undo of drops. For irreversible drops, ask for confirmation (Finder confirms dropping into a write-only folder) or offer a reversal path (Photos lets people cancel sharing after dropping into a shared stream).
- Offer multiple representations ordered highest to lowest fidelity (example: PDF vector, then lossless PNG with transparency, then lossy JPEG; or native chart object, then image).
- Consider spring loading: dragging over buttons or segmented controls activates them (Calendar: drag an event onto Day/Week/Month/Year). Mac with Magic Trackpad: force click while holding; iPad: hover while holding.

**Feedback during drag**
- Show a drag image once the selection moves about 3 points; make it translucent so destinations remain visible; keep it until the drop.
- Optionally morph the drag image to preview the result (photo expands to its default size in a document). Use *flocking* to group multiple items and ungroup on drop. Do not change the image constantly or radically.
- Indicate drop eligibility: show insertion point or highlight only when the destination accepts the item; otherwise show nothing or a "not allowed" image such as SF Symbol `circle.slash`. Show highlight only while hovering; remove when the drag leaves. Highlight one candidate destination at a time.
- On invalid drop or failure, animate the item back to its source (if visible) or scale up and fade out ("evaporate").

**Accepting drops**
- Auto-scroll a scrolling destination while the item hovers inside it; stop when the drag leaves (system text views do this).
- Pick the richest representation you can handle (native chart object over image).
- Extract only the relevant part (Mail takes only name and email from a dropped contact).
- With a physical keyboard, check Option at drop time: Option held forces copy within the same container; released before drop means move.
- Show progress for slow transfers (progress indicator, plus a placeholder at the drop location in collections, lists, tables). The system may show an alert for slow inter-app transfers.
- If a drop starts a task (e.g. printing), show that it started and report progress.
- Dropped text keeps its style if both sides support it; otherwise adopt the destination style.
- After the drop, keep the dropped content selected in the destination. Same-container move: content leaves its origin. Same-container copy: deselect the original. Cross-container: deselect in the source.

**Platform notes**
- tvOS, watchOS: not supported.
- iOS, iPadOS: support multiple simultaneous drag sessions; let people add items mid-drag (show flocking) and accept multiple simultaneous drops.
- macOS:
  - Consider supporting drag to Finder in a format your app can reopen (Calendar exports `.ics`). Use a *clipping* (temporary container, unrelated to the Clipboard) when appropriate.
  - Allow dragging a *background selection* from an inactive window without activating it.
  - Allow dragging an unselected item from an inactive window without disturbing its background selection.
  - Consider a count badge (small filled oval with a number) during multi-item drags; update it if the destination accepts only a subset.
  - Change the pointer to reflect the outcome: copy, drag link, disappearing item, operation not allowed.
  - Let people select and drag in one motion (no pause) for single items.
- visionOS: when content is dropped into empty space, launch your app to handle it by associating an `NSUserActivity` with draggable content (URLs open Safari; Quick Look content opens Quick Look).

**APIs**: Drag and drop (UIKit), Drag and Drop (AppKit), File Provider, `NSUserActivity`.

---

## Entering data

Source: https://developer.apple.com/design/human-interface-guidelines/entering-data

Goal: minimize what people must type and support every input method.

**Best practices**
- Pull data from the system (settings) or via permission (location, calendar) instead of asking.
- Make requirements explicit: placeholder prompts ("username@company.com"), introductory labels ("Email"), sensible prefilled defaults.
- Use secure entry for sensitive data (shows a filled dot per character): `SecureField`. tvOS digit entry can obscure numerals (`isSecureDigitEntry`). visionOS system fields show input only to the wearer; secure fields blur automatically during AirPlay streaming.
- Never prefill a password field. Require entry or use biometrics / keychain.
- Prefer choices (picker, menu, selection control) over free text, even with a keyboard present.
- Accept drag and drop and paste as input.
- Validate dynamically, as values are entered, and flag problems immediately. For numbers, use a number formatter (restricts to numeric input; can format decimals, percent, currency).
- Make required data obvious: enable Next/Continue only after required fields are filled.

**Platform notes**
- macOS: use an *expansion tooltip* (appears on pointer hover) to show full text clipped in a narrow field; also applies to iOS/iPadOS apps running on Mac.

**APIs**: `SecureField`, `isSecureDigitEntry`, Input events (SwiftUI), number formatters.

---

## Feedback

Source: https://developer.apple.com/design/human-interface-guidelines/feedback

Feedback communicates status, success or failure, warnings about negative consequences, and chances to fix mistakes. Match delivery intrusiveness to significance: passive status for routine info, interruption for data-loss risk.

**Best practices**
- Make feedback accessible by using multiple channels (color, text, sound, haptics) so it reaches people who are muted, looking away, or using VoiceOver.
- Integrate status near the content it describes (Mail shows last update and unread count in the mailbox toolbar).
- Use alerts only for critical, ideally actionable information; overuse dulls them.
- Warn before unexpected, irreversible data loss. Do not warn when loss is the expected result (Finder does not warn on every Move to Trash).
- Confirm completion of significant actions only (Apple Pay success). Otherwise people assume success; tell them about failure.
- When a command cannot run, say so and explain why (Maps explains it cannot route between identical start and end).

**Platform notes**
- watchOS: avoid indeterminate progress (spinners) because they make people feel they must keep watching; instead promise a notification on completion.

**APIs**: Animation and haptics (UIKit). Related: Alerts, Playing audio, Playing haptics, Motion.

---

## File management

Source: https://developer.apple.com/design/human-interface-guidelines/file-management

Document-based apps create, edit, save, and browse files. People also browse outside apps via Finder (Mac) or Files (iPhone, iPad, Vision Pro). watchOS and tvOS have no document browser.

**Creating and opening**
- Offer New and Open through app menus and keyboard shortcuts. iPadOS lists them in the hold-Command shortcuts overlay; macOS in the File menu. Always include an Add (+) button for new documents as well; on macOS put add in the File menu.
- A custom file browser must respect the platform file system: you may open at the most relevant spot (Documents, iCloud, last location) but let people reach the rest.

**Saving**
- Preserve work automatically: autosave periodically during editing, on close, and on app switch. Avoid requiring explicit saves.
- Hide file extensions by default with an option to show them; reflect that choice in every open/save UI.

**Quick Look**
- Use a Quick Look viewer to preview files your app cannot open (attachments) without leaving the app. Previews can be interactive (listen to audio, mark up photos, rotate 3D).
- If you create custom file types, ship a Quick Look generator so Finder, Files, Spotlight, and other apps can preview them.

**Platform notes: iOS, iPadOS**
- Document launcher (iOS 18 / iPadOS 18+, `DocumentGroupLaunchScene`): full-screen, branded entry with three parts: a *title card* (app name plus two app-defined buttons), a background image with optional *accessories* around the card, and a sheet with a file browser and optional custom toolbar controls.
  - Map title card buttons to the most important actions: primary usually creates a document; secondary offers more options (Numbers: Start Writing / Choose a Template).
  - Use a background (solid, gradient, or pattern) clearly distinct from accessories and the title card; avoid busy imagery.
  - Place accessories (in front of and behind the card for depth) without obscuring the app name or either button; avoid clutter; test across sizes and orientations.
  - Animate sparingly: gentle, repeating motion (breathing, swaying).
- File provider app extension (File Provider): custom UI for import, export, open, move.
  - When opening/importing, list only context-appropriate files (PDF editor host: only PDFs); optionally show modification date, size, local vs remote.
  - When exporting/moving, let people choose a destination in your hierarchy; optionally allow creating subfolders.
  - Do not add a custom top toolbar; the host modal already has one.

**Platform notes: macOS**
- Use the default file browser unless you have a strong reason not to.
- Custom open UI: offer "open recent", filtering criteria, multi-select; you may retitle the Open button to the task (e.g. Insert).
- Provide a save UI to change name, format, location. New documents are titled "Untitled" by default. Default to a logical location; offer a format picker if you support several.
- Consider a custom accessory view in the Save dialog (Mail's "include attachments").
- Finder Sync extension (for sync apps): show sync-status badges, add contextual menu items (favorite, password-protect), add toolbar buttons for global actions (start sync).
- If people disable autosave (Desktop & Dock: "Ask to keep changes when closing documents"), show unsaved state and present a save dialog on close, quit, log out, restart.
- Unsaved indicator when autosave is off: a dot in the window close button and beside the doc name in the Window menu. Do not show these dots when autosave is on. Appending "Edited" to the title is allowed in either mode, but remove it as soon as an autosave or explicit save happens.

---

## Going full screen

Source: https://developer.apple.com/design/human-interface-guidelines/going-full-screen

Available on iPhone, iPad, Mac. Apple TV and Apple Watch are always full screen. Vision Pro has no full-screen mode (people enlarge windows or use the Digital Crown for immersion).

**Best practices**
- Offer full screen for games, media (video, slideshows), and deep-focus tasks.
- Adapt layout to the larger space (adjust proportions, keep the same items) but never resize the window programmatically; keep transitions subtle.
- Keep essential controls reachable without exiting (persistent or easily revealed playback controls).
- Except in games, let people reveal the Dock on iPadOS and macOS. Games may defer the first bottom-edge swipe (iPadOS) or hide the Dock (macOS): `preferredScreenEdgesDeferringSystemGestures` (SwiftUI and UIKit), `hideDock` (AppKit).
- When people leave and return, resume where they were; auto-pause games and slideshows on leave.
- Let people decide when to exit; do not end full screen automatically when they switch away or finish an activity.
- Hide toolbars and navigation temporarily when content is the focus (photos, reading), restorable by tap, swipe down, or moving the pointer to the top. Keep controls visible when they are essential.

**Platform notes**
- tvOS, visionOS, watchOS: not supported.
- iOS, iPadOS: the Home indicator auto-hides and returns when people touch the bottom area; one swipe exits. Keep that default; only if accidental exits occur, require two swipes via `preferredScreenEdgesDeferringSystemGestures`.
- macOS:
  - Use the system full-screen implementation (`toggleFullScreen(_:)`); it handles the camera housing area at top center on some Macs.
  - Games: do not change the display mode when entering full screen; it does not help performance and removes user control.
  - Let people choose to enter: Enter Full Screen window button, View menu item, Control-Command-F. Avoid custom window-mode menus; games may add their own toggle.

---

## Launching

Source: https://developer.apple.com/design/human-interface-guidelines/launching

Launch begins at open (including initial download) and ends when the first screen is ready. Onboarding, if any, comes after.

**Best practices**
- Launch instantly; people may not wait more than a couple of seconds.
- Provide a launch screen where required: iOS, iPadOS, tvOS. Not required on macOS, visionOS, watchOS.
- Put any splash screen at the start of onboarding, or right after launch if you have no onboarding.
- Restore prior state on relaunch, as granularly as possible: scroll position, window positions and states.

**Launch screens** (iOS, iPadOS, tvOS only)
- Downplay it: it is neither onboarding nor splash nor artistic canvas; its only job is to make launch feel instant.
- Make it nearly identical to the first screen to avoid a flash. If the app shows a solid color first, the launch screen is just that color. Match current orientation and appearance (light/dark).
- No text, even if the first screen has text (it cannot be localized).
- No ads or branding; no logos unless they are a fixed part of the first screen; do not mimic a splash or About window.

**Platform notes**
- iOS, iPadOS: launch in the device's current orientation if you support both; otherwise launch in your only orientation. Landscape-only apps must handle both left and right rotation.
- tvOS: launch screen is static (not layered). Live-viewing apps may auto-start new or recent live content after a few seconds of inactivity.
- visionOS: even fully immersive apps should consider launching a Shared Space window first to give context while loading and to offer a control for entering the Full Space.

---

## Live-viewing apps

Source: https://developer.apple.com/design/human-interface-guidelines/live-viewing-apps

Prioritize live content on every screen and make it distinguishable from video on demand (VOD) at a glance.

**Best practices**
- Feature live content prominently; put it in the first tab so playback is at most one tap away.
- Start playback with one tap or zero (e.g. a Watch Now button over featured content that disappears and goes immersive full screen).
- Make live content look live: actually play it, and mark it (a "Live" row, badges, symbols, sashes).
- Consider progress indicators for in-progress live programs so people know where they will join.
- Playback is always the primary action; also offer record, restart, download, etc., in a consistent order everywhere (e.g. Watch, Start Over, Record, Favorite). Show other airings so people can schedule.
- Consider a content footer to browse channels during playback:
  - Subtle darkening behind it for legibility.
  - Mark the currently playing item (badge or tinted progress bar).
  - Use the same categories as the EPG.
  - Symmetric invoke/dismiss (swipe up to show, swipe down to hide).
- Give instant visual feedback on channel change (confirms arrival, masks stream load time).
- Audio follows context: keep live audio while browsing in-app; stop it when people leave the live tab.

**EPG (electronic program guide)**
- On open, make current program, channel, and time obvious with quick return to playback.
- Make paging, scrolling, jumping easy; consider My Channels or Favorites groups.
- Use familiar categories (Movies, TV Shows, Kids, Sports, Popular); keep content footer categories identical.
- Let people browse without leaving content (PiP or background playback).

**Cloud DVR**
- Start/stop recording from the info panel during live playback.
- Record future programs from a detail view; offer this program only or all future episodes.
- Let people target precisely (current episode, new episodes only, games with specific teams).
- Allow play, delete, and recording-setting edits from DVR detail views.
- Offer DVR management: delete watched or old recordings; ideally automatic storage management that overwrites oldest or watched content.

**Platform notes**: none additional.

---

## Loading

Source: https://developer.apple.com/design/human-interface-guidelines/loading

Best loading is invisible.

**Best practices**
- Show something immediately (placeholder text, graphics, animation) and swap in content as it arrives; blank screens look broken.
- Load in the background and let people do other things (read about next level, use menus).
- For long unavoidable loads, show engaging content (hints, tips, new features). Estimate remaining time accurately so filler content neither runs short nor repeats.
- Download large assets in the background with the Background Assets framework (after install, during updates, at nondisruptive times) to speed install and launch.

**Showing progress**
- Communicate that loading is happening and how long it may take. Use *determinate* progress indicators when duration is known, *indeterminate* when not.
- Games may use custom loading views that match their art style.

**Platform notes**
- watchOS: avoid loading indicators; show content immediately. If a second or two is needed, a loading indicator beats a blank screen.

**APIs**: Background Assets, Progress indicators.

---

## Managing accounts

Source: https://developer.apple.com/design/human-interface-guidelines/managing-accounts

Require an account only if core functionality needs it. If required, consider Sign in with Apple.

**Best practices**
- In the sign-in view, briefly and warmly explain why an account is needed and its benefits.
- Delay sign-in as long as possible (let shoppers browse; require sign-in at purchase).
- Without Sign in with Apple on iOS, iPadOS, macOS, visionOS, prefer passkeys (people provide only a user name). If you keep passwords, add two-factor authentication.
- Name the specific method on buttons ("Sign In with Face ID", not "Sign In").
- Mention only methods available on this device (check `LABiometryType`; no Face ID wording on devices without it).
- Avoid an in-app opt-in toggle for biometrics; people enable it at system level.
- Do not use the word *passcode* for account authentication (it implies reusing the device passcode).

**Deleting accounts**
- If you let people create an account in-app, you must let them delete it (not just deactivate). Comply with regional laws (right to be forgotten). If law requires retaining data (e.g. health records) or a specific process, explain it clearly.
- Provide a clear in-app way to start deletion; if deletion happens on the web, link directly to that page and do not bury it in Privacy Policy or Terms.
- Sign in with Apple accounts: revoke the tokens on deletion (Token revocation).
- Keep in-app and web deletion flows equivalent in length and complexity.
- Consider scheduled future deletion (use remaining service, wait for renewal), but always offer immediate deletion too.
- State when deletion will complete and notify when done.
- With in-app purchases, explain that auto-renewable subscriptions keep billing through Apple until canceled regardless of account deletion, and that people must cancel or request a refund themselves; explain how to cancel and manage purchases. Support deletion even if the subscription was not bought in your app.

**TV provider accounts**
- Use TV Provider Authentication (system-level sign-in) when your TV provider app needs sign-in.
- Hide sign-out when signed in at system level. If you must show it, it should direct people to Settings > TV Provider.
- Never tell people to sign out via Settings > Privacy controls; those manage app access, not sign-out.

**Platform notes**
- tvOS: remote-first input, so ask for minimal info.
  - Prefer sign-up/authentication on another device; configure associated domains so Apple TV can suggest credentials, including Sign in with Apple.
  - For shared accounts (tvOS 16+), do not ask people to pick their profile each time they become current user; use `kSecUseUserIndependentKeychain` and the User Management Entitlement.
  - Minimize entry: send longer forms to a website on another device; for email use the email keyboard screen with recent addresses.
- watchOS: use iCloud Keychain sync for autofill of user names, passwords, and settings.

---

## Managing notifications

Source: https://developer.apple.com/design/human-interface-guidelines/managing-notifications

Get permission before sending any notification. People can change it or silence everything in Settings (government alerts excepted in some locales).

**Focus and scheduled delivery**
- Focus filters notifications during reserved times (sleep, work, reading, driving). Scheduled summary lets people receive alerts in batches at chosen times. People choose which contacts and apps break through.
- A Focus may delay the *alert*, but the notification itself is available immediately.
- Classify notifications: *communication* (calls, messages; adopt SiriKit intents `INSendMessageIntent`, `UNNotificationContentProviding`; delivery decided by sender) vs *noncommunication* (you assign an interruption level).

| Interruption level | Meaning | Overrides scheduled delivery | Breaks through Focus | Overrides Ring/Silent (iPhone, iPad) |
|---|---|---|---|---|
| Passive | View at leisure (restaurant suggestion) | No | No | No |
| Active (default) | Good to know on arrival (team score) | No | No | No |
| Time Sensitive | Directly affects person, needs attention now (account security, package delivery) | Yes | Yes | No |
| Critical | Urgent health and safety; very rare (government, health, home apps) | Yes | Yes | Yes; requires an entitlement |

**Best practices**
- Assign urgency honestly; inflated urgency erodes trust and leads people to disable notifications.
- Use Time Sensitive only for events happening now or within an hour. On first receipt the system explains it and lets people turn it off, and periodically asks again (`UNNotificationInterruptionLevel`).

**Marketing notifications**
- Never send marketing or promotional notifications without explicit opt-in.
- Never mark marketing notifications Time Sensitive; they must not break through Focus or scheduled delivery.
- Ask permission via an alert, modal, or other UI that describes what you will send with clear opt-in/opt-out.
- Provide an in-app settings screen to change notification choices (required).

**Platform notes**
- watchOS: iPhone notification settings apply by default; manage in the Apple Watch app on iPhone, or swipe left on an arriving notification for options like Mute 1 Hour or Turn off Time Sensitive.

---

## Modality

Source: https://developer.apple.com/design/human-interface-guidelines/modality

Modal presentation blocks the parent view and requires explicit dismissal. Use it to ensure critical info is seen, to confirm or modify a recent action, to run a short, scoped task without losing context, or for immersion/concentration. Components: alerts (all platforms), activity views, sheets, confirmation dialogs / action sheets, popovers; iPadOS, macOS, visionOS may use a separate window. Full-screen modal suits temporary media viewing or multistep editing (non-modal full screen: see Going full screen).

**Best practices**
- Go modal only with clear benefit (focus, or choices affecting content or device).
- Keep modal tasks simple, short, streamlined.
- Avoid an "app inside your app": if subviews are necessary, provide one linear path and no buttons that look like the dismiss button.
- Use full-screen modal for in-depth content or complex tasks (video, photos, camera, markup, photo editing). visionOS: in Shared Space it fills the window; in a Full Space it can become more immersive.
- Always offer an obvious dismissal following platform norms: iOS, iPadOS, watchOS: top toolbar button or swipe down; macOS, tvOS: a button in the main content view.
- If dismissal (button or gesture) could lose user content, explain and offer resolution (iOS: action sheet with a save option).
- Title the modal with its task, or add descriptive text, so people keep their bearings.
- Dismiss one modal before presenting another; avoid stacking. Alerts may appear above everything, including modals, but never show two alerts at once.

**Platform notes**: none additional.

---

## Multitasking

Source: https://developer.apple.com/design/human-interface-guidelines/multitasking

Nearly every app must handle multitasking (exceptions: some games, visionOS apps in a Full Space). Always be ready to save and restore context.

**Best practices**
- Pause attention-requiring activities (games, media) when people switch away; resume as if they never left.
- Handle audio interruptions: pause indefinitely for primary interruptions (music, podcasts, audiobooks); for short ones (GPS prompts) lower volume or pause and restore afterward.
- Finish user-initiated tasks (downloads, video processing) in the background before suspending.
- Notify sparingly: notify on completion of important or time-sensitive tasks people started; skip notifications for routine or secondary tasks.

**Platform notes**
- watchOS: not supported.
- iOS: FaceTime or video in Picture in Picture while using another app.
- iPadOS: full-screen or windowed modes. Windowed apps are resizable and tile like macOS; system window controls handle tiling, full screen, minimize, close; the frontmost window has colored controls and casts a shadow. PiP works in both modes. Apps neither control nor learn the configuration chosen, so adapt gracefully to any size (see Layout, Windows).
- macOS: multitasking is the default; windows get drop shadows and state-specific visual effects.
- tvOS: browse or play while a movie or show runs in PiP (where supported).
- visionOS:
  - Multiple apps share the Shared Space; only one window is active; looking at another window activates it while the previous one becomes translucent and recedes along z.
  - Closing a window backgrounds the app without quitting. Closing the Now Playing app's window pauses audio (resume from Control Center).
  - Do not alter window edge appearance (system applies a feathered mask to the window looked away from).
  - Do not pause video when people look away.
  - Expect audio ducking when people look away, unless you are the Now Playing app.

---

## Offering help

Source: https://developer.apple.com/design/human-interface-guidelines/offering-help

**Best practices**
- Match help to task complexity: inline descriptions for one- or two-step tasks, tutorials for complex multistep goals. Tie help to what people are doing now and make it easy to dismiss or skip.
- Keep language and imagery relevant and platform-correct (no game controller imagery for Siri Remote users; no "click" on iPhone or "tap" on Mac).
- Make help inclusive (see Inclusion).
- Do not explain standard components; explain what they do in your app. For unique controls or unusual input (e.g. Siri Remote held rotated 90 degrees), orient quickly with animation or graphics rather than long text.

**Tips (TipKit)**: small transient views describing a feature.
- Choose the type: *popover tip* to preserve content flow; *inline tip* to keep surrounding info visible. Inline tips come in *annotation* style (points at a UI element) or *hint* style (not tied to a specific element).
- Use tips only for simple features; more than three actions is too complex for a tip.
- Keep tips to one or two direct, action-oriented sentences. No promotional content or content about other features or flows.
- Define eligibility rules (parameter-based or event-based) so only people who would benefit see the tip (not people who already used the feature). With multiple tips, set a display frequency (e.g. once every 24 hours).
- Include a recognizable symbol or image (prefer the filled variant, e.g. a star for favorites), but do not repeat an image the tip directly points to.
- Add buttons to jump to related settings or deeper resources (e.g. a setup flow).

**Platform notes: macOS, visionOS (tooltips / help tags)**
- Tooltips appear on pointer hover (Mac, including iPhone/iPad apps on Mac) or on look or hover (visionOS). API: `help(_:)`.
- Describe only the control the person is pointing at.
- Explain the action; start with a verb ("Restore default settings", "Add or remove a language from the list").
- Do not repeat the control's name.
- Keep to 60 to 75 characters max (localization changes length); fragments and dropped articles are fine. Needing lots of text signals a UI to simplify.
- Use sentence case; omit ending punctuation for complete sentences unless your app style requires it.
- Consider context-sensitive tooltips (different text per control state).

---

## Onboarding

Source: https://developer.apple.com/design/human-interface-guidelines/onboarding

Ideally the app explains itself. If onboarding is needed, make it fast, fun, optional, and run it after launch completes.

**Best practices**
- Teach through interaction: let people safely try actions, features, or mechanics.
- Prefer context-specific tips over one upfront flow; place instructions next to the relevant UI (TipKit).
- If a prerequisite flow is required, keep it brief and enjoyable without heavy memorization.
- Make separate tutorials optional; if skipped, do not show again on later launches, but keep them findable (help, account, or settings area).
- Teach your app, not the system or device.

**Additional content**
- Splash screen, if used: show just long enough to absorb at a glance.
- Do not block onboarding on large downloads; bundle enough content to start immediately (see Launching).
- Keep licensing and disclaimers out of onboarding; let the App Store show agreements. If unavoidable, integrate without disruption.

**Additional requests**
- Postpone nonessential setup and customization; ship good defaults.
- If the app cannot function without private data access, consider asking during onboarding with an explanation of benefits; otherwise ask when people first use the dependent feature (see Requesting permission).
- Let people experience the app before asking for ratings or purchases.

**Platform notes**: none additional.

---

## Playing audio

Source: https://developer.apple.com/design/human-interface-guidelines/playing-audio

Output routes: internal/external speakers, headphones, Bluetooth, AirPlay. Controls: volume buttons, iPhone Ring/Silent switch, headphone controls, Control Center slider, accessories.

**Expectations**
- Silent mode: play only audio people explicitly start (media, alarms, audio/video messaging); silence keyboard clicks, effects, soundtracks, other nonessential feedback.
- Volume: system volume affects all sound by any adjustment method; exception is iPhone ringer volume, adjustable separately in Settings.
- Headphones: connecting reroutes seamlessly; disconnecting pauses playback immediately.

**Best practices**
- Adjust relative mix levels as needed but never change the overall system volume; it always governs output.
- Allow audio rerouting (stereo, car, Apple TV) unless there is a compelling reason not to.
- Use the system volume view (`MPVolumeView`): slider plus route control; slider appearance is customizable.
- Choose the right audio session category (`AVAudioSession.Category`); do not stop other apps' music unnecessarily.

| Category | Use when | Silence switch | Mixes with others | Background |
|---|---|---|---|---|
| Solo ambient | Nonessential sound that silences others (game soundtrack) | Responds | No | No |
| Ambient | Nonessential sound that lets other audio play (game allowing user music) | Responds | Yes | No |
| Playback | Essential sound (audiobook, language lessons) | Ignores | Optional | Plays |
| Record | Recording (voice notes; may switch to Playback to play back) | Ignores | No | Records |
| Play and record | Simultaneous record and play (audio messaging, video calls) | Ignores | Optional | Records and plays |

- Respond to external audio controls (Control Center, headphones) only when actively playing, in a clear audio context, or connected via Bluetooth/AirPlay; otherwise do not halt another app's audio.
- Never repurpose standard audio controls; ignore unsupported ones.
- Build custom player controls only for commands the system lacks (custom skip increments, related content such as a live score).
- After temporary audio that interrupts others, deactivate with `notifyOthersOnDeactivation` so they can resume.

**Handling interruptions**
- Decide how to respond (see Handling audio interruptions). Recording apps can ask the system not to interrupt for an incoming call unless accepted. VoIP apps must end the call when an iPad Smart Folio closes (it mutes the mic and interrupts the session); never silently restart the session on reopen (privacy).
- On interruption end, decide whether to auto-resume (`shouldResume`). Interruptions are *resumable* (phone call) or *nonresumable* (new playlist). Media apps check for resumable before resuming; games can resume without checking since their audio is not an explicit user choice.

**Platform notes**
- iOS, iPadOS: use System Sound / Audio Services for short sounds and vibrations.
- macOS: notification sounds mix with other audio by default.
- tvOS: system plays audio only on user-initiated interactions or calibration; no sounds for alerts or notifications.
- visionOS:
  - Spatial Audio places sound at locations in space using surroundings data. Never convey important info by sound alone.
  - Now Playing app audio pauses when its window closes; other apps' audio can duck when people look away.
  - Prefer playing sound; silence feels lifeless or broken, especially in immersion. Use sounds to aid navigation and spatial understanding.
  - Design custom sounds for custom UI elements (system elements already have them).
  - Combine *ambient audio* (pervasive, anchors a world) and *audio sources* (tied to an object).
  - Define where sounds originate; audio from a window follows the window when moved.
  - Vary repetitive sounds by randomizing pitch and volume at playback (like the virtual keyboard) rather than authoring many files.
  - Choose *fixed* sound (anchored to the wearer, e.g. Mindfulness) vs *tracked* sound (anchored to an object, changes with distance); tracked usually adds realism.
- watchOS: system manages playback; short clips play while foregrounded, longer audio can continue with wrist down or app switched (Playing Background Audio). Encode at 64 kbps HE-AAC. Consider the system Now Playing view (shows current source, possibly another app on Watch or iPhone; auto-selects current or most recent source).

---

## Playing haptics

Source: https://developer.apple.com/design/human-interface-guidelines/playing-haptics

System controls (switches, sliders, pickers) play haptics automatically on supported iPhones. Apple Watch Taptic Engine pairs patterns with tones. Mac Force Touch trackpads play haptics on drag and force click. Game controllers (iPadOS, macOS, tvOS, visionOS), Apple Pencil, and some trackpads on certain iPads also support haptics.

**Best practices**
- Use system patterns only for their documented meaning; otherwise use a generic pattern or a custom one.
- Be consistent: build a clear cause-and-effect mapping (never reuse a failure haptic for success).
- Use haptics to complement visuals and sound; match haptic intensity and sharpness to the animation; sync with audio where possible.
- Do not overuse; user-test for balance. The ideal is unnoticed but missed when off.
- In apps, prefer short haptics tied to discrete events; long-running haptics suit gameplay but distract in apps (continuous haptics on Apple Pencil Pro are unpleasant).
- Make haptics optional; the app must work fully without them.
- Ensure vibrations do not disturb camera, gyroscope, or microphone use.

**Custom haptics (Core Haptics)**
- Building blocks: *transient* events (brief taps or impulses, like the Flashlight button) and *continuous* events (sustained vibration, like the Messages lasers effect).
- Parameters: *sharpness* (soft, rounded, organic vs crisp, precise, mechanical) and *intensity* (strength). Optionally add audio.
- Vary dynamically with context (a jump from a tree hits harder than a jump in place; collisions differ from approaching footsteps).

**Platform notes**
- iOS: use standard controls for built-in haptics, or `UIFeedbackGenerator` with three categories:
  - Notification: outcome of a task (check deposited, car unlocked).
  - Impact: physical metaphor (snap into place, heavy collision).
  - Selection: values changing in a control.
- macOS (Magic Trackpad, `NSHapticFeedbackPerformer`), on drag or force click:

| Pattern | Use |
|---|---|
| Alignment | Dragged item aligns with another, fits dimensions, hits a preferred position, or reaches a min/max/start/end (e.g. scrubber) |
| Level change | Crossing discrete pressure levels (e.g. fast-forward speed tiers) |
| Generic | General feedback when others do not fit |

- watchOS (`WKHapticType`): Series 4+ gives Digital Crown haptic detents (linear by default; some controls like table views tick as items scroll in).

| watchOS haptic | Meaning |
|---|---|
| Notification | Something significant needs attention; same as notification arrival |
| Up | Important value rose above a threshold |
| Down | Important value fell below a threshold |
| Success | Action completed successfully |
| Failure | Action failed |
| Retry | Action failed but can be retried |
| Start | Activity (e.g. timer) started; usually followed later by Stop |
| Stop | Previously started activity stopped |
| Click | Dial-click sensation for progress at fixed increments; overuse or overlap confuses |

---

## Playing video

Source: https://developer.apple.com/design/human-interface-guidelines/playing-video

System players exist for iOS, iPadOS, macOS, tvOS, visionOS; content can also surface in the TV app. Players support aspect modes and, in most platforms, Picture in Picture.

| Mode | Behavior | Default for | API |
|---|---|---|---|
| Aspect-fill (full screen) | Scales to fill; may crop edges | Wide video, 2:1 to 2.40:1 | `resizeAspectFill` |
| Aspect (fit to screen) | Whole frame visible; letterbox or pillarbox | Standard (4:3, 16:9, up to 2:1) and ultrawide (above 2.40:1) | `resizeAspect` |

On visionOS and tvOS the player has *transport controls* (subtitles, audio language, add to library, favorite) and *content tabs* below (Info, Episodes, Chapters). On visionOS transport controls are an ornament.

**Best practices**
- Use the system player. If custom is truly needed, mirror the system's behavior closely; slight divergence breaks habits.
- Always show video at original aspect ratio; never bake letterbox or pillarbox padding into the frame (it shrinks video in both modes and breaks edge-to-edge contexts like iPad PiP).
- Add metadata (image, title, description) on iOS, iPadOS, tvOS, visionOS without obscuring playback (`externalMetadata`).
- Support expected inputs: Space plays/pauses on a connected keyboard across Vision Pro, Mac, iPhone, iPad, Apple TV; Siri Remote gestures on Apple TV.
- tvOS: add a transport control for playback-related actions (favorite) or a custom content tab for supplementary info or recommendations; keep actions within one or two steps.
- Prevent audio mixing across mode switches (PiP mute/unmute plus a game's music); handle secondary audio via `silenceSecondaryAudioHintNotification`.

**Integrating with the TV app**
- The TV app fades to black and skips your launch screen; immediately show your own black screen before playing or resuming.
- Show chosen content immediately: no splash, detail screens, intros. If an interstitial is unavoidable, Select steps through it, Play skips to playback.
- Resume automatically without asking.
- Space on a Bluetooth keyboard toggles play/pause.
- Honor the profile the TV app specifies; auto-switch before playing. If none specified, ask the viewer to pick one first and remember it.
- Resume long videos from the previous end time.
- Loading: avoid loading screens if fast; if loading exceeds 2 seconds, show a black screen with a centered activity spinner and nothing else. Show it only until playback can start, then keep loading in background. Any branding stays minimal on black.
- Exiting: people stay in your app afterward; show the detail view of what they watched with a resume option, else a menu listing it or your main menu. Prepare the exit view as soon as the playback notification arrives in case people exit immediately.

**Platform notes**
- tvOS:
  - Keep logos and noninteractive overlays small (logo, countdown); some displays suffer image retention, so keep overlays brief, translucent, and SDR rather than bright and opaque.
  - Interactive overlays (quizzes, surveys, check-ins): pause with a minimum 0.5 s delay, then show; give a clear dismiss that resumes playback.
- visionOS:
  - Comfort: let people choose when to start, use a small resizable window, keep surroundings visible.
  - In full immersion, do not let virtual content occlude the system-placed player or its bottom ornament controls.
  - Never auto-start fully immersive video.
  - Provide a thumbnail track for scrubbing; thumbnails 160 px wide (HLS Trick Play spec).
  - Do not expand an inline player to fill a window; inline video stays 2D with window content visible around it (`AVPlayerViewController`).
  - Use a RealityKit video player for splash or transitional video (no controls needed); it handles 2D/3D aspect ratios and captions and can texture video onto custom surfaces.
- watchOS (`VideoPlayer`): system manages playback; short clips only while foregrounded, inline or separate interface.
  - Clips 30 seconds or shorter (storage and wrist fatigue).
  - Do not scale clips. Encoding:

| Attribute | Value |
|---|---|
| Video codec | H.264 High Profile |
| Video bit rate | 160 kbps at up to 30 fps |
| Resolution, full screen | 208x260 px (portrait) |
| Resolution, 16:9 | 320x180 px (landscape) |
| Audio | 64 kbps HE-AAC |

  - Poster image must not look like a system control; make it represent the clip's content (tapping replaces it with inline playback).

---

## Printing

Source: https://developer.apple.com/design/human-interface-guidelines/printing

Available on iOS, iPadOS, macOS, visionOS. Not on tvOS or watchOS.

**Best practices**
- Put Print in standard places: macOS File menu; iOS/iPadOS toolbar button opening an action sheet. On a customizable macOS toolbar, a Print button can be an optional add.
- Offer printing only when possible: if nothing to print or no printers, dim the macOS File > Print item and remove Print from the iOS/iPadOS action sheet; dim or hide custom print buttons.
- Present relevant options (page range, copies, duplex) via the system view, only when the printer supports them.

**Platform notes: macOS**
- For app-specific options, add a custom print panel category named uniquely (e.g. app name). Default categories include Layout, Paper Handling, Media & Quality. (Keynote: presenter notes, slide backgrounds, skipped slides.)
- For document-specific page settings (size, orientation, scaling), consider a page setup dialog; do not reimplement system options like orientation or reverse order.
- Make option interdependencies clear (duplex disables transparencies).
- Hide advanced options behind a disclosure control labeled *Advanced Options*.
- Consider live previews of setting effects (thumbnail reflects tone changes).
- Store modified print settings with the document, or at least until it closes.

---

## Ratings and reviews

Source: https://developer.apple.com/design/human-interface-guidelines/ratings-and-reviews

Great experience drives good ratings; timing the ask matters. Signals for timing: launch count or frequency, features explored, tasks completed. People can always rate in the App Store.

**Best practices**
- Ask only after demonstrated engagement (finished a level, completed a significant task). Never on first launch or during onboarding (premature asks can yield negative reviews).
- Do not interrupt active tasks or gameplay; ask at natural breaks.
- Do not pester: wait at least a week or two between requests and only after further engagement.
- Prefer the system prompt (iOS, iPadOS, macOS; `RequestReviewAction`). It checks for prior feedback, offers rating plus optional review, dismisses with one tap or click, lets people opt out globally, and is capped by the system at 3 displays per app per 365 days.
- Weigh resetting the summary rating on a new version: reflects the current build but lowers the count, which can deter downloads.

**Platform notes**: none additional.

---

## Searching

Source: https://developer.apple.com/design/human-interface-guidelines/searching

In-app search uses search fields; personalize with recents, suggestions, completions, corrections. Scope or filter with scope bars and tokens (date, size, type). Support find-in-page on iOS, iPadOS, macOS. Spotlight searches across apps and the web on iOS, iPadOS, macOS.

**Best practices**
- If search is important, make it primary: e.g. bottom toolbar (Notes) or a dedicated search tab in tab bar apps (Photos, Apple TV).
- Offer one place to search everything; local search for distinct sections is fine (Music filters the current view).
- Always show current scope via placeholder text, scope bar/tokens, or title (Mail names the mailbox being searched).
- Offer recent searches before typing and predictive suggestions while typing (`searchSuggestions(_:)`).
- Consider privacy before showing search history; if shown, let people clear it.

**Systemwide search (Spotlight)**
- Index your content with descriptive metadata.
- For custom file types, supply a Spotlight File Importer (`CSImportExtension`).
- Use Spotlight for advanced in-app file search (e.g. a button that searches from the current selection, then a custom results view).
- Prefer system open and save panels; they include systemwide search (see File management).
- Ship a Quick Look generator for custom file types.

**Platform notes**: none additional.

---

## Settings

Source: https://developer.apple.com/design/human-interface-guidelines/settings

System Settings covers appearance, network, accounts, accessibility, language and region, and (on some platforms) per-app privacy and integration toggles (location, mic, camera, notifications, Siri, Search). Put general settings in an in-app area; put task-specific options inside the task.

**Best practices**
- Ship defaults that suit the most people (e.g. auto-tune game performance for the device instead of asking).
- Minimize the number of settings.
- Open settings the expected way: Command-Comma with a keyboard; Esc in games.
- Detect instead of asking (connected controllers, Dark Mode).
- Respect systemwide settings; do not duplicate global options (accessibility, scrolling, authentication) in your settings.

**General settings**: put infrequently changed, app-wide options in your settings area (window configuration, game-save behavior, key mappings, account options).

**Task-specific options**: expose in the affected screen (show/hide parts of the view, reorder, filter), not in a separate settings area. In games, players adjust tactics through gameplay, not settings.

**System Settings app**: add only the rarest-changed options there; consider a button that opens it directly.

**Platform notes**
- macOS: Settings item lives in the App menu and opens a settings window with a toolbar of *panes*.
  - Do not put settings buttons in a window toolbar; document-level options go in the File menu.
  - Dim the settings window's minimize and maximize buttons.
  - Use a noncustomizable, always-visible toolbar that highlights the active pane.
  - Title the window after the current pane; with a single pane use "*App Name* Settings".
  - Reopen to the last viewed pane.
- watchOS: apps cannot add settings to the system Settings app; put a few essential options at the bottom of the main view or in a More menu.

---

## Undo and redo

Source: https://developer.apple.com/design/human-interface-guidelines/undo-and-redo

People undo repeatedly until something changes and may forget what each step targets. Make outcomes predictable and visible.

**Best practices**
- Predict the result: describe it in the iPhone shake-to-undo alert (with cancel), and label menu items specifically ("Undo Typing", "Redo Bold").
- Show the result: if the affected content is offscreen, scroll or otherwise highlight it (e.g. scroll to a restored paragraph) so people do not repeat the action.
- Allow unlimited (or generous) undo, back to a logical point like opening or saving the document.
- Consider batch revert: collapse incremental tweaks to one property into one undo, or offer "revert all changes since open/save".
- Add visible undo/redo buttons only when necessary; if so, use the standard system symbols and put them in a toolbar. Default triggers: macOS Edit menu, keyboard shortcuts on Mac and iPad, shake on iPhone.

**Platform notes**
- tvOS, watchOS: not supported.
- iOS, iPadOS: do not redefine standard undo gestures (three-finger swipe, shake). The alert title auto-prefixes "Undo " or "Redo " (with trailing space); supply one or two words describing the action ("Undo Name", "Redo Address Change").
- macOS: put Undo and Redo at the top of the Edit menu; support Command-Z and Shift-Command-Z.

---

## Workouts

Source: https://developer.apple.com/design/human-interface-guidelines/workouts

Watch is worn during many workouts; iPhone/iPad carried for walking, wheelchair pushing, running; larger devices (iPad Pro, Mac, Apple TV) used for live or recorded sessions. Build for Apple Watch, iPhone, or iPad using device activity data and familiar metric components.

**Best practices**
- watchOS: use workout sessions; the app stays onscreen between wrist raises, so show the most important data (elapsed/remaining time, calories, distance) and relevant controls (lap, interval markers).
- Hide irrelevant information during a workout (no browsing the workout list or other app sections).
- Make an active workout visually distinct; a live-updating metrics page with a unique layout works well.
- Make pause, resume, stop easy to find and tap; give clear feedback when a session starts or stops.
- If sensors are unavailable (e.g. water blocks heart rate), explain what is still tracked using wording similar to Apple's Workout app (for Swimming or Other types). Examples paraphrased: pool swims do not use GPS and may lack heart rate, but calories, laps, distance still come from the accelerometer; when readings are missing you earn the calorie equivalent of a brisk walk; GPS gives distance only for freestyle.
- End with a summary screen confirming completion and showing recorded data; consider including Activity rings.
- Discard extremely short sessions (ended seconds after start) automatically or ask whether to save.
- Ensure legibility in motion: large type, high contrast, most important info easiest to read.
- Use the Activity rings view only for its documented purpose; colors and meanings match the Activity app.

**Platform notes**
- Not supported in macOS, tvOS, visionOS. No extra notes for iOS, iPadOS, watchOS.
