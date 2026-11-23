# Android & Material 3: Cars, XR and AI Glasses

Distilled from developer.android.com design guides for Android for Cars, Android XR and AI glasses, plus m3.material.io XR pages and the XR and car app quality guidelines (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

## Contents

1. [Android for Cars: platforms and roles](#android-for-cars-platforms-and-roles)
2. [Cars design principles and driver distraction](#cars-design-principles-and-driver-distraction)
3. [Cars UX requirements](#cars-ux-requirements)
4. [Cars task flows and step counts](#cars-task-flows-and-step-counts)
5. [Cars writing guidelines](#cars-writing-guidelines)
6. [Cars templates catalog](#cars-templates-catalog)
7. [Cars template details](#cars-template-details)
8. [Cars components](#cars-components)
9. [Cars communication methods](#cars-communication-methods)
10. [Cars app types and sample flows](#cars-app-types-and-sample-flows)
11. [Cars flows: permissions, sign-in, settings, purchase](#cars-flows-permissions-sign-in-settings-purchase)
12. [Cars styles and customization](#cars-styles-and-customization)
13. [Car app quality highlights](#car-app-quality-highlights)
14. [Android XR overview and app tiers](#android-xr-overview-and-app-tiers)
15. [XR foundations: spaces, environments, inputs](#xr-foundations-spaces-environments-inputs)
16. [XR display technologies](#xr-display-technologies)
17. [XR spatial UI: panels, orbiters, elevation](#xr-spatial-ui-panels-orbiters-elevation)
18. [XR visual design: targets, color, type](#xr-visual-design-targets-color-type)
19. [XR comfort and motion](#xr-comfort-and-motion)
20. [XR 3D models, environments, anchors](#xr-3d-models-environments-anchors)
21. [Unity, OpenXR and WebXR design](#unity-openxr-and-webxr-design)
22. [Material Design for XR](#material-design-for-xr)
23. [Material XR components](#material-xr-components)
24. [XR app quality](#xr-app-quality)
25. [Jetpack Compose Glimmer](#jetpack-compose-glimmer)
26. [AI glasses principles](#ai-glasses-principles)
27. [AI glasses get started](#ai-glasses-get-started)
28. [AI glasses surfaces](#ai-glasses-surfaces)
29. [AI glasses styles](#ai-glasses-styles)
30. [AI glasses components](#ai-glasses-components)
31. [AI glasses inputs and navigation](#ai-glasses-inputs-and-navigation)
32. [AI glasses audio focus and AI patterns](#ai-glasses-audio-focus-and-ai-patterns)
33. [AI glasses onboarding and permissions](#ai-glasses-onboarding-and-permissions)
34. [AI glasses sound design](#ai-glasses-sound-design)
35. [AI glasses quality and policies](#ai-glasses-quality-and-policies)

---

## Android for Cars: platforms and roles

Source: https://developer.android.com/design/ui/cars
Source: https://developer.android.com/design/ui/cars/guides/foundations/design-process
Source: https://developer.android.com/design/ui/cars/guides/foundations/overview
Source: https://developer.android.com/design/ui/cars/guides/foundations/cal

Two ways an app reaches a car:

| Platform | How it runs | Styling |
|---|---|---|
| Android Auto (AA) | Projected from the phone to the car screen over USB or wireless | Same look in every compatible car |
| Android Automotive OS (AAOS, "Google built-in") | Installed from Play directly on the car's infotainment system, no phone needed | Car makers (OEMs) can restyle colors, fonts, shapes, button widths and order |

- Design once with the Android for Cars App Library (CAL) templates; development produces 2 APKs (AA and AAOS).
- CAL app categories: navigation, point of interest (POI: parking, charging), IoT, weather, communication (calling, templated messaging), media (templated). Video, games and browsers are parked or passenger experiences on AAOS.
- Parked and passenger apps (video, games, browsing) reuse existing tablet apps on cars with Google built-in; OEMs make sure video can't be watched while driving.

Design process with CAL:

1. Define user tasks (vehicle-appropriate, driving-related).
2. Plan task flows (sequence of templates).
3. Consider driving state (parked-only templates, pause and resume).
4. Plan communications (toast, notification, alert, message templates, voice).
5. Customize content and brand styling.

Who handles what:
- CAL handles: input (touch, rotary, touchpad), screen sizing, transitions, consistent driving-optimized UI, light and dark mode, driving-state restrictions (text limits, no keyboard), the Place List (map) map.
- You handle: voice input processing, template flows, metadata (list items, map pins), brand icons, imagery and accent colors (light and dark variants), and for navigation apps the map (light or dark on instruction) and cluster map.

## Cars design principles and driver distraction

Source: https://developer.android.com/design/ui/cars/guides/foundations/design-principles
Source: https://developer.android.com/design/ui/cars/guides/foundations/define-user-tasks

Principles (balance visual, cognitive and manual attention):

| Principle | Concrete rule |
|---|---|
| Designed for the drive | Only usable apps are available while driving; visual differences show which apps can't be used |
| Robust voice controls | Microphone stays visible when open; voice commands for frequent tasks |
| Easy to pause and resume | Never lose progress; remind drivers to resume when safe |
| Tasks as short as possible | Common tasks in 3 taps or fewer; A-Z shortcuts in long lists; some systems temporarily restrict browsing to force glances back to the road |
| Readable at a glance | Text shown while driving: 1 to 3 lines and 120 characters |
| Helps drivers focus | Notifications timed and placed carefully; suppressed during maneuvers |

Limiting distraction:
- Limit information per screen: templates cap actions, images and text. List and grid item maximums vary by vehicle; read them with the `ConstraintManager` API.
- Present only essential, driving-related content (frequent places, favorites); leave the full phone app on the phone.
- Provide shortcuts early in flows (favorites, recents); preselect defaults; enable voice input.
- Update template content cautiously: non-refresh updates add steps, and steps are capped while driving.

## Cars UX requirements

Source: https://developer.android.com/design/ui/cars/guides/ux-requirements/overview

Levels: MUST = required (enforced by API or car app quality review), SHOULD = recommended, MAY = optional.

General (all templated apps):

| Level | Requirement |
|---|---|
| MUST | Task flows of 5 steps or fewer |
| MUST | Get permission for the car microphone before recording voice input |
| MUST | Send AA users to the phone for actions not allowed while driving, telling them to look only when safe |
| MUST NOT | End a 5-step flow on a list or grid template unless Adaptive task limits is on (step 5 must be Navigation, Message or Pane) |
| SHOULD | Keep flows to 2 to 3 steps |
| SHOULD | Show content (or action strip buttons) at least 8 s before an auto-transition removes it |
| SHOULD | Ask for permissions on first open |
| SHOULD | Provide 2 accent colors for light and dark backgrounds |
| SHOULD | Provide back or another exit where no other action exists (loading, actionless Message and Pane) |
| SHOULD | Open templates with useful content, never an empty state |
| SHOULD | Shortcuts to earlier steps when flows exceed 3 screens |
| SHOULD | Voice entry point (mic icon) if the app records voice; stop recording when the user stops talking |
| SHOULD NOT | Chain auto-transitions to finish tasks without user action |
| SHOULD NOT | Stateful buttons (toggles) outside list rows |
| MAY | Update a row or grid item's image, icon or secondary text to reflect changes |

Purchase flows: SHOULD offer shortcuts like "book again"; MUST NOT set up payment methods, ask for recurring payments, or allow multiple items in one flow.

POI apps: SHOULD offer a way to launch a navigation app to the POI.

Navigation apps:

| Level | Requirement |
|---|---|
| MUST | Everything drawn on maps meets contrast requirements |
| MUST | Draw only map and drive-related content on the template surface |
| MUST | Draw a light or dark map when instructed |
| MUST | Use turn-by-turn (TBT) notifications when the user is outside the Navigation template during active guidance |
| SHOULD | Map text 24 dp or larger, unless paired with a route or road or relatively static |
| SHOULD | Images, icons, map markers at least 36 x 36 dp |
| SHOULD | Indicate when a task will change the route; refresh duration and distance during the drive |
| SHOULD NOT | Build multi-stop journeys (templates are not optimized for it) |
| MAY | Navigation alerts or HUNs for traffic and other updates; custom TBT notification background; animation when it aids driving |

Weather apps:

| Level | Requirement |
|---|---|
| MUST | Map and icon visuals (radar, temperature, conditions) meet contrast; only weather content on the surface; light or dark map on instruction |
| MUST | Indicators never overlap or become unreadable from density |
| MUST NOT | Weather animations on the surface while driving |
| MUST NOT | More than 5 unique weather annotation types in one view |
| MUST NOT | Legends with more than 3 unique items or 3 unique colors while driving (gradients excepted) |
| MUST NOT | Let users configure forecast time intervals or dates |
| SHOULD | Map text 24 dp or larger; images, icons, markers 36 x 36 dp minimum |
| MAY | Forecasts by hour, AM/PM or day; HUNs for imminent or on-route weather; animations when parked or tied to map movement |

## Cars task flows and step counts

Source: https://developer.android.com/design/ui/cars/guides/ux-requirements/plan-task-flows
Source: https://developer.android.com/design/ui/cars/guides/ux-requirements/driving-state
Source: https://developer.android.com/design/ui/cars/guides/ux-requirements/adapt-parked-apps

Limits:

| Flow | Target | Hard limit |
|---|---|---|
| Any task | 3 steps or fewer | 5 steps including start and end (app crashes if exceeded without Adaptive task limits) |
| Purchase flows | 4 steps or fewer | 5 |
| Media | 3 steps or fewer when possible | 5 |

- A new task (step count resets to 1) starts when the user lands on or returns to the landing template, opens another app, or lands on the Navigation template.
- Step count +1: a new template, or the same template with new content that is not a refresh. Step count -1: returning to the previous view with the same content.
- Never chain 5 list or grid templates in a row, even across a subflow; step 5 can't be a list or grid.
- Parked-only templates (Sign-in, Long Message) don't increment steps.

What counts as a refresh (no step added; almost always app-initiated, except the Place List refresh button):

| Template | Refresh without Adaptive task limits | Refresh with Adaptive task limits |
|---|---|---|
| Navigation, Sign-in, Long Message | Any content update | Any content update |
| List, Grid, Map, Pane, Place List (map and navigation), Route Preview, Search, Tab | Per template restrictions (changing row count = new step) | Any update keeping the layout: same title or tabs, and same section names on lists |
| Message | Only updates that keep title and message (e.g. adding a button) | Same |

Adaptive task limits:
- Allows flows longer than 5 steps while parked; while driving the task pauses after step 5 and resumes when parked.
- Throttles refreshes while driving (latest refresh shown at the end of each throttle period), which widens what counts as a refresh.
- Unavailable on JAMA-affiliated Android Auto vehicles; AAOS OEMs can toggle it per app category. Check with `IsAppRefreshEnabled` before running long tasks.

Interactive maps (Navigation, Route Preview, Map, Place List (navigation)): touch gestures, taps on POIs, map action strip buttons, refresh button. Refreshing content next to the map adds no step. Place List (map) has no interactive map but allows list refresh.

Parked scenarios: List shows more text when parked; Long Message and Sign-in are parked-only. Video apps on AAOS: optimize for large screen, support landscape and portrait, use `MediaSession`, resume from pause.

## Cars writing guidelines

Source: https://developer.android.com/design/ui/cars/guides/foundations/writing-guidelines

Text limits (from NHTSA and JAMA guidance; legal and privacy text exempt):

| Limit | Value |
|---|---|
| One message or chunk, English | 120 characters or 24 words max |
| One message or chunk, Japanese | 30 characters max |
| One line | 80 characters max |
| Sentence or paragraph | 3 lines max |
| Button label (CTA) | Starts with a verb, ideally 3 words or fewer |

- Make content scannable (people scan in an F pattern): front-load what matters, use bullets and hierarchy.
- Use direct words ("Sign in" over "Authenticate").
- Be consistent: one capitalization style for buttons (sentence or title case), consistent end punctuation, one term per concept ("phone" everywhere, never mixing "mobile device").
- Situational awareness: brief while driving; longer explanations (consents, permissions, data sharing) only when parked, broken into lists.
- Lead with the user benefit ("To connect your phone, turn on Bluetooth").
- Reassuring tone while moving ("New conversations are paused"); in real danger use direct commands and exclamation marks ("Brake now!").
- Confirm completed user-initiated tasks; error messages state the problem and a way out, or say honestly there is none.
- Notifications front-load critical information and never alarm the driver.

## Cars templates catalog

Source: https://developer.android.com/design/ui/cars/guides/templates/overview

| Template | Use | Key limits | Categories |
|---|---|---|---|
| Sectioned Item | Mixed browsing: lists, grids, chips, banners, condensed items, spotlight; replaces List and Grid | Inherits list and grid rules | General (CAL 1.9) |
| List | Vertically scrolling rows or conversation items | Row count per vehicle (`ConstraintManager`); secondary text 2 lines while driving; up to 2 FABs | General |
| Grid | Image-first selection | At least 6 items allowed, more in some vehicles; up to 2 FABs | General |
| Pane | Details plus prominent actions | 1 to 4 non-actionable rows, up to 2 buttons, optional large image (hidden inside Map + Content) | General |
| Message | Brief message, errors, permission prompts | Up to 2 lines of text, up to 2 buttons, optional image, icon or spinner | General |
| Long Message | Legal text, destination details | Unlimited scrolling text, up to 2 buttons; parked only, no step added | General |
| Search | Search bar, results list, keyboard | Keyboard only when parked; rows per vehicle | General |
| Sign-in | Provider, username/password, PIN, QR code | Parked only, no step added; PIN up to 12 characters | General |
| Tab | Container with tabs | 2 to 4 tabs, each with icon and title | General |
| Navigation | Full-screen app-drawn map, routing card, travel estimate | Action strip up to 4, map action strip up to 4 | Navigation |
| Place List (map) | Ordered locations over a library-drawn map | List rows within limits; distance or duration per item | POI |
| Map + Content | Map plus an included List, Grid, Pane or Message | Content template rules apply | Navigation, POI, Weather |
| Media Playback | Now playing view | Buttons via media session | Media |

## Cars template details

### List template

Source: https://developer.android.com/design/ui/cars/guides/templates/list-template

- Supports loading state, sections via sublists, rows as toggles or radio buttons; embeddable in Tab and Map + Content.
- Secondary text truncates to 2 lines while driving; put driving-relevant text first. Full text shows when parked.

| Level | Requirement |
|---|---|
| MUST | Section header when sections exist |
| MUST NOT | Mix selectable (radio) rows with other row types, or split them across sections |
| SHOULD | Default selection on selectable lists; an action on every row (info-only rows discouraged); header with title and actions |
| MAY | Sections; mix toggle rows with others; update row text or image on toggle |

### Grid template

Source: https://developer.android.com/design/ui/cars/guides/templates/grid-template

- Items: icon or large image, optional primary and secondary text, badge. Prefer Sectioned Item for new work.
- SHOULD: short labels, an action per item, visible state changes (image, icon or text), header. SHOULD NOT: action strip and FAB together. MAY: loading spinner in place of the item image while its action runs.

### Sectioned Item template

Source: https://developer.android.com/design/ui/cars/guides/templates/sectioned-item-template

- Vertically scrolling, mixed sections: lists, grids, chips, banners, condensed items, spotlight sections; supports expanded headers. Migrate List and Grid usages here for new features. List and Grid requirements apply.

### Pane template

Source: https://developer.android.com/design/ui/cars/guides/templates/pane-template

- MUST: at least 1 info row. SHOULD: primary action when 2 actions; navigation as primary when present; icons on all actions; header. MAY: up to 4 rows and 2 actions. Rows have no dividers (not actionable). If space is short, the second button can show only its icon.

### Message template

Source: https://developer.android.com/design/ui/cars/guides/templates/message-template

- MUST: message text. SHOULD: primary action with 2 actions, placed closest to the driver (left in left-hand-drive cars); header. MAY: image or icon, up to 2 actions, permission prompts that continue on the phone when parked.
- For longer text use Long Message; for more detail with prominent actions use Pane.

### Long Message template

Source: https://developer.android.com/design/ui/cars/guides/templates/long-message-template

- Hidden while driving; give an alternative button (for example "Skip sign-in, use guest mode"). MUST include text; SHOULD set a primary when 2 actions; MAY have up to 2 actions.

### Map + Content template

Source: https://developer.android.com/design/ui/cars/guides/templates/map-content-template

| Level | Requirement |
|---|---|
| MUST | Include List, Message, Grid or Pane content |
| SHOULD | Primary action when 2 actions; icons plus labels on actions; only the closest or most relevant locations; support list refresh with map interaction |
| SHOULD | Map marker text at least 24 dp Roboto (or equivalent); a marker for each listed location; highlight the route on selection |

### Navigation template

Source: https://developer.android.com/design/ui/cars/guides/templates/navigation-template

Anatomy: full-screen app-drawn map; optional routing card; optional travel estimate card (ETA, time, distance, or custom text and icon); action strip (up to 4); optional map action strip (up to 4).

- Routing card (routing state): current step (icon, distance, cue text with optional image spans), optional lane guidance (lane images or junction image up to 200 dp high), optional next step (only without a junction image). Can show a spinner for loading, calculating, rerouting. Message state: 1 to 2 line routing message plus optional image (arrival, route failure).
- Cluster map: independently rendered (may copy main), non-interactive, dark theme strongly recommended. On AAOS, OEMs may show their own TBT in the cluster.
- TBT notifications are mandatory when the app gives text TBT directions; background color customizable. Regular notifications or navigation alerts carry other navigation messages.
- Navigation alerts: title, optional subtitle, optional icon, progress indicator (bar or timed button), up to 2 buttons. Dismissed by any action, by timeout after a configurable number of seconds, or by the app. Never use alerts for primary guidance (turns, arrival time).

| Level | Requirement |
|---|---|
| MUST | At least 1 maneuver on the routing card; at least 1 action on the action strip; pan button in the map action strip if panning is supported |
| SHOULD | Dark cluster map; only map-interactivity buttons on the map action strip (compass, recenter, 3D); an End navigation button during TBT; standardized symbols; junction image spanning card width; lane images with transparent backgrounds; alerts only for non-distracting, task-relevant info |
| MAY | Supporting lane text (Roboto 24 recommended) with lower contrast for non-highlighted lanes; 2 maneuvers when they occur in rapid succession; route-marker images in cue text; full map in free drive; hide or show cards; speed, speed limit, camera alerts on the map; change routing card color by road type |

### Place List (map) template

Source: https://developer.android.com/design/ui/cars/guides/templates/place-list-map-template

- For POI apps. Header in a card with optional refresh button (no step added), optional action strip, library-drawn base map, list rows, markers.
- Markers: map marker (text up to 3 letters, icon or image), matching list marker, optional anchor marker for the search center. Any background color; it carries to the list marker.
- MUST: distance or duration on every non-browsable item; an action on every row (info-only rows not allowed). SHOULD: at least one location or browsable item, a marker per location, closest or most relevant only, support refresh after driving out of range.

### Search template

Source: https://developer.android.com/design/ui/cars/guides/templates/search-template

- MUST update results as keywords change. SHOULD: refresh only to show results during input; loading indicator for searches over 1 s; on open, show content or launch the keyboard if there is none. MAY: expanded or collapsed keyboard when parked, initial text, hint text, default list of past results.
- While driving, the keyboard is unavailable; speech-to-text and past results remain.

### Sign-in template

Source: https://developer.android.com/design/ui/cars/guides/templates/sign-in-template

- Methods: provider (no input), username/password (single mandatory field), PIN (up to 12 characters, refreshable on timeout), QR code. Parked only.
- MUST include a sign-in method. SHOULD: input fields only for sign-in, shortest flow, most popular method first. MAY: actions to switch methods.

### Tab template

Source: https://developer.android.com/design/ui/cars/guides/templates/tab-template

- Tab bar with app icon and 2 to 4 tabs (MUST icon and title per tab). Embeds List, Grid, Search, Pane, Message, Navigation or Sectioned Item; embedded headers are ignored. SHOULD short labels; SHOULD NOT rely on embedded headers or action strips (use a FAB instead of an action strip).

### Media Playback template

Source: https://developer.android.com/design/ui/cars/guides/templates/media-playback-template

- Decide which header buttons and which playback buttons and images appear (playback data comes from the media session).

## Cars components

Source: https://developer.android.com/design/ui/cars/guides/components/overview

CAL 1.9 adds: spotlight section, condensed items, chips, minimized control panel, banner, section header (all Sectioned Item only).

| Component | Page under https://developer.android.com/design/ui/cars/guides/components/ | Key rules and limits |
|---|---|---|
| Action strip | action-strip | Up to 2 buttons (4 on map templates); 1 label button per template; for secondary or tertiary actions except on Navigation; never with a FAB; auto-hides after 10 s without interaction or rotary focus (may hide on small screens even with focus); actions can be flagged persistent |
| Map action strip | map-action-strip | Up to 4 buttons: pan (required if panning), recenter, zoom in, zoom out; pan mode shows only map and strip; provide enter and exit pan icons (exit clearly an X); hides after 10 s; keep the lower-right map corner clear; not on Place List (map) |
| Button | button | Icon, label, or both; custom foreground and background colors (AAOS OEMs may ignore); one primary button in Message, Long Message, Pane (accent color); timed buttons show a horizontal progress fill and auto-run the default action |
| FAB | fab | Icon only plus background color; Grid and List only; up to 2, lower right; the most important action; required instead of action strip inside Tab |
| Header | header | At least one of text, app icon, back; title 1 line (truncates); refresh button only on Place List; expanded headers (Sectioned Item) can hold collapsing images and secondary actions |
| Row | row | Title mandatory, up to 2 lines; secondary text up to 2 lines (custom color); inline icon, numeric decoration, image, up to 2 actions, progress bar; browsable rows must be clickable and have no actions; toggle and radio never together; no chevrons with toggles or radios |
| HUN | hun | App icon, primary and secondary text, up to 3 actions, optional avatar |
| Toast | toast | One at a time, near bottom, no action needed, disappears after 8 s; low priority (dialogs are high priority and hold focus); OEMs can change font, size, placement |
| Chip | chips/chips | Max 7 per row; MUST have icon or label; distinct state styling; no mixing stateful and stateless chips in one group; critical chips at leading edge; brief labels |
| Condensed item | condensed-items/condensed-items | At least one of leading image, 1-line texts, trailing image; avoid images on both ends; use for recents and featured categories |
| Banner | banners/banners | Leading image or icon and primary text required; MUST be the only item in its own section, one per section; custom fill, accent, radius; never adjacent to another banner section |
| Section header | section-header/section-header | Leading image, 1-line title and overline, optional trailing action; tappable for shortcuts, sorting, settings |
| Spotlight section | spotlight-section/spotlight-section | MUST hero image plus at least 1 condensed item; hero image carries no text drivers must read; SHOULD show at least 3 condensed items |
| Minimized control panel | minimized-control-panel/minimized-control-panel | Required for media apps on CAL 1.9+ (quality guidelines); persistent condensed Now Playing: image and 1-line texts, primary actions, progress bar; adapts to width |
| Voice input | voice-input | User starts it (mic in action strip); overlay shows recording; stop on dismiss or when speech ends; get mic permission first (ideally before the drive); brand your in-app assistant |

## Cars communication methods

Source: https://developer.android.com/design/ui/cars/guides/components/plan-communications

| Method | Format | Use case |
|---|---|---|
| Message template | Brief message, icon or image, actions | Error message |
| Long Message template | Long scrollable text, parked | Legal text for permissions |
| Toast | Very brief text | "Continue on your phone when parked" |
| Voice input | Microphone audio processed by app | Request to the app while driving |
| Navigation alert | Brief message plus optional actions on Navigation template, never blocks guidance | Suggesting a route change |
| HUN | Temporary card with brief text and actions, deep-links into app | High-importance update worth interrupting (outside Navigation template) |

- AAOS OEMs decide whether navigation HUNs show.
- The plan page lists up to 4 actions for Message and 2 for HUNs; the template and HUN pages say 2 buttons and 3 actions. Follow the template pages (inference).

## Cars app types and sample flows

### Media apps

Source: https://developer.android.com/design/ui/cars/guides/app-types/media-apps
Source: https://developer.android.com/design/ui/cars/guides/app-types/create-media-apps
Source: https://developer.android.com/design/ui/cars/guides/app-types/customize-playback-controls
Source: https://developer.android.com/design/ui/cars/guides/app-types/plan-browsing-views
Source: https://developer.android.com/design/ui/cars/guides/app-types/plan-navigation-tabs
Source: https://developer.android.com/design/ui/cars/guides/app-types/provide-recommendations

- Driving principles: voice controls first, flows of 3 steps or fewer, audio only while driving.
- Two build paths: CAL templates (Sectioned Item, Media Playback, Sign-in, Tab; templated media is beta, internal and closed tracks only) or `MediaBrowserService` (Google and OEMs own the visuals; you supply browse tree, branding, tab and custom action icons).
- Google and OEMs implement playback view, minimized control bar and queue with Play/Pause, Next, Previous (if supported), Overflow.

| Level | Media requirement |
|---|---|
| MUST | Monochrome vector icons for custom actions, changing with state |
| MUST | Subheader text when a browsing view has subcategories |
| MUST (AAOS) | No more than 4 tabs, each with a label and monochrome (preferably white) vector icon |
| SHOULD | Fill the icon bounding box when an icon contains text or numbers |
| SHOULD | Indicator on the currently playing queue item; include previously played items |
| SHOULD | Browse depth of 3 levels or fewer below top level; consider in-app search (OEMs design voice and keyboard search UI) |
| SHOULD | Short tab labels; allow OEMs to show labels without icons |
| SHOULD | Supply a recommendation source (AA: 10 items for the dashboard when nothing is playing) |
| SHOULD | Support voice actions for all relevant media categories (genre, artist, album, playlist, title) and handle vague requests ("Play some music") |
| MAY | Up to 6 custom actions (8 if not using Next and Previous); queue thumbnails; grid or list per view (list is default) |

- Tab categories should be tailored (frequent, preferred, timely, curated), avoiding overly broad buckets.
- Custom actions show in the order added to `PlaybackState`. Recommendations go through `EXTRA_SUGGESTED`; without them AA pulls from the top of the browse tree (often repetitive). Choose recommendations from in-car listening history.

### Communication apps

Source: https://developer.android.com/design/ui/cars/guides/app-types/communications

- Calling: contact lists or grids that start calls through `CallsManager`; Android Auto supplies the in-call screen. Relevant templates: Sectioned Item, Grid, List, Sign-in, Tab. Beta (internal and closed tracks).
- Messaging notifications: no UI work; supply an icon legible as a small badge and keep messages grouped and ordered.
- Templated messaging: conversation lists matching the phone app; Conversation Item templates require specific data so Gemini or Assistant can read and reply. Beta.

### Navigation apps and flows

Source: https://developer.android.com/design/ui/cars/guides/app-types/navigation-apps
Source: https://developer.android.com/design/ui/cars/guides/app-types/navigation-alerts
Source: https://developer.android.com/design/ui/cars/guides/app-types/view-map-in-cluster
Source: https://developer.android.com/design/ui/cars/guides/ux-requirements/communicate-app-by-voice

Features: place lists, route previews, travel estimate cards, routing cards, alerts, map interactivity, cluster integration. Key templates: Map + Content and Navigation.

| Flow | Page under https://developer.android.com/design/ui/cars/guides/ | Templates and step counts |
|---|---|---|
| Navigate to saved place | app-types/navigate-to-a-saved-location | Home/Work shortcut on landing Pane (1) then Navigation (new task) |
| Browse locations | app-types/browse-locations | Submenu (1), location (2), route (3), Navigation (new task) |
| Place details | app-types/access-location-details | Submenu list (1), location list (2, new content is a step), Pane (3), navigation app opens (1) |
| Search past results | app-types/search-using-past-results | Search from action strip (1), Search template without keyboard (2), list (3), Pane (4), Navigation (new task) |
| Add a stop | app-types/add-stop | Add stop (1), compact list on Map + Content with floating nav bar (2), pick (refresh, 2), Navigate on Pane (3), alert confirms (1) |
| Timed alert | app-types/timed-alert | Pane view in Navigation template with timed default button (2) |
| Arrive | app-types/arrive-at-destination | Routing card switches to message state (refresh); after at least 8 s show map only |
| Resume after stop | app-types/resume-navigation | Message in Map + Content on restart asks to continue (new task) |
| Report incident | app-types/report-incident | Report FAB (1), Grid in Map + Content (2), toast confirms (new task) |

Also: navigation alerts replace the ETA with a reroute option and timeout progress (all refreshes); the cluster shows a non-interactive app map only during guidance; voice input (mic on action strip, recording indicator, confirmation toast) adds no steps beyond the first.

### POI, IoT, weather and parked apps

Source: https://developer.android.com/design/ui/cars/guides/app-types/other-apps
Source: https://developer.android.com/design/ui/cars/guides/app-types/weather-apps
Source: https://developer.android.com/design/ui/cars/guides/components/tabs-switch-views
Source: https://developer.android.com/design/ui/cars/guides/app-types/parked-passenger-apps

- POI (parking, charging) and IoT are approved CAL categories alongside navigation. Weather apps may draw their own map (temperature, wind, radar) and use Grid, List, Long Message, Message, Pane, Search, Sign-In, Tab, Map + Content.
- IoT sample: Tab with List (1), tap desk light in Grid tab (1), confirmation toast (refresh, 1).

## Cars flows: permissions, sign-in, settings, purchase

Source: https://developer.android.com/design/ui/cars/guides/flows/overview
Source: https://developer.android.com/design/ui/cars/guides/flows/grant-permissions-on-phone
Source: https://developer.android.com/design/ui/cars/guides/flows/grant-permissions-in-car
Source: https://developer.android.com/design/ui/cars/guides/flows/create-sign-in-flow
Source: https://developer.android.com/design/ui/cars/guides/flows/sign-in-while-parked
Source: https://developer.android.com/design/ui/cars/guides/flows/create-settings
Source: https://developer.android.com/design/ui/cars/guides/flows/purchase

- Permissions on phone (AA): Message template with 2 buttons (2), toast pointing to the phone (refresh), user grants on phone when not driving, then refresh the car to the landing template (step count resets). Never leave the user on the Message template after granting.
- Permissions on car (AAOS): Message template (2), system dialog on car screen and toast (refresh), back to landing (new task).
- Sign-in is parked only and less critical on AA (phone already signed in). Steps: pick a primary method, plan the template sequence, validate requirements.

| Level | Sign-in requirement (AAOS) |
|---|---|
| SHOULD | Google sign-in as primary when supported; else phone sign-in |
| SHOULD | Phone sign-in PIN of 8 digits or fewer |
| SHOULD | Username and password on 2 separate steps; persistent field label ("Enter password"); show-password option; forgot-credentials help; account creation path |
| MAY | Standard sign-in as primary only if neither Google nor phone sign-in is possible; other methods as backups |

- QR sample: Sign-in template (parked), scan continues on phone (task paused), Long Message for privacy policy (parked), return to landing (new task).
- Settings (optional on AA): only driving-essential settings (account, preferences, sign-in or out, explicit content toggle), all on one List screen if possible, dialogs only for simple confirmation. Declare a Settings activity in the manifest. On AAOS media, settings open as an overlay from the app bar.
- Purchase sample: landing (1), curated List of nearby or recent places (2), Pane reserves and charges in the background (3), Message confirms and offers Navigate (4), navigation app opens (new task).

## Cars styles and customization

Source: https://developer.android.com/design/ui/cars/guides/foundations/customize-app
Source: https://developer.android.com/design/ui/cars/guides/app-types/branding-elements

| Aspect | Library decides | App customizes | AAOS OEM customizes |
|---|---|---|---|
| Images and icons | Standard icons (back, spinner) | All other images and icons (Material icons, Play icon specs) | |
| Layout and shape | Default layout, sizes, shapes (standard on AA) | Large vs small images and icons; tabs on some templates; second map in cluster | Sizes, shapes, button position and proportions |
| Typography | Font family and size on AA | Longer and shorter text variants for different screens | Font family and size |
| Color | Default AA colors | Marker colors, some text and background colors | Adjust default and app colors to blend with the car |

- App-customizable colors: list row secondary text (OEM controls primary text color on AAOS), button text, button backgrounds (except action strip and map action strip), place-list markers, routing card (background, images, duration color), TBT notification background.
- Text color: pick from 4 standard Android for Cars colors or up to 2 custom accents. Other items accept any color.
- Provide up to 2 custom accent colors, each with light and dark variants.
- Foreground to background contrast at least 4.5:1 for legibility while driving. Use color only when it serves a function.
- Branding MUST: vector app icon in full color and in monochrome, plus an accent color (set in the app theme).
- OEMs may choose app or OEM accent for the primary button and place it left or right (right-hand drive).

## Car app quality highlights

Source: https://developer.android.com/docs/quality-guidelines/car-app-quality

| ID | Applies to | Rule |
|---|---|---|
| DD-2, DD-3 | Video, games, browsers | Not launchable, visible or usable while driving; audio stops when driving starts and can't resume while driving |
| DD-4 | Video | Support audio while driving on capable devices |
| DD-1 | Navigation | Navigation audio channel only for navigation instructions |
| SA-1 | Driving-category apps | No animated graphics or video on screen (relevant canvas animation allowed when parked) |
| ST-1 | Driving-category apps | No auto-scrolling text |
| AD-1 | Driving-category apps | Text ads limited to advertiser or product name |
| IU-1 | Driving-category apps | No images except allowed exceptions such as a single static background image for content context (album art) |
| DR-1 / DR-2 / DR-3 | Driving-category apps | Buttons respond within 2 s; launch within 10 s; content loads within 10 s |
| TH-1 | Templated apps | Custom theming on CAL 1.9+ must support light and dark |
| NF-2 to NF-4, MR-1 | Navigation (MR-1 also POI, weather) | Only map content on the surface; TBT, lanes, ETA in template components; TBT triggers notifications and cluster next-turn data; light or dark map on instruction |
| UX-1 / UX-2 / UX-3 | Video, games, browsers | Touch targets 64 dp min, 24 dp apart and 24 dp from screen edges; fonts at least 24 sp |
| IN-2 | Video, games, browsers | No heads-up notifications |
| EP-2 | All | Restore previous state on relaunch |

---

## Android XR overview and app tiers

Source: https://developer.android.com/design/ui/xr
Source: https://developer.android.com/design/ui/xr/guides
Source: https://developer.android.com/design/ui/xr/guides/get-started

| Tier | Definition | Play availability |
|---|---|---|
| XR compatible mobile app | Unmodified phone app that requires no unsupported features (such as telephony); critical flows work | Automatic |
| XR compatible large screen (adaptive) app | Tier 1 or Tier 2 adaptive app with external input and multitasking support | Automatic |
| XR differentiated app | Designed for XR with at least one XR-only feature: spatial panels, orbiters, environments, 3D models, spatial audio, spatial video, anchors | Gets a "Made for XR" badge |

- Build paths: Jetpack XR SDK (Compose for XR, SceneCore), Unity, OpenXR, WebXR (Godot and Unreal also count per quality guidelines).
- Quick start: follow large-screen guidelines, use Material components, pick key spatial moments, add clear Full Space and Home Space switch cues (collapse content and expand content icons). Save full immersion for key moments.
- Comfort basics: center interactables in the field of view; support seated, standing and reclined use with custom height; predictable motion and stable frame rate; keep some stationary reference objects; offer passthrough when fully immersive.
- Accessibility: TalkBack, voice to text, live captions, color inversion and correction, magnification, dwell control; sufficient contrast (especially on transparent backgrounds); dimming for contrast; no sudden brightness shifts; fewer choices at once with progressive disclosure; support both direct (arm's reach) and distant interaction.

## XR foundations: spaces, environments, inputs

Source: https://developer.android.com/design/ui/xr/guides/foundations

| | Home Space | Full Space |
|---|---|---|
| Apps | Several side by side (multitasking) | One app; others hidden |
| Spatial panels, 3D models, app environments | Not supported | Supported, plus spatial audio and stereoscopic video |
| Environment | System environments | App environment or inherited system environment |
| Default size | 1024 x 720 dp | Same position as Home Space unless overridden |
| Size range | Min 385 x 595 dp, max 2560 x 1800 dp | No minimum, max 2560 x 1800 dp |
| Launch distance | 1.75 m, not overridable | 1.75 m recommended; launch position overridable; move and resize |

- Unity, OpenXR and WebXR apps run in an unmanaged Full Space. Check spatial capabilities at runtime because they can change.
- Environments: spatial (fully virtual, Full Space only) or passthrough (digital over the real room). On wired XR glasses, full immersion still leaves the periphery and display transparency visible.
- System gestures: pinch (index and thumb, primary hand) = tap; held pinch scrolls, moves, resizes. Palm-inward pinch and hold opens the gesture navigation menu anywhere: Back (same as Android back stack), Launcher (home), Recents. Primary hand set in Input Settings.
- Multimodal input: hand and eye tracking, voice (Gemini dictation and commands), Bluetooth keyboard, mice (including adaptive), trackpads, 6DoF controllers. Never rely on a single input; give visual or audio feedback for every action.
- Custom gestures (OpenXR): easy to learn, remember and repeat; no large movements or frequent arm lifting; avoid resemblance to system gestures.
- Eye tracking: raw gaze data is never shared; the system draws a generic hover highlight on interactables. Offer alternatives to reduce eye strain.
- Privacy: consent before collecting PII, minimal data, secure storage.

## XR display technologies

Source: https://developer.android.com/design/ui/xr/guides/get-started

| Feature | XR headsets | Wired XR glasses |
|---|---|---|
| World view | Camera passthrough on opaque display | Direct view through transparent lenses |
| Display | Opaque MicroLED, full color, true black | Additive optics: black renders transparent, dark colors look see-through |
| Immersion | Can block the world entirely | World always visible; electrochromatic dimming increases immersion |
| Field of view | About 110 degrees or more | About 50 to 70 degrees |
| UI scaling | Standard | Automatic scaling into the narrower FOV |
| Inputs | Hands, eyes, 6DoF controllers | Hands plus peripherals (phone, keyboard, mouse) |
| Mobility | Stationary or room scale | High mobility, lightweight |

## XR spatial UI: panels, orbiters, elevation

Source: https://developer.android.com/design/ui/xr/guides/spatial-ui

Spatial UI is Full Space only (preview).

Spatial panels:
- Fundamental containers for UI, components and immersive content. The spatial UI APIs allow any number of panels in flat rows, curved rows or arbitrary positions. Never overlap panels over critical information.
- Scaling: apparent size stays constant between 0.75 m and 1.75 m; beyond that the scaling rate grows at 0.5 m per m and elements look smaller. Moving a panel rescales it automatically; users can resize.
- Movement limits (avoid system UI conflicts): minimum depth 0.75 m, maximum 5 m.
- Units: Android XR uses 0.868 dp-to-dmm (dmm = distance-independent millimeters, an angular unit constant at any distance).
- Placement: spawn panel center 1.75 m from the user; vertical center 5 degrees below eye level; keep content within the center 41 degrees of the field of view.
- Panels stay put as users walk around; they keep their position when switching from Home Space to Full Space unless you set one. Anchoring to floor, chair, wall, ceiling or table is passthrough only.
- Spatial video: monoscopic or stereoscopic on flat, 180-degree or 360-degree surfaces.

Orbiters (floating controls anchored to a panel or entity):

| Spec | Value |
|---|---|
| Recommended offset from panel | 20 dp |
| Default elevation | 15 dp in Z (the elevation table lists orbiters at level 1, 16 dp) |
| Max overlap with the panel | Less than 50% of the orbiter's size |
| Sizing | Fixed or flexible with panel resize; may expand to fit content |

- Use sparingly; spatialize a few key navigation components (navigation rail, navigation bar). Avoid far-away orbiters, absolute X or Y coordinates, and too many orbiters. Position via padding as flex or percentage.

Spatial elevation (developer preview values, may change):

| Level | Component | Z offset |
|---|---|---|
| 0 | Not assigned | 0.1 dp |
| 1 | Orbiter | 16 dp |
| 2 | Not assigned | 24 dp |
| 3 | SpatialPopup | 32 dp |
| 4 | Not assigned | 40 dp |
| 5 | SpatialDialog | 56 dp |

- Elevation draws attention, builds hierarchy and improves legibility. Don't elevate large planes (bottom sheets, side sheets) or scrollable content.

## XR visual design: targets, color, type

Source: https://developer.android.com/design/ui/xr/guides/visual-design

Targets (Material target guidance applies to Android, Unity, OpenXR, WebXR):

| Spec | Value |
|---|---|
| Recommended target | 56 x 56 dp or larger (optimal) |
| Minimum target (quality guideline) | 48 x 48 dp |
| Visual affordance (icon) | 48 x 48 dp or larger |
| Offset between target and affordance | 4 dp |
| Spacing between targets | At least 8 dp (more for big or unrelated buttons, less inside toolbars) |
| Target formula in meters | Min = distance(m) x 0.868 x 48; recommended = distance(m) x 0.868 x 56 |

- Pointer targets of different elements never overlap; targets and icons scale with their container or label.
- Add hover and focus states on top of basic states. With eye tracking on, apps can't see hover (privacy); the system draws a user-only highlight.

Panels and distance:
- Panels have 32 dp corner radius by default (overridable). Keep primary content within a 41-degree FOV.
- At 1.75 m: 1024 dp is perceived as 1556.24 mm, 720 dp as 1093.66 mm; 1 m in reality = 1 m in XR.

Buttons and icons: keep Material components for Android apps; custom ones use simple shapes, clean lines, limited palette, scale cleanly, have contrast, and carry text descriptions or tooltips.

Color:
- Follow the Material color system with sufficient contrast, balanced palette, color-blind-safe pairs, no jarring combinations.
- Wired glasses: black renders transparent; brighter colors look more solid; add white for visibility without excessive brightness; UI colors blend with the world, so prefer bright high-contrast colors; dimming makes content more solid.
- Support light and dark themes as on mobile (the quality guidelines push dark theme; see XR app quality).

Typography:
- Font size 14 dp or larger, weight normal or heavier.
- Size for viewing from varied distances; keep text in the natural field of view; use depth and scale for hierarchy; heavier weights against busy backgrounds; brighter text on wired glasses; limit text attached to moving objects.
- Accessible type: legible letterforms, sentence case, short lines, color-blind-safe colors, breathing room, user-adjustable text size.
- Unity, OpenXR, WebXR: use Signed Distance Field fonts for smooth text at any size.

Test on the Android XR emulator for motion comfort, passthrough blending, bright and dim lighting, text at varied distances and angles, and color accessibility; include users with varied XR experience and vision.

## XR comfort and motion

Source: https://developer.android.com/design/ui/xr/guides/motion
Source: https://developer.android.com/design/ui/xr/guides/considerations

- Use Material motion for UI elements. For 3D and environments, large or fast movement can cause sickness (visual motion while the inner ear senses stillness).
- Start small, save big motion for specific moments, use motion to show where to look, introduce mechanics gradually, give rest stops, consider making motion optional, keep camera motion smooth and predictable.
- For unavoidable whole-world movement: fade out and in, hide peripheral vision, accelerate slowly, avoid rotation. Make large moving objects semi-transparent or less noticeable.
- Run at 72 fps (quality guideline: frame time under 13.8 ms at 72 Hz, under 11.1 ms at 90 Hz).
- Locomotion: let users walk within their boundary; prefer teleportation (least sickness; briefly obscure the view during the jump); avoid continuous joystick movement; if used, keep a constant speed with no progressive acceleration, steady level horizon, tunnel-vision vignette, snap rotation to fixed angles; let users choose method, vignette on or off, speed.
- Limit scenes that move around the user (flying); in VR consider windows onto the real world.

## XR 3D models, environments, anchors

Source: https://developer.android.com/design/ui/xr/guides/3d-content
Source: https://developer.android.com/design/ui/xr/guides/environments
Source: https://developer.android.com/design/ui/xr/guides/spatial-anchor

3D models (Full Space only, preview):
- Formats `.gltf` and `.glb`; small files, modest polygon counts and texture resolution.
- SceneCore APIs (or `SceneCoreEntity` subspace composable in Compose for XR): custom rotate, move, scale; parent relationships with panels or other models; anchors to horizontal or vertical surfaces, floor or wall; annotations; embedded animation playback; multiple models; custom menu and launch positions.
- Scene Viewer: built-in move, rotate, scale, anchor UI, but runs as a separate app (your panels and environment are hidden).
- Launch position: 1.5 m away, 15 degrees below line of sight, centered; opens at miniature size of 1.5 m per axis. Menu: optional extra actions, a 1:1 button when the file has suggested and actual sizes, mandatory close button.

Spatial environments (Full Space only; no teleportation or interactivity in preview):
- Surrounding geometry: `.gltf` or `.glb` with geometry plus 360-degree texture, plus an Image Based Lighting file from an HDR EXR image.
- Additional geometry near the user: avoid objects above 0.9 m within 1.5 m of the user (depth conflicts with UI). Keep objects at least 1 m away to avoid collisions.
- Large mid-field screens: user should sit at least 5 feet above the surface the screen floats over, so viewing is centered without looking up.
- Performance: reduce polycount, draw calls (texture atlases), use KTX2 compression, bake lighting. Target about 80 MB for a 3D wallpaper or glb and 15 MB for audio files.
- Keep a safe tonal range without brightness spikes; UI legible in all directions, especially the middle horizontal band. Offer a menu to switch among multiple environments, and a clear Full Space and Home Space toggle.

Spatial anchors and markers (Full Space only):
- Anchors lock a virtual point to a physical object; they stay put when the user moves. Size and orient them so users don't need to back up.
- Marker forms: dot, icon, drawing (runtime-drawn, Glimmer-themed, for example a direction cue). Markers and attached UI use constant angular dp size, so distance is reflected in size; they can rotate toward the user under gravity or partially.
- Limit visible markers; cluster several into one prominent marker that expands progressively.
- Average angular target size for markers: 7 degrees. The hand raycast cursor appears only near an active target; for small targets add a cursor catcher (blank target behind them).

## Unity, OpenXR and WebXR design

Source: https://developer.android.com/design/ui/xr/guides/openxr
Source: https://developer.android.com/design/ui/xr/guides/considerations

- These apps run only in Full Space, can port from other platforms with little work, and may use any design language (Material recommendations still help).
- Inputs: standard system gestures (pinch) for 2D UI; real-world mimicking gestures for 3D (pick up, throw); avoid complex multi-step gestures; work with either hand or honor system handedness; one-handed alternatives for every essential action; implement a back stack so the Android XR back gesture works.
- UI: primary content in the natural line of sight; size UI for its intended distance and input (ray vs direct touch); visual feedback; panels for menus, 3D controls (levers, buttons) for world interactions; legible text with SDF fonts.
- Spatial interactions: believability over realism (add force to a throw if the user feels they threw hard); account for every affordance an object suggests; test grab techniques (parenting, joints, following, forces); add handles so flat surfaces can be raised to a comfortable height.
- Spatial audio: ambisonics for ambient beds, spatialized cues and voices, separate volume controls, subtitles. Let users remap controller buttons and gestures.

## Material Design for XR

Source: https://m3.material.io/foundations/xr/design

Principles: use familiar patterns (Material components), prioritize comfort (center of FOV; seated, standing, reclined), embrace depth (elevation and 3D models), design for accessibility.

Interaction:
- Gestures easy to learn, familiar (press, pinch, swipe), comfortable to repeat; essential actions one-handed; no large repetitive arm movement.
- Hand tracking: direct (touch, grab, push within reach) or ray-based (laser pointer plus pinch). Eye tracking: gaze and dwell; looking triggers hover.
- Voice for dictation and commands ("Open Settings", "Go back"); mouse and keyboard for precision and text; 6DoF controllers for games and 3D manipulation.
- Motion: standard easing and long duration tokens, stable horizon, limit continuous motion (teleport or instant jump instead), vignetting while moving.
- Feedback: hover icons, focus indicators, ripples, labels, elevation changes or highlight for targeted items; spatial audio click on press; controller haptics with an on/off setting.

Layout:
- XR layout accounts for Z depth, viewing distance and FOV. Panel defaults, size limits and depth limits match the spatial UI section above; group panels flat, curved or arbitrary.
- Orbiters hold navigation that must stay reachable without covering content; Material XR components adapt into orbiters automatically.
- Volumetric UI uses real depth instead of shadows; layers can be physically separated (a scrim floats several centimeters behind a dialog).
- Anchoring: world-locked panels are fine; avoid head-locked UI, use lazy follow that drifts to catch up.
- Standard surface tokens handle contrast: the system dims bright passthrough rooms; panels adapt to virtual lighting.

Accessibility:
- Work with TalkBack, voice to text, live captions, dwell control, magnification, color inversion and correction.
- Minimum 14 dp body text, high text contrast, standard surface container roles (dim automatically), light and dark themes.
- Every action possible with one hand, voice or eyes; never require two-handed gestures; support seated, standing, reclined; let people recenter and pull UI closer.
- Target sizes as in the visual design section (56 dp target, 48 dp affordance, 4 dp offset, no overlap).

## Material XR components

Source: https://m3.material.io/foundations/xr/components

Five M3 Expressive components adapt to XR: app bars, dialogs, navigation bar, navigation rail, toolbars. Orbiter versions exist only in Full Space; in Home Space use the regular 2D component on the content plane. Accessibility follows each component's standard M3 guidance (XR accessibility guidance still evolving). Color roles communicate elevation of orbiters.

| Component | Orbiter context | Placement rules |
|---|---|---|
| App bar | One variant, aligned with small app bar, center or left aligned. Global context (recommended, one per app): centered at top of the app, anchored through layout changes. Local: top of its panel, repositions | Offset 20 dp or inset 12 dp without covering content; stay within panel width and the field of view; local app bars may match the adjacent panel width (test it) |
| Dialog | Spatial dialog via component overrides (`EnableXrComponentOverrides`); colors surface container high or highest (manual in Compose for now) | Basic dialogs only (no full-screen); highest elevation in the product; scrim stays at app level and only fades; dialog scales uniformly and fades, rises to the highest resting level and returns; standard easing, long duration; centered in FOV, or lazy follow if it can track the head |
| Navigation bar | Global: bottom center of app. Local: bottom center of its panel | Offset for global actions, inset for local; 20 dp margin when adjacent; inset overlap 12 dp and no more than half its height; never wider than the panel; always at the panel bottom (top is for app bars) |
| Navigation rail | Global only, centered on left or right edge of the app; variants with contained FAB or spatialized FAB | Overlap 12 dp and no more than half its width; 20 dp margin when adjacent; align top, middle or center; never taller than the panel; never between panels (use a nav bar for more than 2 panels); spatialized FAB its own orbiter, 20 dp from the rail, above or below |
| Toolbar | One variant aligned with the floating toolbar, horizontal or vertical. Local context recommended (bottom center of panel); global allowed | Offset or inset (inset at most 12 dp); stay within panel width or height; more than 5 items can expand and collapse within panel bounds or split into several toolbars; never place a vertical toolbar between panels |

## XR app quality

Source: https://developer.android.com/docs/quality-guidelines/android-xr
Source: https://developer.android.com/docs/quality-guidelines/android-xr/immersive

Immersive guidelines cover headsets and wired XR glasses; augmented guidelines cover audio and display glasses (see the last section).

| Area | Requirement |
|---|---|
| Strobing | Avoid; if unavoidable keep under 3 flashes per second in a small subtle area, offer a setting to disable, warn beforehand |
| Motion sickness | No abrupt camera moves; consistent frame of reference; never rotate the camera over time (snap to new orientation) |
| Dimmer | Respect user dimmer settings; apps may adjust but users can override |
| Targets | Min 48 x 48 dp, recommended 56 x 56 dp (or distance formula) |
| Hand input | Usable without controllers |
| Boundary | Passthrough-focused apps (`currentPassthroughOpacity` above 0.5) keep the central FOV clear of dense opaque elements; virtual non-stationary apps consider `XR_BOUNDARY_TYPE_LARGE` and stay playable within 2.0 m radius (boundary fades in at 1.5 m); no boundary on glasses |
| Performance | Frame time under 11.1 ms (90 Hz) and 13.8 ms (72 Hz); mean cold start under 2 s, warm under 1 s; fewer than 1 ANR in 99.5% of daily sessions; about 1% crash rate |
| Differentiated baseline | At least one XR feature; menus, assets and controls in dedicated panels or orbiters (not the main editing panel); separate panels for parallel tasks |
| Theme | Default to dark theme; on XR glasses always implement dark (system default) |
| Space switching | Easy-to-reach icon or label button for Home Space and Full Space |
| Scrolling | Lists and carousels scroll with momentum |
| Video | Full Space playback with controls in a panel or orbiter (not overlaid); panel aspect ratio without letterboxing; dim passthrough or choose an environment; clarify audio source and control mapping with multiple streams; consider spatial audio |
| Policies | Same bystander, camera, audio and LED policies as glasses (last section), minus the gesture rules |

## Jetpack Compose Glimmer

Source: https://developer.android.com/design/ui/xr/guides/glimmer

Google's design system and UI toolkit for optical see-through (OST) displays such as wired XR glasses and display AI glasses.

- Principles: transparent display first (backed by color science), hardware-input-driven interactions, purpose-built components that still allow custom focus highlights, type and color (`GlimmerTheme`).
- Black is transparent on OST displays: dark colors look dull or see-through, which can also create depth. Even with the wider FOV of wired glasses, keep UI out of the way.
- Styles (3 accent and 6 surface roles; Body and Title type roles) and components are detailed in the AI glasses sections below.

---

## AI glasses principles

Source: https://developer.android.com/design/ui/ai-glasses
Source: https://developer.android.com/design/ui/ai-glasses/guides/foundations/design-principles
Source: https://developer.android.com/design/ui/ai-glasses/guides/foundations/made-for-glasses

| Device | Hardware | Experience |
|---|---|---|
| Audio glasses (displayless) | Speakers, camera, microphone, touchpad | AI agents, natural language, proactive and reactive audio (media, navigation); concise responses and text to speech |
| Display glasses | Adds a small private display | Audio plus subtle, glanceable, high-contrast visuals (navigation, notifications) shown only when relevant |

Design every experience for both: an audio-only flow and a display flow.

- Multimodal and hands-free first (voice, gesture); account for indirect, less precise input.
- Glanceable, transient UI: appear when needed, recede when done; no persistent on-screen distractions.
- Transparent UI always competes with the real world: small FOV, varying focal distance, dynamic backgrounds. Keep information concise and adaptive.
- Optimize for focus: fewer actions and visual elements, controlled density.
- Comfort: be transparent about data collected and why; no sudden visuals at critical moments; audio never masks environmental sound; no reading large text while walking; follow Glimmer legibility practices.
- Use Jetpack Compose Glimmer (`GlimmerTheme`) for display UI; Figma kit and user-education motion assets (After Effects, exportable to Lottie) are available.

## AI glasses get started

Source: https://developer.android.com/design/ui/ai-glasses/guides/foundations/get-started

1. Pick critical user journeys that fit glanceable, hands-free use (for example walking turn-by-turn). Extract features; never port the whole phone app. Avoid tasks needing the camera for long periods or intruding on privacy.
2. Minimize and translate a phone CUJ: prioritize essentials, use depth for hierarchy, design from the bottom up, translate components (phone app bar becomes a title chip, Material list becomes a Glimmer list).
3. Write an audio-only flow map with cues and dialogue; check it doesn't overwhelm.
4. Map inputs (phone tap becomes touchpad tap).
5. Account for system UI (home, notifications in the system bar).
6. Plan extra states (connection, permissions) in both visual and audio form, for example an audio prompt to finish a permission on the phone.

## AI glasses surfaces

Source: https://developer.android.com/design/ui/ai-glasses/guides/surfaces/overview
Source: https://developer.android.com/design/ui/ai-glasses/guides/surfaces/sysui
Source: https://developer.android.com/design/ui/ai-glasses/guides/surfaces/app

| Surface | Role |
|---|---|
| Home | Lowest system layer, inspired by the phone lock screen: clock, weather, notifications, Gemini feedback, shortcuts, multitasking between running activities |
| App view | Your app's canvas; system bar empty by default |
| System bar | Gemini feedback, notifications, alerts, chips, clock; invisible when unused (except on Home); apps may only use it through notification chips |
| Notifications | Templated, brief, timely; appear as a chip and expand on focus; minimal brand accents only |
| LEDs | One user-facing and one bystander-facing LED show feature and device state; system-controlled, unchangeable |

App view anatomy (display glasses):
- Build from the bottom of the canvas upward so the line of sight stays clear; avoid vertically centered content.
- Use depth for hierarchy; keep scrolling item counts small; balance voice against physical gestures.
- Display on: touchpad scrolls lists, moves focus, clicks buttons; prefer visual feedback over extra audio. Track display on and off so users can move between display and audio modes. Display timeout is user configurable; override only when crucial (performance cost).

Audio glasses: map input to key actions (tap play or pause, swipe back to end); translate visual cues to audio cues; no list scrolling, so pair audio prompts with inputs.

Entry points: phone handoff is the main one today. Implicit handoff (starting navigation shows TBT on glasses) or explicit (a button in the phone app, marked with an eyeglasses icon and optional "Launch on glasses" label). Expect future entry from system UI and AI.

## AI glasses styles

Source: https://developer.android.com/design/ui/ai-glasses/guides/styles/overview
Source: https://developer.android.com/design/ui/ai-glasses/guides/styles/color
Source: https://developer.android.com/design/ui/ai-glasses/guides/styles/type
Source: https://developer.android.com/design/ui/ai-glasses/guides/styles/icons
Source: https://developer.android.com/design/ui/ai-glasses/guides/styles/surfaces

Overall: crisp, high-contrast elements that appear only when necessary and fade quickly. Glimmer provides a color scheme, a typescale and 3 corner-radius sizes; embrace rounded corners (sharp corners create visual pockets that pull the eye).

Color:
- Scheme: 3 accent roles, 6 surface roles, on-colors; use like mobile roles. Most text white; accent color text only for emphasis.
- Brand, action and alert colors must be bright enough to read, saturated enough to read as color, with at least 66 tone difference (HCT) between foreground and background. Over every possible background aim for 70 tone difference (about 7:1). Preview designs in screen blend mode.
- Prefer desaturated colors; oversaturated colors display poorly.
- Power and heat: green costs least, blue most at equal tone; light as few pixels as possible; never fill the screen with white (triggers thermal mitigation).
- Surfaces: black for highest contrast, no lighter than 34% tone when focused; avoid custom surfaces; keep Surface and Surface Variant clearly apart (a gap around 20 tone is too close); subtle visible outlines.
- Outlines: prefer defaults; one outline color only; the focus highlight is 2 outlines, tint layer 2 to brand it; keep contrast in every state.

Typography:
- Measured in angular degrees. Minimum 0.6 degrees; most text 0.7 to 0.9 degrees. At 30 pixels per degree, 0.6 degrees = 18 px minimum.
- Glimmer typescale: Body and Title roles, 3 styles each. Google Sans Flex (now on Google Fonts) can be tuned with optical size, roundness, weight and width axes.
- Halation and chromatic aberration blur letter edges: use rounded fonts with heavier weight and wider letter-spacing; avoid thin condensed faces.

Icons: Material Symbols Rounded, unfilled (filled icons cause halation), heavier stroke weight.

Surfaces and depth: depth = Z placement plus shadows. Surfaces stay transparent; use variants like Surface Container Low for depth contrast; shadows must be fully opaque black.

## AI glasses components

Source: https://developer.android.com/design/ui/ai-glasses/guides/components/overview

Glimmer optimizations: black (transparent) surfaces, contrast-optimized outline plus highlight for focus and input, softer shapes, white on-surface content, a small Body and Title type set, rounded Material Symbols. Avoid building custom components.

| Component | Page under https://developer.android.com/design/ui/ai-glasses/guides/components/ | Usage rules | Default specs |
|---|---|---|---|
| Button | buttons | Near related content; progressive disclosure over many buttons; never decorative (use a title chip); icon buttons only for well-known actions; toggle variant only for binary actions, swapping icons by state; states: rest, focused, pressed, disabled, disabled and focused | Default: min height 48 dp, padding 16 x 8 dp, 2 dp border #606460, Body Small, 32 dp icons, shape Large or Circle. Large: min height 72 dp, padding 16 x 16 dp. Icon button: 48 dp, 32 dp icon. Toggle icon corners 100 dp to 20 dp selected; selected surface Outline |
| Button group | button-group | Use for 2 or more buttons; same height; 1 to 10 buttons; one group per layout; initial focus leftmost by default, center for symmetric groups; avoid overflow in centered layouts | Left-aligned start and end margins 44 dp; scrolls to center over 3 steps per swipe. Not yet in the Glimmer library (Figma only) |
| Card | cards | Text, icons, images, Gemini responses; at most one nested button (pair with a button group for more); focus goes to the button when the card holds one, to the card when it is a list entry; never a mobile-style dialog | Slots: header image, title and subtitle, leading and trailing icons (56 dp), single action, main content. Shape Medium, padding 24 x 24 dp, 2 dp #606460 border, Body Small |
| List | lists | Fills the app view; one list per view; optional static or sticky title; black scrim marks overflow; focused item moves from depth 0 to +4; highlight only the element that responds to tap | Item shape 40 dp, medium symbol icons, padding 20 dp (first value garbled in source), 20 dp spacing; single line Body Small, double line Title Small plus Body Small |
| Stack | stack | Collapsed list showing one card or notification at a time; swipe moves one item; touch can expand into a list; stretch animation at ends; keep item opacity constant while scrolling | Top item depth +2, others 0; scrim, paging and animation not customizable |
| Pager | pager | Dots for position in a horizontal sequence; above the system bar, under content; one card visible, no overlap | 5 or more dots: first dot shrinks and the row slides; not customizable |
| Progress | progress | Determinate only for known durations; indeterminate for unknown; one indicator at a time, only when there is enough time to show | Linear, circular, wavy. Thickness 6 dp, indicator Primary, track Outline; linear 360 dp, circular 40 dp |
| Title chip | title-chip | Read-only label (no focus state), the glasses counterpart of a mobile app bar; scrolls with layout or stays fixed; sticky variant has an outline | Padding 16 x 8 dp, 2 dp border, Body Small, 40 dp leading icon, max width 352 dp, min height 56 dp |
| Icon marker | icon-marker | Annotates real-world objects only; non-interactive state (no disabled state) or interactive state that opens a Glimmer card; progressive disclosure; cluster many markers; billboards toward the user while respecting gravity | Icon, large dot or small dot; padding medium on side positions, 0 dp on diagonal; 8 alignment positions; avoid customizing |
| Voice indicator | voice-indicator | Shows the mic is receiving input (does not control it); uncontained on cards or buttons; no container on colored surfaces; on a card center it vertically for 1 to 2 rows, top-right corner for 2 or more rows; brand primary color, red reserved for system warnings | Container off, color Primary |

## AI glasses inputs and navigation

Source: https://developer.android.com/design/ui/ai-glasses/guides/interaction/inputs
Source: https://developer.android.com/design/ui/ai-glasses/guides/interaction/navigation

System-handled: camera press (photo) and hold (video); 2-finger swipe (volume); touch and hold or wake word (Gemini); swipe down on display glasses (system back). App-accessible: single-finger swipe, microphone, POV camera, IMU, camera double-press.

| Input | Audio glasses | Display glasses |
|---|---|---|
| Touchpad tap | Play, pause, confirm | Play, pause, confirm |
| Touchpad swipe | Next, previous, dismiss | UI navigation |
| Swipe down | None | Back |
| Touch and hold | Invoke AI | Invoke AI |
| 2-finger swipe | Volume | Volume |
| Display button press | None | Wake or sleep |
| Camera button press / hold / double press | Photo or video end / video start / camera | Same |

- Inputs are 1-dimensional, one at a time: quick, discreet gestures; no precise or complex gestures.
- Recognition over recall on display glasses: show UI for actions instead of relying on memorized gestures.
- Always offer an immediate exit. Give instant feedback: earcons and audio on audio glasses (audible, distinct, right after the gesture); visual feedback on display glasses.
- Prevent errors: remove memory burden, tolerate slips, support undo, warn before important actions; initial focus on the low-cost action (accept call, not decline).
- Navigation stays shallow. Swipe moves laterally through content (media on audio glasses, UI on display glasses). Back goes up the stack, then to Home; on displayless glasses back is system-handled.
- Ending: end immediately on swipe back for continuous streams (calls, translation, Gemini); for long or destructive activities confirm with a second swipe ("End hike? Go back again to confirm." then a spoken summary, then exit). Apps play no generic exit earcon. On display glasses provide a visible exit button.

## AI glasses audio focus and AI patterns

Source: https://developer.android.com/design/ui/ai-glasses/guides/interaction/audio-input
Source: https://developer.android.com/design/ui/ai-glasses/guides/sound/audio-input
Source: https://developer.android.com/design/ui/ai-glasses/guides/interaction/ai-patterns
Source: https://developer.android.com/design/ui/ai-glasses/guides/surfaces/ai-in-your-app

Audio focus equals input focus on glasses; one app holds it at a time.

| Content | Behavior when interrupted |
|---|---|
| Music, ambient audio | Ducks and keeps playing |
| Spoken content (audiobooks) | Pauses and rewinds so nothing is missed |
| Calls, live translation, agent readouts | Hold exclusive (persistent) focus; others pause |
| Short updates (navigation, activity tracking) | Transient focus; others duck briefly |
| System overrides (calls, spoken notifications, privacy indicators, critical hardware alerts) | Always override |

- Earcons confirming the user's own action mix over other audio (clean attack, tight duration, distinct timbre); informational earcons duck others briefly (give them a clear start before the dip completes).
- Information readout: when an app is paused or quiet, a tap gives a status update so users needn't remember state.
- AI patterns: favor ongoing natural conversation over short handoffs; let users pause or stop by touch, gesture or speech (exit by swipe back on audio glasses, swipe down on display glasses); camera only when the user activates it (battery), never running continuously; on display glasses pair audio with glanceable visuals.
- Consent first: never record just because the app is open; use explicit triggers (a gesture) before sensors; the agent asks before turning on the camera; collect the minimum, process, discard. Agent tone: concise, unobtrusive, socially comfortable, safe. Gemini Live API or a custom agent can take multimodal input.

## AI glasses onboarding and permissions

Source: https://developer.android.com/design/ui/ai-glasses/guides/interaction/onboarding
Source: https://developer.android.com/design/ui/ai-glasses/guides/interaction/permissions

- Prefer contextual, just-in-time education and permissions when the user meets the feature (also fits returning users who pair glasses later). Use upfront onboarding only if glasses are core, used right away, or need a longer education flow; keep steps few.
- The companion app teaches pairing, basic use and Gemini; your app teaches only its own features.
- Mobile entry: if glasses are paired, prompt feature discovery, then education and permission priming, then hand off to glasses. Installs from a glasses intent deep-link into the glasses flow.
- Glasses entry (first run): permission priming on glasses, hand off to the phone to grant, then educate; if the app needs Gemini and it isn't installed, prompt install on the phone. Welcome first-time users with an audio cue.
- Never run complex flows (registration) on glasses; hand off to the phone.
- Education covers special invocations, unique gestures, and why camera or mic are used; later features get coachmarks or tooltips.
- Recovery: alert on unpairing; deep link to settings for missing or denied permissions; link help.
- Permissions always open on the phone: prime first (why, and impact), and let users change them later.

## AI glasses sound design

Source: https://developer.android.com/design/ui/ai-glasses/guides/sound/overview
Source: https://developer.android.com/design/ui/ai-glasses/guides/sound/earcons
Source: https://developer.android.com/design/ui/ai-glasses/guides/sound/bespoke-earcon
Source: https://developer.android.com/design/ui/ai-glasses/guides/sound/voice-alerts
Source: https://developer.android.com/design/ui/ai-glasses/guides/interaction/earcons

Context: speakers sit next to open (unsealed) ears, sounds repeat all day, and audio must blend with traffic and conversation.

Principles:
- Every sound does at least one job: communicate information, confirm intent, or ask for attention. Otherwise silence. Don't duplicate what other devices already do.
- Match emotional tone (uplifting for success, negative only for real problems, never alarming for routine status); build on real references (shutter for photo) over abstract sounds to memorize.
- Character over loudness: distinct timbre, pitch above ambient noise, clean attack and short gentle tail.
- Respect the moment: succinct notifications, yield to concurrent media, prominent signals only for high priority.
- Common cases: voice alert when regaining focus; clear feedback on exit; immediate mute earcon plus a voice confirmation of mic status.

System earcons:

| Sound | Behavior |
|---|---|
| Mic mute and unmute | System-controlled privacy chime |
| Critical low battery, thermal mitigation, device disconnected | 20% minimum volume floor, bypass Do Not Disturb, play even when disconnected from phone, suppress all other audio including calls |
| Camera and shutter | Non-mutable, 60% minimum volume floor, ignore DnD. Camera stream sequence: start warning, audible 3-second countdown (dismissable), stream-on sound, unified stream-off or dismiss sound |

App earcons:
- Generic (use the provided shared sounds): app open (or a spoken greeting for conversational apps), loading, app-level media mute and unmute, error or announcement. No exit earcons; use optional spoken wrap-ups ("Hike ended. You walked 2.8 miles.").
- Align glasses and phone earcons (share the mute sound). Skip earcons where frequent voice alerts already carry the experience (Maps). Never mimic system sounds; avoid earcons that need explaining.

Custom earcon specs:

| Parameter | Spec |
|---|---|
| Format | .ogg (Ogg Vorbis) |
| Bit depth and sample rate | 16-bit, 48 kHz (or 44.1 kHz) |
| Size | Under 1 MB uncompressed |
| Headroom | -3.0 to -6.0 dB true peak |
| Channels | Stereo, binaural or mono |
| High-pass | Gentle filter below 100 Hz |
| Target audibility band | 2 to 5 kHz (core melodic and transient energy) |
| High-shelf roll-off | Above 8 kHz (sharp near-ear transients fatigue) |

| Category | Duration |
|---|---|
| Micro-interactions | 15 to 60 ms |
| Confirmations | 80 to 220 ms |
| State alerts | 250 to 500 ms |
| Hero moments | 500 to 1000 ms |

- Earcons must be immediate and legible, acoustically polite, DSP-aware (clean sine or low-harmonic fundamentals survive onboard saturation). Use synthetic tones (sine, clean FM, bells) over organic samples that blend into ambient noise.
- Ascending pitch reads positive, descending reads final or negative; for critical states add rhythm (two quick rising chimes for success, staccato descending pulse for warning). Provide softened variants for frequent interactions (volume); suppress or reduce repeated triggers to a minimal click.

Voice alerts:
- Usually preceded by an earcon and follow audio focus. Use where an earcon can't explain (lost connection, translation closing). If the action happened on the phone (muting a call there), play the earcon only.
- Generic alerts use the standard system TTS voice (connection issues, education hints, focus resumed, welcome). Bespoke branded voices only for high-impact shifts (translation, meditation).
- Writing: non-technical, personal, addressed to "you", never "I" or "we"; start actions with active verbs ("Starting...", "Closing..."); frequent alerts favor brevity, rare ones clarity; say only what's needed to proceed; mention when something happens on the phone; errors explain why and how to fix, encourage retry, never playful. Error alerts must work offline (quality guideline).

## AI glasses quality and policies

Source: https://developer.android.com/docs/quality-guidelines/android-xr/augmented

| Tier | Meaning |
|---|---|
| Compatible | Unmodified phone app; the platform extends notifications (read aloud or minimal overlays) and Live Updates to glasses. Requires standard `NotificationManager` notifications and the Live Update framework for ongoing activities |
| Differentiated | Built with Jetpack Compose Glimmer (UI), Jetpack Projected (phone host to glasses bridge) and ARCore for Jetpack XR (device tracking, Geospatial API) |

Differentiated checklist:
- Launchable and controllable from the phone (setup, dense info) before handing off.
- Zero-launch state for "Open [App]" via Gemini: skip menus and go straight into a ready audio state or cue.
- Camera from phone entry plays a countdown before streaming; minimal frame rate and resolution for the use case; minimize high-drain sensors; follow background task limits.
- User-initiated actions only; minimize distraction during movement and in public.
- Request glasses permissions with the projected permissions API (redirects to the phone).
- Voice fallback for touchpad gestures; test across lighting and busy environments with the Android XR emulator and composable previews.
- Request and release audio focus correctly; voice alerts concise and actionable.

Gesture policies (audio-only experiences; input works whenever the app has audio focus):

| Gesture | Allowed | Prohibited |
|---|---|---|
| Tap | Relevant prompt (permission prompt, contextual info, repeat last message), stop current playback, mute or unmute mic with audio feedback | Ads or irrelevant info; continuous game input; harmful instructions |
| Camera double press | Start camera stream to the app (photo, video, ambient processing) | Remapping to non-camera functions; registering without using the feed; using it without prior disclosure in the phone setup flow |
| Single-finger back swipe | Must call `onBack()` to exit or go to the previous state | Custom actions, media launches, ads; fake exits that keep sensors running |

Also prohibited: social live streaming or public broadcasting from wearable cameras (video calls and scene understanding are allowed), facial identification of bystanders, NCII, persistent background recording, bystander voice identification, disabling system audio denoisers, and altering, dimming or hiding the LEDs or bypassing their tamper detection.
