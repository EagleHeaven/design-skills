# WWDC design sessions (2017 to 2026)

A curated catalog of Apple's WWDC sessions on design and on the SwiftUI, UIKit and AppKit APIs that implement that design. Every session below was checked against developer.apple.com (the Design topic listing at https://developer.apple.com/videos/design/ or the session page itself) on 2026-11-19. URLs follow the pattern `https://developer.apple.com/videos/play/wwdcYYYY/NNNNN/`. Takeaways are paraphrased; watch the session for the exact wording.

How to use this file: start with the 2025 and 2026 tables (Liquid Glass era), then the "Key takeaways" for whatever you are building, then the API map at the end. The older sessions are still the best source for motion, typography, writing and spatial reasoning, because those principles did not change with Liquid Glass.

---

## WWDC26 (June 2026)

WWDC26 refined Liquid Glass rather than replacing it. Apps built with standard components pick up the refreshed look on the 2027 releases with no code changes. Design content focused on principles, brand expression inside the system, search, naming, and new toolbar, tab and corner APIs.

| Session | # | What it teaches (one line) |
|---|---|---|
| [Principles of great design](https://developer.apple.com/videos/play/wwdc2026/250/) | 250 | Eight principles (purpose, agency, responsibility, familiarity, flexibility, simplicity, craft, delight) for any Apple platform app. |
| [Communicate your brand identity on iOS](https://developer.apple.com/videos/play/wwdc2026/251/) | 251 | Keep the UI layer native, put brand in the content layer through imagery, color, type and icons. |
| [Design intuitive search experiences](https://developer.apple.com/videos/play/wwdc2026/292/) | 292 | Where to place search on iOS, iPadOS and macOS, search tabs, suggestions, filters, tokens and empty states. |
| [Craft clear names for features and labels in your app](https://developer.apple.com/videos/play/wwdc2026/290/) | 290 | Criteria, a brainstorm process and an evaluation step for naming features, tabs and settings. |
| [What's new in SwiftUI](https://developer.apple.com/videos/play/wwdc2026/269/) | 269 | Refreshed look, toolbar visibility priority and minimize behavior, prominent tab role, swipe actions on any view, reordering. |
| [Modernize your UIKit app](https://developer.apple.com/videos/play/wwdc2026/278/) | 278 | Resizable iPhone layouts, legacy API removal, tab bar sidebar placement, prominent tab, nav bar minimization, updated scroll edge effect. |
| [Modernize your AppKit app](https://developer.apple.com/videos/play/wwdc2026/289/) | 289 | Gesture recognizers, state restoration, Liquid Glass updates in macOS 27, interactive glass, container concentric corners. |
| [Use SwiftUI with AppKit and UIKit](https://developer.apple.com/videos/play/wwdc2026/272/) | 272 | Mixing SwiftUI into existing UIKit and AppKit apps. |
| [Compose advanced graphics effects with SwiftUI](https://developer.apple.com/videos/play/wwdc2026/322/) | 322 | Chaining blur, Metal layer shaders, `TimelineView`, scroll and alignment guides into a "creative pipeline" (Music lyrics style). |
| [Dive into lazy stacks and scrolling with SwiftUI](https://developer.apple.com/videos/play/wwdc2026/321/) | 321 | Lazy stack and scroll behavior in SwiftUI. |
| [Create UI prototypes using agents in Xcode](https://developer.apple.com/videos/play/wwdc2026/227/) | 227 | Using Xcode's coding agents to prototype interfaces (listed under Design). |
| [Design immersive environments for visionOS apps and the spatial web](https://developer.apple.com/videos/play/wwdc2026/234/) | 234 | Designing immersive environments for visionOS apps and websites. |
| [Design no-code games with Reality Composer Pro 3](https://developer.apple.com/videos/play/wwdc2026/252/) | 252 | Game design without code in Reality Composer Pro 3. |
| [Live Activities essentials](https://developer.apple.com/videos/play/wwdc2026/223/) | 223 | Fundamentals of building Live Activities. |
| [WidgetKit foundations](https://developer.apple.com/videos/play/wwdc2026/277/) | 277 | Fundamentals of building widgets with WidgetKit. |
| [Refine accessibility for custom controls](https://developer.apple.com/videos/play/wwdc2026/220/) | 220 | Making custom controls accessible. |
| [Prepare your tvOS apps for Dynamic Type](https://developer.apple.com/videos/play/wwdc2026/221/) | 221 | Dynamic Type support on tvOS. |
| [Elevate your app's text experience with TextKit](https://developer.apple.com/videos/play/wwdc2026/370/) | 370 | Text layout and editing with TextKit. |
| [Icon Composer for Beginners Group Lab](https://developer.apple.com/videos/play/wwdc2026/8012/) | 8012 | Q&A lab on building layered Liquid Glass icons. |

## WWDC25 (June 2025): Liquid Glass and the new design system

| Session | # | What it teaches (one line) |
|---|---|---|
| [Meet Liquid Glass](https://developer.apple.com/videos/play/wwdc2025/219/) | 219 | What the material is (lensing, dynamics, adaptivity), its two variants, tinting rules and accessibility behavior. |
| [Get to know the new design system](https://developer.apple.com/videos/play/wwdc2025/356/) | 356 | Type, color, concentric shapes, controls, bars, sheets, scroll edge effects and cross-device continuity. |
| [Build a SwiftUI app with the new design](https://developer.apple.com/videos/play/wwdc2025/323/) | 323 | `glassEffect`, `GlassEffectContainer`, glass button styles, toolbars, search tab, tab bar minimize and accessory. |
| [Build a UIKit app with the new design](https://developer.apple.com/videos/play/wwdc2025/284/) | 284 | `UIGlassEffect`, `UIGlassContainerEffect`, bar button grouping, `UIBackgroundExtensionView`, edge effects, glass buttons. |
| [Build an AppKit app with the new design](https://developer.apple.com/videos/play/wwdc2025/310/) | 310 | `NSGlassEffectView`, toolbar glass, floating sidebars, `NSBackgroundExtensionView`, control sizes and tint prominence. |
| [Say hello to the new look of app icons](https://developer.apple.com/videos/play/wwdc2025/220/) | 220 | Layered glass icons, appearance modes, unified grid and drawing guidance. |
| [Create icons with Icon Composer](https://developer.apple.com/videos/play/wwdc2025/361/) | 361 | Export layers, tune glass per group and appearance, ship one `.icon` file in Xcode. |
| [What's new in SF Symbols 7](https://developer.apple.com/videos/play/wwdc2025/337/) | 337 | Draw On / Draw Off animations, Variable Draw, Magic Replace upgrades, gradient rendering. |
| [Design foundations from idea to interface](https://developer.apple.com/videos/play/wwdc2025/359/) | 359 | Structuring an app from concept to screens: navigation, content, visual design. |
| [Principles of inclusive app design](https://developer.apple.com/videos/play/wwdc2025/316/) | 316 | Designing for a wide range of people, abilities and contexts. |
| [Make a big impact with small writing changes](https://developer.apple.com/videos/play/wwdc2025/404/) | 404 | Small UX writing edits that make interfaces clearer. |
| [Elevate the design of your iPad app](https://developer.apple.com/videos/play/wwdc2025/208/) | 208 | iPadOS 26 windowing, menu bar and pointer-friendly layout. |
| [Design interactive snippets](https://developer.apple.com/videos/play/wwdc2025/281/) | 281 | Designing App Intents snippets that people can act on. |
| [Design widgets for visionOS](https://developer.apple.com/videos/play/wwdc2025/255/) | 255 | Widgets placed in physical space on visionOS. |
| [Design hover interactions for visionOS](https://developer.apple.com/videos/play/wwdc2025/303/) | 303 | Custom hover effects and look-to-reveal patterns. |
| [Meet SwiftUI spatial layout](https://developer.apple.com/videos/play/wwdc2025/273/) | 273 | 3D layout tools in SwiftUI for visionOS. |
| [Explore prompt design & safety for on-device foundation models](https://developer.apple.com/videos/play/wwdc2025/248/) | 248 | Designing prompts and safeguards for generative features. |

## WWDC24

| Session | # | What it teaches (one line) |
|---|---|---|
| [Enhance your UI animations and transitions](https://developer.apple.com/videos/play/wwdc2024/10145/) | 10145 | Zoom navigation transition, SwiftUI animations driving UIKit views, gesture-driven springs. |
| [Create custom visual effects with SwiftUI](https://developer.apple.com/videos/play/wwdc2024/10151/) | 10151 | Scroll effects, color treatments, custom transitions, text renderers and Metal shaders. |
| [Design App Intents for system experiences](https://developer.apple.com/videos/play/wwdc2024/10176/) | 10176 | Which actions to expose to Siri, Spotlight, Shortcuts, widgets and controls, and how to word them. |
| [Add personality to your app through UX writing](https://developer.apple.com/videos/play/wwdc2024/10140/) | 10140 | Defining a voice and applying it consistently. |
| [What's new in SF Symbols 6](https://developer.apple.com/videos/play/wwdc2024/10188/) | 10188 | Wiggle, rotate and breathe animations, Magic Replace. |
| [Elevate your tab and sidebar experience in iPadOS](https://developer.apple.com/videos/play/wwdc2024/10147/) | 10147 | The floating tab bar that converts to a sidebar on iPad. |
| [Design Live Activities for Apple Watch](https://developer.apple.com/videos/play/wwdc2024/10098/) | 10098 | How Live Activities appear in the watchOS Smart Stack. |
| [Design great visionOS apps](https://developer.apple.com/videos/play/wwdc2024/10086/) | 10086 | Patterns from the first year of visionOS apps. |
| [Design interactive experiences for visionOS](https://developer.apple.com/videos/play/wwdc2024/10096/) | 10096 | Interaction design for immersive and windowed visionOS apps. |
| [Create custom hover effects in visionOS](https://developer.apple.com/videos/play/wwdc2024/10152/) | 10152 | Building custom gaze hover effects. |
| [Say hello to the next generation of CarPlay design system](https://developer.apple.com/videos/play/wwdc2024/10112/) | 10112 | The next generation CarPlay visual system. |
| [Design advanced games for Apple platforms](https://developer.apple.com/videos/play/wwdc2024/10085/) | 10085 | Game interface, onboarding and input design. |

## WWDC23

| Session | # | What it teaches (one line) |
|---|---|---|
| [Animate with springs](https://developer.apple.com/videos/play/wwdc2023/10158/) | 10158 | Why springs, the duration and bounce model, velocity preservation, SwiftUI, UIKit and Core Animation APIs. |
| [Explore SwiftUI animation](https://developer.apple.com/videos/play/wwdc2023/10156/) | 10156 | How SwiftUI animates: `Animatable`, `Animation`, springs as default, `CustomAnimation`, transactions. |
| [Wind your way through advanced animations in SwiftUI](https://developer.apple.com/videos/play/wwdc2023/10157/) | 10157 | `phaseAnimator` for multistep motion, `keyframeAnimator` for per-property tracks. |
| [Animate symbols in your app](https://developer.apple.com/videos/play/wwdc2023/10258/) | 10258 | `symbolEffect` behaviors: discrete, indefinite, transition, content transition. |
| [Create animated symbols](https://developer.apple.com/videos/play/wwdc2023/10257/) | 10257 | Preparing custom symbols so they animate well. |
| [What's new in SF Symbols 5](https://developer.apple.com/videos/play/wwdc2023/10197/) | 10197 | The first symbol animation presets. |
| [Design dynamic Live Activities](https://developer.apple.com/videos/play/wwdc2023/10194/) | 10194 | Lock Screen, StandBy and Dynamic Island compact, expanded and minimal layouts. |
| [Principles of spatial design](https://developer.apple.com/videos/play/wwdc2023/10072/) | 10072 | Familiarity, windows, glass, points, ergonomics, immersion, depth, authenticity on visionOS. |
| [Design for spatial input](https://developer.apple.com/videos/play/wwdc2023/10073/) | 10073 | Eyes and hands input, 60 pt targets, hover feedback, direct versus indirect gestures. |
| [Design for spatial user interfaces](https://developer.apple.com/videos/play/wwdc2023/10076/) | 10076 | Materials, typography, layout and controls for visionOS windows. |
| [Design considerations for vision and motion](https://developer.apple.com/videos/play/wwdc2023/10078/) | 10078 | Visual comfort and motion that avoids discomfort in headsets. |
| [Create accessible spatial experiences](https://developer.apple.com/videos/play/wwdc2023/10034/) | 10034 | VoiceOver for RealityKit entities, head-anchor alternatives, reduce motion, captions, Dwell and Pointer Control. |
| [Design with SwiftUI](https://developer.apple.com/videos/play/wwdc2023/10115/) | 10115 | How Apple designers prototype in SwiftUI. |
| [Design and build apps for watchOS 10](https://developer.apple.com/videos/play/wwdc2023/10138/) | 10138 | The watchOS 10 redesign: full-screen colors, vertical pages, Smart Stack. |
| [Design widgets for the Smart Stack on Apple Watch](https://developer.apple.com/videos/play/wwdc2023/10309/) | 10309 | Relevance-driven watch widgets. |
| [Make features discoverable with TipKit](https://developer.apple.com/videos/play/wwdc2023/10229/) | 10229 | When and how to show in-app tips. |
| [Design Shortcuts for Spotlight](https://developer.apple.com/videos/play/wwdc2023/10193/) | 10193 | App Shortcuts surfaced in Spotlight. |
| [Explore immersive sound design](https://developer.apple.com/videos/play/wwdc2023/10271/) | 10271 | Spatial audio as a design material. |

## WWDC22

| Session | # | What it teaches (one line) |
|---|---|---|
| [Writing for interfaces](https://developer.apple.com/videos/play/wwdc2022/10037/) | 10037 | Purpose, anticipation, context, empathy, voice and tone, alert and button wording. |
| [Explore navigation design for iOS](https://developer.apple.com/videos/play/wwdc2022/10001/) | 10001 | Tab bars, hierarchical navigation and modality. |
| [What's new in iPad app design](https://developer.apple.com/videos/play/wwdc2022/10009/) | 10009 | Toolbars, navigation and desktop-class iPad patterns. |
| [Design for Arabic](https://developer.apple.com/videos/play/wwdc2022/10034/) | 10034 | Right-to-left layout, mirroring, Arabic typography and numerals. |
| [Meet the expanded San Francisco font family](https://developer.apple.com/videos/play/wwdc2022/110381/) | 110381 | SF widths (condensed, compressed, expanded) and SF Arabic Rounded. |
| [What's new in SF Symbols 4](https://developer.apple.com/videos/play/wwdc2022/10157/) | 10157 | Automatic rendering mode, Variable Color. |
| [Adopt Variable Color in SF Symbols](https://developer.apple.com/videos/play/wwdc2022/10158/) | 10158 | Representing a value with variable color layers. |
| [Design an effective chart](https://developer.apple.com/videos/play/wwdc2022/110340/) | 110340 | Chart types, marks, axes and accessibility. |
| [Design app experiences with charts](https://developer.apple.com/videos/play/wwdc2022/110342/) | 110342 | Where charts belong in an app and how they scale. |
| [Design App Shortcuts](https://developer.apple.com/videos/play/wwdc2022/10169/) | 10169 | Naming and phrasing voice-invoked shortcuts. |
| [Qualities of great AR experiences](https://developer.apple.com/videos/play/wwdc2022/10131/) | 10131 | Comfort, coaching and placement in AR. |

## WWDC21

| Session | # | What it teaches (one line) |
|---|---|---|
| [Add rich graphics to your SwiftUI app](https://developer.apple.com/videos/play/wwdc2021/10021/) | 10021 | Safe areas, `safeAreaInset`, materials, vibrant foreground styles, `Canvas`, `TimelineView`. |
| [The practice of inclusive design](https://developer.apple.com/videos/play/wwdc2021/10275/) | 10275 | Practical techniques for inclusive interfaces and content. |
| [The process of inclusive design](https://developer.apple.com/videos/play/wwdc2021/10304/) | 10304 | Building inclusion into the design process. |
| [Discoverable design](https://developer.apple.com/videos/play/wwdc2021/10126/) | 10126 | Making features and gestures easy to find. |
| [What's new in SF Symbols](https://developer.apple.com/videos/play/wwdc2021/10097/) | 10097 | Hierarchical and palette rendering modes. |
| [SF Symbols in SwiftUI](https://developer.apple.com/videos/play/wwdc2021/10349/) | 10349 | Rendering modes and variants in SwiftUI. |
| [Create custom symbols](https://developer.apple.com/videos/play/wwdc2021/10250/) | 10250 | Drawing and annotating custom symbols. |
| [Practice audio haptic design](https://developer.apple.com/videos/play/wwdc2021/10278/) | 10278 | Pairing sound and haptics. |
| [Design for spatial interaction](https://developer.apple.com/videos/play/wwdc2021/10245/) | 10245 | Ultra Wideband and proximity-driven interactions. |

## WWDC20

| Session | # | What it teaches (one line) |
|---|---|---|
| [The details of UI typography](https://developer.apple.com/videos/play/wwdc2020/10175/) | 10175 | Optical sizes, variable SF, tracking, leading, text styles, Dynamic Type for custom fonts. |
| [Design great widgets](https://developer.apple.com/videos/play/wwdc2020/10103/) | 10103 | Glanceable content, sizes, margins, tap targets, placeholders, Smart Stacks. |
| [Design with iOS pickers, menus and actions](https://developer.apple.com/videos/play/wwdc2020/10205/) | 10205 | When to use menus, pickers, context menus and action sheets. |
| [Make your app visually accessible](https://developer.apple.com/videos/play/wwdc2020/10020/) | 10020 | Contrast, Dynamic Type, color independence, reduce motion. |
| [Design for the iPadOS pointer](https://developer.apple.com/videos/play/wwdc2020/10640/) | 10640 | Pointer effects, magnetism and hit regions. |
| [Adopt the new look of macOS](https://developer.apple.com/videos/play/wwdc2020/10104/) | 10104 | The Big Sur redesign: full-height sidebars, toolbars, SF Symbols on Mac. |
| [SF Symbols 2](https://developer.apple.com/videos/play/wwdc2020/10207/) | 10207 | Multicolor symbols and localized variants. |
| [Designed for iPad](https://developer.apple.com/videos/play/wwdc2020/10206/) | 10206 | Sidebars and layouts that feel native on iPad. |
| [Design great App Clips](https://developer.apple.com/videos/play/wwdc2020/10172/) | 10172 | Fast, focused App Clip flows. |
| [What's new in watchOS design](https://developer.apple.com/videos/play/wwdc2020/10171/) | 10171 | Complications and watch app layouts. |

## WWDC19

| Session | # | What it teaches (one line) |
|---|---|---|
| [Introducing SF Symbols](https://developer.apple.com/videos/play/wwdc2019/206/) | 206 | The symbol library, weights, scales and alignment with text. |
| [What's New in iOS Design](https://developer.apple.com/videos/play/wwdc2019/808/) | 808 | Dark Mode, semantic colors, materials, card-style modals. |
| [Visual Design and Accessibility](https://developer.apple.com/videos/play/wwdc2019/244/) | 244 | Color, contrast and motion settings in visual design. |
| [Designing Audio-Haptic Experiences](https://developer.apple.com/videos/play/wwdc2019/810/) | 810 | Principles for combining sound and touch feedback. |
| [Designing iPad Apps for Mac](https://developer.apple.com/videos/play/wwdc2019/809/) | 809 | Adapting iPad designs for Mac Catalyst. |

## WWDC18 and WWDC17 (evergreen principles)

| Session | # | What it teaches (one line) |
|---|---|---|
| [Designing Fluid Interfaces](https://developer.apple.com/videos/play/wwdc2018/803/) | 803 (2018) | Responsiveness, interruptibility, spatial consistency, momentum, damping and response. |
| [The Qualities of Great Design](https://developer.apple.com/videos/play/wwdc2018/801/) | 801 (2018) | What separates great design: clarity, delight, intention. |
| [Intentional Design](https://developer.apple.com/videos/play/wwdc2018/802/) | 802 (2018) | Making deliberate choices tied to a clear purpose. |
| [The Life of a Button](https://developer.apple.com/videos/play/wwdc2018/804/) | 804 (2018) | How a single control is designed, from label to states. |
| [Designing Notifications](https://developer.apple.com/videos/play/wwdc2018/806/) | 806 (2018) | Useful, actionable, grouped notifications. |
| [Presenting Design Work](https://developer.apple.com/videos/play/wwdc2018/811/) | 811 (2018) | Communicating design decisions to others. |
| [Essential Design Principles](https://developer.apple.com/videos/play/wwdc2017/802/) | 802 (2017) | Wayfinding, feedback, visibility, consistency, mental models, proximity, grouping, mapping, affordance. |
| [Writing Great Alerts](https://developer.apple.com/videos/play/wwdc2017/813/) | 813 (2017) | When to alert and how to word titles and buttons. |
| [How to Pick a Custom Font](https://developer.apple.com/videos/play/wwdc2017/815/) | 815 (2017) | Choosing and testing a typeface for an app. |
| [Designing for a Global Audience](https://developer.apple.com/videos/play/wwdc2017/819/) | 819 (2017) | Localization, cultural and layout considerations. |
| [Love at First Launch](https://developer.apple.com/videos/play/wwdc2017/816/) | 816 (2017) | Onboarding that gets people into content fast. |
| [App Icon Design](https://developer.apple.com/videos/play/wwdc2017/822/) | 822 (2017) | Pre-glass icon craft: concept, simplicity, recognizability. |
| [Designing Glyphs](https://developer.apple.com/videos/play/wwdc2017/823/) | 823 (2017) | Drawing consistent interface icons. |
| [Size Classes and Core Components](https://developer.apple.com/videos/play/wwdc2017/812/) | 812 (2017) | Adaptive layout with size classes. |
| [Designing Sound](https://developer.apple.com/videos/play/wwdc2017/803/) | 803 (2017) | Sound as part of the interface. |
| [60-Second Prototyping](https://developer.apple.com/videos/play/wwdc2017/818/) | 818 (2017) | Fast, low-fidelity prototyping. |
| [Communication Between Designers and Engineers](https://developer.apple.com/videos/play/wwdc2017/809/) | 809 (2017) | Working practices between design and engineering. |

---

## Key takeaways

### 1. Meet Liquid Glass (WWDC25, 219)

- Liquid Glass is a digital material that bends and concentrates light (lensing) rather than blurring it. That refraction is what separates controls from content while keeping them light.
- It lives in the navigation layer only: bars, tab bars, toolbars, floating buttons, sheets, menus. Never put it on content such as list rows or table cells, where it would fight the content for attention.
- Never stack glass on glass. Elements sitting on glass should use fills, transparency and vibrancy so they read as part of the same surface.
- Two variants, never mixed. Regular is the default and adapts to any content. Clear is permanently more transparent, needs a dimming layer, and is only appropriate over media-rich content with bold, bright foreground content.
- Adaptivity is automatic: small elements such as tab bars flip between light and dark based on what is behind them, larger ones such as menus and sidebars adapt without flipping, and bigger glass looks thicker with deeper shadows.
- Tint selectively. Color on glass is mapped across tones like real tinted glass, so reserve it for the primary action (one tinted button per screen, not five). Decorative color belongs in the content layer.
- Scroll edge effects replace hard dividers: soft by default, hard for pinned accessories such as column headers.
- Elements appear and disappear by changing the lensing, not by fading alpha. Interactive glass flexes and glows under the finger.
- Accessibility settings are honored without extra work: Reduce Transparency makes glass frostier, Increase Contrast moves toward black or white with borders, Reduce Motion lowers effect intensity and removes elastic motion.

### 2. Get to know the new design system (WWDC25, 356)

- Treat the app as one system, not a set of screens. Type, color and shape were tuned to work together with Liquid Glass.
- Typography is bolder and left-aligned in places like alerts and onboarding, which improves scanning.
- System colors were retuned for Light, Dark and Increased Contrast. Use semantic system colors so you inherit those adjustments.
- Concentricity is the core shape rule. Three shape types: fixed (constant radius), capsule (radius equals half the height), concentric (parent radius minus padding). Pinched or flared corners signal a mismatch.
- Controls: capsules for touch-friendly and standout actions. On macOS, mini, small and medium controls stay rounded rectangles for dense UI, large controls become capsules, and a new extra-large size uses glass for emphasis.
- Bars: remove custom backgrounds and borders, create hierarchy through grouping. Group items by function and frequency, never group a symbol with a text button, move secondary actions into a menu, and keep the primary action separate and tinted.
- Sheets and menus now grow out of the control that triggered them. Partial sheets are inset glass, and they become more opaque as they are pulled to full height.
- iOS gains a dedicated Search tab. Persistent features (a mini player) go in a tab bar accessory; screen-specific actions do not.
- Continuity: design the app anatomy once and let it adapt from a narrow iPhone column to a wide Mac canvas, using the same symbols for the same meanings everywhere. Use a text label when no symbol is unambiguous.

### 3. Build a SwiftUI app with the new design (WWDC25, 323), plus UIKit (284) and AppKit (310)

- Recompile with the Xcode 26 SDK first. Standard `NavigationSplitView`, `TabView`, toolbars, sheets and controls adopt the new look automatically.
- Audit and delete custom backgrounds on bars and sheets (`presentationBackground`, `UIBarAppearance` colors, legacy `NSVisualEffectView` sidebars). They block the glass and break scroll edge effects.
- Let artwork flow behind floating sidebars with `backgroundExtensionEffect()` (SwiftUI), `UIBackgroundExtensionView` (UIKit) or `NSBackgroundExtensionView` (AppKit).
- Tab bars can shrink while scrolling (`tabBarMinimizeBehavior(.onScrollDown)`) and host a persistent accessory above them (`tabViewBottomAccessory`, `UITabAccessory`). Read the placement environment to switch between inline and expanded layouts.
- Toolbars group automatically. Use `ToolbarSpacer(.fixed)` or `UIBarButtonItem.fixedSpace` to split groups, and `sharedBackgroundVisibility(.hidden)` or `hidesSharedBackground` to control the shared glass.
- Use `.buttonStyle(.glass)` and `.buttonStyle(.glassProminent)` (UIKit `.glass()` and `.prominentGlass()`) instead of custom blurred buttons.
- For custom glass, apply `glassEffect` and wrap neighbors in `GlassEffectContainer`, because glass cannot sample other glass. Morph between shapes with `glassEffectID` and a namespace.
- To show or hide glass in UIKit, animate the `effect` property of `UIVisualEffectView` (set it to `nil` to dematerialize) rather than animating alpha.
- Sheets can morph out of their source with `matchedTransitionSource` and `navigationTransition(.zoom(...))` (UIKit `preferredTransition = .zoom`). Action sheets must have a source view on iPhone too.
- On macOS, use `tintProminence` and the default button to express the primary action, and `prefersCompactControlSizeMetrics` for dense inspectors.

### 4. WWDC26 updates: SwiftUI (269), UIKit (278), AppKit (289)

- No new opt-in is required: apps using system components inherit the refined Liquid Glass on the 2027 releases.
- Toolbars got smarter about space: `visibilityPriority(.high)` keeps a group visible, `ToolbarOverflowMenu` always overflows, `.topBarPinnedTrailing` pins an item, and `toolbarMinimizeBehavior(.onScrollDown, for: .navigationBar)` lets the navigation bar slide away while scrolling.
- `Tab(role: .prominent)` (UIKit `prominentTabIdentifier`) separates a key destination, such as a cart, at the trailing edge of the tab bar.
- UIKit can put an iPhone tab bar into a sidebar layout (`sidebar.preferredPlacement = .sidebar`), aimed at resizable iPhone apps (iPhone Mirroring) and iPad.
- The scroll edge effect `.automatic` style now has its own appearance and no longer alternates between soft and hard. If you forced `.soft` to match the old default, re-check it.
- On macOS 27, sidebars reach the window edges, selected rows use semibold text, and glass can be interactive (a subtle bounce on click). Apple reserves interactive glass for controls and containers of controls, not every surface.
- AppKit adds `cornerConfiguration` with `NSViewCornerRadius.containerConcentric(_:)`, so custom views can match the window's curve automatically, with a minimum radius as fallback.
- Menu item icons are hidden by default in iPad and Mac menu bars. Override with `labelStyle(.titleAndIcon)` or `preferredImageVisibility` only where the icon adds meaning.
- The keynote also announced a user-facing Liquid Glass transparency control in iOS 27, iPadOS 27 and macOS 27 (reported by press coverage; not described in the sessions above, so treat specifics as unverified). Design so the UI stays legible across the whole range from clear to tinted.

### 5. Principles of great design (WWDC26, 250)

- Purpose: every feature costs people time, attention and trust. Decide what not to build before sketching.
- Agency: let people move at their own pace, make actions undoable, and interrupt only before a serious mistake.
- Responsibility: ask for personal data only when needed, at the moment it is needed, with a reason. Anticipate harm, especially from AI features that can be wrong.
- Familiarity: lean on established conventions and consistent behavior; things that look alike should act alike.
- Flexibility: play to each device (touch, pointer, hands-free in the car) and let people personalize.
- Simplicity means less friction, not fewer pixels. Sometimes adding context (such as playback progress) makes something simpler.
- Craft and delight: typography, adaptive color, responsive motion and performance build trust, and delight comes from getting the rest right rather than from late decoration.

### 6. Communicate your brand identity on iOS (WWDC26, 251)

- Split the app into a UI layer (tab bars, toolbars, navigation) that stays native, and a content layer where brand lives.
- Prefer standard components; customize only high-impact moments, and keep system behaviors such as hit sizes, dismiss actions and concentric corners.
- Move brand color out of solid bars and into scroll content, so glass controls float over it and pick up the color. Use color for meaning: hierarchy, grouping, status, selection, primary action.
- Motion is part of the brand: stutters and slow loads damage perception even when people cannot name the cause.
- Custom fonts must support Dynamic Type, be tested at the largest sizes, and wrap rather than truncate. System fonts offer variety through widths and SF Rounded.
- Keep logos understated (for example only on the home tab, fading on scroll). Support Dark Mode.

### 7. Designing Fluid Interfaces (WWDC18, 803)

- Latency kills the feeling of direct manipulation. Hunt down delays in taps, presses and swipes.
- Every animation must be interruptible and redirectable mid-flight, so people can change their mind without waiting.
- Spatial consistency: something that leaves in one direction returns from that direction.
- Project momentum: use release velocity and a deceleration rate to predict where a flick should land, then target that, not the finger's last position.
- Rubber-band at boundaries so the interface keeps tracking instead of hitting a wall.
- Describe springs with damping (100 percent means no overshoot) and response (how fast). Start at full damping and add bounce only when the gesture carries momentum.
- Gestures: track one-to-one, give continuous feedback, run competing recognizers in parallel and cancel the losers. Avoid double-tap where it delays single taps.
- Teach through visual hints (grabbers, clipped content), behavior that mirrors the gesture, and play; save explicit instructions for frequent gestures.

### 8. Animate with springs (WWDC23, 10158) and Explore SwiftUI animation (WWDC23, 10156)

- Springs keep position and velocity continuous, so a drag that ends hands its speed straight into the animation. Ease curves cannot accept initial velocity.
- Configure springs with two perceptual parameters: `duration` (pacing) and `bounce` (0 smooth, positive overshoots, negative flattens). Treat bounce above about 0.4 with caution.
- Default to bounce 0. Add bounce for playful moments or gesture-driven motion.
- Do not wait for a spring's settling time before updating the UI; use completion handlers, which follow the perceptual duration.
- SwiftUI: `withAnimation(.spring(duration: 0.6, bounce: 0.2))`, presets `.smooth`, `.snappy`, `.bouncy` (each takes `duration` and `extraBounce`). Since iOS 17 a bare `withAnimation` uses a smooth spring.
- UIKit: `UIView.animate(duration:bounce:)`. Core Animation: `CASpringAnimation(perceptualDuration:bounce:)`. The `Spring` type converts to mass, stiffness and damping when needed.
- For multistep or choreographed motion, use `phaseAnimator` and `keyframeAnimator` (WWDC23, 10157). Custom `Animatable` conformance runs `body` every frame, so keep it a last resort.

### 9. Enhance your UI animations and transitions (WWDC24, 10145)

- The zoom navigation transition morphs a tapped cell into the destination and stays interactive. SwiftUI uses `matchedTransitionSource(id:in:)` on the source and `navigationTransition(.zoom(sourceID:in:))` on the destination; UIKit uses `preferredTransition = .zoom { ... }`.
- In UIKit's closure, look up the source by a stable model identifier, because cells get reused.
- Interrupted UIKit pushes are converted to pops rather than cancelled, so reset transition state in `viewDidAppear` and `viewDidDisappear`.
- UIKit and AppKit views can now be animated with SwiftUI `Animation` values, for example `UIView.animate(.spring(duration: 0.5))`.
- For drags, use `.interactiveSpring` while the gesture changes and `.spring` on release; velocity carries over automatically.
- In representables, `context.animate { }` applies the current SwiftUI transaction's animation to UIKit changes.

### 10. The details of UI typography (WWDC20, 10175)

- San Francisco has optical sizes: Text below 20 pt, Display from 20 pt. The variable SF Pro interpolates between them (roughly 17 to 28 pt).
- Tracking (space across all glyphs) differs from kerning (specific pairs). Apple publishes tracking tables per size; follow them for custom layouts.
- Leading: tight and loose traits shift line height by about 2 pt on iOS and macOS. Use tight leading for dense UI, loose for long reading.
- Use text styles (`body`, `title1`, `footnote` and so on) instead of fixed sizes so Dynamic Type works. Emphasized variants change weight, not size.
- Designs: New York (serif), SF Rounded and SF Mono all follow text styles.
- Scale custom fonts with `UIFontMetrics` or `Font.custom(_:size:relativeTo:)`, and spacing with `@ScaledMetric`.
- Allow tightening before truncation (`allowsTightening`, `allowsDefaultTighteningForTruncation`).

### 11. SF Symbols: Animate symbols in your app (WWDC23, 10258) and What's new in SF Symbols 7 (WWDC25, 337)

- Pick the behavior by intent: discrete (bounce, pulse, variable color) for one-off feedback; indefinite (scale, pulse, variable color, appear, disappear) for ongoing state; transition for inserting or removing a symbol; content transition (replace) for swapping symbols, such as play to pause.
- SwiftUI: `.symbolEffect(_:options:value:)` for discrete, `.symbolEffect(_:options:isActive:)` for indefinite, `.contentTransition(.symbolEffect(.replace))` for swaps. UIKit and AppKit: `addSymbolEffect`, `removeSymbolEffect(ofType:)`, `setSymbolImage(_:contentTransition:)`.
- Rendering modes (since 2021): monochrome, hierarchical, palette, multicolor; Variable Color (2022) expresses a value across layers.
- SF Symbols 7 adds Draw On and Draw Off (symbols draw along their paths like handwriting), playable by layer, whole symbol or individually.
- Variable Draw shows progress by drawing a layer to a percentage; a symbol uses either Variable Color or Variable Draw, not both at once.
- Magic Replace now keeps shared enclosures and swaps only differing parts. A new gradient rendering derives a smooth gradient from one color in every rendering mode.
- Custom symbols need guide points (start, end, corners) on the regular weight for drawing animations.

### 12. Design dynamic Live Activities (WWDC23, 10194) and Design great widgets (WWDC20, 10103)

- Live Activities: design for the specific information, not a notification layout. Size the key data to read at a glance, and add buttons only for essential controls.
- Use app colors and type for identity, and a logo mark rather than the whole app icon.
- Dynamic Island: content concentric with the island's curves, even margins, heavy legible type. Compact hugs the sensor; expanded keeps the compact arrangement; minimal still conveys information rather than only a logo.
- Animate updates with numeric content transitions for counters and replace transitions for changing text and graphics. Alert only when the person must act.
- StandBy scales the layout 200 percent; avoid edge-drawn graphics and check the red night mode.
- Widgets: one glanceable, personal piece of information per widget; do not just scale a small layout up.
- Use the default 16 pt margins (11 pt for tight inset shapes), concentric corners via the system container, a placeholder for loading, and both light and dark appearances.
- Do not show the app name or icon, instructional text, or "last updated" stamps. Small widgets have one tap target that deep links.

### 13. Principles of spatial design (WWDC23, 10072) and Design for spatial input (WWDC23, 10073)

- Keep familiar structures (sidebars, tabs, search) so people know where things are.
- Start in a window and let people choose deeper immersion; provide clear ways in and out.
- Design in points so UI scales with distance. Keep key content centered in the field of view, landscape-oriented, and slightly beyond arm's reach; do not place content behind people or anchor it to their head.
- Use depth subtly for hierarchy, keep text flat, and reinforce depth with light and shadow.
- Eyes target, pinch selects. Interactive targets need at least 60 pt including spacing, plus a subtle hover effect.
- Prefer indirect gestures for comfort; use direct touch only when central, with strong sound and visual feedback.
- Keep interactive content at a consistent depth to avoid eye strain. Find one authentic spatial moment instead of a flat port.

### 14. Writing for interfaces (WWDC22, 10037) and Craft clear names (WWDC26, 290)

- Each screen answers one question: what does the person need to know now? Put it first and cut the rest.
- Anticipate the next step; make the default the most likely choice.
- Fit the context: shorter text when attention is divided, specific alerts, empty states that explain what will appear.
- Write for everyone: plain language, no idioms that do not translate, layouts that survive longer or right-to-left text, descriptive accessibility labels.
- Buttons state the outcome ("Keep Subscription", not "Yes"). Errors are specific and actionable.
- One consistent voice; tone shifts with the moment. Read it aloud.
- For names: a good name belongs where it appears, sets an accurate expectation, and works across languages and platforms. Name by what the feature does for people, not the technology.
- Generate names from think, feel and do prompts, group them by theme, then test candidates inside real sentences.

### 15. Accessibility: Create accessible spatial experiences (WWDC23, 10034), with Liquid Glass behavior

- Give custom or 3D content accessibility labels, traits and values, and an activate action matching what touch users can do.
- Post announcements for meaningful state changes when the app owns the gesture handling.
- Support the largest Dynamic Type sizes by reflowing layouts, and keep text contrast at 4.5:1 or better.
- Offer world-anchored alternatives to head-anchored content, and calmer alternatives (crossfades) when Reduce Motion is on.
- Make every function reachable with alternative inputs (Switch Control, Dwell, Pointer Control, keyboards, controllers).
- Use system captions where possible; prefer pop-on captions.
- System materials, including Liquid Glass, already respond to Reduce Transparency, Increase Contrast and Reduce Motion. Custom effects must do the same by reading the matching environment values.

---

## Implementation APIs mentioned

Only APIs named on the session pages or in Apple's documentation are listed. Platform versions follow the session year (iOS 26 / macOS 26 for WWDC25, the 2027 releases for WWDC26).

| Concept | SwiftUI | UIKit | AppKit |
|---|---|---|---|
| Custom Liquid Glass surface | `glassEffect()`, `glassEffect(in:)`, `glassEffect(.regular.tint(_:))`, `.regular.interactive()` | `UIVisualEffectView` with `UIGlassEffect` (`tintColor`, `isInteractive`) | `NSGlassEffectView` (`contentView`, `cornerRadius`) |
| Group and merge glass | `GlassEffectContainer`, `glassEffectID(_:in:)` with `@Namespace` | `UIGlassContainerEffect` (`spacing`) | `NSGlassEffectContainerView` (`spacing`) |
| Glass buttons | `.buttonStyle(.glass)`, `.buttonStyle(.glassProminent)` | `UIButton.Configuration.glass()`, `.prominentGlass()` | Glass bezel style with `bezelColor`, `tintProminence` |
| Content behind sidebars | `backgroundExtensionEffect()` | `UIBackgroundExtensionView` (`contentView`, `automaticallyPlacesContentView`) | `NSBackgroundExtensionView`, `NSSplitViewItem.automaticallyAdjustsSafeAreaInsets` |
| Scroll edge effect | `scrollEdgeEffectStyle(.hard, for: .top)` | `scrollView.topEdgeEffect.style`, `UIScrollEdgeElementContainerInteraction` | `NSScrollEdgeEffectStyle` (2026), split item accessories |
| Tab bar minimize and accessory | `tabBarMinimizeBehavior(.onScrollDown)`, `tabViewBottomAccessory`, `tabViewBottomAccessoryPlacement` | `tabBarMinimizeBehavior`, `bottomAccessory` with `UITabAccessory`, `tabAccessoryEnvironment` trait | n/a |
| Search | `searchable(text:)`, `Tab(role: .search)`, `searchToolbarBehavior(.minimize)`, `DefaultToolbarItem(kind: .search, ...)` | `searchBarPlacementBarButtonItem`, `searchBarPlacementAllowsExternalIntegration`, `preferredSearchBarPlacement` | n/a |
| Toolbar grouping | `ToolbarSpacer(.fixed / .flexible)`, `sharedBackgroundVisibility(.hidden)`, `badge(_:)` | `UIBarButtonItem.fixedSpace`, `hidesSharedBackground`, `style = .prominent`, `navigationItem.subtitle` | `NSToolbarItemGroup`, `isBordered`, `style = .prominent`, `backgroundTintColor`, `NSItemBadge` |
| Toolbar space (2026) | `visibilityPriority(.high)`, `ToolbarOverflowMenu`, `.topBarPinnedTrailing`, `toolbarMinimizeBehavior(.onScrollDown, for: .navigationBar)` | navigation bar minimization (name differs between narration and sample code, check docs) | n/a |
| Prominent tab (2026) | `Tab(role: .prominent)` | `prominentTabIdentifier`, `sidebar.preferredPlacement` | n/a |
| Concentric corners | `ConcentricRectangle` (doc page exists; the `.rect(corners: .concentric)` shorthand spelling is unverified) | `cornerConfiguration` (`.fixed`, `.containerRelative()`) on glass | `cornerConfiguration`, `NSViewCornerRadius.containerConcentric(_:)`, `.uniformCorners(radius:)` (2026) |
| Morphing presentations | `matchedTransitionSource(id:in:)`, `navigationTransition(.zoom(sourceID:in:))` | `preferredTransition = .zoom { }`, `popoverPresentationController.sourceItem` | n/a |
| Springs | `.spring(duration:bounce:)`, `.smooth`, `.snappy`, `.bouncy`, `Spring`, `.interactiveSpring` | `UIView.animate(duration:bounce:)`, `UIView.animate(.spring(...))` | `CASpringAnimation(perceptualDuration:bounce:)` |
| Choreographed motion | `phaseAnimator`, `keyframeAnimator`, `KeyframeTimeline`, `CustomAnimation`, `Transaction` | n/a | n/a |
| Symbol animation | `symbolEffect(_:options:value:)`, `symbolEffect(_:options:isActive:)`, `contentTransition(.symbolEffect(.replace))` | `addSymbolEffect`, `removeSymbolEffect(ofType:)`, `setSymbolImage(_:contentTransition:)` | same as UIKit |
| Typography | `Font.leading(.tight)`, `Font.system(_:design:)`, `Font.custom(_:size:relativeTo:)`, `@ScaledMetric`, `tracking(_:)`, `allowsTightening(_:)` | `UIFontMetrics`, `UIFontDescriptor` traits `.traitTightLeading`, `.withDesign(.rounded)`, `adjustsFontForContentSizeCategory` | `NSFontDescriptor.preferredFontDescriptor(forTextStyle:)` |
| Graphics effects | `layerEffect`, `colorEffect`, `distortionEffect` with `ShaderLibrary`, `TimelineView`, `Canvas`, `drawingGroup()` | n/a | n/a |
| Controls | `controlSize(_:)`, `buttonBorderShape(.capsule)`, `Slider` with `step`, `ticks`, `neutralValue` | `UISlider.trackConfiguration`, `sliderStyle = .thumbless` | `prefersCompactControlSizeMetrics`, `borderShape`, `NSSlider.neutralValue` |

Not verified, so not relied on above: exact SwiftUI identifiers for SF Symbols 7 Draw and gradient modifiers (the session describes them through `symbolEffect` and a color rendering mode modifier but does not show names on its page), the API name for macOS 27 interactive glass, and the exact UIKit 2026 navigation bar minimization property names. Check the current documentation before using them.
