# Implementation: from Material / Android rule to code

How to realize Material 3 and Android platform guidance in Jetpack Compose, Android Views, React Native / Expo and the web. Compose names come from the Material 3 Compose library and developer.android.com (see `io-design-sessions.md`, API map). Library names for React Native / Expo are ecosystem options: confirm each against the installed SDK before relying on it.

## Contents
1. Adoption order for an existing Android app
2. Theme: color, type, shape, motion
3. Edge-to-edge and insets
4. Navigation and adaptive layout
5. Back and predictive back
6. Presentation: dialogs, sheets, menus, snackbars
7. Typography and font scale
8. Icons
9. Motion and haptics
10. Accessibility settings to read
11. React Native / Expo equivalents
12. Web equivalents
13. Cross-platform: where iOS and Android intentionally differ

---

## Adoption order for an existing Android app

1. Target the current SDK and turn on edge-to-edge first; fix every overlap with insets before touching visuals (Android 15 enforces edge-to-edge for apps targeting SDK 35, Android 16 removes the opt-out). Details: `android-platform.md`, platform version table.
2. Move to Material 3 components (`androidx.compose.material3`) and a single `MaterialTheme` (or `MaterialExpressiveTheme`) with your color scheme, typography and shapes; delete hard-coded colors and dimensions.
3. Support dynamic color on Android 12+ where the brand allows it, keeping a static brand scheme as fallback.
4. Make navigation adaptive: navigation bar on compact, rail on medium and wider, chosen from the window size class. Replace navigation drawers with the expanded rail, bottom app bars with the docked toolbar, segmented buttons with connected button groups (M3 Expressive).
5. Opt in to predictive back and replace custom back interception with the supported callbacks.
6. Ship an adaptive icon with a monochrome layer for themed icons; check the splash screen.
7. Re-test: font scale 200%, TalkBack, Switch Access, keyboard and D-pad, dark theme, RTL, gesture navigation and 3-button navigation, compact phone, foldable (both postures), tablet, desktop window.

## Theme: color, type, shape, motion

| Need | Compose | Views |
|---|---|---|
| App theme | `MaterialTheme(colorScheme, typography, shapes)`; Expressive: `MaterialExpressiveTheme(..., motionScheme = MotionScheme.expressive())` | `Theme.Material3.DayNight` / `Theme.Material3.DynamicColors.DayNight` (MDC-Android) |
| Dynamic color (Android 12+) | `dynamicLightColorScheme(context)` / `dynamicDarkColorScheme(context)`, guarded by `Build.VERSION.SDK_INT >= 31` | `DynamicColors.applyToActivitiesIfAvailable(application)` |
| Static brand scheme | `lightColorScheme(...)` / `darkColorScheme(...)` generated with Material Theme Builder | color resources `md_theme_*` from Theme Builder |
| Read a role | `MaterialTheme.colorScheme.primary`, `.onPrimary`, `.surfaceContainer`... | `?attr/colorPrimary`, `?attr/colorSurfaceContainer` |
| Type | `MaterialTheme.typography.bodyLarge`, `.titleMedium`... (15 baseline styles + emphasized in Expressive) | `?attr/textAppearanceBodyLarge` |
| Shape | `MaterialTheme.shapes.medium`; shape morphing via `androidx.graphics.shapes` (`RoundedPolygon`, `Morph`) and `MaterialShapes` | `ShapeAppearance.Material3.*` |

Rules in code: always pair a container role with its `on` role; use `surfaceContainer*` roles for layered surfaces instead of elevation tints; never hard-code `Color.Black` / `Color.White` for text or backgrounds. Full role and token tables: `styles.md`.

## Edge-to-edge and insets

- Activity: `enableEdgeToEdge()` before `setContent` (Compose) or in `onCreate` (Views).
- Material 3 components such as `Scaffold`, `TopAppBar`, `NavigationBar`, `NavigationRail`, `ModalBottomSheet` handle their own insets; pass `innerPadding` from `Scaffold` to content.
- Custom UI: `Modifier.windowInsetsPadding(WindowInsets.safeDrawing)`, `.systemBarsPadding()`, `.imePadding()`, `.displayCutoutPadding()`; lists: `contentPadding` from `WindowInsets.systemBars.asPaddingValues()` so content scrolls behind bars.
- Views: `ViewCompat.setOnApplyWindowInsetsListener` with `WindowInsetsCompat.Type.systemBars()` / `.ime()` / `.displayCutout()`.
- Keep taps and drags out of `WindowInsets.systemGestures`; use `Modifier.systemGestureExclusion()` only for small, necessary regions.
- Translucent scrim behind 3-button navigation is the default; gesture navigation stays transparent.

## Navigation and adaptive layout

| Need | Compose |
|---|---|
| Window size class | `currentWindowAdaptiveInfo().windowSizeClass` (material3-adaptive); breakpoints in `device-specs.md` |
| Bar / rail switch automatically by window size | `NavigationSuiteScaffold` (material3-adaptive-navigation-suite) |
| List-detail | `ListDetailPaneScaffold` + `rememberListDetailPaneScaffoldNavigator()` |
| Supporting pane | `SupportingPaneScaffold` |
| Foldable posture and hinge | `currentWindowAdaptiveInfo().windowPosture`, Jetpack WindowManager `FoldingFeature` |
| Navigation | Navigation Compose (Navigation 3 where adopted) |

Rules in code: decide layout from window size, never from "is tablet"; keep state across configuration changes and resizes (`rememberSaveable`, ViewModel); do not lock orientation (Android 16 ignores orientation and resizability restrictions on large screens for apps targeting SDK 36).

## Back and predictive back

- Opt in: `android:enableOnBackInvokedCallback="true"` in the manifest. For apps targeting SDK 36 on Android 16+, predictive back animations are on by default and `onBackPressed` / `KEYCODE_BACK` no longer fire; setting the attribute to `false` is only a temporary opt-out.
- Compose: `BackHandler` for simple interception, `PredictiveBackHandler { progress -> }` to animate with the gesture; Material 3 components (sheets, search, drawer) already animate.
- Views: `OnBackPressedDispatcher` with `OnBackPressedCallback`; `onBackPressed()` is deprecated and does not run with predictive back.
- Never trap the user: back from the start destination leaves the app (back-to-home animation).

## Presentation: dialogs, sheets, menus, snackbars

- Dialogs: `AlertDialog(onDismissRequest, confirmButton, dismissButton, title, text)`; full-screen dialog on compact for complex input.
- Bottom sheet: `ModalBottomSheet` with `rememberModalBottomSheetState()`; standard sheet via `BottomSheetScaffold`; side sheet on expanded widths.
- Menus: `DropdownMenu` / `ExposedDropdownMenuBox`; Expressive menu groups where available.
- Snackbar: `SnackbarHost` in `Scaffold`, `snackbarHostState.showSnackbar(message, actionLabel)`; one at a time, no critical info only in a snackbar.
- Confirmation of destructive action: dialog with the destructive verb as the confirm label; prefer undo via snackbar when the action is reversible.

## Typography and font scale

- Sizes in `sp`, never `dp` for text; let text scale to 200% (Android 14+ nonlinear font scaling).
- Do not fix container heights around text; use `minHeight` and allow wrapping.
- Custom fonts: `FontFamily(Font(R.font.x))` or downloadable Google Fonts; variable fonts via `FontVariation.Settings`.
- Test with `fontScale = 2f` in previews (`@Preview(fontScale = 2f)`).

## Icons

- Material Symbols (outlined / rounded / sharp, variable fill, weight, grade, optical size); Compose `Icons.*` from material-icons-extended or vector drawables exported from Material Symbols.
- 24dp default icon size, 48dp touch target around it (`IconButton` provides this).
- App icon: adaptive icon (foreground, background, monochrome layers). Specs: `device-specs.md`.

## Motion and haptics

- Use the theme's `MotionScheme` springs (`MaterialTheme.motionScheme.defaultSpatialSpec()`, `fastEffectsSpec()` ...) instead of hand-picked durations in Expressive apps; `spring(dampingRatio, stiffness)` otherwise.
- Shared element transitions: `SharedTransitionLayout` + `Modifier.sharedElement()`; container transform for list to detail.
- Respect animator duration scale and "Remove animations" (`Settings.Global.ANIMATOR_DURATION_SCALE`, Compose honors it for most animation APIs).
- Haptics: `LocalHapticFeedback.current.performHapticFeedback(HapticFeedbackType.*)` or `View.performHapticFeedback(HapticFeedbackConstants.CONFIRM | REJECT | CLOCK_TICK | ...)`; prefer semantic constants over raw vibration. Rules: `android-platform.md`, Haptics.

## Accessibility settings to read

| Setting | Compose / Android API |
|---|---|
| Font scale | `LocalDensity.current.fontScale`; `Configuration.fontScale` |
| Remove animations | `ANIMATOR_DURATION_SCALE == 0` |
| High contrast text | `AccessibilityManager` (`isHighTextContrastEnabled` is hidden; design for 4.5:1 regardless) |
| Contrast level (Android 14+) | `UiModeManager.getContrast()`; Material color schemes have medium and high contrast variants |
| Dark theme | `isSystemInDarkTheme()` |
| TalkBack labels | `Modifier.semantics { contentDescription = ...; role = Role.Button }`, `Modifier.clearAndSetSemantics`, `mergeDescendants = true` for rows |
| Custom actions | `semantics { customActions = listOf(CustomAccessibilityAction(label) { ... }) }` for swipe-only actions |
| Headings and traversal | `semantics { heading() }`, `isTraversalGroup`, `traversalIndex` |
| Touch target | `Modifier.minimumInteractiveComponentSize()` (48dp) |

## React Native / Expo equivalents

Goal: the Android build should feel native, with the same brand as iOS. Prefer components that render real Android views over JS re-creations. Check the project's `package.json` and installed Expo SDK first, and follow the `rn-architecture-omega` skill for native-module changes.

| Android / Material need | React Native / Expo |
|---|---|
| Edge-to-edge | Recent Expo SDKs run Android apps edge-to-edge by default; handle insets with `react-native-safe-area-context` (`useSafeAreaInsets`, `SafeAreaView edges`) on every screen, including the bottom edge for gesture navigation |
| System bar icon colors | `expo-status-bar` `style="auto"`; `expo-navigation-bar` for button style; keep bars transparent |
| Predictive back | Expo app config `android.predictiveBackGestureEnabled` (check the SDK version supports it); React Navigation / Expo Router native stack handles back; avoid `BackHandler` that blocks the gesture without UI feedback |
| Native bottom navigation | Expo Router native tabs (`NativeTabs`, backed by `react-native-screens`) render a Material bottom navigation on Android; check stability for the installed SDK |
| Native Material 3 components | `@expo/ui/jetpack-compose` exposes Compose Material 3 components (check maturity per SDK); otherwise `react-native-paper` v5 implements Material 3 in JS |
| Dynamic color | `PlatformColor('@android:color/system_accent1_500')` style system colors on Android 12+, or Material You helpers from the chosen UI kit |
| Dark theme | `useColorScheme()`; `userInterfaceStyle: "automatic"` in app config; `expo-system-ui` for root background to avoid white flashes |
| Font scale | keep `allowFontScaling`; cap only decorative text with `maxFontSizeMultiplier`; test at 200% |
| Ripple feedback | `Pressable android_ripple={{ color, borderless, foreground }}` |
| Haptics | `expo-haptics` (`performAndroidHapticsAsync` with Android haptic types where available, else `impactAsync` / `selectionAsync`) |
| Touch targets | `hitSlop` to reach 48x48 dp without enlarging the visual |
| Adaptive icon + themed icon | app config `android.adaptiveIcon` with `foregroundImage`, `backgroundImage` (or `backgroundColor`) and `monochromeImage` |
| Splash screen | `expo-splash-screen` config (icon + background color; Android 12+ shows the icon in a circle mask) |
| Large screens | do not lock `orientation` in app config for tablets; read `useWindowDimensions()` and switch layout at 600dp / 840dp |
| Reduce motion | `AccessibilityInfo.isReduceMotionEnabled()` (maps to Remove animations), Reanimated `useReducedMotion()` |
| TalkBack | `accessibilityLabel`, `accessibilityRole`, `accessibilityActions`, `importantForAccessibility` |

## Web equivalents

| Need | Web |
|---|---|
| Material 3 components | Material Web (`@material/web`, maintenance mode) or a Material 3 CSS token set from Material Theme Builder |
| Color roles | CSS custom properties `--md-sys-color-*` exported from Theme Builder |
| Type scale | `--md-sys-typescale-*`; Roboto Flex / Google Sans Flex via Google Fonts |
| Safe areas on Android Chrome | `viewport-fit=cover` + `env(safe-area-inset-*)`; `interactive-widget=resizes-content` for the keyboard |
| Dark theme / contrast | `prefers-color-scheme`, `prefers-contrast` |
| Reduce motion | `prefers-reduced-motion: reduce` |
| Touch targets | at least 48x48 CSS px |
| Breakpoints | 600, 840, 1200, 1600 px matching window size classes |

## Cross-platform: where iOS and Android intentionally differ

Keep brand identity shared (content layer: imagery, color accents, type for headlines, illustrations) and platform behavior native (functional layer). Pair this table with `apple-hig` `references/implementation.md`.

| Topic | iOS (HIG) | Android (Material / platform) |
|---|---|---|
| Back | Leading back button + edge swipe | System back gesture / button, predictive back; top app bar up arrow optional |
| Top-level navigation | Tab bar | Navigation bar (compact), navigation rail (medium+, expanded rail for many destinations; drawer no longer recommended) |
| Primary action | Toolbar button or prominent button | FAB / extended FAB or button group in a toolbar |
| Title alignment | Large title, leading | Small top app bar title leading (center-aligned optional); large and medium flexible app bars |
| Bars | Liquid Glass floating bars | Opaque surface containers, edge-to-edge content under system bars |
| Sheets | Detented sheets | Bottom sheets (compact), side sheets (expanded) |
| Alerts | Alert with stacked or side-by-side buttons, cancel leading | Dialog with text buttons trailing, confirm at the end |
| Feedback on press | Highlight / dim | Ripple and state layers |
| Toast-like messages | No system equivalent; use inline or banners | Snackbar (with optional action) |
| Icons | SF Symbols | Material Symbols |
| Type | SF Pro, Dynamic Type text styles | Roboto / Roboto Flex or brand font, M3 type scale in sp |
| Touch target | 44x44 pt | 48x48 dp |
| Settings | Settings app bundle or in-app | In-app settings screen, per-app language in system settings |
| Haptics | Rich Core Haptics | Semantic `HapticFeedbackConstants`, device-dependent quality |
