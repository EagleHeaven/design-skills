# Implementation: from HIG rule to code

How to realize HIG guidance in SwiftUI, UIKit/AppKit, React Native/Expo and the web. API names marked (HIG) are cited by the HIG pages themselves; others come from Apple's iOS 26 SDK and WWDC 2025 sessions (verify details in `wwdc-design-sessions.md` or Apple docs before relying on exact signatures).

## Contents
- Adoption order for the new design
- Liquid Glass and materials
- Navigation: tab bars, toolbars, sidebars
- Presentation: sheets, alerts, menus
- Typography and Dynamic Type
- Color and Dark Mode
- SF Symbols and icons
- Layout and safe areas
- Motion and haptics
- Accessibility settings to read
- React Native / Expo equivalents
- Web equivalents

## Adoption order for the new design

1. Build with the latest Xcode/SDK and look before changing anything: system bars, sheets, menus, buttons and tab bars adopt Liquid Glass automatically.
2. Delete custom bar backgrounds, custom blur views behind bars and hard divider lines; let scroll edge effects do the separation.
3. Move actions into toolbars and group them; keep the primary action prominent.
4. Only then add custom glass to the few custom controls that float above content.
5. Re-test with Reduce Transparency, Increase Contrast, Dark Mode, largest Dynamic Type, RTL.
6. Rebuild the app icon as layers in Icon Composer; check default, dark, clear and tinted appearances.

## Liquid Glass and materials

| Need | SwiftUI | UIKit / AppKit |
|---|---|---|
| Glass on a custom view | `.glassEffect(_:in:)` (HIG), variants `.regular` / `.clear` (HIG), `.tint(_:)`, `.interactive()` | `UIGlassEffect` in a `UIVisualEffectView`; `NSGlassEffectView` |
| Several glass shapes that blend/morph | `GlassEffectContainer`, `.glassEffectID(_:in:)` with a `@Namespace` | `UIGlassContainerEffect` |
| Glass buttons | `.buttonStyle(.glass)`, `.buttonStyle(.glassProminent)` for the primary action | `UIButton.Configuration.glass()` / `.prominentGlass()` |
| Content-layer material | `.background(.ultraThinMaterial)` ... `.thickMaterial`; `Material` (HIG) | `UIBlurEffect` + `UIVibrancyEffect` (HIG); `NSVisualEffectView` (HIG) |
| Scroll edge treatment | `.scrollEdgeEffectStyle(_:for:)` with `ScrollEdgeEffectStyle` (HIG) `.soft` / `.hard` | `UIScrollEdgeEffect.Style` (HIG), `NSScrollEdgeEffectStyle` (HIG) |
| Extend content under a sidebar/inspector | `.backgroundExtensionEffect()` | `UIBackgroundExtensionView` |

Rules in code: no glass on list rows, cards or backgrounds (content layer); no glass inside glass; tint the glass, not the label; clear glass only over media, with a dimming layer if the media is bright.

## Navigation: tab bars, toolbars, sidebars

- Tabs: `TabView` with `Tab` items (HIG). `.tabViewStyle(.sidebarAdaptable)` (HIG) turns into a sidebar on iPad/Mac; `TabViewCustomization` (HIG) lets people reorder.
- Minimize on scroll (iPhone): `.tabBarMinimizeBehavior(.onScrollDown)` (HIG type `TabBarMinimizeBehavior`; UIKit `UITabBarController.MinimizeBehavior`).
- Accessory above the tab bar (e.g. now playing): `.tabViewBottomAccessory { }` (HIG `TabViewBottomAccessoryPlacement`).
- Search as a tab: `Tab(role: .search)`; the system places it at the trailing end.
- Toolbars: `.toolbar { ToolbarItem(placement: .primaryAction) }` (HIG placements `primaryAction`, `topBarLeading`, `topBarTrailing`, `bottomBar`); separate groups with `ToolbarSpacer`; UIKit `UIBarButtonItem.SystemItem.fixedSpace` (HIG).
- Hierarchy: `NavigationStack`; deep content on iPad/Mac: `NavigationSplitView` (HIG "navigation split view").

## Presentation: sheets, alerts, menus

- Sheets: `.sheet(item:onDismiss:content:)` (HIG) with `.presentationDetents([.medium, .large])` (HIG "detents"); UIKit `UISheetPresentationController` with `prefersGrabberVisible` (HIG). Partial-height sheets float inset with glass; full height becomes opaque.
- Alerts: `.alert(_:isPresented:actions:message:)`; destructive buttons use `role: .destructive`, cancel uses `role: .cancel`.
- Confirmation of a destructive action from a control: `.confirmationDialog` (action sheet).
- Menus: `Menu`, `.contextMenu`, `Picker` with `.pickerStyle(.menu)`; group with `Section`, `Divider`.

## Typography and Dynamic Type

- Use text styles: `.font(.body)`, `.headline`, `.largeTitle` etc.; UIKit `UIFont.preferredFont(forTextStyle:)` with `adjustsFontForContentSizeCategory = true`.
- Custom fonts: `Font.custom(_:size:relativeTo:)`; UIKit `UIFontMetrics(forTextStyle:).scaledFont(for:)`.
- Scale spacing too: `@ScaledMetric`.
- Switch layout at accessibility sizes: `@Environment(\.dynamicTypeSize)` and `.isAccessibilitySize`, or `ViewThatFits`.

## Color and Dark Mode

- Semantic colors: `Color(.label)`, `.secondary`, `Color(.systemBackground)`, `Color(.secondarySystemBackground)`, `.tint`; UIKit `UIColor.label`, `.systemBackground`, `.systemBlue` etc.
- Asset catalog colors with Any/Dark and High Contrast variants for brand colors.
- Never hard-code `#000`/`#FFF` for text or backgrounds.

## SF Symbols and icons

- `Image(systemName:)`; `.symbolRenderingMode(.hierarchical | .palette | .multicolor)`; `.symbolVariant(.fill)`; `.imageScale`; match weight to adjacent text automatically by using the same font.
- Animations: `.symbolEffect(.bounce)`, `.pulse`, `.variableColor`, `.replace` transitions via `.contentTransition(.symbolEffect(.replace))`.
- App icon: Icon Composer `.icon` file in Xcode.

## Layout and safe areas

- Respect safe areas by default; use `.ignoresSafeArea()` only for backgrounds and full-bleed media.
- `.safeAreaInset(edge:)` / `.safeAreaPadding` for custom bars.
- Layout margins and readable content width for text on iPad/Mac.
- Size classes: `@Environment(\.horizontalSizeClass)`.

## Motion and haptics

- Springs: `.animation(.smooth)`, `.snappy`, `.bouncy`, `.spring(duration:bounce:)`; `withAnimation`. Fluid gesture physics: load the `apple-design` skill.
- Haptics: `.sensoryFeedback(.success, trigger:)` (also `.selection`, `.impact`, `.warning`, `.error`); UIKit `UIImpactFeedbackGenerator`, `UINotificationFeedbackGenerator`, `UISelectionFeedbackGenerator`; custom patterns with Core Haptics.

## Accessibility settings to read

| Setting | SwiftUI | UIKit |
|---|---|---|
| Reduce Motion | `@Environment(\.accessibilityReduceMotion)` | `UIAccessibility.isReduceMotionEnabled` |
| Reduce Transparency | `@Environment(\.accessibilityReduceTransparency)` | `UIAccessibility.isReduceTransparencyEnabled` |
| Increase Contrast | `@Environment(\.colorSchemeContrast)` | `UIAccessibility.isDarkerSystemColorsEnabled` |
| Bold Text | `@Environment(\.legibilityWeight)` | `UIAccessibility.isBoldTextEnabled` |
| Differentiate Without Color | `@Environment(\.accessibilityDifferentiateWithoutColor)` | `UIAccessibility.shouldDifferentiateWithoutColor` |
| Labels and traits | `.accessibilityLabel`, `.accessibilityHint`, `.accessibilityAddTraits`, `.accessibilityAction` | `accessibilityLabel`, `accessibilityTraits`, `accessibilityCustomActions` |

## React Native / Expo equivalents

Goal: the iOS build should feel native. Prefer components that render real UIKit views (they get Liquid Glass for free) over JS re-creations.

| HIG need | React Native / Expo |
|---|---|
| Native tab bar with glass, minimize, search tab | Expo Router native tabs (`expo-router` `NativeTabs`, backed by `react-native-screens`); check the installed SDK's docs for stability |
| Native stack, large titles, header search | `@react-navigation/native-stack` / Expo Router `Stack` (`headerLargeTitle`, `headerSearchBarOptions`, `headerTransparent` to let scroll edge effects show) |
| Sheets with detents | Expo Router / native-stack `presentation: 'formSheet'` with `sheetAllowedDetents`, `sheetGrabberVisible` |
| Liquid Glass on custom views | `expo-glass-effect` (`GlassView`, `GlassContainer`); fall back to `expo-blur` `BlurView` where glass is unavailable |
| Semantic colors | `PlatformColor('label')`, `PlatformColor('systemBackground')`, `DynamicColorIOS({ light, dark, highContrastLight, highContrastDark })` |
| Dark Mode | `useColorScheme()`; set `userInterfaceStyle: "automatic"` in app config |
| Dynamic Type | keep `allowFontScaling` on; cap only decorative text with `maxFontSizeMultiplier`; test at the largest accessibility size |
| SF Symbols | `expo-symbols` `SymbolView` (`name`, `type: 'hierarchical' | 'palette' | 'multicolor'`, `animationSpec`) |
| Haptics | `expo-haptics` (`selectionAsync`, `impactAsync`, `notificationAsync`) mapped to the HIG haptic meanings |
| Menus / context menus | native menu libraries (e.g. `@react-native-menu/menu`, `zeego`) rather than JS popovers |
| Reduce Motion / Transparency | `AccessibilityInfo.isReduceMotionEnabled()`, `isReduceTransparencyEnabled()`, Reanimated `useReducedMotion()` |
| Safe areas | `react-native-safe-area-context` |
| Hit targets | `hitSlop` to reach 44x44 pt without enlarging the visual |

Before adopting any library above, check it is in the project's `package.json` and matches the installed Expo SDK; follow the project's `rn-architecture-omega` skill for native-module changes.

## Web equivalents

| HIG need | Web |
|---|---|
| System font and text styles | `font-family: system-ui, -apple-system`; `font: -apple-system-body` (Safari) for Dynamic Type |
| Safe areas | `viewport-fit=cover` + `env(safe-area-inset-*)` |
| Materials | `backdrop-filter: blur() saturate()` with an opaque fallback under `@media (prefers-reduced-transparency: reduce)` |
| Dark Mode / contrast | `prefers-color-scheme`, `prefers-contrast: more`, `color-scheme: light dark` |
| Reduce Motion | `prefers-reduced-motion: reduce` |
| Hit targets | min 44x44 CSS px on touch |
| Motion physics | `apple-design` skill |
