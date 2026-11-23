# Android & Material 3: Google I/O and Android Dev Summit design sessions (2019 to 2026)

Distilled from the official session catalogs on io.google, the Android Developers, Material Design and Google Design YouTube channels, m3.material.io and developer.android.com (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

Every session was checked on 2026-11-19 against the io.google catalog (2024 to 2026 explore pages, which carry the video ID) or the official YouTube page (title, channel, publish date). Channels: Android Developers, Material Design, Google Design, Google for Developers, Android. Summaries paraphrase the official description; where io.google and YouTube titles differ, both are given.

Start with 2025 and 2026 (M3 Expressive, Compose-first, adaptive everywhere), then "Key takeaways", then the "API map". The 2019 to 2023 sessions still teach the foundations (theming, dark theme, edge-to-edge, canonical layouts, dynamic color).

## Contents

1. [2026: I/O 2026, I/O Connect, Android Dev Summit 2026](#2026)
2. [2025: I/O 2025 and The Android Show](#2025)
3. [2024: I/O 2024](#2024)
4. [2023: I/O 2023](#2023)
5. [2022: I/O 2022 and Android Dev Summit 2022](#2022)
6. [2021: I/O 2021 and Android Dev Summit 2021](#2021)
7. [2019 and 2020](#2019-and-2020)
8. [Key takeaways by topic](#key-takeaways-by-topic)
9. [M3 Expressive research claims (cited)](#m3-expressive-research-claims-cited)
10. [API map: design concept to Jetpack Compose API](#api-map-design-concept-to-jetpack-compose-api)
11. [Not included / could not verify](#not-included--could-not-verify)

---

## 2026

I/O 2026 (May 19 to 22) design themes: Material goes Compose-first, the Expressive layout system, expressive lists, menus and search, the experimental Styles API, Android 17 "Adaptive Everywhere", and widgets spanning phone, car and watch. Android Dev Summit 2026 (Oct 28 to 30) followed with Compose 1.13, graphics, input and Wear widgets.

### Google I/O 2026

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [Build beautiful, premium, adaptive apps with Material](https://www.youtube.com/watch?v=zRBi6oBtpoo) ([io](https://io.google/2026/explore/technical-session-30)) | I/O 2026 | New Expressive component updates, upcoming customizability (Styles) and adaptive Material; links the Figma kit and migration guide. |
| [Make Material your own](https://www.youtube.com/watch?v=HbAFGivZ158) ([io](https://io.google/2026/explore/technical-session-13)) | I/O 2026 | Building a premium, branded design language on top of Material's usability foundation. |
| [Build custom design systems with Jetpack Compose's new Styles API](https://www.youtube.com/watch?v=e-wlF3cmJms) ([io](https://io.google/2026/explore/technical-session-43)) | I/O 2026 | Theme-level property overrides, state-based styles, style animations and a size-adaptive theme; how Material will adopt Styles. |
| [Adaptive development for the expanding Android ecosystem](https://www.youtube.com/watch?v=thfNTC9x_Ys) ([io](https://io.google/2026/explore/technical-session-45)) | I/O 2026 | Android 17 "Adaptive Everywhere": Compose as the engine for foldables, desktop, cars, TV and XR. |
| [Build adaptive layouts with Navigation 3](https://www.youtube.com/watch?v=j0k8qizH0KY) ([io](https://io.google/2026/explore/technical-session-29)) | I/O 2026 | Navigation 3 1.1: state-driven back stack and the scene decorator API for multi-pane layouts at every window size. |
| [Make your UI adaptive with Android Studio's AI agent](https://www.youtube.com/watch?v=vCHU6eUFxdk) ([io](https://io.google/2026/explore/technical-session-41)) | I/O 2026 | Agent-driven migration to Navigation 3, an experimental device capability API, and FlexBox and Grid layouts. |
| [Design and build desktop-class Android experiences](https://www.youtube.com/watch?v=V8WPpDx8PWg) ([io](https://io.google/2026/explore/technical-session-11)) | I/O 2026 | Quality and design guidelines for connected displays, Chromebooks and desktop setups: layouts, input, window management. |
| [Build a modern note-taking app on Android](https://www.youtube.com/watch?v=ZyFb2geQ-GQ) ([io](https://io.google/2026/explore/technical-session-10)) | I/O 2026 | Ink API and Brush Designer for low-latency drawing, Notes Role, desktop windowing and multi-instance. |
| [Build adaptive widgets for cars, phones, watches, and more](https://www.youtube.com/watch?v=VnjgKzAa0ws) ([io](https://io.google/2026/explore/technical-session-7)) | I/O 2026 | Mobile widgets on Android Auto with little extra code; Wear widgets with Jetpack Glance and Remote Compose. |
| [The latest in Android XR](https://www.youtube.com/watch?v=1KOO2lqsdaA) ([io](https://io.google/2026/explore/technical-session-20)) | I/O 2026 | Android XR SDK, beta Jetpack XR libraries, AI glasses, XR emulator; links XR design guidelines. |
| [Extend your mobile app for AI glasses](https://www.youtube.com/watch?v=83CF7AhozJ8) ([io](https://io.google/2026/explore/technical-session-8)) | I/O 2026 | Designing app logic for glasses with and without displays; what is new in Jetpack Compose Glimmer. |
| [Android accessibility updates](https://www.youtube.com/watch?v=EDqgZS8q2rA) ([io](https://io.google/2026/explore/technical-session-5)) | I/O 2026 | TalkBack and Voice Access updates, expanded dark theme, Android 17 accessibility API changes. |
| [What's new in Android](https://www.youtube.com/watch?v=8PxuWdjESfg) ([io](https://io.google/2026/explore/pa-keynote-5)) | I/O 2026 | Android 17 overview: Compose UI breakthroughs, desktop and large-screen features, form factors. |
| [What's new in Jetpack Compose](https://www.youtube.com/watch?v=07Rrbj4hLmA) | I/O 2026 follow-up video (Jun 2026) | The "Compose First" approach, XML to Compose conversion, Compose 1.10 and 1.11 features. |
| [Make your app adaptive for Android 17](https://www.youtube.com/watch?v=J64Lc6F7lXk) | I/O 2026 playlist | Foldable postures, desktop multitasking and new Compose components for fluid layouts; "Adaptive ready" quality. |
| [Build adaptive apps with Compose's new APIs (I/O Connect '26)](https://www.youtube.com/watch?v=RyO2H1VbqdM) | I/O Connect 2026 | MediaQuery, FlexBox and Grid APIs, list-detail and supporting pane with the new layouts. |
| [Build for the wrist, the road, and the remote with Jetpack Compose and Gemini (I/O Connect '26)](https://www.youtube.com/watch?v=ZtVQGkUKNAk) | I/O Connect 2026 | Wear OS 7, TV, Auto and Automotive OS with Compose adaptive, Nav3 and ambient support. |

### Android Dev Summit 2026

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [Scale your app for every screen with Compose](https://www.youtube.com/watch?v=SGTkTKX7qq4) | ADS 2026 | Architecting for resizable windows and diverse aspect ratios with Compose, Navigation 3 and WindowManager. |
| [Graphics features in Jetpack Compose that can elevate your app](https://www.youtube.com/watch?v=TirZPDPV8Dw) | ADS 2026 | Mesh gradients, progressive blur and other new graphics effects, with performance guidance. |
| [Scaling input interactions beyond the touchscreen with Jetpack Compose](https://www.youtube.com/watch?v=iztM_PgoCjw) | ADS 2026 | Compose's layered input system, from trackpad gestures to novel hardware input. |
| [Powering interactive surfaces with Remote Compose](https://www.youtube.com/watch?v=csh2Opo_wjE) | ADS 2026 | Serialized Compose layouts projected to remote surfaces such as widgets, reflowing across form factors. |
| [Evolving Tiles to Wear Widgets using Jetpack Glance and Remote Compose](https://www.youtube.com/watch?v=5--1viVciq4) | ADS 2026 | From full-screen Tiles to partial-height Wear Widgets; UX guidance and migration. |
| [Building reliable text editing experiences in Compose](https://www.youtube.com/watch?v=1DvjkRYGs2g) | ADS 2026 | Why BasicTextField was rewritten around TextFieldState; formatted editing. |
| [XR is for everyone: Designing accessible spatial experiences](https://www.youtube.com/watch?v=FCuqj4bwvB4) | ADS 2026 | Motor, visual, auditory and cognitive accessibility principles for XR apps and games. |

## 2025

The Android Show: I/O Edition (May 13, 2025) launched Material 3 Expressive and Android 16's new look; I/O 2025 (May 20 to 21) carried the developer sessions. Google stated M3 Expressive is an evolution of M3, not a new version ("this isn't M4").

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [Build next-level UX with Material 3 Expressive](https://www.youtube.com/watch?v=6IsFP3gD28E) ([io](https://io.google/2025/explore/technical-session-24)) | I/O 2025 | The research behind M3 Expressive, the new emotional design guidelines, design files and alpha Compose code. |
| [Introducing: Material 3 Expressive](https://www.youtube.com/watch?v=n17dnMChX14) | Google Design, May 13, 2025 | Short intro: vibrant color, intuitive motion, adaptive components, flexible type, contrasting shapes. |
| [The Android Show: I/O Edition, Expressive Design](https://www.youtube.com/watch?v=4SErIMflSLQ) | The Android Show: I/O Edition 2025 | Android 16's expressive look from home screen to notifications, animations and haptics, on phone and wrist. |
| [Adaptive Android development makes your app shine across devices](https://www.youtube.com/watch?v=15oPNK1W0Tw) ([io](https://io.google/2025/explore/pa-keynote-8)) | I/O 2025 | Android 16 large-screen changes, WindowManager updates, material3-adaptive 1.1, Studio tooling. |
| [What's new in Jetpack Compose](https://www.youtube.com/watch?v=89UusPuz8q4) | I/O 2025 | New Compose features and performance, Autofill, and the redesigned Navigation 3 library. |
| [Android notifications and Live Updates](https://www.youtube.com/watch?v=ihR8hL_Hmec) ([io](https://io.google/2025/explore/technical-session-53)) | I/O 2025 | Android 16 Live Updates: progress-centric templates for rideshare, delivery and navigation journeys. |
| [Build more accessible UIs with Jetpack Compose](https://www.youtube.com/watch?v=80qkStdDWXQ) ([io](https://io.google/2025/explore/technical-session-9)) | I/O 2025 | Semantics, traversal order, merging and clearing, inspection and Compose accessibility checks. |
| [Android accessibility updates](https://www.youtube.com/watch?v=fKY6qYxytLI) ([io](https://io.google/2025/explore/technical-session-8)) | I/O 2025 | TalkBack and Live Captions updates and Android 16 accessibility API changes. |
| [Mastering text input in Compose](https://www.youtube.com/watch?v=07Y9CPuxgvQ) ([io](https://io.google/2025/explore/technical-session-16)) | I/O 2025 | State-based TextField, Autofill, AutoSize text, input and output transformations. |
| [Unlock user productivity with desktop windowing and stylus support](https://www.youtube.com/watch?v=MmeJSLAnB-M) ([io](https://io.google/2025/explore/technical-session-21)) | I/O 2025 | Designing for desktop windowing (multiple tasks) and stylus input with the Ink API. |
| [The future is now, with Compose and AI on Android XR](https://www.youtube.com/watch?v=YYMt7Ddzz6Y) ([io](https://io.google/2025/explore/technical-session-2)) | I/O 2025 | Jetpack Compose for XR; reusing large-screen work to reach Android XR. |
| [Building differentiated apps for Android XR with 3D content](https://www.youtube.com/watch?v=KbTJNK1ALYc) ([io](https://io.google/2025/explore/technical-session-22)) | I/O 2025 | Jetpack SceneCore and ARCore for Jetpack XR: 3D models, stereoscopic video, hand tracking. |
| [What's new in Android](https://www.youtube.com/watch?v=IaNpcrCSDiI) ([io](https://io.google/2025/explore/pa-keynote-7)) | I/O 2025 | Android 16 and building high-quality apps for all form factors. |
| [Bring your most expressive apps to the wrist: Wear OS 6 and the new Pixel Watch 4](https://www.youtube.com/watch?v=plON4SsFXGo) | The Android Show, Sep 2025 | Material 3 Expressive on Wear OS 6 with Compose, new UI capabilities, Watch Face Push API. |
| [WearOS Material 3 shape morphing](https://www.youtube.com/watch?v=qEEo6AwgBjU) | Compose Tips, Jul 2025 | Round buttons, ButtonGroup and TransformingLazyColumn in Compose Material 3 for Wear OS. |

The 2025 learning pathway [Improve the user experience of your Android app](https://io.google/2025/explore/learning-pathway-3) reuses the 2024 edge-to-edge, predictive back and Glance video.

## 2024

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [The latest in Material Design](https://www.youtube.com/watch?v=XQ_Hvu-s7JY) (io.google title: [Faster, more expressive design with Material for Compose](https://io.google/2024/explore/efabefda-bc65-492b-acd6-48c7fade31e4/)) | I/O 2024 | Color and typography updates for personalized, accessible products; a fuller Compose offering; Google Maps case study. |
| [Building UI with the Material 3 adaptive library](https://www.youtube.com/watch?v=xPUZENis4gc) | I/O 2024 | List-detail and supporting-pane composables, navigation that swaps by window size class, building blocks for custom panes. |
| [Designing adaptive apps](https://www.youtube.com/watch?v=G-76xfNlMxc) | I/O 2024 | Using panes across window classes for phones, foldables and tablets; adaptive components. |
| [Building adaptive Android apps](https://www.youtube.com/watch?v=wBc6oMVAP60) | I/O 2024 | Dropping the portrait-only, compact-window mindset to avoid tech debt and serve all devices. |
| [Build beautiful Android widgets with Jetpack Glance](https://www.youtube.com/watch?v=jI1LKN7jBVk) | I/O 2024 | Glance 1.1 updates, high-quality widget guidelines and use cases. |
| [3 things to improve your Android app experience: Edge to Edge, Predictive Back, and Glance](https://www.youtube.com/watch?v=RimGfoOU67s) (io.google title: [Improve the user experience of your Android app](https://io.google/2024/explore/3d552a80-acee-4243-8995-c491272800a1/)) | I/O 2024 learning pathway | Codelab-driven walkthrough of edge-to-edge, predictive back and a Glance widget on the SociaLite sample. |
| [Increase user productivity with large screens & accessories](https://www.youtube.com/watch?v=ygPlp5IEldo) | I/O 2024 | Using large-screen space and supporting stylus, keyboard, touchpad and mouse. |
| [Building for the future of Wear OS](https://www.youtube.com/watch?v=6K5cITvVcoM) | I/O 2024 | Wear OS 5, Watch Face Format advances, designing for a growing range of watch sizes. |
| [Updates to Android accessibility features and API](https://www.youtube.com/watch?v=qLCK0HO_tNQ) | I/O 2024 | Latest accessibility features and in-app accessibility best practices. |
| [What's new in Android](https://www.youtube.com/watch?v=_yWxUp86TGg) | I/O 2024 | Android 15 (edge-to-edge enforced for target SDK 35), form factors, Compose. |

## 2023

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [Material You for large screens guidance](https://www.youtube.com/watch?v=wP-xAPIyqLY) | I/O 2023 (Material Design) | Material across tablets, foldables and phones; new large-screen guidance and previews. |
| [Making beautiful products more accessible with Material research](https://www.youtube.com/watch?v=k-nG86tp8oQ) | I/O 2023 (Material Design) | How accessible design enables more expressive, opinionated products; Material's research process. |
| [Optimize activity-based apps for large screens](https://www.youtube.com/watch?v=zx20-3GSdHw) | I/O 2023 | Activity embedding with Jetpack WindowManager for multi-activity apps, no refactor. |

## 2022

### Google I/O 2022

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [Designing apps for large screens](https://www.youtube.com/watch?v=pvdqeIM6mh0) | I/O 2022 | Strategies for adapting mobile apps to tablets and foldables; links M3 adaptive guidelines. |
| [Implementing Android apps for all screen sizes](https://www.youtube.com/watch?v=MPwf5DklKp0) | I/O 2022 | Compose, navigation, state and testing practices for every screen format. |
| [Basics for System Back](https://www.youtube.com/watch?v=Elpqr5xpLxQ) | I/O 2022 | Android 13's new back handling that lays the base for predictive back animations. |
| [Create expressive and readable typography with variable fonts](https://www.youtube.com/watch?v=bNiPLUjh6LQ) | I/O 2022 (Material Design) | Variable fonts for type and icons, launch of Material Symbols. |
| [Design accessibility for individuals with Material Design](https://www.youtube.com/watch?v=b6FTDYrJWRA) | I/O 2022 (Material Design) | Research-backed contrast, component behavior and handoff guidance that builds on WCAG. |
| [Create beautiful, power-efficient apps for Wear OS](https://www.youtube.com/watch?v=jpUVamtoKOs) | I/O 2022 | Compose for Wear OS (beta) and Health Services. |
| [Input for all screens](https://www.youtube.com/watch?v=XtImpP23uhE) | I/O 2022 | Keyboard, mouse and stylus best practices for large screens. |

### Android Dev Summit 2022

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [Material You in Compose apps](https://www.youtube.com/watch?v=xS4GpdIQUEo) | ADS 2022 | Compose Material 3 goes stable: theming, components, dynamic color, migrating from M2. |
| [Designing a high quality app with the latest Android features](https://www.youtube.com/watch?v=922ADxreYDY) | ADS 2022 | Three platform features for polish: edge-to-edge layouts, predictive navigation, accessible color. |
| [Insets: Compose edition](https://www.youtube.com/watch?v=mlL6H-s0nF0) | ADS 2022 | How insets describe system bars, IME and taskbar, and Compose APIs that move content with them. |
| [Canonical layouts and visual hierarchy: Designing for larger screens](https://www.youtube.com/watch?v=FrkIa9vZjCI) | ADS 2022 | Choosing and extending canonical layouts from a design perspective. |
| [Compose: Implementing responsive UI for larger screens](https://www.youtube.com/watch?v=fQjDtCtri4s) | ADS 2022 | Adaptive layouts for every screen size with Compose. |
| [Navigation Compose on every screen size](https://www.youtube.com/watch?v=LTLQhC6VadI) | ADS 2022 | One navigation system that scales from phone to ChromeOS with canonical layouts. |
| [Building modern Android app widgets](https://www.youtube.com/watch?v=b-P5dFyGiKs) | ADS 2022 | Modernizing app widgets; Glance. |
| [Building accessibility support for Compose](https://www.youtube.com/watch?v=Sf1z_gRplDc) | ADS 2022 | How TalkBack and Switch Access read Compose UI state. |
| [Styling text in Compose](https://www.youtube.com/watch?v=_qls2CEAbxI) | ADS 2022 | Material typography in Compose, downloadable and variable fonts. |

## 2021

Material You was announced at I/O 2021 (May 18 to 20) with Android 12; the Compose Material 3 library (`androidx.compose.material3`) debuted at ADS 2021.

### Google I/O 2021

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [What's new in Material Design (Keynote)](https://www.youtube.com/watch?v=rLKtIGY2Mgc) | I/O 2021 | Material You: personal, dynamic experiences with Material Design. |
| [Build beautiful Material Design apps with Jetpack Compose](https://www.youtube.com/watch?v=zEeMu_odTa8) | I/O 2021 | Material theming, components and dark theme in Compose. |
| [5 things you can do to prepare your app for large screens](https://www.youtube.com/watch?v=UNDZn9GKJGo) | I/O 2021 | Prioritized large-screen fixes when time is short. |
| [What's new in foldables, tablets, and large screens](https://www.youtube.com/watch?v=Qkiz3QIPJzk) | I/O 2021 | New components and toolkits for large screens, including NavigationRail. |
| [Designing A11y with Material Design](https://www.youtube.com/watch?v=nTNwZXVRGdY) | I/O 2021 | How Material builds accessibility into the design system. |
| [Designing for accessibility in Android Studio and Jetpack Compose](https://www.youtube.com/watch?v=PNjFhYtdpdQ) | I/O 2021 | Automated accessibility checks in Studio; Compose accessibility support. |
| [Refreshing widgets](https://www.youtube.com/watch?v=cHv84zXZf6E) | I/O 2021 | Android 12 widget redesign: useful, discoverable, beautiful widgets. |
| [Now is the time: What's new with Wear](https://www.youtube.com/watch?v=kYIb9g1r4lw) | I/O 2021 | The unified Wear platform and new APIs and tools. |

### Android Dev Summit 2021

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [Implementing Material You using Jetpack Compose](https://www.youtube.com/watch?v=jrfuHyMlehc) | ADS 2021 | `androidx.compose.material3`: theming, components, dynamic color, system UI, Views interop. |
| [Material You: Applying dynamic color to your app and brand](https://www.youtube.com/watch?v=4bguZJwHqsQ) | ADS 2021 | How dynamic color meets brand color; Material Theme Builder. |
| [Design beautiful apps on foldables and large screens](https://www.youtube.com/watch?v=DJeJIJKOUbI) | ADS 2021 | New Material large-screen guidance, canonical layouts, foldables, responsive structure. |
| [Build Android UIs for any screen size](https://www.youtube.com/watch?v=ir3LztqbeRI) | ADS 2021 | Introduces window size classes, Views and Compose approaches, Studio tooling. |
| [How to build Modern Android App Widgets in Android 12](https://www.youtube.com/watch?v=15Q7xqxBGG0) | ADS 2021 | Android 12 widget APIs with the Material You theme, Compose-based tooling. |
| [Reimagine animations system for a delightful development experience with Jetpack Compose](https://www.youtube.com/watch?v=Z_T1bVjhMLk) | ADS 2021 | High-level and low-level Compose animation APIs and animation preview. |
| [From mobile to Wear OS: Learn how to create a Compose app for the wrist](https://www.youtube.com/watch?v=B7D3G6tC9n0) | ADS 2021 | Compose for Wear OS developer preview: what carries over from mobile. |

## 2019 and 2020

### Google I/O 2019

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [Material Theming: Build Expressively with Material Components](https://www.youtube.com/watch?v=IaT4wdWTwuo) | I/O 2019 (Google Design) | Customizing Material's style (color, type, shape) to express a brand with Material Components. |
| [How to Design a Dark Theme Using Material](https://www.youtube.com/watch?v=9NDLR3COU7Y) | I/O 2019 (Google Design) | Best practices for deriving a dark theme from an existing Material app. |
| [Dark theme & gesture navigation](https://www.youtube.com/watch?v=OCHEjeLC_UY) | I/O 2019 | Android Q dark theme and gesture navigation; working with system UI. |
| [Motional intelligence: Build smarter animations](https://www.youtube.com/watch?v=f3Lm8iOr4mE) | I/O 2019 | Interruptible, retargetable animations structured like state machines. |
| [Build apps for foldable, multi-display, and large-screen devices](https://www.youtube.com/watch?v=8uQEzv3upy8) | I/O 2019 | First foldable and multi-display guidance on Android. |

### Android Dev Summit 2019

| Session | Year/event | What it teaches (one line) |
|---|---|---|
| [Going edge-to-edge with Gesture Navigation](https://www.youtube.com/watch?v=moYIjqFMi0o) | ADS 2019 | Drawing behind system bars and resolving gesture conflicts with Android 10 navigation. |
| [Developing themes with style](https://www.youtube.com/watch?v=Owkf8DhAOSo) | ADS 2019 | Themes vs styles, isolating theme-dependent resources, Material theming and dark theme in Views. |

### 2020

Google I/O 2020 did not take place, and no 2020 design session could be verified for this catalog.

---

## Key takeaways by topic

Each bullet paraphrases the cited session description or the official post it links. "(inference)" marks a conclusion drawn from several sources.

### Material You and Material 3 foundations (2021 to 2023)

- Material You (I/O 2021, [What's new in Material Design](https://www.youtube.com/watch?v=rLKtIGY2Mgc)) shifted Material toward personal, dynamic interfaces; Android 12 widgets and system UI adopted it the same year ([Refreshing widgets](https://www.youtube.com/watch?v=cHv84zXZf6E)).
- Dynamic color derives the scheme from the user's wallpaper on Android 12+; brand color still has a place, and Material Theme Builder previews how both interact ([Applying dynamic color to your app and brand](https://www.youtube.com/watch?v=4bguZJwHqsQ)).
- Implement M3 in Compose with `androidx.compose.material3`: theme (color, type, shape), components, dynamic color and edge-to-edge system UI ([Implementing Material You using Jetpack Compose](https://www.youtube.com/watch?v=jrfuHyMlehc)).
- Compose Material 3 went stable at ADS 2022; migrate from M2 component by component ([Material You in Compose apps](https://www.youtube.com/watch?v=xS4GpdIQUEo)).
- Theming predates M3: define themes for attributes that change with context (light or dark) and styles for per-view appearance, so Material theming and dark theme stay maintainable ([Developing themes with style](https://www.youtube.com/watch?v=Owkf8DhAOSo), [How to Design a Dark Theme Using Material](https://www.youtube.com/watch?v=9NDLR3COU7Y)).

### M3 Expressive (2025 onward)

- M3 Expressive is an evolution of M3: opt-in features, updated components and design tactics for emotionally impactful UX. M3 is not deprecated and there is no "M4" ([Build next-level UX with Material 3 Expressive](https://www.youtube.com/watch?v=6IsFP3gD28E); [m3.material.io blog](https://m3.material.io/blog/building-with-m3-expressive)).
- 14 new or updated components: app bars, button groups (new), common buttons, extended FAB, FAB menu (new), FABs, icon buttons, loading indicator (new), navigation bar, navigation rail, progress indicators, sliders, split button (new), toolbars (new) (same blog post).
- Styles added: a spring-based motion-physics system (spatial springs for position, size and shape; effects springs for color and opacity), emphasized type styles, a 35-shape library with built-in shape morphing, and more vibrant color schemes (same blog post).
- Seven expressive tactics: vary shapes, apply rich color roles, guide attention with emphasized type, contain content for emphasis, add fluid motion, flex components to context, and combine tactics into one or two hero moments per product (same blog post).
- Limit hero moments: too many become distracting. Ask whether the interaction is emotionally impactful and whether it is a key interaction before investing in one (same blog post).
- On Android 16 the system UI itself (home screen, notifications, animations, haptics) took on the expressive look on phone and watch ([The Android Show: Expressive Design](https://www.youtube.com/watch?v=4SErIMflSLQ)).
- Motion springs adapt to device size because they are specified by damping and stiffness rather than time, and they retarget smoothly when interrupted; this echoes the 2019 advice to build interruptible, retargetable animations ([Motional intelligence](https://www.youtube.com/watch?v=f3Lm8iOr4mE); [M3 Expressive motion theming](https://m3.material.io/blog/m3-expressive-motion-theming)).
- Status in Nov 2026: Compose Material 3 1.5.0 is stable and graduates the M3 Expressive components (split buttons, button groups, shape-morphing toggle buttons and chips, floating toolbars, wavy progress indicators, nested menus, segmented list items) plus expressive color, shape and motion; Compose Material 2 is deprecated ([Compose Material 3 1.5.0 is stable](https://m3.material.io/blog/compose-material-3-is-stable)).

### Material 2026: Compose-first, layout, Styles

- Material Android is Compose-first: Material Views 1.14.0 brought M3 Expressive to Views (expressive themes, expressive list, emphasized type scale, expressive styles for 11 components) and is the final stable Views release; Views is now in maintenance mode ([Build beautiful, premium, adaptive apps with Material](https://www.youtube.com/watch?v=zRBi6oBtpoo); [Material is Compose-first](https://m3.material.io/blog/material-is-compose-first)).
- I/O 2026 introduced the Expressive layout system: a new layout scaffold for mobile, desktop and spatial devices, an 8dp-based spacing system built into components, plus watch and XR principles ([What's new at I/O 2026](https://m3.material.io/blog/whats-new-at-io26)).
- The Styles API replaces styling parameters (padding, colors) with a single Style that can be overridden at theme level, react to state (pressed, focused, checked) and animate between states; it runs in layout and draw phases and skips composition ([Build custom design systems with the Styles API](https://www.youtube.com/watch?v=e-wlF3cmJms)). As of Compose 1.13 (Nov 2026) Styles remains experimental and is being reworked into an unopinionated styling engine ([Compose November '26 release](https://developer.android.com/blog/posts/jetpack-compose-november-2026-release)).
- The Material adaptive library integrates with Navigation 3, which reads screen metadata to decide pane placement ([Material is Compose-first](https://m3.material.io/blog/material-is-compose-first); [Build adaptive layouts with Navigation 3](https://www.youtube.com/watch?v=j0k8qizH0KY)).

### Adaptive layouts, large screens, foldables, desktop

- Stop designing portrait-only for compact windows; the same habits create tech debt on foldables and tablets ([Building adaptive Android apps](https://www.youtube.com/watch?v=wBc6oMVAP60)).
- Decide layout by window size class, not device type. Width classes: compact < 600dp, medium 600 to 839dp, expanded 840 to 1199dp, large 1200 to 1599dp, extra-large ≥ 1600dp; height classes split at 480dp and 900dp ([window size classes doc](https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes); concept introduced in [Build Android UIs for any screen size](https://www.youtube.com/watch?v=ir3LztqbeRI)).
- Start from canonical layouts (list-detail, supporting pane, feed) and adapt them to your product's hierarchy ([Canonical layouts and visual hierarchy](https://www.youtube.com/watch?v=FrkIa9vZjCI); [Design beautiful apps on foldables and large screens](https://www.youtube.com/watch?v=DJeJIJKOUbI)).
- Android 16 ignores orientation, resizability and aspect-ratio restrictions on displays with smallest width ≥ 600dp for apps targeting API 36; plan for any window shape ([Adaptive Android development](https://www.youtube.com/watch?v=15oPNK1W0Tw); [Android 16 behavior changes](https://developer.android.com/about/versions/16/behavior-changes-16)).
- Android 17 frames this as "Adaptive Everywhere" across phones, foldables, desktop, cars, TV and XR ([Adaptive development for the expanding Android ecosystem](https://www.youtube.com/watch?v=thfNTC9x_Ys)).
- Support keyboard, mouse, touchpad and stylus on large screens and desktop ([Input for all screens](https://www.youtube.com/watch?v=XtImpP23uhE); [Increase user productivity](https://www.youtube.com/watch?v=ygPlp5IEldo); [Desktop windowing and stylus](https://www.youtube.com/watch?v=MmeJSLAnB-M); [Desktop-class Android experiences](https://www.youtube.com/watch?v=V8WPpDx8PWg)).
- New in 2026: FlexBox and Grid layouts and the MediaQuery API (window size, posture, pointer precision, keyboard type) for adaptive Compose UI ([Compose's new APIs, I/O Connect](https://www.youtube.com/watch?v=RyO2H1VbqdM)); FlexBox and Grid are stable in Compose 1.13 and FlexBox supersedes FlowRow and FlowColumn for new code ([Compose November '26 release](https://developer.android.com/blog/posts/jetpack-compose-november-2026-release)).

### Edge-to-edge, insets and system bars

- Draw behind the system bars and handle gesture-navigation conflicts; this guidance dates from Android 10 ([Going edge-to-edge with Gesture Navigation](https://www.youtube.com/watch?v=moYIjqFMi0o); [Dark theme & gesture navigation](https://www.youtube.com/watch?v=OCHEjeLC_UY)).
- Edge-to-edge is enforced for apps targeting Android 15 (API 35); on Android 16 with target API 36 the opt-out attribute `windowOptOutEdgeToEdgeEnforcement` is disabled ([Android 15](https://developer.android.com/about/versions/15/behavior-changes-15) and [Android 16](https://developer.android.com/about/versions/16/behavior-changes-16) behavior changes).
- Material 3 Compose components apply insets automatically, so most edge-to-edge work concerns custom containers and lists (Android 15 behavior changes page).

### Predictive back

- Android 13 introduced ahead-of-time back handling as the base for predictive back ([Basics for System Back](https://www.youtube.com/watch?v=Elpqr5xpLxQ)).
- For apps targeting API 36 on Android 16+, back-to-home, cross-task and cross-activity predictive animations are on by default; `onBackPressed` is not called and `KEYCODE_BACK` is not dispatched. Temporary opt-out: `android:enableOnBackInvokedCallback="false"` ([Android 16 behavior changes](https://developer.android.com/about/versions/16/behavior-changes-16)).
- In Compose, animate custom in-app back with `PredictiveBackHandler`; enable it only when you need to intercept (for example, a "discard changes?" confirmation while a form has input) ([predictive back guide](https://developer.android.com/guide/navigation/custom-back/predictive-back-gesture)).

### Widgets, Glance, Live Updates, glanceable surfaces

- 2026: one modern mobile widget can reach Android Auto with little extra code, and Wear widgets use Glance plus Remote Compose ([Build adaptive widgets for cars, phones, watches](https://www.youtube.com/watch?v=VnjgKzAa0ws)).
- Wear Tiles are evolving into partial-height Wear Widgets ([Evolving Tiles to Wear Widgets](https://www.youtube.com/watch?v=5--1viVciq4)); Remote Compose serializes layouts so remote surfaces can render and reflow them locally ([Powering interactive surfaces with Remote Compose](https://www.youtube.com/watch?v=csh2Opo_wjE)).
- Live Updates (Android 16) are promoted notifications for user-initiated, time-sensitive journeys such as rideshare, delivery and navigation; they show prominently and as a status bar chip ([Android notifications and Live Updates](https://www.youtube.com/watch?v=ihR8hL_Hmec)).
- A Live Update must use Standard, BigText, Call, Progress or Metric style, declare `POST_PROMOTED_NOTIFICATIONS`, request promotion (`setRequestPromotedOngoing`), be ongoing, have a title, and must not use custom RemoteViews, group summary, colorization or `IMPORTANCE_MIN` ([Live Update doc](https://developer.android.com/develop/ui/views/notifications/live-update)).

### Wear OS and Material 3

- Design for a widening range of watch sizes and use the Watch Face Format ([Building for the future of Wear OS](https://www.youtube.com/watch?v=6K5cITvVcoM)).
- Wear OS 6 brings Material 3 Expressive to the wrist through Compose Material 3 for Wear OS ([Wear OS 6 and Pixel Watch 4](https://www.youtube.com/watch?v=plON4SsFXGo)); shape morphing, round buttons, `ButtonGroup` and `TransformingLazyColumn` are the signature pieces ([WearOS Material 3 shape morphing](https://www.youtube.com/watch?v=qEEo6AwgBjU)).

### Android XR and AI glasses

- Existing large-screen work carries into Android XR; Compose for XR extends it ([The future is now, with Compose and AI on Android XR](https://www.youtube.com/watch?v=YYMt7Ddzz6Y)).
- Add differentiated immersive content with SceneCore and ARCore for Jetpack XR ([Building differentiated apps for Android XR with 3D content](https://www.youtube.com/watch?v=KbTJNK1ALYc)).
- AI glasses need logic for devices with and without displays; Jetpack Compose Glimmer is the UI toolkit for display glasses ([Extend your mobile app for AI glasses](https://www.youtube.com/watch?v=83CF7AhozJ8)).

### Accessibility

- Material bakes accessibility into the system and argues accessible design permits more expressive products ([Designing A11y with Material Design](https://www.youtube.com/watch?v=nTNwZXVRGdY); [Making beautiful products more accessible with Material research](https://www.youtube.com/watch?v=k-nG86tp8oQ)).
- In Compose, classify each composable, apply semantics, control traversal order, merge or clear semantics, and run Compose accessibility checks in tests ([Build more accessible UIs with Jetpack Compose](https://www.youtube.com/watch?v=80qkStdDWXQ)).
- Android 16 added enhanced dark themes, options for motion sensitivity and a new way to increase text contrast ([Android accessibility updates 2025](https://www.youtube.com/watch?v=fKY6qYxytLI); [Android Design at I/O 2025](https://android-developers.googleblog.com/2025/05/android-design-google-io-25.html)); Android 17 expands dark theme further ([Android accessibility updates 2026](https://www.youtube.com/watch?v=EDqgZS8q2rA)).
- M3 Expressive research found that removing text labels from actions lowered usability; keep labels on key actions (inference from the design.google research article cited below).

### Typography, variable fonts and icons

- Variable fonts pack many styles into one file and let you tune axes; Material Symbols applies the same idea to icons (fill, weight, grade, optical size) ([Create expressive and readable typography with variable fonts](https://www.youtube.com/watch?v=bNiPLUjh6LQ)).
- M3 Expressive adds emphasized type styles for hierarchy and key actions ([Build next-level UX with M3 Expressive](https://www.youtube.com/watch?v=6IsFP3gD28E)); Compose Material 3 1.5.0 lets you set a brand font across the whole type scale at once ([1.5.0 stable post](https://m3.material.io/blog/compose-material-3-is-stable)).
- Themed icons: launchers tint apps that ship a `monochrome` layer in their adaptive icon when the user enables themed icons ([adaptive icons doc](https://developer.android.com/develop/ui/views/launch/icon_design_adaptive)). No I/O session dedicated to themed icons could be verified.

### Motion and shared elements

- Build animations that can be interrupted and retargeted ([Motional intelligence](https://www.youtube.com/watch?v=f3Lm8iOr4mE)); Compose's animation system supports this natively ([Reimagine animations system](https://www.youtube.com/watch?v=Z_T1bVjhMLk)).
- Shared element transitions in Compose use `SharedTransitionLayout` with `Modifier.sharedElement` or `sharedBounds` ([shared elements guide](https://developer.android.com/develop/ui/compose/animation/shared-elements)); Compose 1.13 deprecates ConstraintLayout and MotionLayout for Compose in favor of these newer tools ([Compose November '26 release](https://developer.android.com/blog/posts/jetpack-compose-november-2026-release)).
- Compose 1.13 adds `PolygonShape` and `MorphPolygonShape` for shape morphing without the graphics-shapes dependency, plus progressive blur ([same post](https://developer.android.com/blog/posts/jetpack-compose-november-2026-release); [Graphics features in Jetpack Compose](https://www.youtube.com/watch?v=TirZPDPV8Dw)).

---

## M3 Expressive research claims (cited)

Google published these figures; quote them only with the source.

| Claim | Source |
|---|---|
| M3 Expressive is the most researched update to Material since its 2014 launch: 46 studies, more than 18,000 participants. | [Start building with Material 3 Expressive](https://m3.material.io/blog/building-with-m3-expressive) |
| Expressive designs are preferred by people of all ages. | Same post; [Expressive Design: Google's UX Research](https://design.google/library/expressive-material-design-google-research) |
| Preference was highest among 18 to 24 year olds, up to 87%. | design.google article |
| Expressive designs score higher on playfulness, energy, creativity and friendliness. | m3.material.io post; design.google article |
| Users are more likely to switch to products using M3 Expressive components and techniques. | m3.material.io post |
| Participants spotted key UI elements up to four times faster in expressive screens (eye tracking across 10 apps); in an email case study the Send button was found four times faster. | m3.material.io post; design.google article; [Usability](https://m3.material.io/foundations/usability) |
| Participants aged 45+ spotted key elements as fast as younger participants. | design.google article |
| Perceived modernity rose 34%, subculture perception 32%, rebelliousness 30%. | design.google article |
| Limits: breaking standard patterns (a playlist redesign) and removing text labels from email actions lowered usability; unfamiliarity reduced the gains. | design.google article |
| Methods: eye tracking, surveys, focus groups, experiments, usability testing. | design.google article |

---

## API map: design concept to Jetpack Compose API

Verified on developer.android.com reference pages and guides on 2026-11-19 unless noted. Status reflects Compose BOM 2026.11.01 (Compose 1.13, Material 3 1.5.0).

| Design concept | Compose API / library | Status and notes |
|---|---|---|
| M3 theme (color, type, shape) | `MaterialTheme` in `androidx.compose.material3` | Stable |
| Dynamic color (Android 12+) | `dynamicLightColorScheme(context)`, `dynamicDarkColorScheme(context)`; gate on `Build.VERSION_CODES.S` | Stable |
| M3 Expressive theme | `MaterialExpressiveTheme` | Defaults to the expressive motion scheme; expressive APIs graduated in M3 1.5.0 |
| Motion physics (springs) | `MotionScheme.expressive()`, `MotionScheme.standard()`, read via `MaterialTheme.motionScheme.defaultSpatialSpec()` / `defaultEffectsSpec()` (also fast and slow variants) | Spatial specs for position, size, shape; effects specs for color, opacity |
| Expressive components | `ButtonGroup`, `SplitButtonLayout`, `HorizontalFloatingToolbar` / `VerticalFloatingToolbar`, `LoadingIndicator`, `FlexibleBottomAppBar`, `ShortNavigationBar`, `WideNavigationRail` | Present in material3 package reference |
| Expressive shape library and morph | `MaterialShapes`; foundation `PolygonShape`, `MorphPolygonShape` (Compose 1.13) | Stable in 1.13 per release post |
| Opt-in marker for remaining expressive APIs | `@ExperimentalMaterial3ExpressiveApi` | Fewer APIs need it after 1.5.0 |
| Custom design system styling | `Style`, `StyleScope`, `StyleState` in `androidx.compose.foundation.style` | Experimental; reworked in 1.13, Material integration pending |
| Window size classes | `currentWindowAdaptiveInfo().windowSizeClass`; `WindowSizeClass.isWidthAtLeastBreakpoint(WIDTH_DP_MEDIUM_LOWER_BOUND)` and `WIDTH_DP_EXPANDED_LOWER_BOUND`, `WIDTH_DP_LARGE_LOWER_BOUND`; pass `supportLargeAndXLargeWidth = true` for large and extra-large | `androidx.window.core.layout` + `material3.adaptive` |
| Adaptive navigation (bar, rail, drawer by size) | `NavigationSuiteScaffold`, `NavigationSuiteType` (`material3.adaptive.navigationsuite`) | Stable |
| List-detail and supporting pane | `ListDetailPaneScaffold`, `SupportingPaneScaffold` (`material3.adaptive.layout`); `NavigableListDetailPaneScaffold`, `rememberListDetailPaneScaffoldNavigator` (`material3.adaptive.navigation`) | material3-adaptive 1.1 in 2025 |
| Navigation 3 with adaptive panes | `NavDisplay` (`androidx.navigation3.ui`), `rememberNavBackStack`; `rememberListDetailSceneStrategy`, `rememberSupportingPaneSceneStrategy` (`material3.adaptive.navigation3`) | Nav3 1.1 adds scene decorators |
| Responsive wrapping and 2D layouts | `FlexBox`, `Grid` (`androidx.compose.foundation.layout`) | Stable in Compose 1.13; FlexBox supersedes FlowRow/FlowColumn |
| Query window, posture, pointer, keyboard | `mediaQuery`, `derivedMediaQuery`, `UiMediaScope` (`androidx.compose.ui`) | Experimental |
| Edge-to-edge | `enableEdgeToEdge()` (`androidx.activity`); Compose `WindowInsets` and inset modifiers; M3 components apply insets | Enforced at target SDK 35; opt-out disabled at 36 |
| Predictive back | `PredictiveBackHandler`, `BackHandler` (`androidx.activity.compose`); Views: `OnBackPressedCallback`; manifest `android:enableOnBackInvokedCallback` | System animations default at target SDK 36 |
| Shared element transitions | `SharedTransitionLayout`, `Modifier.sharedElement`, `Modifier.sharedBounds`, `rememberSharedContentState` (`androidx.compose.animation`) | Stable; see the shared elements guide |
| Exit animation without retained state | `CapturedAnimatedVisibility` | New in Compose 1.13 |
| Home-screen widgets | Jetpack Glance: `GlanceAppWidget`, `GlanceAppWidgetReceiver` (`androidx.glance.appwidget`) | Stable |
| Wear Widgets, remote surfaces | Jetpack Glance + Remote Compose | Rolling out 2026; check current docs |
| Wear OS Material 3 Expressive | `androidx.wear.compose.material3`: `AppScaffold`, `ScreenScaffold`, `EdgeButton`, `TransformingLazyColumn`, `ButtonGroup` | Present in reference |
| Live Updates | `Notification.ProgressStyle` (or Standard, BigText, Call, Metric), `NotificationCompat.Builder#setRequestPromotedOngoing`, permission `POST_PROMOTED_NOTIFICATIONS`, `NotificationManager.canPostPromotedNotifications()` | Android 16+ |
| AI glasses UI | Jetpack Compose Glimmer (`androidx.xr.glimmer`, `GlimmerTheme`) | Jetpack XR libraries in beta at I/O 2026 |
| Text input | State-based `TextField` / `BasicTextField` with `TextFieldState`, `InputTransformation`, `OutputTransformation` | Value-based BasicTextField deprecated in 1.13 |
| Variable fonts | `FontVariation.Settings` (mergeable in 1.13) with `Font(...)` | Stable |
| Themed app icon | `<monochrome>` layer in the adaptive icon XML | Android 13+ launchers that support themed icons |

---

## Not included / could not verify

- No 2020 Google I/O or Android Dev Summit design session could be verified; the 2020 section is intentionally empty.
- No dedicated I/O session on themed icons was found; that row relies on developer.android.com docs only.
- The 2024 io.google catalog page lists about 105 sessions; a Compose "what's new" session for I/O 2024 (shared elements) was not found there or in the official 2024 playlists, so shared element transitions are mapped to docs.
- Exact default spring values for `MotionScheme.expressive()` are not given here; the values in the M3 motion theming post belong to a custom "playful" example.
- Wear Widgets and Remote Compose API names change fast; confirm against developer.android.com before coding.
