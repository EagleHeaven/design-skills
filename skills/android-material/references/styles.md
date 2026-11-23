# Android & Material 3: Styles

Distilled from m3.material.io (Styles section), developer.android.com design guides and Compose / Views theming docs (state as of Nov 2026, M3 Expressive era). Rules are paraphrased; follow the source links for the authoritative text.

## Contents

1. [Color system](#color-system)
2. [Color roles](#color-roles)
3. [Choosing a color scheme](#choosing-a-color-scheme)
4. [Dynamic color](#dynamic-color)
5. [Static color schemes](#static-color-schemes)
6. [Advanced color customizations](#advanced-color-customizations)
7. [Color resources](#color-resources)
8. [Android color for mobile design](#android-color-for-mobile-design)
9. [Themes](#themes)
10. [Dark theme (implementation)](#dark-theme-implementation)
11. [Elevation](#elevation)
12. [Icons (Material Symbols)](#icons-material-symbols)
13. [Motion physics system (springs)](#motion-physics-system-springs)
14. [Easing and duration (legacy motion)](#easing-and-duration-legacy-motion)
15. [Transitions](#transitions)
16. [Shape](#shape)
17. [Spacing](#spacing)
18. [Typography](#typography)
19. [Fonts in Compose](#fonts-in-compose)
20. [Material 3 theming in Compose](#material-3-theming-in-compose)
21. [Quick reference: style tokens](#quick-reference-style-tokens)

---

## Color system

Source: https://m3.material.io/styles/color/system

What the system provides: accessible color relationships built in, 26+ color roles mapped to Material Components, built-in dark theme colors, a static baseline scheme, and dynamic color (user-generated from wallpaper, or content-based from in-app imagery). Dynamic color gives personalized UI, accessible contrast, user-controlled contrast and automatic dark theme.

### What's new (timeline)

| Date | Change |
|---|---|
| May 2025 (M3 Expressive) | Color roles support three contrast levels (standard, medium, high); contrast is tokenized |
| Aug 2024 | Light theme: on primary container, on secondary container, on tertiary container, on error container made more colorful while keeping accessible contrast. Affects badges, buttons, extended FAB, FAB, icon buttons, segmented buttons, chips, lists, menus, navigation bar / drawer / rail, switches, toolbars |
| Oct 2023 | Guidelines reorganized (how the system works, advanced customizations, resources); same system |
| Feb 2023 | Tone-based surface roles replace the old surface +1 to +5 elevation overlays. Default light surface moved from tone 99 to tone 98; neutral palette chroma raised from 4 to 6; dark theme surfaces slightly darkened |
| Feb 2023 | Fixed accent colors added (primary / secondary / tertiary fixed) that stay the same in light and dark |

### How it works ("paint by number")
- Every UI element is assigned a color role (the "number"); each role gets a color. Pick colors by hand (static) or let the dynamic system generate the whole scheme from one source color. If the source changes, product colors update.
- Customize dynamic color by: setting the source, adding static or harmonized colors, remapping roles to elements.

### Generation pipeline

| Step | What happens |
|---|---|
| 1. Source color | (A) from wallpaper via quantization, (B) from in-app content (album art, logo, video preview) via quantization, or (C) hand-picked (the baseline scheme uses a hand-picked source) |
| 2. Algorithm | Material Color Utilities (MCU). Common algorithms: user-generated (wallpaper), content-based (tones adjusted to match image while keeping contrast), custom colors (stay close to input, for brand or semantic meaning) |
| 3. Key colors | 5 key colors derived by manipulating hue and chroma: primary, secondary, tertiary, neutral, neutral variant |
| 4. Tonal palettes | One palette per key color, tones 0 to 100 in steps of 10 plus 95, 98, 99 (some palettes have more). Compose docs describe 13 tones per palette |
| 5. Tone to role | Accessible tones assigned to the 26 standard roles for light and dark. Example: primary role = primary40, on primary = primary100 (light) |
| 6. Apply | Roles already mapped to components; a new source recolors the UI |

### Contrast levels
- Three levels: Standard (default), Medium, High. Applied automatically to both light and dark themes. Standard keeps hierarchy via high and low contrast elements; medium and high help people with low vision.
- Custom components get contrast support for free only if they use proper role pairs (for example primary container with on primary container) via tokens.

### Accessible tone pairing
- Tone determines contrast. The algorithms pair a dark container tone with a light label tone for at least 3:1; tones further apart reach 7:1 (this powers user-controlled contrast).
- Chroma can rise or fall at some tones because some hue/chroma/tone combinations cannot physically exist (no bright light blue or bright light red).

### HCT color space

| Dimension | Range | Notes |
|---|---|---|
| Hue | 0 to 360 (circular, 0 = 360) | Perceived color family |
| Chroma | 0 (gray) to unbounded, practical max about 120 | Max chroma differs by hue and tone |
| Tone | 0 (black) to 100 (white) | Luminance; drives contrast |

- HCT changes hue and chroma without changing tone, unlike HSL or RGB.
- Do not conflate HCT with HSL: equal perceived brightness gives equal HCT tone but can give different HSL lightness.

---

## Color roles

Source: https://m3.material.io/styles/color/roles

26 standard roles in six groups (primary, secondary, tertiary, error, surface, outline), plus add-on roles. Roles map to components, guarantee accessible pairs (minimum 3:1), and are implemented as tokens.

### Naming vocabulary

| Term | Meaning |
|---|---|
| Surface | Backgrounds and large low-emphasis areas |
| Primary / Secondary / Tertiary | Accent roles to emphasize or de-emphasize foreground elements |
| Container | Fill for foreground elements like buttons. Never use for text or icons |
| On | Text/icons on top of the paired parent color (on primary sits on primary) |
| Variant | Lower-emphasis alternative of the non-variant role (outline variant vs outline) |

- Apply colors only in the intended pairs or layering orders. Wrong pairs break contrast, especially when user-controlled contrast or dynamic color shifts tones.

### Accent emphasis
- Primary: important actions needing most emphasis (FAB to start a message, high-emphasis buttons, active states).
- Secondary: elements needing less attention (selected nav icon state, dismissive button, filter chips).
- Tertiary: smaller elements needing special emphasis but not immediate attention (badge, notification, input field accents). Used at the designer's discretion for broader color expression.
- Be careful changing roles purely for visual effect.

### All standard roles

| Group | Role | Use / pairing |
|---|---|---|
| Primary | primary | High-emphasis fills, text and icons against surface |
| | on primary | Text and icons on primary |
| | primary container | Standout fill against surface for key components (FAB) |
| | on primary container | Text and icons on primary container |
| Secondary | secondary | Less prominent fills, text, icons against surface |
| | on secondary | Text and icons on secondary |
| | secondary container | Less prominent fill for recessive components (tonal buttons) |
| | on secondary container | Text and icons on secondary container |
| Tertiary | tertiary | Complementary fills, text, icons against surface |
| | on tertiary | Text and icons on tertiary |
| | tertiary container | Complementary container against surface (input fields) |
| | on tertiary container | Text and icons on tertiary container |
| Error | error | Attention-grabbing fills, icons, text signalling urgency |
| | on error | Text and icons on error |
| | error container | Attention-grabbing fill against surface |
| | on error container | Text and icons on error container |
| Surface | surface | Default background |
| | on surface | Text/icons on any surface or surface container |
| | on surface variant | Lower-emphasis text/icons on any surface or surface container |
| | surface container lowest | Lowest-emphasis container |
| | surface container low | Low-emphasis container |
| | surface container | Default container (for example navigation areas) |
| | surface container high | High-emphasis container |
| | surface container highest | Highest-emphasis container |
| Inverse | inverse surface | Fill for elements that contrast against surface (snackbar-style) |
| | inverse on surface | Text and icons on inverse surface |
| | inverse primary | Actionable elements (text buttons) on inverse surface |
| Outline | outline | Important boundaries (text field outline) |
| | outline variant | Decorative elements (dividers), or when other elements already give 4.5:1 |

- Error roles are static by default in every dynamic scheme (they do not follow the source color) but still adapt to light and dark.
- Common surface pattern: surface for body background, surface container for the navigation area. Text and icons use on surface / on surface variant on all surfaces.
- Keep surface mappings identical for a layout region across breakpoints (body = surface, nav = surface container on phone and tablet).
- The five surface container levels mainly help hierarchy and nested containers on expanded windows. Neutral components (navigation bars, menus, dialogs) map to specific surface containers by default and may be remapped.

Outline don'ts: outline for dividers (use outline variant); outline on cards; outline variant for input chips and filter chips (they need outline).

### Add-on roles (most products do not need them)

| Role | Use |
|---|---|
| primary fixed / secondary fixed / tertiary fixed | Fills against surface that keep the same tone in light and dark (containers change tone). Use instead of container when fixed behavior is wanted |
| primary fixed dim / secondary fixed dim / tertiary fixed dim | Stronger, deeper tone with the same fixed behavior |
| on primary fixed (etc.) | Text/icons on the fixed color |
| on primary fixed variant (etc.) | Lower-emphasis text/icons on the fixed color |
| surface dim | Dimmest surface in both light and dark |
| surface bright | Brightest surface in both light and dark |

- Surface flips brightness between themes (brightest in light, dimmest in dark); surface bright and surface dim keep their relative brightness in both themes.
- Don't use primary fixed as a button fill on a surface background (a permission screen CTA should use primary).

### Tone assignments per role (standard contrast)

The fetched page text only states primary = tone 40 and on primary = tone 100 in light. The full mapping below matches the Compose baseline scheme tokens ColorLightTokens / ColorDarkTokens (Compose M3 token); see tokens.md. The Compose tokens still map on primary container / on secondary container / on tertiary container / on error container to tone 10 in light, so the Aug 2024 raise toward tone 30 applies to Material Color Utilities dynamic schemes only. P = primary palette (same pattern for secondary S, tertiary T, error E), N = neutral, NV = neutral variant.

| Role | Light tone | Dark tone |
|---|---|---|
| primary | P40 | P80 |
| on primary | P100 | P20 |
| primary container | P90 | P30 |
| on primary container | P10 (raised toward P30 by the Aug 2024 "more colorful" update) | P90 |
| secondary / on / container / on container | S40 / S100 / S90 / S10 (same Aug 2024 note) | S80 / S20 / S30 / S90 |
| tertiary / on / container / on container | T40 / T100 / T90 / T10 (same note) | T80 / T20 / T30 / T90 |
| error / on / container / on container | E40 / E100 / E90 / E10 (same note) | E80 / E20 / E30 / E90 |
| surface (and background) | N98 | N6 |
| surface dim | N87 | N6 |
| surface bright | N98 | N24 |
| surface container lowest | N100 | N4 |
| surface container low | N96 | N10 |
| surface container | N94 | N12 |
| surface container high | N92 | N17 |
| surface container highest | N90 | N22 |
| on surface | N10 | N90 |
| surface variant | NV90 | NV30 |
| on surface variant | NV30 | NV80 |
| outline | NV50 | NV60 |
| outline variant | NV80 | NV30 |
| inverse surface | N20 | N90 |
| inverse on surface | N95 | N20 |
| inverse primary | P80 | P40 |
| primary fixed / fixed dim | P90 / P80 | P90 / P80 |
| on primary fixed / on primary fixed variant | P10 / P30 | P10 / P30 |
| scrim, shadow | N0 | N0 |

---

## Choosing a color scheme

Source: https://m3.material.io/styles/color/choosing-a-scheme

A color scheme = all of a product's colors, roles and relationships across light and dark. Two kinds: static and dynamic.

| | Static (baseline or brand) | Dynamic |
|---|---|---|
| Accessible colors | Yes | Yes |
| Personalized (wallpaper / content) | No | Yes |
| User-controlled contrast | No | Yes |
| Same colors on every device | Yes | No |
| Other gains | Pre-made baseline; won't break an M2 app; easy to move to dynamic later | Advanced customizations such as color fidelity |

Use static (baseline) when:
- You are not ready for dynamic color (switching later is easy).
- Migrating from M2 and want M3 features without breaking the app.
- Enterprise users who gain nothing from personalization or contrast controls.
- The product is built for iOS.

Use dynamic when:
- You want to showcase personalization, colors from wallpaper or content, or user-controlled contrast.
- You are unsure whether you'll mix dynamic and static (static colors can be added later).
- Design first with the baseline scheme to get role mapping right, then test mocks across many source colors in Material Theme Builder.

---

## Dynamic color

Source: https://m3.material.io/styles/color/dynamic

Two source types; pick by what matters most, user preference or content.

| Source | Choose when | User sees |
|---|---|---|
| User-generated (wallpaper) | Users benefit from a tested, personalized experience; you want the latest Material features | Apps and system UI tinted from their wallpaper; product feels personal |
| Content-based (in-app imagery) | Content is front and center; team can do some advanced customization; supports features like media players | Product (and maybe system UI) matches on-screen imagery; product feels "smart" |
| Multiple sources | Several criteria apply; you accept advanced customization | Start with user-generated, then customize |

- Content-based color is best for contained elements adjacent to the source image (the image is not always visible).
- Because final colors are generated per device, design with roles, never particular hex values. Use Material Theme Builder (Figma plugin) to generate roles and state layers, swap colors on Design Kit components, and shuffle random source colors to preview the range of outcomes.
- Replace every color that is not a scheme role with the closest role.
- Content-based use cases: a music app tinting from album artwork; a news feed tinting per publication to differentiate brands. Apply within a specified area (set of components or a screen).
- Implementation: MDC-Android Color docs (dynamic and content-based dynamic colors); Compose `dynamicLightColorScheme` / `dynamicDarkColorScheme` (Android 12+).

---

## Static color schemes

Source: https://m3.material.io/styles/color/static

- Baseline: the default static scheme (purple), accessible pairs, light and dark included. Users see an accessible UI with static colors.
- Custom brand: hand-picked colors aligned to brand; created and maintained by your team (more effort). Users see a product that "looks like its brand".
- Building a brand scheme: in Material Theme Builder, add a theme, set a custom Primary source hex; optionally set custom sources for Secondary, Tertiary, Error, Neutral and Neutral Variant. Turn on "New theme color diagram" and "Generate State Layers".
- Export from Material Theme Builder for Jetpack Compose, Android Views, Flutter, Web or JSON. On Android Views, customize the default theme.

---

## Advanced color customizations

Source: https://m3.material.io/styles/color/advanced

Three families of customization:

| Action | Options |
|---|---|
| Apply colors | Combine multiple schemes; map or remap colors onto UI elements |
| Define new colors | Static colors (formerly "custom colors"); custom color roles |
| Adjust existing colors | Own baseline scheme; own dynamic scheme; color fidelity; harmonization |

### Combine multiple schemes
- Base: baseline or user-generated dynamic scheme for the whole app; on top, map content-based roles into contained spaces (media player, album page).
- Uses: build hierarchy and direct attention; link related items in lists (item and its action share content color); full-screen immersion in content flows (media controls, purchase flow).
- Keep the source content visible wherever its content color is used.
- Limit to two schemes from different source types per screen (for example user-generated plus one album art).
- Don't replace semantic colors (red error, green success) with content color.

### Map or remap
- Choose a role by how the color is used. Roles starting with "on" are guaranteed to contrast with their pair; other pairs may miss 4.5:1 (small text) and 3:1 (large text).
- Test dynamic remaps across light/dark and red/yellow/green/blue sources.
- Always apply roles, never static hex or raw tonal palette values (they break dark theme, contrast control and dynamic color).

### Static colors (formerly custom colors)
- Input a reference color; Material returns four roles: main, on-main, container, on-container, following accent conventions.
- Use for brand expression or semantics (green success). Error red already exists, so do not define your own semantic red.
- Optionally harmonize static colors to the scheme's primary.

### Custom color roles
- Only when nothing else works. Define for each role: source palette (primary, secondary, tertiary, neutral, neutralVariant, error) and reference tone for light and dark (for example primary70); pairing relationships and tone deltas; contrast meeting Material minimums. Then generate values through MCU so they respond to theming and contrast level.

### Own baseline / own dynamic scheme
- Own baseline: input primary, secondary, tertiary, neutral, neutral variant in Material Theme Builder. Convention: primary and tertiary most prominent (tertiary shifts hue from primary); secondary, neutral variant and neutral share primary's hue with progressively less chroma.
- Own dynamic scheme: provide hue and chroma rules per color group, define a scheme variant, generate with MCU (for example a more vibrant wallpaper-based theme).

### Color fidelity
- Adjusts role tones so colors look like the input (a too-light color can look washed out at the role's tone) without harming contrast.
- Material Theme Builder: "match color" toggle per input; on by default for custom baselines and static colors. In code, a boolean flag per role.
- Still pair roles correctly after enabling.

### Harmonization
- Shifts a static color's hue slightly toward the scheme's primary; hue shift is limited so semantics survive (red stays red, only warmer or cooler).
- Theme Builder: toggle per static color. Code: MCU `Blend` function.
- Check results under many primaries. Don't harmonize colors that must stay exact, such as brand colors.

---

## Color resources

Source: https://m3.material.io/styles/color/resources

| Resource | Purpose |
|---|---|
| Material Theme Builder (Figma plugin) | Emulates dynamic extraction, builds full tonal schemes, contrast checks, tokens, code export |
| Codelab: Visualizing dynamic color | Apply user-generated color |
| Codelab: Designing with accessible colors | Color and contrast guidelines |
| Codelab: Customizing Material color | Custom theme in MTB applied to Figma mocks |
| Figma file: Build a Material color scheme | Build an M3 scheme with component roles |

---

## Android color for mobile design

Source: https://developer.android.com/design/ui/mobile/guides/styles/color

### Takeaways
- Check contrast; avoid pairing colors with similar tones. Red/green is a common pattern but fails for some color blindness types.
- Stick to a palette: too many semantic colors confuse; too many decorative colors overwhelm.
- Repeat established color patterns; keep semantic colors consistent across the app (one color per meaning, for example purple always = membership).
- Build light and dark schemes, ideally contrast themes too.
- Assign colors with tokens (roles), never hardcoded values.
- Avoid mixing many dynamic and static sources in one view; with content color, avoid pulling colors from multiple content pieces.

### Color science on Android
- Screens use additive RGB; perception varies with calibration, panel type, settings and color space.
- HCT: hue 0 to 360, chroma up to about 120, tone = luminance. Colors at the same tone are not accessible together.
- Manually assigned key colors keep their own tone: an input with tone 86 lands near primary container, not primary.
- Color limitations: yellow (hue 105) has little chroma at low tones; red (hue 25) peaks chroma at a lower tone; blue (hue 285) peaks at an even darker tone and loses chroma at light tones.
- Roles describe use, never hue (on primary, not "on blue"). Container/on-container pairs have accessible tone values. Light and dark schemes have their own tone assignments.

### Applying color

| Kind | What | Guidance |
|---|---|---|
| Accent | Primary, secondary, tertiary (each a group of 4 to 8 tones) | Most expressive. Primary for crucial CTAs (FAB). Assign brand primary, or pick a color for interactive components and use brand color sparingly |
| Semantic | Colors with fixed meaning (error); extra ones via custom/static colors | Be consistent; harmonize with dynamic schemes |
| Surface | Neutral backgrounds, containers, sheets, panes | The majority of app color; generous surface space lets the eye rest |

- Dynamic color: Android 12 (API 31)+ extracts a source from wallpaper or in-app content (key art).
- Always ship a static scheme as fallback when dynamic color is unavailable; otherwise the device falls back to the baseline purple scheme.
- Using only base primary/secondary/tertiary roles looks oversaturated; mix in container and outline roles.
- Make the most prominent action vivid: a FAB with the same muted tone and chroma as navigation blends in.
- Never make color the only affordance: add a component, weight change or icon.
- Contrast guidelines split into text and non-text, each with grades.

### Implementation
- Compose: colors in `Color.kt`; Views: `colors.xml`; part of a theme.
- Hex is 6-digit RGB; prepend alpha for 8 digits (AARRGGBB).
- Material Theme Builder exports light and dark schemes and tokens; turn on state layers in Settings.

---

## Themes

Source: https://developer.android.com/design/ui/mobile/guides/styles/themes

A theme = set of styles/attributes (color, type, shape) affecting the look of the device and the app.

### Takeaways
- Adopt system preferences: light/dark, dynamic, contrast.
- Provide a custom theme as fallback when dynamic color is unavailable.
- Consider type settings across themes; always check text/surface contrast.

### Types of themes

| Type | Scope | Notes |
|---|---|---|
| System: light / dark | Whole device | Dark lowers luminance, helps legibility in sun or low light, reduces eye strain, saves battery; often the most requested feature. Settings: always on, off, or scheduled |
| System: user-generated | Whole device | Dynamic color from wallpaper since Android 12 (Material You). Font settings also apply: use sp for text |
| System: manufacturer | Device | OEM theming may affect system UI and display |
| App: baseline | App | Material default: purple scheme, Roboto. Apps without theme attributes fall back to it |
| App: custom (brand) | App | Full custom design system or small brand guide; also the fallback when system themes are unavailable. Can offer multiple schemes |
| App: content | Part of app | Dynamic color from key art or media (media notifications also extract from artwork). Works best with one primary content source |

- Reflect the user's system light/dark setting by default; in-app overrides are welcome.
- Android can force dark if the user enables it; a custom dark theme gives more control.
- Locking the app to light is possible but discouraged (hurts accessibility and personalization).
- WebViews can use light, dark or default styling.
- Keep a theme hierarchy: one primary theme source (dynamic or custom) for most of the UI, with selective accents.

### Theme attributes
- Color: scheme of tones assigned to roles mapped to components.
- Type: Roboto is the system font; custom fonts must stay legible for their roles.
- Shape: full rounded corners feel softer and playful; angular cut corners feel more serious.
- Icons (Material Icons legacy set): Filled, Outlined, Sharp, Rounded, Two Tone. Use one style throughout.
- Other systems can be added (gradients, spacing dimensions) by extending or replacing Material systems.

### Theme vs style
- A style is a reusable look for one element (Body Large); a theme spans many elements or the whole app (Light, Dark).
- Compose: model systems as classes in `MaterialTheme` (see [Material 3 theming in Compose](#material-3-theming-in-compose)). Views: semantically named resources sharing style syntax.

---

## Dark theme (implementation)

Source: https://developer.android.com/develop/ui/views/theming/darktheme

- Available on Android 10 (API 29)+. Benefits: big power savings (screen-dependent), better for low vision and light sensitivity, easier in low light.
- Users enable it via Settings > Display > Theme, the Quick Settings tile, or (Pixel) Battery Saver.

### Support it (Views)
- Inherit from a DayNight theme: `Theme.AppCompat.DayNight` or `Theme.MaterialComponents.DayNight` (Material 3: `Theme.Material3.DayNight` (inference)).
- No hardcoded colors or light-only icons: use theme attributes or `-night` resources.
- Key attributes: `?android:attr/textColorPrimary` (near-black light, near-white dark, has disabled state) and `?attr/colorControlNormal` (icons, has disabled state). Prefer Material attrs like `?attr/colorSurface`, `?attr/colorOnSurface`.

### In-app switch

| Option | AppCompat mode |
|---|---|
| Light | `MODE_NIGHT_NO` |
| Dark | `MODE_NIGHT_YES` |
| System default (recommended default) | `MODE_NIGHT_FOLLOW_SYSTEM` |

- API 31+: `UiModeManager#setApplicationNightMode` so the system matches the splash screen. API 30 and lower: `AppCompatDelegate.setDefaultNightMode()` (since AppCompat 1.1.0 it recreates started activities).

### Force Dark
- Android 10 feature that auto-darkens a light app. Opt in with `android:forceDarkAllowed="true"` in the activity theme (set on system/AndroidX light themes like `Theme.Material.Light`). Not applied to dark or DayNight themes.
- Exclude views with `android:forceDarkAllowed` or `View.setForceDarkAllowed()`. Test thoroughly.

### Best practices
- Notifications: use system templates (`MessagingStyle`) so styling is correct.
- Widgets and custom notification views: test light and dark. Pitfalls: assuming a light background, hardcoded text color, hardcoded background with default text color, static-color drawables.
- Launch screens: remove hardcoded white; use `?android:attr/colorBackground`. Dark `android:windowBackground` drawables work only on Android 10.
- Theme change triggers a `uiMode` configuration change and activity recreation. To handle it yourself (for example during video playback) declare `android:configChanges="uiMode"` and react in `onConfigurationChanged()`. Read current mode with `configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK` (`UI_MODE_NIGHT_NO` / `UI_MODE_NIGHT_YES`).

---

## Elevation

Source: https://m3.material.io/styles/elevation

- Elevation = distance between two surfaces on the z-axis, in dp. Every surface and component has one.
- Tokens encode z-distance only; they carry no shadow or color. Each platform decides how to render a level.
- Depict elevation with tonal surface colors or shadows. Keep the number of levels small; avoid changing default component elevation.

### Differences from M2
- Shadows only when needed for protection against a background or to encourage interaction (M2 shadowed every level).
- New color mappings compatible with dynamic color.
- Elevation expressed as levels 0 to 5.
- Surface tint color is deprecated; use level tokens. (Compose docs still describe tonal elevation overlays from the primary slot via `Surface(tonalElevation, shadowElevation)`; the M3 guidance now prefers surface container roles.)

### Levels and default component mapping

| Level | dp | Resting components |
|---|---|---|
| 5 | 12dp | none at rest (reached via interaction) |
| 4 | 8dp | none at rest (for example FAB on hover) |
| 3 | 6dp | Date pickers, modal dialogs, extended FAB, FAB, FAB menu close button, search, time pickers |
| 2 | 3dp | App bar (scrolled), menu, navigation bar, rich tooltip, toolbar |
| 1 | 1dp | Banner, modal bottom sheet, elevated button, elevated card, elevated chips, modal navigation drawer, modal side sheet |
| 0 | 0dp | App bar (not scrolled), filled / tonal / outlined buttons, button groups, filled and outlined cards, carousel, chips, full-screen dialog, extended FAB and FAB in navigation rail, FAB menu list items, icon buttons, list, navigation rail, segmented button, docked side sheet, slider, split button, tabs |

### Changing elevation
- Change elevation in response to system events or interaction, consistently across similar elements. Hover raises by 1 level (FAB 3 to 4; all Material buttons +1 on hover). Focus usually +1 too.

### Depicting elevation
- A surface must show edges, overlap with other surfaces (at rest or in motion) and distance.
- Default in M3: tonal difference between surfaces. Alternatives: drop shadow, scrim behind the surface.
- Interactive components need edge contrast that meets accessible ratios.
- Overlapping containers must use different surface roles to show separation. Surface roles are not tied to elevation.
- Shadow size and softness express distance: small sharp = close; large soft = far. Fewer levels = more power to direct attention.
- Use visible shadows to protect elements over busy or patterned backgrounds (cards, chips, buttons) and to show temporary lift on focus, selection or swipe.
- Do separate a FAB from content with a shadow; don't leave a FAB shadowless and blending into the surface.

### Scrims
- Scrim color role at 32% opacity, beneath modals and expanded navigation menus.

---

## Icons (Material Symbols)

Source: https://m3.material.io/styles/icons

- Get icons at fonts.google.com/icons (resize, recolor, copy/paste). Material Symbols (variable font) are the default; legacy Material Icons remain but lack variable axes. Over 2,000 icons. Figma plugin available.
- Three styles: Outlined (light, clean, good for dense UI), Rounded (pairs with heavier type, curved logos, circles), Sharp (straight corners, crisp at small sizes, for rectangular brand styles).

### Sizes and metrics

| Spec | Value |
|---|---|
| Standard icon | 24 x 24dp (design at 100% scale) |
| Other optical sizes | 20dp (desktop, dense, small visuals), 40dp and 48dp (display/headline type, larger screens) |
| Live area padding (24dp grid) | 2dp inner padding; content stays in live area, may extend into padding for weight, never past trim area |
| Corner radius | 2dp default; outlined style has square interior corners; shapes 2dp wide or less get unrounded stroke corners. Rounded style: interior and exterior rounded. Sharp: corners reduce from 2dp to 0dp |
| Stroke | 2dp, matching weight 400 |
| Target size | 24dp icon = 48dp target; 20dp icon = 40dp target when mouse/keyboard is primary |
| Text-icon baseline | Shift icon baseline down 11.5% when set with text |

### Variable axes

| Axis | Range | Use |
|---|---|---|
| Weight | 100 (thin) to 700 (bold), 400 regular | Stroke weight, also affects size. Keep consistent within a component (nav rail). Avoid 100 weight in galleries |
| Fill | 0 to 1 | Outlined to filled; convey state transitions (unselected to selected) |
| Grade | for example -25, 0, positive | Finer thickness control without size change. Default 0 for dark icon on light; -25 for light icon on dark (compensates visual bleed). Positive grade for emphasis/active state. Match text font grade |
| Optical size | 20dp to 48dp | Auto-adjusts stroke as size changes so large icons are not too heavy |

### Design rules
- Simple, modern, friendly, geometric; front view, flat shapes; no isometric perspective; no excessive detail.
- Align to the grid with integer coordinates; use keyline shapes. 24dp keyline template (Illustrator, Apache 2.0) for custom icons.
- Optical corrections allowed for complex icons, using the same geometric forms without skewing.
- Match icon size and optical weight to adjacent text.

### Accessibility and localization
- Label abstract icons; navigation items must have labels.
- Below 20dp, complex icons and key-action icons need a text label. Simple symbols (rating stars) can stand alone at any identifiable size.
- Test icons across ages, cultures and languages; consider internet familiarity. Colors and symbols vary culturally (white = purity vs mourning; owl = wisdom vs bad omen).

---

## Motion physics system (springs)

Source: https://m3.material.io/styles/motion/overview
Also: https://m3.material.io/m3-expressive-motion-theming (Compose how-to)

- May 2025 (M3 Expressive): the physics-based motion system replaces easing and duration for components and interactions. Easing/duration remains for transitions and as fallback.

### Availability

| Platform | Status | How |
|---|---|---|
| Jetpack Compose | Available | Built-in components (21 components use physics by default) plus spring tokens; `MotionScheme` |
| Android Views (MDC-Android) | Available, not yet wired into components | Use spring tokens |
| Web | Compatible | Use springs where possible; otherwise curves from the conversion table |
| Flutter | Unavailable | |

### Motion schemes
- Expressive: Material's opinionated, recommended scheme; most situations, especially hero moments and key interactions.
- Standard: functional, minimal bounce; utilitarian products.
- Custom: build your own while keeping theming. Most of a product should share one scheme; swap per element to emphasize key moments.
- Choosing `MaterialExpressiveTheme` defaults to the expressive scheme. Updating the Compose dependency alone applies the standard scheme to Material components.

### Springs and tokens
- A spring = stiffness + damping + initial velocity. One spring serves many situations (transitions, button effects, gestures); springs handle interruption and retargeting using current velocity, and adapt to screen size because no time is specified.
- Token pattern: `md.sys.motion.spring.{fast|default|slow}.{spatial|effects}`. The scheme (expressive/standard) is selected at product level, outside the token name, so swapping schemes needs no token changes.
- Spring composite tokens combine damping and stiffness. Easing, duration and path tokens belong to the legacy system.

| Style | Animates | Behavior |
|---|---|---|
| Spatial | x/y position, rotation, size, rounded corners (shape) | Overshoots and bounces into place |
| Effects | Color, opacity | No overshoot |

| Speed | Spatial example | Effects example |
|---|---|---|
| Default (most motion) | Partial-screen: bottom sheet, expanded navigation rail | Opacity of nav rail content |
| Fast | Small components: switches, buttons | Switch handle color |
| Slow | Full-screen animations | Full-screen content refresh |

- Speed tokens are device-relative: exact values differ on wearable, phone and tablet, but fast is always faster than default and slow.

### Spring values (Compose)
Stiffness/damping per scheme are not printed in the fetched pages. Values below are the Compose `MotionScheme` defaults from ExpressiveMotionTokens / StandardMotionTokens (Compose M3 token):

| Token | Expressive damping / stiffness | Standard damping / stiffness |
|---|---|---|
| fast spatial | 0.6 / 800 | 0.9 / 1400 |
| default spatial | 0.8 / 380 | 0.9 / 700 |
| slow spatial | 0.8 / 200 | 0.9 / 300 |
| fast effects | 1.0 / 3800 | 1.0 / 3800 |
| default effects | 1.0 / 1600 | 1.0 / 1600 |
| slow effects | 1.0 / 800 | 1.0 / 800 |

Example custom ("playful") scheme from the M3 blog: effects use `Spring.DampingRatioNoBouncy` with stiffness 1600 (default), 3800 (fast), 800 (slow); spatial uses dampingRatio 0.6 with stiffness 700 (default), 1400 (fast), 300 (slow).

### Web conversion (springs to cubic-bezier)

| Spring | Curve | Duration |
|---|---|---|
| Expressive fast spatial | 0.42, 1.67, 0.21, 0.90 | 350ms |
| Expressive default spatial | 0.38, 1.21, 0.22, 1.00 | 500ms |
| Expressive slow spatial | 0.39, 1.29, 0.35, 0.98 | 650ms |
| Expressive fast effects | 0.31, 0.94, 0.34, 1.00 | 150ms |
| Expressive default effects | 0.34, 0.80, 0.34, 1.00 | 200ms |
| Expressive slow effects | 0.34, 0.88, 0.34, 1.00 | 300ms |
| Standard fast spatial | 0.27, 1.06, 0.18, 1.00 | 350ms |
| Standard default spatial | 0.27, 1.06, 0.18, 1.00 | 500ms |
| Standard slow spatial | 0.27, 1.06, 0.18, 1.00 | 750ms |
| Standard fast effects | 0.31, 0.94, 0.34, 1.00 | 150ms |
| Standard default effects | 0.34, 0.80, 0.34, 1.00 | 200ms |
| Standard slow effects | 0.34, 0.88, 0.34, 1.00 | 300ms |

### Customization levels (Compose)
1. Use a default scheme: `MaterialExpressiveTheme(motionScheme = MotionScheme.expressive())` or `MotionScheme.standard()`.
2. Custom scheme: implement `MotionScheme` and return an `AnimationSpec` for each of `defaultSpatialSpec`, `fastSpatialSpec`, `slowSpatialSpec`, `defaultEffectsSpec`, `fastEffectsSpec`, `slowEffectsSpec` (marked `@ExperimentalMaterial3ExpressiveApi`).
3. Swap the scheme per element by overriding the CompositionLocal for a composable or screen.
- Custom components: replace `tween()` with `MaterialTheme.motionScheme.defaultSpatialSpec<Float>()` for scale/position and `defaultEffectsSpec<Color>()` for color, so they follow scheme switches.
- Expressive APIs shipped in Material3 1.4.0 alphas, then moved to 1.5.0-alpha when 1.4.0 went stable; stable in 1.5.0.

---

## Easing and duration (legacy motion)

Source: https://m3.material.io/styles/motion/easing-and-duration

- Legacy system: components now use springs and products should migrate. Still used for transitions and by teams not on M3 Expressive; no longer maintained.
- Compared to M2: snappier take-offs, very soft landings, slightly longer durations.

### Default pairs

| Easing | Duration | Transition type |
|---|---|---|
| Emphasized | 500ms | Begin and end on screen |
| Emphasized decelerate | 400ms | Enter the screen |
| Emphasized accelerate | 200ms | Exit the screen |
| Standard | 300ms | Begin and end on screen |
| Standard decelerate | 250ms | Enter the screen |
| Standard accelerate | 200ms | Exit the screen |

### Choosing easing
- Emphasized set for most transitions (M3 style). Standard set for small, quick utility transitions, and as fallback where emphasized is unsupported (iOS, web CSS).
- Begin and end on screen: emphasized. Enter: emphasized decelerate (starts at peak velocity, gentle rest). Exit permanently: emphasized accelerate (ends at peak velocity, implies not retrievable). Exit temporarily: emphasized (rests just off screen, implies retrievable).

### Easing tokens

| Token | Android | CSS |
|---|---|---|
| `md.sys.motion.easing.emphasized` | `PathInterpolator` path: M 0,0 C 0.05,0 0.133333,0.06 0.166666,0.4 C 0.208333,0.82 0.25,1 1,1 | none (use standard); Flutter `easeInOutCubicEmphasized` |
| `md.sys.motion.easing.emphasized.decelerate` | `PathInterpolator(0.05f, 0.7f, 0.1f, 1f)` | cubic-bezier(0.05, 0.7, 0.1, 1.0) |
| `md.sys.motion.easing.emphasized.accelerate` | `PathInterpolator(0.3f, 0f, 0.8f, 0.15f)` | cubic-bezier(0.3, 0.0, 0.8, 0.15) |
| `md.sys.motion.easing.standard` | `PathInterpolator(0.2f, 0f, 0f, 1f)` | cubic-bezier(0.2, 0.0, 0, 1.0) |
| `md.sys.motion.easing.standard.decelerate` | `PathInterpolator(0f, 0f, 0f, 1f)` | cubic-bezier(0, 0, 0, 1) |
| `md.sys.motion.easing.standard.accelerate` | `PathInterpolator(0.3f, 0f, 1f, 1f)` | cubic-bezier(0.3, 0, 1, 1) |

### Duration tokens (`md.sys.motion.duration.*`)

| Group | 1 | 2 | 3 | 4 | Use |
|---|---|---|---|---|---|
| short | 50ms | 100ms | 150ms | 200ms | Small utility transitions |
| medium | 250ms | 300ms | 350ms | 400ms | Medium-area transitions |
| long | 450ms | 500ms | 550ms | 600ms | Large expressive transitions, often with emphasized easing |
| extra-long | 700ms | 800ms | 900ms | 1000ms | Rare; ambient transitions without user input |

- Duration scales with area covered: small = short, large = long, for consistent perceived speed.
- Exits, dismissals and collapses are shorter; entries and persistent elements are longer.
- Not jarringly fast, not so slow users wait.

---

## Transitions

Source: https://m3.material.io/styles/motion/transitions

M3 transitions still use legacy easing and duration (to be moved to physics later). Transitions are the top priority of a motion implementation.

### Patterns

| Pattern | Use for | Common with | Android behavior |
|---|---|---|---|
| Container transform | Element expands to show detail (card to details page); strongest relationship, most expressive | Cards, lists, image galleries, search, sheets, FABs, chips | Persistent container or hero image connects start and end |
| Forward and backward | Consecutive hierarchy levels (inbox to thread) | Lists, cards, buttons, links | Horizontal slide with fade (iOS uses parallax). Use platform defaults |
| Lateral | Peer content at same level (tabs of a library) | Tabs, carousels, galleries | Grouped slide in unison, no fade or parallax; hints swipe |
| Top level | Top-level destinations | Navigation bar, rail, drawer | Quick fade out then fade in; no shared elements |
| Enter and exit (in bounds) | Components appearing over the UI | FABs, dialogs, menus, snackbars, time pickers, tooltips | Expand/collapse along x or y; avoid scale and z motion (implies elevation change). Direction away from nearest edge (top menu expands down, bottom snackbar up). iOS scales uniformly and fades out |
| Enter and exit (beyond bounds) | Components sliding on/off screen, possibly on scroll | App bars, banners, nav bar, nav rail, nav drawer, sheets | Expand/collapse along an axis while sliding (iOS slides without changing shape). Coplanar side sheets shrink content area |
| Skeleton loaders | Loading to loaded | Content areas | Subtle pulse from top-left to bottom-right; content fades in quickly on top |

- Spatial model: notifications from the top, nav drawer from the left (start), bottom sheet and keyboard from the bottom (easiest reach).

### What makes a good transition
- Follows reduced-motion settings: subtle fades instead of slides/scales; disable parallax and shape morphing.
- Consistent pattern for the same kind of navigation.
- Stable layouts: skeleton loaders; no content shifting or popping in.
- No jump cuts by default; acceptable only where pure efficiency matters (menu in a productivity app).
- Coherent spatial model (horizontal carousel scrolls horizontally).
- Unified direction: grouped elements on one primary axis; only hero elements persist.
- Clean fades: fully fade out before fading in; any cross-fade quick and hidden in the fastest part. Don't slowly fade components over content.
- Simple style: no bouncy, highly stylized transitions (they are frequent and large).

### Choosing
- Container transform: hero moments, shallow hierarchies (expand then collapse), seamless element connection. Don't use for mundane items like a settings row.
- Forward/backward: platform default; avoid radical takeovers for routine navigation.
- Lateral: only for peers; never for hierarchical screens (full-width slide is excessive and implies peers).
- Top level: quick fade; don't use lateral (implies swipe between destinations, conflicts with carousels and swipeable list items).
- Enter/exit: for components in context (modal dialog, standard bottom sheet over a map). Don't use for hierarchical screen navigation.

---

## Shape

Source: https://m3.material.io/styles/shape

### M3 Expressive update (May 2025)
- 35 new shapes and shape morphing added to the Material Shape Library (Figma kit) and Compose (`MaterialShapes`).
- New corner tokens: large increased (20dp), extra large increased (32dp), extra extra large (48dp).
- Fully rounded corners now use the `full` token (previously 50% of component size).
- New shape principles and art direction.

### Corner radius scale (10 steps)

| Token (md.sys.shape.corner.*) | Value |
|---|---|
| none | 0dp |
| extra-small | 4dp |
| small | 8dp |
| medium | 12dp |
| large | 16dp |
| large-increased | 20dp |
| extra-large | 28dp |
| extra-large-increased | 32dp |
| extra-extra-large | 48dp |
| full | Fully rounded |

- Shape corner tokens define whole shapes; corner-value tokens address individual corners.
- Symmetric (all corners equal) or asymmetric (different corners), both from the same scale. Asymmetric "inner corners" appear in closely grouped items such as menus and split buttons.
- Rectangular shapes are fully rounded in all corners by default; individual corners can be adjusted.

### Principles
- Shapes echo typography; use shape and type together.
- Morph shapes to communicate interaction states (selected button), actions in progress (typing, loading), environmental change (sound, temperature, time of day). Consider tap, swipe, scroll, release, long press.
- Embrace tension: mix square and rounded or unconventional shapes for memorable design.
- Shape is versatile, never semantic: no shape carries a fixed meaning (a wavy loading indicator does not make waves mean progress).
- Use abstract shapes sparingly; never at the cost of clarity. Most freedom in decorative moments: graphics, photo crops, avatar masks.
- Shape plus motion can feel 2.5D.

### Customizing
- Style level: change a style's size (for example medium), affecting every component mapped to it unless overridden.
- Component level: remap a component to another style (buttons default to full; remap to small or medium for less roundness).
- Family: rounded or cut corners. Cut corners clip more content; add padding in dense components.
- Optical roundness for nested shapes: inner radius = outer radius minus padding (48dp - 14dp = 34dp). Don't reuse the same radius inside.
- Use library shapes for mostly visual elements; avoid unconventional shapes on text-heavy containers.

### Shape morph
- Built into the standard button group and loading indicator components.
- Android: Compose `MaterialShapes` API. Web: not available.
- Morphing uses the expressive motion scheme by default; can switch to standard.
- Disable shape morphing when reduced motion is on (see Transitions).

### Compose `Shapes`
- `Shapes(extraSmall, small, medium, large, extraLarge)` with defaults matching the scale (the docs example overrides extraLarge to 24dp); Compose also offers `RectangleShape` and `CircleShape`. The token scale adds large increased 20dp, extra large increased 32dp and extra extra large 48dp (Compose M3 token); the matching `Shapes` slot names are an inference (check the `Shapes` reference).

---

## Spacing

Source: https://m3.material.io/styles/spacing

- 8dp scale: `md.sys.measurement.space100` = 8dp; tokens follow a multiplier pattern (space125 = 10dp, space200 = 16dp, space225 = 18dp). Material defines only the most recommended units; nested values like 2, 4, 6, 10dp are also used.
- Spacing tokens exist on Jetpack Compose only (Views and Web unavailable).
- Apply tokens to margins, padding and gaps; adapt to context (mobile vs desktop, density).

### Parts

| Part | Definition | Guidance |
|---|---|---|
| Padding | Space inside an element (container edge to content) | Preferred, uniform |
| Gap | Space between elements in a grid/container | Simple components: one horizontal and one vertical gap. Complex: name by neighbors (icon-label gap) |
| Margin | Space outside an element | Rare in components; only beyond parent padding or in layouts |

- Positions: vertical, top, bottom, horizontal, leading, trailing. Leading/trailing swap in RTL.
- Example (search container): 8dp vertical padding, 8dp horizontal gaps, 24dp horizontal margins (12dp when focused).
- Do: uniform button horizontal padding. Don't: different leading/trailing margins around a button icon.

### Applying
- Spacing logic is built per component (unlike color, which switches globally).
- Use pre-tokenized components; replace hardcoded values in custom components with system tokens.
- Preserve spacing when text scales to 200%.
- Customize: remap component spacing (button top padding space125 to space200 for taller buttons); add new tokens on the multiplier pattern; tokenize product patterns (surface content horizontal padding); map spacing per device type for adaptive layouts; vary vertical padding per density setting.
- Naming going forward: padding, margin, gap plus horizontal/vertical/leading/trailing/top/bottom ("Medium button: leading padding"). Older tokens used "space" (leading-space, between-space).

---

## Typography

Source: https://m3.material.io/styles/typography

### Updates
- Aug 2026: language script height support. Line height adapts automatically to language height category (small, medium, large, extra large); components can adapt size.
- May 2025 (M3 Expressive): 15 baseline + 15 emphasized styles (30 total). Emphasized = higher weight and minor adjustments. Roboto Flex usable standalone but not part of the type scale.
- Earlier: variable fonts (Roboto Flex, Roboto Serif, Roboto Mono); five roles display, headline, title, body, label.

### Fonts

| Font | Role | Axes / notes |
|---|---|---|
| Roboto | Android default; used in M3 type scale; 3,300+ glyphs | Static |
| Roboto Flex | Variable; 900+ glyphs (Latin, Greek, Cyrillic) | Slant, width, weight, grade, optical size; advanced: XOPQ, YOPQ, XTRA, YTUC, YTLC, YTAS, YTDE, YTFI |
| Roboto Serif | Variable; comfortable reading, even in UI | Many weights and widths |
| Roboto Mono | Monospace; code and aligned numbers | Weight, italic |
| Noto Sans | Fallback, 150+ scripts, compatible with Roboto | Width, weight, italic |

- Fallback order with Roboto Flex: Roboto Flex, then Roboto, then Noto Sans. Confirm with engineering that fallback is available.

### Baseline type scale

Size and line height are confirmed by the Compose M3 docs. Weight and tracking are the Compose M3 TypeScaleTokens values (Compose M3 token); the current androidx-main tokens round three trackings (display large -0.2, title medium 0.2, body medium 0.2) where older M3 specs listed -0.25, 0.15 and 0.25. All sizes in sp; tracking in sp (Android letterSpacing = tracking / size em).

| Style | Compose name | Size | Line height | Weight | Tracking |
|---|---|---|---|---|---|
| Display Large | `displayLarge` | 57 | 64 | 400 | -0.2 |
| Display Medium | `displayMedium` | 45 | 52 | 400 | 0 |
| Display Small | `displaySmall` | 36 | 44 | 400 | 0 |
| Headline Large | `headlineLarge` | 32 | 40 | 400 | 0 |
| Headline Medium | `headlineMedium` | 28 | 36 | 400 | 0 |
| Headline Small | `headlineSmall` | 24 | 32 | 400 | 0 |
| Title Large | `titleLarge` | 22 | 28 | 400 (Compose M3 token WeightRegular; the Compose docs table labels it Roboto Medium) | 0 |
| Title Medium | `titleMedium` | 16 | 24 | 500 | 0.2 |
| Title Small | `titleSmall` | 14 | 20 | 500 | 0.1 |
| Body Large | `bodyLarge` | 16 | 24 | 400 | 0.5 |
| Body Medium | `bodyMedium` | 14 | 20 | 400 | 0.2 |
| Body Small | `bodySmall` | 12 | 16 | 400 | 0.4 |
| Label Large | `labelLarge` | 14 | 20 | 500 | 0.1 |
| Label Medium | `labelMedium` | 12 | 16 | 500 | 0.5 |
| Label Small | `labelSmall` | 11 | 16 | 500 | 0.5 |

Tokens: `md.sys.typescale.{role}-{size}` (for example `md.sys.typescale.display-large`), each with sub-tokens for font, line height, size, tracking, weight.

### Emphasized type scale
- Same 15 steps and sizes as baseline. Token: `md.sys.typescale.emphasized.{role}-{size}`; Compose: `displayLargeEmphasized` and so on (Expressive `Typography`).
- Weight increase (Compose M3 token): display, headline, title large and body go 400 to 500; title medium, title small and labels go 500 to 700. Emphasized tracking also differs on a few steps (display large 0, title medium 0.15, body large 0.15, body medium 0.25); see tokens.md.
- Material components do not use emphasized styles by default; swap the baseline token for the emphasized token of the same step.
- Use for: badges, buttons for primary actions, extended FAB, selected list items, selected menu items, unread messages, headlines, editorial treatments. Apply on text that already uses weight for hierarchy; emphasized context and weight can combine. Baseline and emphasized are meant to be used together.

### Roles

| Role | Use | Font guidance |
|---|---|---|
| Display | Largest text; short important text or numerals; best on large screens | Expressive fonts welcome (handwritten, script); set optical size |
| Headline | Short high-emphasis text on smaller screens; primary passages/regions | Expressive OK with proper line height and tracking |
| Title | Medium-emphasis, relatively short; secondary passages/regions | Caution with expressive fonts |
| Body | Longer passages | Readable text faces only; avoid decorative fonts |
| Label | Utilitarian text inside components, captions | Buttons use Label Large |

### Customizing
- Brand typeface token for large styles (display, headline); plain typeface for small styles (body, label). Roboto is default for both.
- Change typeface via brand/plain tokens; tune line height and letter spacing; avoid changing size (affects component layout/reflow). Repeat for baseline and emphasized; keep emphasized consistent (for example all wider). Heavier fonts may need wider tracking; long ascenders/descenders need different line heights.
- Custom scales: Material uses the Major Second ratio (1.125) with a 14 key base size. Avoid tiny steps between sizes. Customizing may stop you receiving token updates.

### Units

| | Android | Web |
|---|---|---|
| Font size | sp (ratio 1.0) | rem (sp / 16): 10sp = 0.625rem, 12sp = 0.75rem, 24sp = 1.5rem, 60sp = 3.75rem |
| Letter spacing | em = tracking px / size sp (0.2 / 16 = 0.0125em) | rem, same formula |

### Language height

| Category | Scripts | Height vs base |
|---|---|---|
| Small (base) | Cyrillic, Greek, Hebrew, Latin (except Vietnamese) | base |
| Medium | Amharic, Arabic, Armenian, Bangla, Chinese, Gujarati, Hindi, Japanese, Kannada, Khmer, Korean, Lao, Malayalam, Odia, Punjabi, Sinhala, Tamil, Thai, Vietnamese, most others | about 7% taller |
| Large | Burmese, Telugu | about 30% taller |
| Extra large | Nastaliq | about 100% taller |

- Default to medium; switch by detected language. Components with vertical padding adapt automatically; fixed-height components are built for small and may not. Ignoring this causes overlapping text and broken UI.

### Typesetting and readability
- Android: specify vertical positions relative to the text baseline (line height = baseline to baseline). Web/iOS: bounding boxes with half-leading and padding.
- Use tabular (monospaced) figures in tables and changing values (clocks).
- Contrast: 3:1 large text, 4.5:1 small text. Default text color on surface; on surface variant as alternative. Links: primary (tertiary for less prominent), always underlined.

### Editorial treatments
- Standalone, type-driven showcase moments (custom large sizes, blocky looks), combinable with motion, shape and color. Uses: celebrating content, voice of the user (personalized type), bespoke functionality.
- Keep similar editorial moments consistent (tokenize them); match emotional tone to task; don't mix clashing styles in one layout; don't mimic personalization theming; never for labels or plain information.
- Variable axes: weight (avoid light weights for body; avoid bold nav labels), grade (thickness without changing width or line breaks), width (narrow labels fit more; avoid wide titles in crowded app bars), optical size (match to type size).

---

## Fonts in Compose

Source: https://developer.android.com/develop/ui/compose/text/fonts

- `Text(fontFamily = ...)`: built-in `FontFamily.Serif`, `SansSerif`, `Monospace`, `Cursive`. Custom fonts in `res/font` via `FontFamily(Font(R.font.x, FontWeight.Light), ...)`, then pick with `fontWeight` / `fontStyle`.
- Set app-wide fonts through `Typography(...)` `TextStyle`s passed to `MaterialTheme`. M3 `Typography` has no `defaultFontFamily`; set `fontFamily` per style.

### Downloadable fonts (Compose 1.2.0+)
- Dependency `androidx.compose.ui:ui-text-google-fonts` (docs show 1.12.1). Google Fonts only; custom providers unsupported.
- `GoogleFont.Provider(providerAuthority = "com.google.android.gms.fonts", providerPackage = "com.google.android.gms", certificates = R.array.com_google_android_gms_fonts_certs)`; then `FontFamily(Font(googleFont = GoogleFont("Lobster Two"), fontProvider = provider, weight, style))`.
- Fallback chains: list the downloadable `Font` followed by a local `Font(resId = ...)` per weight; the loader tries online first, then local.
- Debug: pass a `CoroutineExceptionHandler` to `createFontFamilyResolver` via `LocalFontFamilyResolver`; check `provider.isAvailableOnDevice(context)`.
- New Google Fonts can take months to reach Android; they may throw `IllegalStateException`.

### Variable fonts
- Supported on Android O (API 26)+ only; provide a static fallback below. Not available through downloadable fonts; bundle the variable .ttf (lowercase filename, no special chars) in `res/font`.
- `Font(R.font.robotoflex_variable, variationSettings = FontVariation.Settings(FontVariation.weight(950), FontVariation.width(30f), FontVariation.slant(-6f)))` (`@OptIn(ExperimentalTextApi::class)`).
- Custom axes via `FontVariation.Setting("YTAS", value)` (Roboto Flex ascender height 649 to 854) and `"XTRA"` (counter width 323 to 603); guard ranges with `require`.
- Keep axis values in constant objects per style (for example `DisplayLargeVFConfig`).

---

## Material 3 theming in Compose

Source: https://developer.android.com/develop/ui/compose/designsystems/material3

- Dependency `androidx.compose.material3:material3`. Some APIs need `@OptIn(ExperimentalMaterial3Api::class)`; Expressive APIs need `@ExperimentalMaterial3ExpressiveApi`. M3 Expressive complements the Android 16 visual style.
- `MaterialTheme(colorScheme, typography, shapes) { }` (plus `motionScheme` on `MaterialExpressiveTheme`). Changes propagate to all M3 components.

### ColorScheme
- Generate with Material Theme Builder: `Color.kt` (light/dark role colors), `Theme.kt` with `lightColorScheme(...)` / `darkColorScheme(...)`.
- Choose with `isSystemInDarkTheme()`.
- Dynamic color (Android 12+, `Build.VERSION.SDK_INT >= Build.VERSION_CODES.S`): `dynamicDarkColorScheme(context)` / `dynamicLightColorScheme(context)`; otherwise fall back to custom light/dark schemes.
- Read colors via `MaterialTheme.colorScheme.primary` etc. Component color objects: `CardDefaults.cardColors(...)`, `ButtonDefaults.buttonColors(containerColor, contentColor)`.
- Selected-state example: card container `primaryContainer` with `onPrimaryContainer` text; unselected `surfaceVariant` with `onSurface`.
- Do pair `primary` with `onPrimary`; don't put `primaryContainer` text on a `tertiaryContainer` button (poor contrast).
- Disabled states may use on-x colors with alpha.
- Views (inference, MDC-Android docs linked from the guide): `DynamicColors.applyToActivitiesIfAvailable(application)` with a `Theme.Material3.DayNight` parent.

### Typography
- `Typography(displayLarge = TextStyle(...), ...)`; omitted params keep defaults. A product may use a reduced set (for example five styles). Use via `MaterialTheme.typography.titleLarge`.
- Emphasis: vary font weight in styles, and neutral color pairs (surface with on surface variant, surface variant with on surface).
- Type scale values can differ per device context (Display Small on phone vs tablet).

### Shapes
- `Shapes(extraSmall = RoundedCornerShape(4.dp), small = 8.dp, medium = 12.dp, large = 16.dp, extraLarge = ...)`; use `MaterialTheme.shapes.medium` on Card, `.large` on FAB; `RectangleShape`, `CircleShape` also available.

### Elevation
- `Surface(tonalElevation, shadowElevation)`: tonal elevation tints with a more prominent tone (overlay from primary in older M3), shadow elevation draws shadows. Current M3 guidance prefers surface container roles (surface tint deprecated).

### System UI (Android 12+)
- Ripple uses a sparkle effect (platform `RippleDrawable`); stretch overscroll on by default in `LazyColumn`, `LazyRow`, `LazyVerticalGrid` (Compose Foundation 1.1.0+). No work needed.

---

## Quick reference: style tokens

| System | Token family | Key values |
|---|---|---|
| Color | `md.sys.color.*` | 26 standard roles + fixed, dim/bright add-ons; 3 contrast levels |
| Elevation | `md.sys.elevation.level0..5` | 0, 1, 3, 6, 8, 12dp |
| Scrim | scrim role | 32% opacity |
| Shape | `md.sys.shape.corner.*` | 0, 4, 8, 12, 16, 20, 28, 32, 48dp, full |
| Spacing | `md.sys.measurement.space*` | space100 = 8dp (Compose only) |
| Type | `md.sys.typescale.*` and `.emphasized.*` | 15 + 15 styles; Major Second scale, base 14sp |
| Motion (current) | `md.sys.motion.spring.{fast,default,slow}.{spatial,effects}` | Scheme expressive or standard chosen at product level |
| Motion (legacy) | `md.sys.motion.easing.*`, `md.sys.motion.duration.*` | 50 to 1000ms in 16 steps |
| Icons | Material Symbols | 24dp default, 48dp target, weight 100 to 700, fill 0 to 1, grade, optical size 20 to 48dp |
