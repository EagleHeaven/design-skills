# Android & Material 3: App quality checklists

Distilled from the developer.android.com quality guidelines (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

## Contents

1. [How to use this checklist](#how-to-use-this-checklist)
2. [Core app quality](#core-app-quality)
3. [Adaptive app quality overview](#adaptive-app-quality-overview)
4. [Adaptive Tier 3: Adaptive ready](#adaptive-tier-3-adaptive-ready)
5. [Adaptive Tier 2: Adaptive optimized](#adaptive-tier-2-adaptive-optimized)
6. [Adaptive Tier 1 experience: Desktop](#adaptive-tier-1-experience-desktop)
7. [Adaptive Tier 1 experience: Foldables](#adaptive-tier-1-experience-foldables)
8. [Adaptive Tier 1 experience: Camera and audio](#adaptive-tier-1-experience-camera-and-audio)
9. [Adaptive Tier 1 experience: Stylus](#adaptive-tier-1-experience-stylus)
10. [Large screen app quality (legacy IDs)](#large-screen-app-quality-legacy-ids)
11. [Wear OS app quality](#wear-os-app-quality)
12. [Wear OS design quality tiers](#wear-os-design-quality-tiers)
13. [TV app quality](#tv-app-quality)
14. [Car app quality](#car-app-quality)
15. [Widget quality](#widget-quality)
16. [Android XR: immersive experiences](#android-xr-immersive-experiences)
17. [Android XR: augmented experiences (glasses)](#android-xr-augmented-experiences-glasses)

---

## How to use this checklist

Source: https://developer.android.com/docs/quality-guidelines

- Every Android app starts from **Core app quality** (minimum bar for all apps). Form factor checklists (adaptive, Wear, TV, car, widget, XR) extend it; none replaces it.
- Each table row gives the official ID, the requirement (paraphrased) and the test procedure. Test IDs are the guideline ID prefixed with `T-` unless stated.
- ID scheme note: the current core page uses named IDs (`Touch_Target_Size`, `State_Preservation`). Older numbered codes such as `VX-N1`, `PS-T1`, `SC-N1` belong to archived versions (2021) of the core guidelines and are absent from the current page; map them by topic. Legacy large-screen IDs (`LS-C1`, `LS-U1`...) are mapped in section 10.

### What Google Play enforces or rewards

| Checklist | Play consequence (as stated in sources) |
|---|---|
| Core app quality | Minimum quality for all apps. Play policy items (content policy, rating, feature graphic, notification ads) are policy-backed. App Bundles mandatory for new apps since Aug 2021. |
| Adaptive app quality | Tier 2 + Tier 1 earn the **Google Play Large Screen badge**; adaptive apps rank higher in Play listings and search. Foldable screenshots + guidelines qualify for foldable store badging and enhanced promotion. |
| Wear OS | Failing applicable requirements can get the submission rejected; Play team emails the developer. A blocked Wear artifact blocks the whole listing update. |
| TV | Tier 3 = submission requirements reviewed by Play; missing TV manifest entries means the app is not reviewed as a TV app. Tier 2/1 = premium experience. |
| Car | Extra manual review for every car app. Parked categories must meet Tier 3; driving categories must meet Tier 2 to be accepted. Updates for other devices are held until car approval. |
| Widgets | Tier 1 widgets are recommended to users and featured as best practice; Tier 3 widgets are considered low quality. |
| Android XR | XR-differentiated apps automatically get the **Made for XR** badge. Compatible mobile and adaptive apps are auto opted in. App policies (camera, mic, LED) are mandatory. |

---

## Core app quality

Source: https://developer.android.com/docs/quality-guidelines/core-app-quality

Minimum quality all apps should meet. Prefer Material components over platform widgets for consistent look across Android versions. Current version supersedes archives dated 2026-03-20, 2021-05-17 and 2021-02-10.

### User experience: usability

| ID | Requirement | How to test |
|---|---|---|
| Consistent_UX | Consistent experience for every use case on every form factor. | Visit every screen, dialog, setting and flow (editing, gameplay, playback, all in-app purchase flows). Interrupt with notifications and calls; toggle network, battery, GPS, system load. Also run on SD card install (T-SD_Card) if supported. |
| App_Switcher | Goes to background when another app takes focus; returns via Recents. | From each screen switch app, return through Recents. |
| Sleep_Resume | Pauses on sleep, resumes on wake. | Power button off, then on. |
| Lock_Resume | Pauses on lock, resumes on unlock. | Set a screen lock, sleep, wake and unlock. |

### User experience: user interface and visuals

| ID | Requirement | How to test (T-Orientation_Transitions unless stated) |
|---|---|---|
| Display_State_Parity | Every orientation and fold state exposes essentially the same features and actions. | Rotate portrait/landscape and fold/unfold at least 3 times on each screen; check parity. |
| Fullscreen_Display | Fills the app window in both orientations; no letterboxing after config changes including fold/unfold (minor letterboxing for geometry variance is acceptable). | Same rotation/fold pass; verify no letterbox. |
| Orientation_Transitions | Rapid rotation and fold/unfold cause no rendering problems and no state loss. | Same pass, fast. |
| Graphic_Quality | No distortion, blur or pixelation; vector drawables where possible; high-quality assets for every targeted size; no aliased edges. | T-Graphic_Quality: use every feature, inspect all visuals. |
| Line_Length | Text lines limited to **45 to 75 characters** (spaces included) in every supported language. | T-Line_Length: review all text blocks; no cut letters, no bad wraps in buttons or icons, enough spacing around text. |
| Theme_Support | App content and any web content it loads support light and dark themes. | T-Theme_Support: all text readable and visuals clear in both themes. |

### User experience: navigation and notifications

| ID | Requirement | How to test |
|---|---|---|
| Back_Button_Nav | Standard back navigation; no custom on-screen back prompts. | T-Back_Nav: from every screen press Back or swipe back; lands on previous or home screen. |
| Back_Gesture_Nav | Supports gesture navigation for back and home. | T-Back_Nav. |
| State_Preservation | Keeps user/app state when leaving foreground; no accidental data loss on back or other state changes. From Recents or after wake: exact previous state. Relaunch from Home/All Apps: restore closely if last used minutes ago; after longer, restore or start from home/default. | T-State_Preservation: from each screen go Home, relaunch from All Apps. |
| Notification_Quality | Relevant notifications only; cross-promotion or ads for another product are strictly prohibited by Play. Use channels per best practice (not one channel for all), correct priority, groups, timeouts (`setTimeoutAfter`); persistent only for ongoing events (music, call). | T-Notification_Quality: trigger every notification type, expand, tap every action. |
| Conversation_Quality | Messaging/social: `MessagingStyle`, direct reply, conversation shortcuts with direct share ranking best practices, bubbles. | Same test. |

### User experience: accessibility

| ID | Requirement | How to test |
|---|---|---|
| Touch_Target_Size | Touch targets at least **48 dp**. | Targets keep consistent accessible size and position at every display size; use Accessibility Scanner. |
| Visual_Contrast | **3:1** for large text and graphics; **4.5:1** for small text (under 18 pt, or under 14 pt bold). | Check contrast of every visual element. |
| Content_Description | Every UI element except `TextView` has a `contentDescription`. | Verify all non-TextView elements are described. |

### Functionality

| ID | Requirement | How to test |
|---|---|---|
| Audio_Playback_Start | Within **1 second** of user starting audio: play, or show a preparing indicator. | Start playback, time it. |
| Audio_Focus_Request | Request audio focus on play, abandon on stop (automatic when targeting Android 12 / API 31+). | Start and stop playback. |
| Audio_Focus_Change | React to other apps' focus requests (duck or stop). | Play in your app, then in another app. |
| Audio_Playback_Background | Background playback through a foreground service plus a persistent, non-dismissible notification (status bar or lock screen); controls in notification, lock screen and accessories. | Play, switch to a non-audio app: audio continues, notification controls work; lock screen: same. |
| Audio_Notification_Style | Background audio notification uses `MediaStyle`. | Verify style while backgrounded. |
| Audio_Playback_Resume | Paused background audio resumes on return to foreground, or app shows it is paused. | Background, then foreground the app. |
| Video_PiP | Video apps support picture-in-picture. | Enter PiP during playback. |
| Video_Encoding | Video encoding uses HEVC. | Verify encoder. |
| Video_Playback_Background | Video continues when window is minimized, behind other windows or system UI (shade, home, lock), or off the visible desktop. | Minimize, background, move window off desktop; playback uninterrupted. |
| System_Sharesheet | Share through the Android Sharesheet. | `startActivity()` with a share intent shows the Sharesheet. |
| Background_Service_Optimization | No unnecessarily long background services (bad uses: holding a network connection for notifications, holding Bluetooth, keeping GPS on). | Use major features, background the app, check Settings for running services. |

### Performance and stability

| ID | Requirement | How to test |
|---|---|---|
| App_Startup_Time | Loads fast, or shows progress if loading takes over **2 seconds**. | Launch and time. |
| Rendering_Performance | Frames in **16 ms or less** (at least **60 fps**). | Use Profile HWUI rendering across major features. |
| StrictMode_Compliance | No StrictMode red flashes. | Enable `StrictMode.ThreadPolicy.Builder().detectAll().penaltyFlashScreen()`; exercise features; watch storage, network, memory and GC issues. |
| Stability_ANR | No crashes, no UI thread blocking (ANR). | Use features; review Play pre-launch report; after launch monitor Android Vitals. |
| Android_Platform_Compatibility | Runs on the latest public Android without crashes or core feature loss. | Test on latest release. |
| Target_SDK_Version | `targetSdk` meets current Play requirements. | Review manifest and build config. |
| Compile_SDK_Version | Built with latest SDK (`compileSdk`). | Same. |
| SDK_Maintenance | Google and third-party SDKs up to date; prefer Play services SDKs. You own the whole codebase including third-party SDKs. | Review `build.gradle` for outdated dependencies. |
| Non_SDK_Interfaces | No non-SDK interfaces. | Android Studio lint. |
| Production_Build_Quality | No debug libraries in production. | Review `build.gradle`. |
| Power_Management | Works with Doze and App Standby (exemption request possible). | Use features in Doze and Standby via ADB; alarms, timers, notifications, syncs work in the maintenance window; diagnose drain with Power Profiler or Battery Historian. |

### Privacy and security

| ID | Requirement | How to test |
|---|---|---|
| Minimize_Permissions | Only the minimum permissions; coarse over fine location when possible. | Review manifest, runtime and Settings > App Info. |
| Sensitive_Permissions | Sensitive data (SMS, Call Log, location) or paid services (Dialer, SMS) only for core use cases, implications prominently disclosed; prefer alternatives such as implicit intents for contacts. | Trigger each permission request; verify disclosure. |
| Runtime_Permissions | Request when the feature is used, never at startup. | Verify lazy requests. |
| Permission_Rationale | Explain why each permission is needed. | Verify rationale UI. |
| Graceful_Degradation | Denied or revoked permission degrades gracefully; never blocks the whole app. | Deny/revoke; app keeps working with an alternative. |
| Sensitive_Data_Storage | Sensitive data only in internal storage. | Review internal and external storage; check how external data is processed (T-Sensitive_Data_Handling). |
| Sensitive_Data_Logging | No personal data in system or app logs. | Watch logcat while using features. |
| Hardware_IDs | No non-resettable hardware IDs (IMEI) for identification. | Use major features, inspect. |
| App_Data_Backup | Preferences, databases, settings and state survive cloud backup and device-to-device transfer: Auto Backup + `android:dataExtractionRules`. | Configure state, back up or D2D transfer, launch on new device, compare. |
| App_Logins_Restoration | Sign-in restored automatically on a new device via Restore Credentials (Credential Manager). | Sign in, transfer, launch: no sign-in screen or recovery flow. |
| Autofill_Hints | Autofill hints on credentials, card, address, phone fields. | Check every input field. |
| Credential_Manager | Credential Manager for passkeys, federated identity and passwords. | Sign in and verify. |
| Biometric_Authentication | Biometrics protect financial transactions and sensitive documents. | Use every auth-gated feature. |
| Component_Export | `android:exported` set explicitly on every component; export only what shares data or must be invoked by other apps. | Review manifest. |
| Component_Permissions | Explicit intents when the target is known; verify payload intents; no nested intents in extras (use `PendingIntent`); set immutable flag on pending intents. | Review permissions in manifest, runtime and Settings. |
| Component_Protection | Custom permissions for cross-app components use `android:protectionLevel="signature"`; do not rely on the installed packages list. | Review content providers' protectionLevel. |
| Network_Security_Traffic | All traffic over SSL. | Declare a config that disables cleartext; test. |
| Network_Security_Configuration | App declares a network security configuration. | No lint failures on it. |
| Security_Provider_Initialization | With Play services, initialize the security provider at startup. | Verify at launch. |
| WebView_Asset_Loader | Use `WebViewAssetLoader`; never `setAllowUniversalAccessFromFileURLs()`. | Lint; try navigating WebViews to content the app does not load (T-WebView_Navigation). |
| WebView_JavaScript | No `addJavaScriptInterface()` with untrusted content; use HTML message channels on API 23+. | Open JS pages in each WebView. |
| App_Bundles | No dynamic code loading from outside the APK; use App Bundles (Play Feature Delivery, Play Asset Delivery). Mandatory for new Play apps since Aug 2021. | Verify. |
| Cryptographic_Algorithms | Strong platform crypto and RNG; no custom algorithms. | Verify. |

### Google Play

| ID | Requirement | How to test |
|---|---|---|
| Play_Content_Policies | Follows Developer Content Policy; no inappropriate content or others' IP/brands. | T-Play_Content_Policies: review profile, description, screenshots, feature graphic, rating and feedback in Play Console. |
| Play_Content_Rating | Maturity rating set correctly. | Same. |
| Play_Feature_Graphic | High-quality feature graphic; no device images, screenshots or small text illegible when scaled; does not look like an ad. | T-Play_Feature_Graphic: scale graphic and screenshots down to target displays. |
| Play_Device_References | Screenshots and videos show no non-Android devices. | T-Play_Graphic_Assets: review all assets. |
| Play_Misleading_Content | Screenshots and videos represent the app honestly. | Same. |
| Play_User_Reviews | Fix reproducible bugs reported widely in Reviews; also fix few-device bugs on popular or new devices. | Review user feedback. |

### Test environment

- Emulators at minimum: foldable 7.6" fold-in with outer display (listed under phones in AVD Manager); tablet Pixel C 9.94" (2,560 x 1,800 px); a phone paired with Wear OS Round 1.84" for notification testing.
- A few real devices (1 or 2 per form factor), Firebase Test Lab for breadth, and always the latest Android version.

---

## Adaptive app quality overview

Source: https://developer.android.com/docs/quality-guidelines/adaptive-app-quality

- Replaces and extends the large screen app quality guidelines (archive: 2026-04-07 Tier 2; 2026-01-21 large screen version, with an official ID map).
- Covers phones, tablets, foldables, Googlebooks/desktops, connected displays, car, TV, XR, and windowing modes (split-screen, desktop windowing, multi-display, multi-instance, PiP), plus foldable postures (tabletop, book).
- Implement only the requirements that fit your use cases.
- **Play:** complete Tier 2 and Tier 1 to get the **Large Screen badge** for tablets, foldables, Googlebooks and other large screens. Update the listing with tablet and foldable screenshots and call out XR features.

| Tier | Name | Meaning |
|---|---|---|
| Tier 3 (basic) | Adaptive ready | Full screen or full window everywhere, no letterboxing or compatibility mode; critical flows completable; basic keyboard, mouse, trackpad, stylus. Requires core app quality first. |
| Tier 2 (better) | Adaptive optimized | Layout optimizations for all sizes and configurations; enhanced external input. Target for all apps. |
| Tier 1 (best) | Adaptive differentiated | Experience designed per device: multitasking, postures, drag and drop, stylus. Organized by experiences: Desktop, Foldables, Camera and audio, Stylus, Cars, TV, XR, Games, Widgets. |

### Test devices for adaptive layouts

| Device | Size |
|---|---|
| Googlebook | 160 ppi |
| Foldable | 841 x 701 dp |
| 8-inch tablet | 1024 x 640 dp |
| 10.5-inch tablet | 1280 x 800 dp |
| 13-inch Chromebook | 1600 x 900 dp |

Emulators: Phone > Pixel Fold, Tablet > Medium Tablet, Desktop > Desktop (Preview) (needs Android Studio Canary), plus the resizable emulator.

---

## Adaptive Tier 3: Adaptive ready

Source: https://developer.android.com/docs/quality-guidelines/adaptive-app-quality/tier-3

| ID | Requirement | How to test |
|---|---|---|
| Config_Changes | Fills screen or window; content never overflows; not letterboxed, no compatibility mode. Keeps state across rotation, fold/unfold, split-screen and desktop window resize: scroll position, typed text and keyboard state, media position. | T-Config_Orientation: portrait, landscape, multi-window, unfolded in both orientations; resize in split-screen and desktop windowing; minimize/restore, maximize/restore on desktop. Use a large screen device (sw >= 600 dp) on Android 12 / API 31+, which ignores `android:screenOrientation` and `resizeableActivity="false"`. T-Config_State: scroll, start playback, type into several fields, then rotate, fold, resize, minimize; verify all preserved. |
| Config_Combinations | Handles chained changes (resize then rotate, rotate then fold). | T-Config_Combinations on every screen. |
| Multi-Window_Functionality | Fully functional in multi-window. Unity apps: Unity LTS 2019 or later. | Open in multi-window, resize in each orientation and fold state. Unity: pair in split-screen, go Home, restore pair from Recents; layout correct. |
| Multi-Resume | Keeps updating UI when not top-focused (media, messages, downloads); handles loss of exclusive camera/mic. | T-Multi-Window_Focus: playback continues when another app is focused. T-Multi-Window_Resources: camera/mic released when unfocused, regained when refocused. |
| Camera_Preview | Correct orientation and proportions in both orientations, folded/unfolded, multi-window. | Start camera full screen and in multi-window; rotate, fold, resize. |
| Media_Projection | Same for media projection. | Same procedure with a projection. |
| Keyboard_Input | Text entry with external keyboard; switches physical/virtual keyboard without relaunch on connect/disconnect. | Type with both keyboards, disconnect, type again. |
| Mouse_Trackpad_Basic | Click any clickable element; select radios, checkboxes, text (swipe or double click); scroll lists and pickers vertically and horizontally. | Perform each with mouse and trackpad on every screen. |
| Stylus_Basic | Stylus can select, manipulate and scroll (same as touch, automatic). | Navigate the whole app with a stylus. |
| Stylus_Text_Input | Android 14 / API 34+: write and edit text in fields with stylus (`EditText` default). Googlebook and ChromeOS M114+: also in `WebView` fields. | Write in fields; the soft keyboard must not appear. |

---

## Adaptive Tier 2: Adaptive optimized

Source: https://developer.android.com/docs/quality-guidelines/adaptive-app-quality/tier-2

| ID | Requirement | How to test |
|---|---|---|
| Responsive_adaptive_layouts | All layouts responsive; adaptive layouts chosen by window size classes. Examples: leading-edge nav rail expanding into a full panel on larger windows; grids scaling column count; text in columns; trailing panels open by default on desktop, closed on small screens; multi-pane canonical layouts. Compose: `ListDetailPaneScaffold` and other adaptive scaffolds. Views: activity embedding. | T-Layout_Flow: run on phones, foldables, small and large tablets, desktops, also in multi-window; verify rails expand/contract, grid columns scale, text flows into columns; activity embedding shows side by side on large, stacked on small. |
| UI_Secondary_Elements | On large screens: bottom sheets get a max width; buttons and text fields not full width; small menus/modals do not cover the screen; context menus open next to the selected item; nav rail replaces nav bar; nav drawer becomes expanded nav rail; current Material dialogs; images neither stretched nor cropped. | T-Layout_Flow. |
| Touch_Targets | At least **48 dp**. | T-Touch_Targets: consistent size and position, never hidden or obscured, at every size. |
| Drawable_Focus | Interactive custom drawables are focusable outside Touch Mode with a visible focus state. | T-Drawable_Focus: focus each with keyboard or D-pad. |
| Keyboard_Navigation | Main flows navigable with Tab and arrow keys. | Navigate with external keyboard. |
| Keyboard_Shortcuts | Shortcuts for select, cut, copy, paste, undo, redo. | Use each shortcut. |
| Keyboard_Media_Playback | Keyboard controls media (Spacebar play/pause). | Start, stop, pause, rewind, fast forward by keyboard. |
| Keyboard_Send | Enter sends in communication apps. | Send/submit with Enter. |
| Keyboard_Exit | Esc exits or undoes: closes modals, dialogs, pop-ups, menus; clears search or its focus; cancels keyboard focus; leaves full screen video, PiP, slideshows; dismisses on-screen controls; cancels Up Next/autoplay timers; deselects all; aborts rename/edit without saving; exits crop/transform discarding changes. | Press Esc in each context. |
| Context_Menus | Right click (secondary button or secondary tap) opens context menus. | Secondary click interactive elements. |
| Content_Zoom | Ctrl + scroll wheel and trackpad pinch zoom content. | Zoom in and out. |
| Hover_States | Actionable elements show hover states. | Hover each element. |

---

## Adaptive Tier 1 experience: Desktop

Source: https://developer.android.com/docs/quality-guidelines/adaptive-app-quality/experiences/desktop

Targets Googlebook, Chromebooks and connected displays.

| ID | Requirement | How to test |
|---|---|---|
| Scrollbar_Display | Scrollbar visible while scrolling with mouse or trackpad. | Scroll with both; bar appears. |
| Hover_Parity | Hover reveals previews, fly-outs, tooltips; parity with web/desktop versions; distinct hover states with accessible contrast. | Hover elements with cascading or pop-up content. |
| Desktop_Menus | Desktop-style menus, context menus, small modals keep users on task. | Verify on desktop and connected displays. |
| UI_Config | User-configurable layouts: list/grid/column toggle; dockable or movable floating toolbars; collapsible, resizable, rearrangeable panels (navigation bars, rails, drawers excluded). | Switch presentations, move/dock toolbars, drag dividers, rearrange panels; content stays formatted. |
| Request_Fullscreen_Mode | Implement `Activity#requestFullscreenMode()` with a UI control to go from split-screen or desktop windowing to immersive. | Trigger it from a multi-window state; smooth transition. |
| Keyboard_Navigation | Efficient keyboard navigation; distinct, consistent focus states with accessible contrast; sensible initial focus (for example the To field when composing mail) so typing works immediately. | Tab/arrow through UI; check focus visuals and initial focus. |
| Keyboard_Parity | Comprehensive shortcuts plus conventions (Ctrl-C, Ctrl-Z); parity with web/desktop. | Verify shortcuts. |
| Input_Combinations | Ctrl+click/tap and Shift+click/tap select multiple and ranges. | Select separated items and ranges. |
| Triple_Click | Triple click or triple tap selects a line or paragraph. | Triple click text. |
| Multitasking_Scenarios | PiP in both orientations and multi-window (media, video calls); open another app in an adjacent window from a deep link (`FLAG_ACTIVITY_LAUNCH_ADJACENT`); open attachments in a separate window. | T-Multitasking_PiP, T-Multitasking_Split-Screen (open other app side by side), T-Multitasking_Attachments. |
| Multitasking_PiP | Interactive PiP with custom controls (media and non-media). | Enter/exit PiP, resize window during PiP, use custom controls. |
| Multi-Instance | Launch multiple instances in separate windows (documents, browsing, files, shopping comparison). | Launch several instances in both orientations and multi-window. |
| Drag_Drop_Support | Drag and drop within the app and across apps in multi-window, by touch, mouse, trackpad and stylus; multiple items as a group (`DropHelper`). | T-Drag_Drop_Support and T-Drag_Drop_Batch in both orientations, all input types. |
| Printing_Support | Print or export to a printable format (PDF). | Print or export. |
| File_Management_Basics | Visible file names and locations; choose download location; upload from local storage, preferring the OS picker. | Verify. |
| File_Picker | Uses the system file picker for import and export. | Verify. |
| File_Handlers | Declares handled file types so the Files app offers it. | Open a matching file from Files. |
| Custom_Cursors | Framework cursors (I-beam for text, resize handles, spinners) and custom ones (crosshair, magnifier, drawing tools) via `PointerIcon`. | Hover across UI with mouse and trackpad. |
| Cursor_Target_Size | Cursor hit area matches the visual bounds. | Click small icons, buttons, handles precisely. |
| Cross_Device_Handoff | Start on one Android device, continue near-equivalent state on another. | Switch devices mid-task. |
| Offline_Support | Full or partial offline use; clear notice of connectivity needs. | Disable network. |
| Web_Transition | Smooth app to web transitions and back. | Follow deep links and web content. |

---

## Adaptive Tier 1 experience: Foldables

Source: https://developer.android.com/docs/quality-guidelines/adaptive-app-quality/experiences/foldables

| ID | Requirement | How to test |
|---|---|---|
| Foldables_Postures | Supports postures: tabletop for video calls and playback, book for long reading. | View in every posture; UI moves to the right place (media controls on the horizontal half in tabletop). |
| Foldables_Camera | Camera preview adapts folded/unfolded and supports front and back screen preview. | Check preview folded, unfolded, both orientations, both screens. |
| Foldables_Multitasking_Scenarios | PiP in/out folded and unfolded, both orientations, multi-window; messaging opens attachments in a separate window. | T-Foldables_PiP, T-Foldables_Attachments (open/close attachments and notifications in all states). |
| Foldables_PiP | Interactive PiP with custom controls. | Resize window during PiP, use controls. |
| Foldables_Multi-Instance | Multiple instances in separate windows folded and unfolded. | Launch instances in all states. |

---

## Adaptive Tier 1 experience: Camera and audio

Source: https://developer.android.com/docs/quality-guidelines/adaptive-app-quality/experiences/camera-audio

| ID | Requirement | How to test |
|---|---|---|
| Camera_Switcher | Switcher between built-in and external cameras. | Connect external camera, toggle, preview updates. |
| Audio_Switcher | Mic/speaker apps switch between built-in audio and peripherals (headphones, USB mic). | Toggle; input and output route correctly. |
| Audio_Background_Playback | Plays when not visible (behind apps or lock screen) and when visible but unfocused (split-screen, desktop window). Non-visible playback needs a foreground service and a persistent, non-dismissible notification; always use a foreground service for audio. Limiting background play to premium tiers is compliant. | Play, focus a non-audio app; no stutter; notification shown if hidden. Lock for at least **1 minute**; process survives; lock screen controls work. Unlock and refocus; continuous playback. |

---

## Adaptive Tier 1 experience: Stylus

Source: https://developer.android.com/docs/quality-guidelines/adaptive-app-quality/experiences/stylus

| ID | Requirement | How to test |
|---|---|---|
| Stylus_Draw_Write | Draw and write with stylus; erase with stylus. | Draw, write, erase. |
| Stylus_Drag_Drop | Stylus drag and drop inside the app and across apps in multi-window. | Drag both directions between apps. |
| Stylus_Enhanced | Low latency with motion prediction, pressure-sensitive width, tilt shading, palm and finger rejection. | Watch stroke latency; more pressure makes thicker strokes; more tilt makes wider, lighter shading; palm and fingers leave no marks. |

---

## Large screen app quality (legacy IDs)

Source: https://developer.android.com/docs/quality-guidelines/large-screen-app-quality

Superseded by adaptive app quality (archived 2026-01-21) but its IDs are still referenced by the car checklist and older audits. Requirements are equivalent to the adaptive rows above; differences: legacy text targets "ChromeOS devices", tests also covered dual-screen span/unspan (Surface Duo), and legacy emulators were 7.6" fold-in, Pixel C 9.94", Surface Duo.

| Legacy ID | Legacy test | Current adaptive ID |
|---|---|---|
| LS-C1 | T3-1, T3-2 | Config_Changes |
| LS-C2 | T3-3 | Config_Combinations |
| LS-M1 | T3-4 | Multi-Window_Functionality |
| LS-M2 | T3-5, T3-6 | Multi-Resume |
| LS-CM1 | T3-7 | Camera_Preview |
| LS-CM2 | T3-8 | Media_Projection |
| LS-I1 | T3-9 | Keyboard_Input |
| LS-I2 | T3-10 | Mouse_Trackpad_Basic |
| LS-S1 | T3-11 | Stylus_Basic |
| LS-S1.1 | T3-12 | Stylus_Text_Input |
| LS-U1 | T2-1 | Responsive_adaptive_layouts |
| LS-U2 | T2-1 | UI_Secondary_Elements |
| LS-U3 | T2-2 | Touch_Targets (48 dp) |
| LS-U4 | T2-3 | Drawable_Focus |
| LS-I3 to LS-I9 | T2-4 to T2-10 | Keyboard_Navigation, Keyboard_Shortcuts, Keyboard_Media_Playback, Keyboard_Send, Context_Menus, Content_Zoom, Hover_States (Keyboard_Exit is new in adaptive) |
| LS-M3 | T1-1 to T1-3 | Multitasking_Scenarios / Foldables_Multitasking_Scenarios |
| LS-M4 | T1-4 | Multi-Instance / Foldables_Multi-Instance |
| LS-F1, LS-F2 | T1-5, T1-6 | Foldables_Postures, Foldables_Camera |
| LS-D1 | T1-7 | Drag_Drop_Support |
| LS-I10 to LS-I16 | T1-8 to T1-14 | Keyboard_Parity, Input_Combinations, Scrollbar_Display, Hover_Parity, Desktop_Menus, UI_Config (panels), Triple_Click |
| LS-S2 to LS-S4 | T1-15 to T1-17 | Stylus_Draw_Write, Stylus_Drag_Drop, Stylus_Enhanced |
| LS-P1 | T1-18 | Custom_Cursors |

Legacy layout test devices: foldable 841 x 701 dp, 8" tablet 1024 x 640 dp, 10.5" tablet 1280 x 800 dp, 13" Chromebook 1600 x 900 dp.

---

## Wear OS app quality

Source: https://developer.android.com/docs/quality-guidelines/wear-app-quality

- **Play enforcement:** watch apps must meet all applicable requirements to publish; failures can cause rejection. The paired phone app should meet core app quality. A blocked Wear artifact blocks the whole listing update (replace it with an empty submission meanwhile).
- Configuration requirements and dates:

| Requirement | Date |
|---|---|
| New apps target Android 14 / API 34+ (Wear OS 5); apps targeting API 31 or lower are hidden on newer Wear OS | Aug 31, 2025 |
| Watch Face Format required to install watch faces on all devices | Jan 2026 |
| Watch face Play icon: centered circular watch face (WO-G4) | Jul 15, 2026 |
| 64-bit support for all Wear OS apps | Sep 15, 2026 |

### Visual experience

| ID | Requirement | How to check |
|---|---|---|
| WO-V1 | Honors user font size; nothing overlaps or is cut off at larger sizes. | Max font size in Settings. |
| WO-V2 | Touch targets at least **48 x 48 dp**. | Inspect targets. |
| WO-V3 | Swipe to dismiss on almost every screen; exceptions (ongoing workouts, panning maps) need a clear close action. | Swipe right everywhere. |
| WO-V4 | Long-running work uses `OngoingActivity` or a Live Update notification. | Start long task. |
| WO-V5 | Preserve state; resuming within minutes (for example from Recents) restores closely. | Leave and resume. |
| WO-V6 | Correct icon and name in launcher. | Check launcher. |
| WO-V7, WO-V11 | Retired (rotary scrolling removed Feb 2024; show time in apps removed Jul 2023). | n/a |
| WO-V8 | Scroll bar shown while interacting with a scrollable view. | Scroll. |
| WO-V9 | Tile prompts sign-in when the user is signed out. | Open tile signed out. |
| WO-V10 | Tile includes a preview for the tile manager on watch and phone. | Check previews. |
| WO-V12 | Watch faces show the time clearly. | Inspect. |
| WO-V13 | Black background for apps and tiles. | Inspect. |
| WO-V14 | Minimum **12 sp** essential text, **10 sp** non-essential. | Inspect type. |
| WO-V15 | Splash: **48 x 48 dp** icon on black, matching the launcher icon. | Cold start. |
| WO-V16 | Content fits the display, no overlap or edge clipping, works down to a **192 dp** circle. | Small and large round emulators. |

### Performance and functionality

| ID | Requirement |
|---|---|
| WO-P1 | Meets Play target API level requirements. |
| WO-P2 | App installs, launches, completes tasks without crashing. |
| WO-P3 | Watch face installs, sets and personalizes (complications) without crashing. |
| WO-P4, WO-P9 | Retired (standalone manifest flags). |
| WO-P5 | Non-standalone: companion app connects and enables the Wear app. |
| WO-P6 | Never ask for username/password entry on the watch. |
| WO-P7 | Watch Face Format AOD lights at most **15%** of pixels (white = 100%, black = 0%, linear RGB), checked about every **10 minutes** across a whole day; every sample must pass. |
| WO-P8 | Watch face memory: at most **10 MB** ambient, **100 MB** interactive. |
| WO-P10 | At most **8** complication slots. |

### Google Play

| ID | Requirement |
|---|---|
| WO-G1 | Follow Play Developer Policy. |
| WO-G2 | Listing lists main features, does not mention "Android Wear", mentions tiles/complications if present, localized (Mar 2026: no longer required to mention Wear OS). |
| WO-G3 | App icons follow Play icon specs. |
| WO-G4 | Single watch face icon: accurate, no extra text/graphics/device frames, centered circular face touching the icon edges (multi-face apps exempt). |
| WO-G5 | App screenshots: at least 1, current, interface only, no transparency or masking, no device frames or extra text, **1:1** ratio; tiles screenshot recommended. Android Studio "Play Store Compatible" capture helps. |
| WO-G6 | Watch face screenshots: same rules, show several permutations if customizable. |
| WO-G7 | Same package name and signing key as the phone app. |
| WO-G8 | Paid features: provide test login credentials in Play Console (App Access). |
| WO-G9 | Self-tag watch face categories. |
| WO-G10 | `watch_face_shapes.xml` at most **10** `<WatchFace>` elements. |
| WO-G11 | Watch face XML source at most **10 MB** total. |
| WO-G12 | Watch face tooling (Watch Face Studio) current for latest Wear OS. |

Testing: Wear OS 3.0+; emulators Wear OS small round 1.2" (**192 dp**) and large round 1.39" (**227 dp**); Firebase Test Lab offers physical Pixel Watch.

---

## Wear OS design quality tiers

Source: https://developer.android.com/design/ui/wear/guides/foundations/quality-tiers

M3 Expressive for Wear adds shape morphing (lists, button states) and edge-hugging buttons for round screens. Margins in percentages; non-scrolling views add vertical constraints so the middle stretches. Larger screens must never show less information than smaller ones.

| Tier (design guide naming) | Do | Don't |
|---|---|---|
| Ready for all screens (minimum) | No obvious bugs across sizes; use M3 Compose for Wear (built-in responsive behavior). | Awkward alignment or spacing; proportionally scaling UI up. |
| Responsive and optimized | Responsive layouts that fill space (edge-hugging buttons, card lists). | Stretching text fields, buttons, dialogs; enlarging fonts unless graphic. |
| Adaptive and differentiated | Custom layouts at the **225 dp** breakpoint (screens start at **192 dp**): bigger controls, extra button rows, extra cards. | Designing for one size; relying only on responsive behavior. |

Note: the tier pages are numbered inconsistently in the source (page titles call the minimum tier "Tier 1" and the differentiated one "Tier 3", the reverse of the phone adaptive tiers).

---

## TV app quality

Source: https://developer.android.com/docs/quality-guidelines/tv-app-quality

Viewing distance about 10 feet, remote-only input. Tier 3 is the Play submission bar; Play emails failures. Apps with correct TV manifest entries appear on TV Play immediately after approval. Tiers 2 and 1 added May 2026.

### Tier 3: TV Ready (required)

| ID | Requirement |
|---|---|
| TV-LM | Launcher icon appears in the TV launcher after install. |
| TV-LB | **320 x 180 px** banner and an app icon of at least **160 x 160 px** (xhdpi). |
| TV-BN | Banner contains the app name. |
| TV-LG | Games appear in the Games row. |
| TV-LS | Installs, loads and runs with no error messages. |
| TV-LO | Landscape without vertical letterbox or pillarbox; bars only black and only for original-format video. |
| TV-OV | Nothing cut off by screen edges (overscan). |
| TV-TR | Fills the screen with an opaque background; never partially covers other apps. |
| TV-DP | Fully navigable with a 5-way D-pad (unless a gamepad is required, TV-GP). |
| TV-DK | Gamepad-required apps navigable with standard gamepad keys. |
| TV-DM | No dependency on a Menu button. |
| TV-DB | Back leads back to the TV home screen. |
| TV-DL | Live tab integration meets frictionless playback and direct-back rules. |
| TV-PS | `minSdkVersion` **31 or lower** (Dec 2025). |
| TV-ML | Manifest: `ACTION_MAIN` with `CATEGORY_LEANBACK_LAUNCHER`. |
| TV-MT | `android.hardware.touchscreen` and other TV-absent features declared not required. |
| TV-GP | Gamepad-primary apps declare it with `<uses-feature>`. |
| TV-GC | Controller instructions unbranded with a compatible layout. |
| TV-AP | Ads operable with D-pad. |
| TV-AD | Full screen non-video ads dismissible immediately by D-pad or gamepad. |
| TV-AU | Clickable non-full-screen non-video ads never link to web URLs. |
| TV-AA | Clickable ads never open another app, cross-package navigation or installs (updated Jan 2027). |
| TV-AN | Ads stay in context or convert off-screen (QR codes) (new Jan 2027). |
| TV-WB | Web content only in `WebView`; never launch a browser. |
| TV-NP | Audio continuing after leaving the app exposes system media controls (Now Playing card); video apps pause on exit and skip these controls. |
| TV-PA | System media controls open a screen that can pause. |
| TV-PN | Continue-watching items follow the guidelines. |
| TV-PC | D-pad center toggles pause/resume; left/right rewind/fast forward. |
| TV-PP | `KEYCODE_MEDIA_PLAY_PAUSE` toggles playback. |
| TV-BU / TV-BY / TV-BA | Block Ambient Mode only during user-started video; never otherwise; audio-only allows it unless showing non-static imagery. |
| TV-IC | PiP declares a permitted usage category plus accurate title and subtitle. |
| TV-IP | No ads or promos in PiP beyond the content itself. |
| TV-IQ | PiP never degrades the fullscreen app (resources, audio focus, MediaSession, decoders). |
| TV-IH | No navigable UI in PiP (some direct controls allowed). |
| TV-IE | PiP only on explicit user action; no auto-enter except ongoing calls. |
| TV-IS | No PiP entry UI when PiP is disabled. |
| TV-IX | PiP only continues an ongoing activity; never lures users back to full screen. |
| TV-ME | On low RAM devices (`ActivityManager.isLowRamDevice()`), foreground memory (Anon+Swap + Graphics + File) within documented limits. |
| TV-G1 | App Bundles mandatory for new and existing TV apps. |
| TV-G2 | Follows Play policy. |
| TV-G6 | From **Aug 1, 2026**: 32- and 64-bit support and **16 KB page size** compliance. |
| TV-G3 | Works as described in the listing. |
| TV-G4 | At least 1 unaltered high-res TV screenshot of the current version. |
| TV-G5 | Sign-in apps provide test credentials in Play Console. |

### Tier 2: TV Optimized

| ID | Requirement |
|---|---|
| TV-BP | Ships Baseline Profiles (startup, jank). |
| TV-4K | 4K-ready high-res assets (icon, banner, cards). |
| TV-CT | Cast Connect if the mobile app supports Cast. |
| TV-LI / TV-LC | Sign in with phone or Google Account; secure stored credentials or token auto-login. |
| TV-VS / TV-VC | Voice search for discovery; voice playback commands via `MediaSession`. |
| TV-GF | Games support physical and virtual gamepads. |

### Tier 1: TV Differentiated

| ID | Requirement |
|---|---|
| TV-EC / TV-ER | Engage SDK continue-watching and recommendation entities (replaces in-app search TV-SB, removed May 2026). |
| TV-PI | Selects TV picture profiles (cinema, low latency/high contrast). |
| TV-AO | Picks best audio channel per output (stereo headphones, 5.1). |
| TV-FR | Requests content frame rate (50 Hz for 50 fps). |
| TV-TO | Pointer remote and touch support with hover states and scrolling. |
| TV-SA | Spatial audio (for example IAMF). |
| TV-AX | Audio descriptions, subtitle styles, high-contrast UI, simplified navigation, playback speed. |
| TV-AI | AppFunctions or in-app AI. |

Tier 1 apps are encouraged to ask for ratings in-app and use cross-device install prompts.

---

## Car app quality

Source: https://developer.android.com/docs/quality-guidelines/car-app-quality

- Every car app gets an extra **manual review**. Updates for other form factors are held until approved, so do not prototype car support in the production APK.
- Test Android Automotive OS (AAOS) on the emulator, Android Auto on the Desktop Head Unit (DHU).
- Categories: Media, Media (templated, labs), Communication: messaging notifications, templated messaging (labs), calling (labs) (Auto only), Navigation, POI, IOT, Weather, Video (AAOS only), Games (both; GA Sept 2026), Browsers (AAOS, labs).

| Tier | Meaning | Play gate |
|---|---|---|
| Tier 3 Car ready | Large screen compatible, usable while parked. | Required for parked categories (Video, Games, Browsers). Car ready mobile apps program can ship phone apps to AAOS with Google built-in. |
| Tier 2 Car optimized | Car-specific capabilities across driving/parked. | Required for driving categories. |
| Tier 1 Car differentiated | Adapts across cluster, center console, panoramic displays. | Premium. |

### Car ready

| ID | Categories | Requirement |
|---|---|---|
| PC-1 | All | Only features within car app categories. |
| EP-1 | All | Works as listed on Play. |
| EP-2 | Most | Relaunch restores previous state. |
| EP-3 | Games | Responsive, no freezes or stutter. |
| EP-4 | Media, messaging, calling, nav, POI, IOT, weather | AAOS: listing has AAOS screenshots (Aug 2026; optional for parked). |
| DO-1 | Video, Games, Browsers | AAOS: works on fixed-orientation displays. |
| DO-2 | Games | Auto: no significant pillarboxing on landscape. |
| AR-1 | All AAOS | Interactive UI never under system bars or cutouts. |
| DD-3 | Video, Games, Browsers | Not launchable or usable while driving, no audio (audio apps also meet DD-2). |
| IN-2 | Video, Games, Browsers | No heads-up notifications. |
| AN-1 | Video, Games, Browsers | No dead ends. |
| SD-1 / SD-2 | Browsers | Passwords/payments only behind a profile lock; before syncing, authenticate and notify on the car screen. |
| LS-C1, LS-C2 | Parked apps | Config changes (mainly moving between displays). |

### Car optimized

| ID | Categories | Requirement |
|---|---|---|
| PE-1 | Media, nav, POI, IOT, weather | AAOS: own activities only for setup, settings, sign-in while parked. |
| SA-1 | Driving categories | No animation or video (canvas animation allowed when parked and driving-relevant). |
| AD-1 | Same | Text ads limited to advertiser or product name. |
| IU-1 | Same | No images except one static background (album art, logo), drawer icons, driving-decision images, lane/junction guidance. |
| VI-1 | Auto | When the phone is needed, tell users to look only when safe. |
| AC-1 | Templated categories | Tasks complete in **5 screens or fewer**. |
| ST-1 | Driving categories | No auto-scrolling text. |
| VC-1 | Media, Navigation | Gemini and Google Assistant voice commands (May 2026). |
| DR-1 / DR-2 / DR-3 | Templated categories | Buttons respond within **2 s**; launch within **10 s**; content loads within **10 s**. |
| VD-1 / VD-2 / VD-3 | Driving / Media | Meet Auto contrast; white icon sets for system tinting; colors the system can optimize. |
| TH-1 | Templated | Custom theming on Car App Library 1.9+ supports light and dark. |
| GB-1 | Media | Disabled elements are truly nonfunctional. |
| DD-1 | Navigation | Navigation audio channel only for navigation instructions. |
| DD-2 | Video, Games, Browsers | Not launchable or visible while driving; audio stops and cannot resume (except DD-4). |
| PA-1 | Nav, POI, IOT, weather | Simple purchase flows (recent/favorite); no payment setup, multi-item carts or subscriptions. |
| NA-1 / IN-1 | Driving categories | No notification ads; notify only for driver-relevant events. |
| MA-1 | Media | No autoplay on startup without user action. |
| MF-1 to MF-5 | Messaging | Receive, group and order, reply; short-form only (no email); peer-to-peer only. |
| NF-1 to NF-7 | Navigation | Turn-by-turn; only map content on template surface; nav notifications; cluster next-turn metadata; yield to another active nav app; handle nav intents; test-drive simulation mode. |
| PF-1 | POI | Driving-relevant functionality. |
| IT-1 | IOT | While driving: view state, one-touch on/off and scenes, event notifications; never setup, scene editing or fine control. |
| WE-1 to WE-5 | Weather | Location-relevant; at most **3** legends (multi-legend: at most 3 colors); readable icons; no forecast interval customization; at most **5** map annotation types per view. |
| MR-1 | Nav, POI, Weather | Draw light or dark map when told. |
| MC-1 | Video | MediaSession with play/pause or stop plus title and thumbnail per item. |
| DL-1 | Video, Games, Browsers | AAOS deep links. |
| MFT-1 / MFT-3 | Media (templated) | Reach `MediaPlaybackTemplate` or minimized control panel (CAL 1.9+); handle `androidx.car.app.media.action.SHOW_MEDIA_PLAYBACK`. |
| LS-M2, LS-U1, LS-U2, LS-U3 | Parked apps | Multi-resume across distant displays; ultrawide layouts (test with Automotive Ultrawide profile); 48 dp targets. |

### Car differentiated

| ID | Categories | Requirement |
|---|---|---|
| NF-9 | Navigation | Renders map tiles only on cluster displays; no weather info on cluster. |
| TMF-1 | Templated messaging | Correct self property, per-conversation send, live refresh. |
| CF-1 to CF-3 | Calling | Start, accept, decline, leave; show name, icon, participants, active speaker, mute; calls carry over when Auto connects. |
| DL-2 | Media, nav, POI, IOT, weather | AAOS deep links. |
| DD-4 | Video | Audio while driving on capable devices (else DD-2). |
| AR-2 | Video, Games, Browsers | Render into cutouts while keeping UI usable. |
| MFT-2 | Media (templated) | Templates beyond browse and play. |
| UX-1 / UX-2 / UX-3 | Video, Games, Browsers | Targets at least **64 dp**, spaced **24 dp** apart and **24 dp** from edges; fonts at least **24 sp**. |
| LS-U4, LS-I3 | Parked apps | Focusable custom drawables and Tab navigation (rotary controllers use the same APIs). |

---

## Widget quality

Source: https://developer.android.com/docs/quality-guidelines/widget-quality

Tier 2 is the baseline; Tier 1 widgets are recommended to users and featured to developers.

### Tier 3: low quality (any one of these)

| ID | Failure |
|---|---|
| WL-1 | Does not fill the host grid bounds. |
| WL-1.1 | Shape touches fewer than 2 opposing grid edges. |
| WC-3 | Text and icon buttons fail contrast. |
| WD-4.2 | Widget name missing from the design. |
| WD-4.3 | No preview image. |
| WT-3 / WT-3.1 / WT-3.2 | Stale content; no update after an action in the widget or a related action in the app. |
| WT-4 | Broken UI or cropped content. |

### Tier 2: standard

| ID | Requirement |
|---|---|
| WL-1 | Aligns with other home screen elements, no extra space. |
| WL-1.2 | Every shape touches at least 2 opposing grid edges. |
| WL-4 | Resizable widgets define min and max size; reflow to show more content; never scale text and icons linearly. |
| WL-4.1 | Cap size when growth only adds blank space; allow unrestricted resize when it shows more (taller lists). |
| WL-4.2 | Minimum size shows a clear use case and **48 x 48 dp** targets (system may scale targets on desktop or car). |
| WD-4 | Accurate static preview in the picker. |
| WT-1 | Zero/empty states scale without sparse areas; signed-out widget shows a use case or call to action. |
| WT-2 | Manual refresh when data changes faster than the UI updates. |

### Tier 1: differentiated

| ID | Requirement |
|---|---|
| WL-1.1 | Rectangular widgets touch all 4 grid edges; custom shapes touch all 4 edges of a square grid; a 4x1 search bar may touch 2. |
| WL-2 | Resizable to **2x1** plus at least two of **1x1, 2x2, 4x2, 4x4**. |
| WL-3 | Consistent header: recommended for scrolling content or useful context, optional for full-bleed, tight space or redundancy; icon always, title when space allows, contextual actions. |
| WL-5 | Collection/feed widgets scroll vertically and show more items and detail at 4x2 and 4x4. |
| WC-1 / WC-2 | Device or app color theming; light and dark palettes. |
| WD-1 | Preview shows form-factor proportions with user content and/or system theme. |
| WD-4.4 / WD-4.5 | Value-explaining description; descriptive name unique among the app's widgets. |
| WS-2 | System (OEM) corner radius on rectangular widgets. |
| WS-3 | Standard loading state; errors shown on the widget. |
| WS-4 | System widget configuration, no custom settings entry. |
| WS-5 | System launch transition into and out of the app. |

---

## Android XR: immersive experiences

Source: https://developer.android.com/docs/quality-guidelines/android-xr/immersive

Overview: https://developer.android.com/docs/quality-guidelines/android-xr. Applies to XR headsets and wired XR glasses (full and semi-immersive).

| Tier | Definition | Play |
|---|---|---|
| XR compatible mobile app | Unmodified mobile app on a panel; no unsupported features (telephony); core input (eye tracking + gesture, raycast hands) and basic external input. Must meet core app quality (fold requirements N/A) and accessibility (contrast). | Auto opted in; incompatible feature requirements make it uninstallable. |
| XR compatible adaptive app | Adaptive Tier 2 or Tier 1 for desktop, tablets or foldables (rotation and folding not required). | Auto opted in. |
| XR differentiated app | At least one XR feature or XR content (spatial panels, environments, 3D models, spatial audio, 3D/spatial video, anchors, orbiters) via Jetpack XR SDK, Unity, Godot, Unreal or OpenXR. Engine apps count if quality metrics pass. | **Made for XR** badge automatically. |

### Differentiated checklist

| Area | Requirement |
|---|---|
| Account sign-in | Show the signed-in account after auth; account page always reachable. |
| Strobing | Avoid; if needed, under **3 flashes per second**, small area, setting to disable, warning first. |
| Motion sickness | No abrupt camera moves, stable frame of reference, snap rotations (never rotate camera over time). |
| Dimmer | Respect user dimmer; app may adjust, user can override. |
| Interaction target size | Minimum = distance (m) x 0.868 x 48; recommended = distance x 0.868 x 56. Jetpack XR: **48 x 48 dp** min, **56 x 56 dp** recommended. |
| Hand input | Fully usable with hands (raycast, gesture primitives); controllers optional. |
| Boundary | Passthrough opacity > 0.5: keep central field of view clear. < 0.5 and non-stationary: consider `XR_BOUNDARY_TYPE_LARGE`, playable within **2.0 m** radius (boundary fades in at **1.5 m**). No boundary on glasses. |
| Rendering | Frame under **11.1 ms (90 Hz)** and **13.8 ms (72 Hz)**. |
| Resolution | OpenXR/engines query `XR_ANDROID_recommended_resolution`. |
| Startup | Mean cold start under **2 s**, warm under **1 s**. |
| ANRs | Under 1 ANR in **99.5%** of daily sessions; use pre-launch report and Vitals. |
| Crash rate | About **1%**; no excessive resource use. |
| Basic XR | At least one XR feature (orbiter, spatial panel, environment, 3D object). |
| Spatial panels | Menus and controls in their own panel or orbiter; separate panels for parallel tasks. |
| Environments | Safe tonal range, no brightness spikes; UI legible in all directions, especially the middle horizontal band. |
| UI theme | Prefer dark theme; always dark on XR glasses. |
| Home Space / Full Space | Easy, labeled control to switch. |
| Scrolling | Momentum physics on carousels and lists. |
| Spatial player | Full Space viewing; controls in a panel or orbiter; panel aspect ratio avoids letterboxing. |
| Spatial audio | Consider panel-locked or surround audio. |
| Simultaneous video | Make clear which stream plays audio and which controls affect which stream. |
| Video environment | In Full Space let users dim passthrough or pick environments. |

### XR app policies (mandatory)

- Prohibited: doxxing, facial recognition or biometric identification, surveillance, NCII creation or sharing.
- Camera: no real-time facial identification exposing bystander PII; no NCII or illegal content (CSAM) generation.
- Microphone: no persistent background recording or transcription outside a user-initiated task; no identifying non-wearer voices.
- LEDs: never change, dim or disable system camera/mic LEDs, nor encourage users to; never bypass thwart/tamper detection.

---

## Android XR: augmented experiences (glasses)

Source: https://developer.android.com/docs/quality-guidelines/android-xr/augmented

Applies to audio glasses and display glasses; extends core app quality.

| Tier | Definition |
|---|---|
| Compatible | Unmodified phone app; system surfaces (notifications read aloud or shown in line of sight) work automatically. Requirements: actionable/time-sensitive notifications through `NotificationManager`; ongoing tasks through Live Update notifications; Play policies (compatibility derived from manifest features). |
| Differentiated | Built for glasses with Jetpack Compose Glimmer (UI for optical see-through displays), Jetpack Projected (phone host to glasses), ARCore for Jetpack XR (device tracking, Geospatial). |

### Differentiated checklist

| Area | Guidance |
|---|---|
| Start glasses activity | Launch and control from the phone app, especially setup and dense info. |
| Open App command | Zero-launch state: "Open [App]" via Gemini goes straight to a ready audio state. |
| Camera initiation | From phone or the camera action gesture; phone-initiated streaming plays an audible countdown first. |
| Gestures | Clear and consistent with platform conventions. |
| Battery / camera config | Respect background limits; idle high-drain sensors; lowest frame rate and resolution that fit the use case. |
| Safety | User-initiated actions; minimal distraction while moving or in public. |
| Permissions | Use the projected permission request API (consent on the host phone). |
| Accessibility | Alternative inputs (voice as fallback for touchpad). |
| Testing | Android XR Emulator and composable previews, varied lighting and busy settings. |
| Voice alerts | Concise, actionable; error alerts work offline; deeper follow-up through an in-app agent or Gemini. |
| Audio focus | Tied to input focus; request and release per Android rules. |

### Audio-only experience policies (mandatory)

| Topic | Allowed | Prohibited |
|---|---|---|
| Camera | Video calls; scene understanding and ambient sensing. | One-to-many live streaming or public broadcasting; facial identification and doxxing; NCII or illegal content. |
| Microphone | User-initiated tasks. | Persistent eavesdropping; identifying bystander voices; disabling or encouraging users to disable system denoisers. |
| Tap gesture | Relevant prompts (permissions, context such as nearby landmarks, repeat last message; tap stops current audio); mute/unmute mic with audio feedback. | Ads or irrelevant info; using tap as a continuous game controller; triggering harmful or illegal instructions. |
| Camera action gesture (double press) | Start the camera stream to the app, disclosed beforehand in a phone flow. | Remapping to non-camera functions; registering it while discarding the feed; undisclosed uses. |
| Back swipe (`onBack()`) | Exit or return to previous state. | Mapping to custom actions, media launches or ads; fake exits that keep sensors running. |
| LEDs | n/a | Changing or dimming LED behavior; bypassing thwart detection. |

Input must work whenever the app holds audio focus, foreground or not.
