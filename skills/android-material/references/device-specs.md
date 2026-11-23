# Android & Material 3: Device specs and numbers sheet

Distilled from m3.material.io and developer.android.com, plus the Google Play preview assets help page (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

## Contents

1. [Window size classes and breakpoints](#window-size-classes-and-breakpoints)
2. [Units and density buckets](#units-and-density-buckets)
3. [Touch and pointer targets](#touch-and-pointer-targets)
4. [App icons](#app-icons)
5. [Splash screen](#splash-screen)
6. [Google Play store listing graphics](#google-play-store-listing-graphics)
7. [Widget sizes](#widget-sizes)
8. [Recommended test device matrix](#recommended-test-device-matrix)

---

## Window size classes and breakpoints

Source: https://m3.material.io/foundations/layout/breakpoints
Source: https://developer.android.com/develop/ui/compose/layouts/adaptive/use-window-size-classes

Width and height are classified separately; width matters most because content usually scrolls vertically. Classes describe the app window, never the device (no `isTablet` logic); they change at runtime (rotation, fold, split-screen, desktop resize).

### Width

| Class | Range (dp) | Typical devices | Panes | Navigation | Margins / spacer |
|---|---|---|---|---|---|
| Compact | < 600 | 99.96% of phones in portrait | 1 | Navigation bar or modal expanded rail | 16 dp margins |
| Medium | 600 to 839 | 93.73% of tablets in portrait; unfolded foldables in portrait | 1 (recommended) or 2 (low density content, 50/50 split) | Rail for single pane; nav bar with two panes | 24 dp margins, 24 dp spacer |
| Expanded | 840 to 1199 | 97.22% of tablets in landscape; unfolded foldables in landscape; phones in landscape; desktop | 1 or 2 (recommended) | Collapsed or expanded rail (modal or standard) | 24 dp, 24 dp; fixed pane 360 dp |
| Large | 1200 to 1599 | Large tablets, desktop | 1 or 2 (recommended) | Collapsed or expanded rail | 24 dp, 24 dp; fixed pane 412 dp |
| Extra-large | >= 1600 | Desktop, ultrawide monitors | 1 to 3 (third = standard side sheet, max 400 dp wide) | Expanded rail suits best | 24 dp, 24 dp; fixed pane 412 dp; never more than 3 panes |

### Height

| Class | Range (dp) | Typical devices |
|---|---|---|
| Compact | < 480 | 99.78% of phones in landscape |
| Medium | 480 to 899 | 96.56% of tablets in landscape, 97.59% of phones in portrait |
| Expanded | >= 900 | 94.25% of tablets in portrait |

- Check height for phones or open flippables in landscape: width is medium but height compact, so two panes are impractical.
- Compose: `currentWindowAdaptiveInfo(supportLargeAndXLargeWidth = true).windowSizeClass` (library `androidx.compose.material3.adaptive`); test with `isHeightAtLeastBreakpoint(WindowSizeClass.HEIGHT_DP_MEDIUM_LOWER_BOUND)` and the width equivalents. Large and extra-large need the `supportLargeAndXLargeWidth` flag.
- Optimize compact first if it exists, then expanded (most room), then medium.
- Keep text lines at 40 to 60 characters across breakpoints (M3); the core quality check accepts 45 to 75 characters.
- Reachability on landscape tablets and unfolded foldables: the top 25% of the screen is hard to reach; also avoid essential controls hugging the bottom edge.
- Wear OS: screens start at **192 dp**; design breakpoint at **225 dp**.

---

## Units and density buckets

Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/grids-and-units
Source: https://developer.android.com/design/ui/mobile/guides/layout-and-content/images-graphics

- 1 dp = 1 px on a **160 dpi** (mdpi) screen. `dp = px x 160 / dpi`.
- Fonts always in **sp** (scales with the user font setting); spec everything else in dp.
- Layout grid: **8 dp**; small elements such as icons align to **4 dp**.
- `nodpi` and `anydpi` buckets do not scale; used for vector drawables.

| Bucket | Scale | Approx dpi | 24 dp icon | 48 dp target |
|---|---|---|---|---|
| mdpi | x1 | 160 | 24 px | 48 px |
| hdpi | x1.5 | 240 | 36 px | 72 px |
| xhdpi | x2 | 320 | 48 px | 96 px |
| xxhdpi | x3 | 480 | 72 px | 144 px |
| xxxhdpi | x4 | 640 | 96 px | 192 px |

(Pixel columns are computed from the scale factors; inference.)

- Export assets in lowercase names; simple art as SVG (convert to Vector Drawable), photos as WebP, PNG or JPG at every bucket. Vectors need no per-density export.
- TV example from the TV icon guidelines (https://developer.android.com/design/ui/tv/guides/system/tv-app-icon-guidelines): banner 160x90 / 240x135 / 320x180 / 480x270 / 640x360 px and app icon 80 / 120 / 160 / 240 / 320 px square for mdpi to xxxhdpi.

---

## Touch and pointer targets

Source: https://m3.material.io/foundations/designing

| Context | Minimum | Source |
|---|---|---|
| Touch target (phone, tablet) | **48 x 48 dp** (about 9 mm; 7 to 10 mm recommended); visual icon may be 24 x 24 dp inside it | M3; Core `Touch_Target_Size`; Adaptive `Touch_Targets` |
| Spacing between targets | **8 dp** or more | M3 |
| Pointer target (mouse, stylus) | **44 x 44 dp** | M3 |
| State layer vs target | State layer 40 dp, target 48 dp | M3 |
| Wear OS | **48 x 48 dp** | Wear `WO-V2` |
| Car (video, games, browsers, Tier 1) | **64 dp**, 24 dp apart, 24 dp from edges; text **24 sp** | Car `UX-1` to `UX-3` |
| Android XR (Jetpack XR) | 48 x 48 dp min, **56 x 56 dp** recommended; in meters: distance x 0.868 x 48 (min) or x 56 (recommended) | XR immersive |
| Widgets | 48 x 48 dp at the minimum widget size | Widget `WL-4.2` |
| iOS comparison | 44 x 44 pt | M3 note |

Other text minimums: Wear essential text 12 sp, non-essential 10 sp.

---

## App icons

Source: https://developer.android.com/develop/ui/views/launch/icon_design_adaptive

### Adaptive launcher icon (`AdaptiveIconDrawable`, `res/mipmap-anydpi-v26/ic_launcher.xml`)

| Element | Size |
|---|---|
| Each layer (foreground, background, monochrome) | **108 x 108 dp** |
| Visible masked viewport | inner **72 x 72 dp** (two thirds; inference from the 432/288 AVD ratio and 18 dp margins) |
| Safe zone never clipped by any OEM mask | inner **66 x 66 dp** |
| Logo | at least **48 x 48 dp**, at most **66 x 66 dp** |
| Reserved margin for masks and parallax/pulse effects | outer **18 dp** on each side |

- Two color layers required (vectors preferred); no masks or shadows baked into layers.
- `<monochrome>` layer enables themed icons (Android 13 / API 33+). From Android 16 QPR 2 the system auto-themes icons of apps that provide none.
- Wrap a drawable in `<inset android:inset*="18dp">` to reuse it for shortcuts.

### Google Play icon

Source: Play Console Help, "Add preview assets to showcase your app" https://support.google.com/googleplay/android-developer/answer/9866151

| Spec | Value |
|---|---|
| Format | 32-bit PNG with alpha |
| Size | **512 x 512 px** |
| Max file size | **1024 KB** |
| Content | No badges or text implying rank, price or category |

### Other platforms

| Asset | Size |
|---|---|
| TV banner (launcher) | 320 x 180 px at xhdpi, must include the app name (`TV-LB`, `TV-BN`) |
| TV app icon | at least 160 x 160 px at xhdpi |
| TV Play banner | 1280 x 720 px, JPEG or 24-bit PNG, no alpha |
| Wear splash icon | 48 x 48 dp on black, same as launcher icon (`WO-V15`) |

---

## Splash screen

Source: https://developer.android.com/develop/ui/views/launch/splash-screen

Android 12+ shows a system splash on cold and warm starts. Use `androidx.core:core-splashscreen` (`Theme.SplashScreen`, `postSplashScreenTheme`, `installSplashScreen()` before `super.onCreate()`).

| Element | Size |
|---|---|
| App icon with icon background | **240 x 240 dp**, content within a **160 dp** circle |
| App icon without background | **288 x 288 dp**, content within a **192 dp** circle |
| Branding image (discouraged) | **200 x 80 dp** |
| Animated (AVD) icon area | **432 dp** (4 x 108 dp); visible inner **288 dp** (4 x 72 dp) |
| Animation duration | at most **1,000 ms** recommended on phones; delayed start at most **166 ms**; loop if startup exceeds 1,000 ms |

- Rule of thumb: content fits a circle two thirds of the icon area (a 300 dp image needs content inside 200 dp).
- Theme attributes: `windowSplashScreenBackground`, `windowSplashScreenAnimatedIcon`, `windowSplashScreenAnimationDuration` (API 31/32 only; inferred from the AVD on 13+), `windowSplashScreenIconBackgroundColor`, `windowSplashScreenBrandingImage`, `windowSplashScreenBehavior`.

---

## Google Play store listing graphics

Source: Play Console Help, "Add preview assets to showcase your app" https://support.google.com/googleplay/android-developer/answer/9866151

"Requirements" are mandatory (removal or suspension risk); "highly recommended" items gate promotion and featuring.

| Asset | Requirement |
|---|---|
| App icon | 512 x 512 px, 32-bit PNG with alpha, max 1024 KB |
| Short description | Max **80** characters; no ranking, price, "Best", "#1", "Free", CTAs, emojis, keyword stuffing, emphasis caps |
| Feature graphic | **1024 x 500 px**, JPEG or 24-bit PNG, no alpha. Keep focal content centered away from cutoff zones; no device imagery, store badges, ranking claims; avoid pure white, black or dark gray backgrounds |
| Alt text | Each graphic and screenshot, max **140** characters, no "image of" |
| Screenshots (all) | At least **2** across device types to publish; up to **8** per device type; JPEG or 24-bit PNG, no alpha; sides 320 to 3,840 px; phone/tablet longest side at most **2.3x** the shortest |
| Preview video | One YouTube URL (no playlist, no timecode params); public or unlisted, ads off, not age restricted, embeddable; autoplays muted up to **30 s**; show real use in the first **10 s**, at least **80%** real experience |

### Screenshots per device type

| Device type | Count | Size (px) | Aspect ratio |
|---|---|---|---|
| Phone | 2 to 8, up to 8 MB each | sides 320 to 3,840 | 9:16 portrait and/or 16:9 landscape |
| Phone, eligible for recommendation formats | at least 4 (apps); at least 3 (games, gameplay) | min 1080 x 1920 portrait or 1920 x 1080 landscape | 9:16 or 16:9 |
| Tablet (7" and 10") and Chromebook | at least 4 | sides 1,080 to 7,680 | 16:9 landscape, 9:16 portrait |
| Foldable | 3 to 8, up to 8 MB each | sides 960 to 3,840 | Apps: at least one 1:1 inner, one 4:3 landscape inner, one 10:16 portrait outer. Games: 4:3 or 3:4 inner plus 16:10 or 10:16 outer. Up to 5 extra in 4:3, 3:4, 16:10, 10:16, 1:1, 16:9, 9:16 |
| Wear OS app / watch face | at least 1 | min 384 x 384 | 1:1, no frames, no transparency or masking |
| Android TV | at least 1, plus TV banner 1280 x 720 | n/a | n/a |
| Android Automotive OS | at least 2 portrait + 2 landscape when provided (required for non-parked categories) | 800 x 1,280 portrait; 1,024 x 768 landscape | generic system UI only |
| Android XR | 4 to 8, up to 8 MB each | 3840 x 2400 recommended, min 1920 x 1200 | 8:5 |

- Foldable emulator profiles for capture: "Foldable (1:1 inner display)" and "Foldable (4:3 inner display)". AAOS: "Automotive (1024p landscape)" and "Automotive Portrait" on a generic system image.
- Taglines at most **20%** of a screenshot; prioritize real UI in the first 3; clean status bar (full battery, Wi-Fi, signal, no notifications).
- XR: optional spatial video (360, 180 or 3D) and non-spatial XR video in addition to the preview video.

---

## Widget sizes

Source: https://developer.android.com/design/ui/mobile/guides/widgets/sizing
Source: https://developer.android.com/docs/quality-guidelines/widget-quality

- Cell sizes vary per device and orientation: design resizable, breakpoint-based widgets and set `targetCellWidth` / `targetCellHeight` for handheld and tablet so the picker places them correctly.
- Fill the grid cell bounds edge to edge, no custom padding; non-rectangular shapes touch at least 2 opposing edges (Tier 2) or all 4 (Tier 1).

| Spec | Value |
|---|---|
| Tier 1 sizes | 2x1 plus at least two of 1x1, 2x2, 4x2, 4x4 |
| Exception | 4x1 search bar may touch only 2 edges |
| Minimum size | Shows a clear use case and 48 x 48 dp targets |
| Corner radius | System (OEM) provided |

Cell to dp mapping:

Source: https://developer.android.com/develop/ui/views/appwidgets/layouts ("Determine a size for your widget"). Measured on a Pixel 4 with a 5x4 grid; cell sizes and margins vary by device and launcher, so use these as minimum-size estimates.

| Cells (w x h) | Portrait (dp) | Landscape (dp) |
|---|---|---|
| 1x1 | 57 x 102 | 127 x 51 |
| 2x1 | 130 x 102 | 269 x 51 |
| 3x1 | 203 x 102 | 412 x 51 |
| 4x1 | 276 x 102 | 554 x 51 |
| 5x1 | 349 x 102 | 697 x 51 |
| 5x2 | 349 x 220 | 697 x 117 |
| 5x3 | 349 x 337 | 697 x 184 |
| 5x4 | 349 x 455 | 697 x 250 |
| n x m | (73n - 16) x (118m - 16) | (142n - 15) x (66m - 15) |

---

## Recommended test device matrix

Sources: https://developer.android.com/docs/quality-guidelines/core-app-quality , https://developer.android.com/docs/quality-guidelines/adaptive-app-quality , https://developer.android.com/docs/quality-guidelines/wear-app-quality

Officially named test targets: foldable 841 x 701 dp, 8" tablet 1024 x 640 dp, 10.5" tablet 1280 x 800 dp, 13" Chromebook 1600 x 900 dp, Googlebook (160 ppi); emulators Pixel Fold, Medium Tablet, Desktop (Preview), resizable emulator, Pixel C 9.94" (2,560 x 1,800 px), 7.6" fold-in; Wear small round 192 dp and large round 227 dp. Always include the latest Android release.

The matrix below combines those with the window size classes (inference):

| Slot | Example config | Width class / height class | What to check |
|---|---|---|---|
| Compact phone, portrait | about 360 to 412 dp wide phone emulator | Compact / Medium | Baseline layout, 48 dp targets, font scale 200% |
| Compact phone, landscape | same, rotated | Medium or Expanded / **Compact** | No two-pane in compact height, insets, state across rotation |
| Foldable outer then inner | Pixel Fold emulator; inner about 841 x 701 dp | Compact to Medium/Expanded | Fold/unfold continuity, tabletop and book postures, no letterboxing |
| Tablet portrait | Medium Tablet, 8" 1024 x 640 dp | Medium / Expanded | Nav rail, single pane, max-width sheets and buttons |
| Tablet landscape | 10.5" 1280 x 800 dp | Large / Medium | List-detail two pane, keyboard and mouse |
| Split-screen on tablet | half of a landscape tablet | Compact or Medium | Multi-resume, resize, camera/mic loss |
| Desktop window | Desktop (Preview), 13" 1600 x 900 dp, freely resized | Expanded to Extra-large | Hover, context menus, shortcuts, Esc, scrollbars, cursors, three panes |
| Wear (if shipped) | 192 dp and 227 dp round | n/a | 225 dp breakpoint, 12 sp text, swipe to dismiss |
