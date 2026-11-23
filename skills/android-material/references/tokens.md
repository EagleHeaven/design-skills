# Android & Material 3: Component and style tokens

Values from the Jetpack Compose Material 3 token files (androidx-main, 2026-11-19); these are the generated M3 design tokens. Source: https://android.googlesource.com/platform/frameworks/support/+/refs/heads/androidx-main/compose/material3/material3/src/commonMain/kotlin/androidx/compose/material3/tokens/

How to read the tables: dp and sp are as generated; shape cells give the shape key plus its resolved radius; elevation cells give the level plus dp; color cells give the color scheme role (resolve roles through the Color section). Hovered, focused, pressed, dragged and disabled color tokens are omitted (they are the base role plus a state layer or disabled opacity, listed in the State layers section). A blank cell means the file has no such token.

## Contents

1. [Type scale](#type-scale)
2. [Shape corner scale](#shape-corner-scale)
3. [Elevation levels](#elevation-levels)
4. [State layers and disabled opacities](#state-layers-and-disabled-opacities)
5. [Motion](#motion)
6. [Color: scheme roles to palette tones](#color-scheme-roles-to-palette-tones)
7. [Components: Buttons](#components-buttons)
8. [Components: Button groups and segmented buttons](#components-button-groups-and-segmented-buttons)
9. [Components: Split button](#components-split-button)
10. [Components: Icon buttons](#components-icon-buttons)
11. [Components: FAB and extended FAB](#components-fab-and-extended-fab)
12. [Components: FAB menu](#components-fab-menu)
13. [Components: App bars](#components-app-bars)
14. [Components: Toolbars](#components-toolbars)
15. [Components: Navigation bar](#components-navigation-bar)
16. [Components: Navigation rail](#components-navigation-rail)
17. [Components: Navigation drawer](#components-navigation-drawer)
18. [Components: Tabs](#components-tabs)
19. [Components: Badges](#components-badges)
20. [Components: Cards](#components-cards)
21. [Components: Chips](#components-chips)
22. [Components: Checkbox](#components-checkbox)
23. [Components: Radio button](#components-radio-button)
24. [Components: Switch](#components-switch)
25. [Components: Slider](#components-slider)
26. [Components: Progress indicators](#components-progress-indicators)
27. [Components: Loading indicator](#components-loading-indicator)
28. [Components: Lists](#components-lists)
29. [Components: Menus](#components-menus)
30. [Components: Dialogs](#components-dialogs)
31. [Components: Bottom sheet and drag handle](#components-bottom-sheet-and-drag-handle)
32. [Components: Divider](#components-divider)
33. [Components: Search bar and search view](#components-search-bar-and-search-view)
34. [Components: Snackbar](#components-snackbar)
35. [Components: Text fields](#components-text-fields)
36. [Components: Date picker](#components-date-picker)
37. [Components: Time picker and time input](#components-time-picker-and-time-input)
38. [Components: Tooltips](#components-tooltips)
39. [Components: Scrim](#components-scrim)

---

## Type scale

Source files: TypeScaleTokens.kt, TypefaceTokens.kt, TypographyTokens.kt.

- Font keys: Brand = FontFamily.SansSerif, Plain = FontFamily.SansSerif in the token file (on Android FontFamily.SansSerif is Roboto; apps swap fonts through `Typography`).
- Weights: WeightRegular = FontWeight.Normal (400), WeightMedium = FontWeight.Medium (500), WeightBold = FontWeight.Bold (700).
- Units: size, line height and tracking in sp.

### Baseline styles (15)

| Style | Font key | Size | Line height | Weight | Tracking |
|---|---|---|---|---|---|
| DisplayLarge | Brand | 57sp | 64sp | 400 (Regular) | -0.2sp |
| DisplayMedium | Brand | 45sp | 52sp | 400 (Regular) | 0sp |
| DisplaySmall | Brand | 36sp | 44sp | 400 (Regular) | 0sp |
| HeadlineLarge | Brand | 32sp | 40sp | 400 (Regular) | 0sp |
| HeadlineMedium | Brand | 28sp | 36sp | 400 (Regular) | 0sp |
| HeadlineSmall | Brand | 24sp | 32sp | 400 (Regular) | 0sp |
| TitleLarge | Brand | 22sp | 28sp | 400 (Regular) | 0sp |
| TitleMedium | Plain | 16sp | 24sp | 500 (Medium) | 0.2sp |
| TitleSmall | Plain | 14sp | 20sp | 500 (Medium) | 0.1sp |
| BodyLarge | Plain | 16sp | 24sp | 400 (Regular) | 0.5sp |
| BodyMedium | Plain | 14sp | 20sp | 400 (Regular) | 0.2sp |
| BodySmall | Plain | 12sp | 16sp | 400 (Regular) | 0.4sp |
| LabelLarge | Plain | 14sp | 20sp | 500 (Medium) | 0.1sp |
| LabelMedium | Plain | 12sp | 16sp | 500 (Medium) | 0.5sp |
| LabelSmall | Plain | 11sp | 16sp | 500 (Medium) | 0.5sp |

### Emphasized styles (15, M3 Expressive)

Exposed in Compose as `Typography.displayLargeEmphasized` and so on.

| Style | Font key | Size | Line height | Weight | Tracking |
|---|---|---|---|---|---|
| DisplayLargeEmphasized | Brand | 57sp | 64sp | 500 (Medium) | 0sp |
| DisplayMediumEmphasized | Brand | 45sp | 52sp | 500 (Medium) | 0sp |
| DisplaySmallEmphasized | Brand | 36sp | 44sp | 500 (Medium) | 0sp |
| HeadlineLargeEmphasized | Brand | 32sp | 40sp | 500 (Medium) | 0sp |
| HeadlineMediumEmphasized | Brand | 28sp | 36sp | 500 (Medium) | 0sp |
| HeadlineSmallEmphasized | Brand | 24sp | 32sp | 500 (Medium) | 0sp |
| TitleLargeEmphasized | Brand | 22sp | 28sp | 500 (Medium) | 0sp |
| TitleMediumEmphasized | Plain | 16sp | 24sp | 700 (Bold) | 0.15sp |
| TitleSmallEmphasized | Plain | 14sp | 20sp | 700 (Bold) | 0.1sp |
| BodyLargeEmphasized | Plain | 16sp | 24sp | 500 (Medium) | 0.15sp |
| BodyMediumEmphasized | Plain | 14sp | 20sp | 500 (Medium) | 0.25sp |
| BodySmallEmphasized | Plain | 12sp | 16sp | 500 (Medium) | 0.4sp |
| LabelLargeEmphasized | Plain | 14sp | 20sp | 700 (Bold) | 0.1sp |
| LabelMediumEmphasized | Plain | 12sp | 16sp | 700 (Bold) | 0.5sp |
| LabelSmallEmphasized | Plain | 11sp | 16sp | 700 (Bold) | 0.5sp |


## Shape corner scale

Source: ShapeTokens.kt, ShapeKeyTokens.kt. Component tables below give shapes as `<Key> <dp>` (for example `Medium 12dp`); `Full` means fully rounded (pill or circle).

| Token | Corner radius |
|---|---|
| None | 0dp |
| ExtraSmall | 4dp |
| Small | 8dp |
| Medium | 12dp |
| Large | 16dp |
| LargeIncreased | 20dp |
| ExtraLarge | 28dp |
| ExtraLargeIncreased | 32dp |
| ExtraExtraLarge | 48dp |
| Full | 50% of the shorter side (CircleShape) |

Directional variants (TS = top start, TE = top end, BE = bottom end, BS = bottom start):

| Shape token | Corners (dp) |
|---|---|
| CornerExtraLargeTop | 28/28/0/0dp (TS/TE/BE/BS) |
| CornerExtraSmallTop | 4/4/0/0dp (TS/TE/BE/BS) |
| CornerLargeEnd | 0/16/16/0dp (TS/TE/BE/BS) |
| CornerLargeStart | 16/0/0/16dp (TS/TE/BE/BS) |
| CornerLargeTop | 16/16/0/0dp (TS/TE/BE/BS) |


## Elevation levels

Source: ElevationTokens.kt. M3 expresses elevation mostly as tonal surface color (surfaceContainer roles); these dp values drive shadows where a component has one.

| Level | dp |
|---|---|
| Level0 | 0dp |
| Level1 | 1dp |
| Level2 | 3dp |
| Level3 | 6dp |
| Level4 | 8dp |
| Level5 | 12dp |


## State layers and disabled opacities

Source: StateTokens.kt plus every `*Opacity` token in the component files. A state layer is the content (or "on") color drawn over the container at this opacity.

| State | State layer opacity |
|---|---|
| Dragged | 0.16 |
| Focus | 0.1 |
| Hover | 0.08 |
| Pressed | 0.1 |

Rule of thumb from the tokens: disabled content (label, icon, input text) = 0.38 of onSurface; disabled containers = 0.10 to 0.12 of onSurface (0.04 for the filled text field container, 0.38 for elevated and filled cards); disabled outlines = 0.12; scrim = 0.32.

| Opacity | Token name | Component token files |
|---|---|---|
| 0.04 | DisabledContainerOpacity | FilledTextField |
| 0.04 | TextFieldDisabledContainerOpacity | FilledAutocomplete |
| 0.1 | DisabledContainerOpacity | BaselineButton, ElevatedButton, FilledButton, FilledIconButton, FilledTonalIconButton, OutlinedButton, TextButton, TonalButton |
| 0.1 | ItemDisabledStateLayerOpacity | List |
| 0.1 | ItemSelectedDisabledStateLayerOpacity | List |
| 0.1 | SelectedDisabledContainerOpacity | OutlinedIconButton |
| 0.1 | UnselectedDisabledOutlineOpacity | Chips |
| 0.12 | DisabledContainerOpacity | FilledTonalButton |
| 0.12 | DisabledInactiveTrackOpacity | Slider |
| 0.12 | DisabledOutlineOpacity | OutlinedCard, OutlinedSegmentedButton, OutlinedTextField |
| 0.12 | DisabledSelectedContainerOpacity | InputChip |
| 0.12 | DisabledTrackOpacity | Switch |
| 0.12 | DisabledUnselectedOutlineOpacity | InputChip |
| 0.12 | ElevatedDisabledContainerOpacity | AssistChip, FilterChip, SuggestionChip |
| 0.12 | FlatDisabledOutlineOpacity | AssistChip, SuggestionChip |
| 0.12 | FlatDisabledSelectedContainerOpacity | FilterChip |
| 0.12 | FlatDisabledUnselectedOutlineOpacity | FilterChip |
| 0.12 | SelectedDisabledContainerOpacity | Chips |
| 0.12 | TextFieldDisabledOutlineOpacity | OutlinedAutocomplete |
| 0.32 | ContainerOpacity | Scrim |
| 0.38 | DisabledActiveIndicatorOpacity | FilledTextField |
| 0.38 | DisabledActiveTrackOpacity | Slider |
| 0.38 | DisabledAvatarOpacity | InputChip |
| 0.38 | DisabledContainerOpacity | ElevatedCard, FilledCard |
| 0.38 | DisabledHandleOpacity | Slider |
| 0.38 | DisabledIconOpacity | AssistChip, BaselineButton, ElevatedButton, FilledButton, FilledTonalButton, OutlinedButton, OutlinedSegmentedButton, TextButton, TonalButton |
| 0.38 | DisabledInputOpacity | FilledTextField, OutlinedTextField |
| 0.38 | DisabledLabelOpacity | FilledTextField, OutlinedTextField, TextButton |
| 0.38 | DisabledLabelTextOpacity | AssistChip, BaselineButton, ElevatedButton, FilledButton, FilledTonalButton, FilterChip, InputChip, OutlinedButton, OutlinedSegmentedButton, SuggestionChip, TonalButton |
| 0.38 | DisabledLeadingIconOpacity | FilledTextField, FilterChip, InputChip, OutlinedTextField, SuggestionChip |
| 0.38 | DisabledOpacity | FilledIconButton, FilledTonalIconButton, IconButton, OutlinedIconButton |
| 0.38 | DisabledSelectedIconOpacity | RadioButton, Switch |
| 0.38 | DisabledSupportingOpacity | FilledTextField, OutlinedTextField |
| 0.38 | DisabledTrailingIconOpacity | FilledTextField, FilterChip, InputChip, OutlinedTextField |
| 0.38 | DisabledUnselectedHandleOpacity | Switch |
| 0.38 | DisabledUnselectedIconOpacity | RadioButton, Switch |
| 0.38 | FieldDisabledInputTextOpacity | FilledAutocomplete, OutlinedAutocomplete |
| 0.38 | FieldDisabledLabelTextOpacity | FilledAutocomplete, OutlinedAutocomplete |
| 0.38 | FieldDisabledSupportingTextOpacity | FilledAutocomplete, OutlinedAutocomplete |
| 0.38 | ItemDisabledLabelTextOpacity | List, StandardMenu, VibrantMenu |
| 0.38 | ItemDisabledLeadingIconOpacity | List, StandardMenu, VibrantMenu |
| 0.38 | ItemDisabledOverlineOpacity | List |
| 0.38 | ItemDisabledSupportingTextOpacity | List, StandardMenu, VibrantMenu |
| 0.38 | ItemDisabledTrailingIconOpacity | List, StandardMenu, VibrantMenu |
| 0.38 | ItemDisabledTrailingSupportingTextOpacity | StandardMenu, VibrantMenu |
| 0.38 | ItemSelectedDisabledContainerOpacity | List, StandardMenu |
| 0.38 | ItemSelectedDisabledLabelTextOpacity | List, StandardMenu, VibrantMenu |
| 0.38 | ItemSelectedDisabledLeadingIconOpacity | List, StandardMenu, VibrantMenu |
| 0.38 | ItemSelectedDisabledOverlineOpacity | List |
| 0.38 | ItemSelectedDisabledSupportingTextOpacity | List, VibrantMenu |
| 0.38 | ItemSelectedDisabledTrailingIconOpacity | List, StandardMenu, VibrantMenu |
| 0.38 | ItemSelectedDisabledTrailingSupportingTextOpacity | List, VibrantMenu |
| 0.38 | SelectedDisabledContainerOpacity | Checkbox |
| 0.38 | TextFieldDisabledActiveIndicatorOpacity | FilledAutocomplete |
| 0.38 | TextFieldDisabledLeadingIconOpacity | FilledAutocomplete, OutlinedAutocomplete |
| 0.38 | TextFieldDisabledTrailingIconOpacity | FilledAutocomplete, OutlinedAutocomplete |
| 0.38 | UnselectedDisabledContainerOpacity | Checkbox |
| 1 | ActiveContainerOpacity | Slider |
| 1 | DisabledSelectedHandleOpacity | Switch |
| 1 | InactiveContainerOpacity | Slider |


## Motion

Source: StandardMotionTokens.kt, ExpressiveMotionTokens.kt, MotionSchemeKeyTokens.kt, MotionTokens.kt.

- Compose `MotionScheme.standard()` uses the Standard springs; `MotionScheme.expressive()` (M3 Expressive default in MaterialExpressiveTheme) uses the Expressive springs. Spatial springs move position and size and may bounce (damping below 1); Effects springs animate color and opacity and never overshoot (damping 1).
- MotionSchemeKeyTokens: DefaultSpatial, FastSpatial, SlowSpatial, DefaultEffects, FastEffects, SlowEffects.

### Springs (stiffness, damping ratio)

| Spring | Standard stiffness | Standard damping | Expressive stiffness | Expressive damping |
|---|---|---|---|---|
| FastSpatial | 1400 | 0.9 | 800 | 0.6 |
| DefaultSpatial | 700 | 0.9 | 380 | 0.8 |
| SlowSpatial | 300 | 0.9 | 200 | 0.8 |
| FastEffects | 3800 | 1 | 3800 | 1 |
| DefaultEffects | 1600 | 1 | 1600 | 1 |
| SlowEffects | 800 | 1 | 800 | 1 |

### Durations (easing-and-duration system)

| Duration token | ms |
|---|---|
| Short1 | 50 |
| Short2 | 100 |
| Short3 | 150 |
| Short4 | 200 |
| Medium1 | 250 |
| Medium2 | 300 |
| Medium3 | 350 |
| Medium4 | 400 |
| Long1 | 450 |
| Long2 | 500 |
| Long3 | 550 |
| Long4 | 600 |
| ExtraLong1 | 700 |
| ExtraLong2 | 800 |
| ExtraLong3 | 900 |
| ExtraLong4 | 1000 |

### Easing curves

| Easing token | cubic-bezier(x1, y1, x2, y2) |
|---|---|
| Emphasized | (0.2, 0, 0, 1) |
| EmphasizedAccelerate | (0.3, 0, 0.8, 0.15) |
| EmphasizedDecelerate | (0.05, 0.7, 0.1, 1) |
| Legacy | (0.4, 0, 0.2, 1) |
| LegacyAccelerate | (0.4, 0, 1, 1) |
| LegacyDecelerate | (0, 0, 0.2, 1) |
| Linear | (0, 0, 1, 1) |
| Standard | (0.2, 0, 0, 1) |
| StandardAccelerate | (0.3, 0, 1, 1) |
| StandardDecelerate | (0, 0, 0, 1) |

Note: Emphasized and Standard share the curve (0.2, 0, 0, 1) in the tokens.


## Color: scheme roles to palette tones

Source: ColorLightTokens.kt, ColorDarkTokens.kt, PaletteTokens.kt (baseline purple seed). Tone numbers are HCT tones (0 = black, 100 = white). These are the baseline static scheme mappings in Compose.

| Role | Light | Dark |
|---|---|---|
| Background | Neutral98 | Neutral6 |
| Error | Error40 | Error80 |
| ErrorContainer | Error90 | Error30 |
| InverseOnSurface | Neutral95 | Neutral20 |
| InversePrimary | Primary80 | Primary40 |
| InverseSurface | Neutral20 | Neutral90 |
| OnBackground | Neutral10 | Neutral90 |
| OnError | Error100 | Error20 |
| OnErrorContainer | Error10 | Error90 |
| OnPrimary | Primary100 | Primary20 |
| OnPrimaryContainer | Primary10 | Primary90 |
| OnPrimaryFixed | Primary10 | Primary10 |
| OnPrimaryFixedVariant | Primary30 | Primary30 |
| OnSecondary | Secondary100 | Secondary20 |
| OnSecondaryContainer | Secondary10 | Secondary90 |
| OnSecondaryFixed | Secondary10 | Secondary10 |
| OnSecondaryFixedVariant | Secondary30 | Secondary30 |
| OnSurface | Neutral10 | Neutral90 |
| OnSurfaceVariant | NeutralVariant30 | NeutralVariant80 |
| OnTertiary | Tertiary100 | Tertiary20 |
| OnTertiaryContainer | Tertiary10 | Tertiary90 |
| OnTertiaryFixed | Tertiary10 | Tertiary10 |
| OnTertiaryFixedVariant | Tertiary30 | Tertiary30 |
| Outline | NeutralVariant50 | NeutralVariant60 |
| OutlineVariant | NeutralVariant80 | NeutralVariant30 |
| Primary | Primary40 | Primary80 |
| PrimaryContainer | Primary90 | Primary30 |
| PrimaryFixed | Primary90 | Primary90 |
| PrimaryFixedDim | Primary80 | Primary80 |
| Scrim | Neutral0 | Neutral0 |
| Secondary | Secondary40 | Secondary80 |
| SecondaryContainer | Secondary90 | Secondary30 |
| SecondaryFixed | Secondary90 | Secondary90 |
| SecondaryFixedDim | Secondary80 | Secondary80 |
| Surface | Neutral98 | Neutral6 |
| SurfaceBright | Neutral98 | Neutral24 |
| SurfaceContainer | Neutral94 | Neutral12 |
| SurfaceContainerHigh | Neutral92 | Neutral17 |
| SurfaceContainerHighest | Neutral90 | Neutral22 |
| SurfaceContainerLow | Neutral96 | Neutral10 |
| SurfaceContainerLowest | Neutral100 | Neutral4 |
| SurfaceDim | Neutral87 | Neutral6 |
| SurfaceTint | Primary | Primary |
| SurfaceVariant | NeutralVariant90 | NeutralVariant30 |
| Tertiary | Tertiary40 | Tertiary80 |
| TertiaryContainer | Tertiary90 | Tertiary30 |
| TertiaryFixed | Tertiary90 | Tertiary90 |
| TertiaryFixedDim | Tertiary80 | Tertiary80 |


## Components: Buttons

### Sizes (M3 Expressive)

ButtonSmall and the baseline button below share the 40dp height.

| Token | ButtonXSmall | ButtonSmall | ButtonMedium | ButtonLarge | ButtonXLarge |
|---|---|---|---|---|---|
| ContainerHeight | 32dp | 40dp | 56dp | 96dp | 136dp |
| ContainerShapeRound | Full | Full | Full | Full | Full |
| ContainerShapeSquare | Medium 12dp | Medium 12dp | Large 16dp | ExtraLarge 28dp | ExtraLarge 28dp |
| IconLabelSpace | 8dp | 8dp | 8dp | 12dp | 16dp |
| IconSize | 20dp | 20dp | 24dp | 32dp | 40dp |
| LeadingSpace | 16dp | 16dp | 24dp | 48dp | 64dp |
| OutlinedOutlineWidth | 1dp | 1dp | 1dp | 2dp | 3dp |
| PressedContainerShape | Small 8dp | Small 8dp | Medium 12dp | Large 16dp | Large 16dp |
| SelectedContainerShapeRound | Full | Full | Full | Full | Full |
| SelectedContainerShapeSquare | Medium 12dp | Medium 12dp | Large 16dp | ExtraLarge 28dp | ExtraLarge 28dp |
| TrailingSpace | 16dp | 16dp | 24dp | 48dp | 64dp |

### Baseline common button

| Token | Value |
|---|---|
| ContainerColor | Primary |
| ContainerElevation | Level0 (0dp) |
| ContainerHeight | 40dp |
| ContainerShapeRound | Full |
| ContainerShapeSquare | Medium 12dp |
| DisabledContainerElevation | Level0 (0dp) |
| FocusedContainerElevation | Level0 (0dp) |
| HoveredContainerElevation | Level1 (1dp) |
| IconColor | OnPrimary |
| IconLabelSpace | 8dp |
| IconSize | 20dp |
| LabelTextColor | OnPrimary |
| LabelTextSelectedColor | OnPrimary |
| LabelTextUnselectedColor | OnSurfaceVariant |
| LeadingSpace | 24dp |
| PressedContainerElevation | Level0 (0dp) |
| PressedContainerShape | Small 8dp |
| SelectedContainerColor | Primary |
| SelectedContainerShapeRound | Full |
| SelectedContainerShapeSquare | Medium 12dp |
| SelectedIconColor | OnPrimary |
| TrailingSpace | 24dp |
| UnselectedContainerColor | SurfaceContainer |
| UnselectedIconColor | OnSurfaceVariant |

### Styles (container, content, elevation)

Color cells are color scheme roles. Selected/Unselected rows apply to toggle buttons.

| Token | ElevatedButton | FilledButton | TonalButton | FilledTonalButton | OutlinedButton | TextButton |
|---|---|---|---|---|---|---|
| ContainerColor | SurfaceContainerLow | Primary | SecondaryContainer | SecondaryContainer |  |  |
| ContainerElevation | Level1 (1dp) | Level0 (0dp) | Level0 (0dp) | Level0 (0dp) |  |  |
| DisabledContainerElevation | Level0 (0dp) | Level0 (0dp) | Level0 (0dp) | Level0 (0dp) |  |  |
| FocusedContainerElevation | Level1 (1dp) | Level0 (0dp) | Level0 (0dp) |  |  |  |
| HoveredContainerElevation | Level2 (3dp) | Level1 (1dp) | Level1 (1dp) |  |  |  |
| IconColor | Primary | OnPrimary | OnSecondaryContainer | OnSecondaryContainer | OnSurfaceVariant | OnSurfaceVariant |
| LabelTextColor | Primary | OnPrimary | OnSecondaryContainer | OnSecondaryContainer | OnSurfaceVariant |  |
| LabelTextSelectedColor | OnPrimary | OnPrimary |  |  |  |  |
| LabelTextUnselectedColor | Primary | OnSurfaceVariant |  |  |  |  |
| PressedContainerElevation | Level1 (1dp) | Level0 (0dp) | Level0 (0dp) | Level0 (0dp) |  |  |
| SelectedContainerColor | Primary | Primary | Secondary |  | InverseSurface |  |
| SelectedIconColor | OnPrimary | OnPrimary | OnSecondary |  | InverseOnSurface |  |
| UnselectedContainerColor | SurfaceContainerLow | SurfaceContainer | SecondaryContainer |  |  |  |
| UnselectedIconColor | OnPrimary | OnSurfaceVariant | OnSecondaryContainer |  | OnSurfaceVariant |  |
| SelectedLabelTextColor |  |  | OnSecondary |  | InverseOnSurface |  |
| UnselectedLabelTextColor |  |  | OnSecondaryContainer |  | OnSurfaceVariant |  |
| ContainerHeight |  |  |  | 40dp |  |  |
| ContainerShape |  |  |  | Full |  |  |
| FocusContainerElevation |  |  |  | Level0 (0dp) |  |  |
| HoverContainerElevation |  |  |  | Level1 (1dp) |  |  |
| IconSize |  |  |  | 18dp |  |  |
| OutlineColor |  |  |  |  | OutlineVariant |  |
| LabelColor |  |  |  |  |  | OnSurfaceVariant |


## Components: Button groups and segmented buttons

### Button groups

| Token | ButtonGroupSmall | ConnectedButtonGroupSmall |
|---|---|---|
| BetweenSpace | 12dp | 2dp |
| ContainerHeight | 40dp | 40dp |
| ContainerShape |  | Full |
| InnerCornerCornerSize |  | CornerSize(8dp) |
| PressedInnerCornerCornerSize |  | CornerSize(4dp) |
| SelectedInnerCornerCornerSizePercent |  | 50 |

### Segmented button (outlined)

| Token | Value |
|---|---|
| ContainerHeight | 40dp |
| OutlineColor | Outline |
| OutlineWidth | 1dp |
| SelectedContainerColor | SecondaryContainer |
| SelectedLabelTextColor | OnSecondaryContainer |
| SelectedIconColor | OnSecondaryContainer |
| Shape | Full |
| UnselectedLabelTextColor | OnSurface |
| UnselectedIconColor | OnSurface |
| IconSize | 18dp |


## Components: Split button

| Token | SplitButtonXSmall | SplitButtonSmall | SplitButtonMedium | SplitButtonLarge | SplitButtonXLarge |
|---|---|---|---|---|---|
| BetweenSpace | 2dp | 2dp | 2dp | 2dp | 2dp |
| ContainerHeight | 32dp | 40dp | 56dp | 96dp | 136dp |
| ContainerShape | Full | Full | Full | Full | Full |
| InnerCornerCornerSize | CornerSize(4dp) | CornerSize(4dp) | CornerSize(4dp) | CornerSize(8dp) | CornerSize(12dp) |
| InnerHoveredCornerCornerSize | CornerSize(8dp) | CornerSize(12dp) | CornerSize(12dp) | CornerSize(20dp) | CornerSize(20dp) |
| InnerPressedCornerCornerSize | CornerSize(8dp) | CornerSize(12dp) | CornerSize(12dp) | CornerSize(20dp) | CornerSize(20dp) |
| LeadingButtonLeadingSpace | 12dp | 16dp | 24dp | 48dp | 64dp |
| LeadingButtonTrailingSpace | 10dp | 12dp | 24dp | 48dp | 64dp |
| OuterCornerCornerSizePercent | 50 |  |  |  |  |
| TrailingIconSize | 22dp | 22dp | 26dp | 38dp | 50dp |
| TrailingInnerSelectedCornerCornerSizePercent | 50 | 50 | 50 | 50 | 50 |
| TrailingButtonLeadingSpace | 13dp | 13dp | 15dp | 29dp | 43dp |
| TrailingButtonTrailingSpace | 13dp | 13dp | 15dp | 29dp | 43dp |


## Components: Icon buttons

### Sizes

Selected shapes swap on toggle: a round icon button becomes the size's square radius when selected, a square one becomes Full (as generated).

| Token | XSmallIconButton | SmallIconButton | MediumIconButton | LargeIconButton | XLargeIconButton |
|---|---|---|---|---|---|
| ContainerHeight | 32dp | 40dp | 56dp | 96dp | 136dp |
| ContainerShapeRound | Full | Full | Full | Full | Full |
| ContainerShapeSquare | Medium 12dp | Medium 12dp | Large 16dp | ExtraLarge 28dp | ExtraLarge 28dp |
| DefaultLeadingSpace | 6dp | 8dp | 16dp |  | 48dp |
| DefaultTrailingSpace | 6dp | 8dp | 16dp |  | 48dp |
| IconSize | 20dp | 24dp | 24dp | 32dp | 40dp |
| NarrowLeadingSpace | 4dp | 4dp | 12dp | 16dp | 32dp |
| NarrowTrailingSpace | 4dp | 4dp | 12dp | 16dp | 32dp |
| OutlinedOutlineWidth | 1dp | 1dp | 1dp | 2dp | 3dp |
| PressedContainerShape | Small 8dp | Small 8dp | Medium 12dp | Large 16dp | Large 16dp |
| SelectedContainerShapeRound | Medium 12dp | Medium 12dp | Large 16dp | ExtraLarge 28dp | ExtraLarge 28dp |
| SelectedContainerShapeSquare | Full | Full | Full | Full | Full |
| WideLeadingSpace | 10dp | 14dp | 24dp | 48dp | 72dp |
| WideTrailingSpace | 10dp | 14dp | 24dp | 48dp | 72dp |
| UniformLeadingSpace |  |  |  | 32dp |  |
| UniformTrailingSpace |  |  |  | 32dp |  |

### Styles

| Token | IconButton | FilledIconButton | FilledTonalIconButton | OutlinedIconButton |
|---|---|---|---|---|
| Color | OnSurfaceVariant | OnPrimary | OnSecondaryContainer | OnSurfaceVariant |
| SelectedColor | Primary | OnPrimary | OnSecondary | InverseOnSurface |
| UnselectedColor | OnSurfaceVariant | OnSurfaceVariant | OnSecondaryContainer | OnSurfaceVariant |
| ContainerColor |  | Primary | SecondaryContainer |  |
| SelectedContainerColor |  | Primary | Secondary | InverseSurface |
| UnselectedContainerColor |  | SurfaceContainer | SecondaryContainer |  |
| OutlineColor |  |  |  | OutlineVariant |
| UnselectedOutlineColor |  |  |  | OutlineVariant |


## Components: FAB and extended FAB

### FAB sizes

FabMedium and ExtendedFabMedium have their ContainerShape commented out in the generated files as `CornerLargeIncreased` (20dp); Compose currently uses that value.

| Token | FabSmall | FabBaseline | FabMedium | FabLarge |
|---|---|---|---|---|
| ContainerHeight | 40dp | 56dp | 80dp | 96dp |
| ContainerShape | Medium 12dp | Large 16dp |  | ExtraLarge 28dp |
| ContainerWidth | 40dp | 56dp | 80dp | 96dp |
| IconSize | 24dp | 24dp | 28dp | 32dp |

### FAB color styles

| Token | FabPrimaryContainer | FabSecondaryContainer |
|---|---|---|
| ContainerColor | PrimaryContainer | SecondaryContainer |
| ContainerElevation | Level3 (6dp) | Level3 (6dp) |
| FocusedContainerElevation | Level3 (6dp) | Level3 (6dp) |
| HoveredContainerElevation | Level4 (8dp) | Level4 (8dp) |
| IconColor | OnPrimaryContainer | OnSecondaryContainer |
| PressedContainerElevation | Level3 (6dp) | Level3 (6dp) |

### Extended FAB

| Token | ExtendedFabSmall | ExtendedFabMedium | ExtendedFabLarge | ExtendedFabPrimary |
|---|---|---|---|---|
| ContainerHeight | 56dp | 80dp | 96dp | 56dp |
| ContainerShape | Large 16dp |  | ExtraLarge 28dp | Large 16dp |
| IconLabelSpace | 8dp | 16dp | 20dp |  |
| IconSize | 24dp | 28dp | 32dp | 24dp |
| LeadingSpace | 16dp | 26dp | 28dp |  |
| TrailingSpace | 16dp | 26dp | 28dp |  |
| ContainerColor |  |  |  | PrimaryContainer |
| ContainerElevation |  |  |  | Level3 (6dp) |
| FocusContainerElevation |  |  |  | Level3 (6dp) |
| HoverContainerElevation |  |  |  | Level4 (8dp) |
| IconColor |  |  |  | OnPrimaryContainer |
| LabelTextColor |  |  |  | OnPrimaryContainer |
| LoweredContainerElevation |  |  |  | Level1 (1dp) |
| LoweredFocusContainerElevation |  |  |  | Level1 (1dp) |
| LoweredHoverContainerElevation |  |  |  | Level2 (3dp) |
| LoweredPressedContainerElevation |  |  |  | Level1 (1dp) |
| PressedContainerElevation |  |  |  | Level3 (6dp) |


## Components: FAB menu

| Token | Value |
|---|---|
| CloseButtonBetweenSpace | 8dp |
| CloseButtonContainerElevation | Level3 (6dp) |
| CloseButtonContainerHeight | 56dp |
| CloseButtonContainerShape | Full |
| CloseButtonContainerWidth | 56dp |
| CloseButtonIconSize | 20dp |
| ListItemBetweenSpace | 4dp |
| ListItemContainerElevation | Level3 (6dp) |
| ListItemContainerHeight | 56dp |
| ListItemContainerShape | Full |
| ListItemIconLabelSpace | 8dp |
| ListItemIconSize | 24dp |
| ListItemLeadingSpace | 24dp |
| ListItemTrailingSpace | 24dp |


## Components: App bars

### Top app bars

| Token | AppBar | AppBarSmall | AppBarMedium | AppBarLarge | AppBarMediumFlexible | AppBarLargeFlexible |
|---|---|---|---|---|---|---|
| AvatarSize | 32dp |  |  |  |  |  |
| ContainerColor | Surface |  |  |  |  |  |
| ContainerElevation | Level0 (0dp) |  |  |  |  |  |
| ContainerShape | None 0dp |  |  |  |  |  |
| IconButtonSpace | 0dp |  |  |  |  |  |
| IconSize | 24dp |  |  |  |  |  |
| LeadingIconColor | OnSurface |  |  |  |  |  |
| LeadingSpace | 4dp |  |  |  |  |  |
| OnScrollContainerColor | SurfaceContainer |  |  |  |  |  |
| OnScrollContainerElevation | Level2 (3dp) |  |  |  |  |  |
| SubtitleColor | OnSurfaceVariant |  |  |  |  |  |
| TitleColor | OnSurface |  |  |  |  |  |
| TrailingIconColor | OnSurfaceVariant |  |  |  |  |  |
| TrailingSpace | 4dp |  |  |  |  |  |
| ContainerHeight |  | 64dp | 112dp | 152dp | 112dp | 120dp |
| LargeContainerHeight |  |  |  |  | 136dp | 152dp |

### Bottom app bar

| Token | Value |
|---|---|
| ContainerColor | SurfaceContainer |
| ContainerElevation | Level2 (3dp) |
| ContainerHeight | 80dp |
| ContainerShape | None 0dp |


## Components: Toolbars

| Token | DockedToolbar | FloatingToolbar |
|---|---|---|
| ContainerColor | SurfaceContainer |  |
| ContainerHeight | 64dp | 64dp |
| ContainerLeadingSpace | 16dp | 8dp |
| ContainerMaxSpacing | 32dp |  |
| ContainerMinSpacing | 4dp |  |
| ContainerShape | None 0dp | Full |
| ContainerTrailingSpace | 16dp | 8dp |
| ContainerBetweenSpace |  | 4dp |
| ContainerExternalPadding |  | 16dp |
| StandardContainerColor |  | SurfaceContainer |
| VibrantButtonSelectedContainerColor |  | SurfaceContainer |
| VibrantButtonSelectedIconColor |  | OnSurface |
| VibrantButtonSelectedTextColor |  | OnSurface |
| VibrantButtonUnselectedIconColor |  | OnPrimaryContainer |
| VibrantButtonUnselectedTextColor |  | OnPrimaryContainer |
| VibrantContainerColor |  | PrimaryContainer |


## Components: Navigation bar

### Bar

| Token | Value |
|---|---|
| ContainerColor | SurfaceContainer |
| ContainerElevation | Level2 (3dp) |
| ContainerHeight | 64dp |
| ItemActiveIconColor | OnSecondaryContainer |
| ItemActiveIndicatorColor | SecondaryContainer |
| ItemActiveIndicatorIconLabelSpace | 4dp |
| ItemActiveIndicatorShape | Full |
| ItemActiveLabelTextColor | Secondary |
| ItemBetweenSpace | 0dp |
| ItemInactiveIconColor | OnSurfaceVariant |
| ItemInactiveLabelTextColor | OnSurfaceVariant |
| NavShape | None 0dp |
| TallContainerHeight | 80dp |

### Items

| Token | NavigationBarVerticalItem | NavigationBarHorizontalItem |
|---|---|---|
| ActiveIndicatorHeight | 32dp | 40dp |
| ActiveIndicatorWidth | 56dp |  |
| ContainerBetweenSpace | 6dp |  |
| IconSize | 24dp | 24dp |
| ActiveIndicatorLeadingSpace |  | 16dp |
| ActiveIndicatorTrailingSpace |  | 16dp |


## Components: Navigation rail

### Rail

| Token | NavigationRailCollapsed | NavigationRailExpanded |
|---|---|---|
| ContainerElevation | Level0 (0dp) | Level0 (0dp) |
| ContainerShape | None 0dp | None 0dp |
| ContainerWidth | 96dp |  |
| ItemVerticalSpace | 4dp |  |
| TopSpace | 44dp | 44dp |
| ContainerColor | Surface |  |
| NarrowContainerWidth | 80dp |  |
| ContainerWidthMaximum |  | 360dp |
| ContainerWidthMinimum |  | 220dp |
| ModalContainerElevation |  | Level2 (3dp) |
| ModalContainerShape |  | Large 16dp |
| ModalContainerColor |  | SurfaceContainer |

### Items

| Token | NavigationRailBaselineItem | NavigationRailVerticalItem | NavigationRailHorizontalItem |
|---|---|---|---|
| ActiveIndicatorIconLabelSpace | 8dp |  |  |
| ActiveIndicatorLeadingSpace | 16dp |  |  |
| ActiveIndicatorShape | Full |  |  |
| ActiveIndicatorTrailingSpace | 16dp |  |  |
| ContainerHeight | 64dp |  |  |
| ContainerShape | None 0dp |  |  |
| ContainerVerticalSpace | 6dp |  |  |
| HeaderSpaceMinimum | 40dp |  |  |
| IconSize | 24dp |  |  |
| ActiveIndicatorHeight |  | 32dp | 56dp |
| ActiveIndicatorWidth |  | 56dp |  |
| IconLabelSpace |  | 4dp | 8dp |
| LeadingSpace |  | 16dp | 16dp |
| TrailingSpace |  | 16dp |  |
| FullWidthLeadingSpace |  |  | 16dp |
| FullWidthTrailingSpace |  |  | 16dp |

### Colors

| Token | Value |
|---|---|
| ItemActiveIcon | OnSecondaryContainer |
| ItemActiveIndicator | SecondaryContainer |
| ItemActiveLabelText | Secondary |
| ItemInactiveIcon | OnSurfaceVariant |
| ItemInactiveLabelText | OnSurfaceVariant |


## Components: Navigation drawer

| Token | Value |
|---|---|
| ActiveIconColor | OnSecondaryContainer |
| ActiveIndicatorColor | SecondaryContainer |
| ActiveIndicatorHeight | 56dp |
| ActiveIndicatorShape | Full |
| ActiveIndicatorWidth | 336dp |
| ActiveLabelTextColor | OnSecondaryContainer |
| BottomContainerShape | LargeTop 16/16/0/0dp (TS/TE/BE/BS) |
| ContainerHeightPercent | 100 |
| ContainerShape | LargeEnd 0/16/16/0dp (TS/TE/BE/BS) |
| ContainerWidth | 360dp |
| HeadlineColor | OnSurfaceVariant |
| IconSize | 24dp |
| InactiveIconColor | OnSurfaceVariant |
| InactiveLabelTextColor | OnSurfaceVariant |
| LargeBadgeLabelColor | OnSurfaceVariant |
| ModalContainerColor | SurfaceContainerLow |
| ModalContainerElevation | Level1 (1dp) |
| StandardContainerColor | Surface |
| StandardContainerElevation | Level0 (0dp) |


## Components: Tabs

| Token | PrimaryNavigationTab | SecondaryNavigationTab |
|---|---|---|
| ActiveIndicatorColor | Primary |  |
| ActiveIndicatorHeight | 3dp |  |
| ActiveIndicatorShape | RoundedCornerShape(3dp) |  |
| ContainerColor | Surface | Surface |
| ContainerElevation | Level0 (0dp) | Level0 (0dp) |
| ContainerHeight | 48dp | 48dp |
| ContainerShape | None 0dp | None 0dp |
| ActiveIconColor | Primary | OnSurface |
| IconAndLabelTextContainerHeight | 64dp |  |
| IconSize | 24dp | 24dp |
| InactiveIconColor | OnSurfaceVariant | OnSurfaceVariant |
| ActiveLabelTextColor | Primary | OnSurface |
| InactiveLabelTextColor | OnSurfaceVariant | OnSurfaceVariant |
| DividerColor |  | SurfaceVariant |
| DividerHeight |  | 1dp |


## Components: Badges

| Token | Value |
|---|---|
| Color | Error |
| LargeColor | Error |
| LargeLabelTextColor | OnError |
| LargeShape | Full |
| LargeSize | 16dp |
| Shape | Full |
| Size | 6dp |


## Components: Cards

| Token | ElevatedCard | FilledCard | OutlinedCard |
|---|---|---|---|
| ContainerColor | SurfaceContainerLow | SurfaceContainerHighest | Surface |
| ContainerElevation | Level1 (1dp) | Level0 (0dp) | Level0 (0dp) |
| ContainerShape | Medium 12dp | Medium 12dp | Medium 12dp |
| DisabledContainerElevation | Level1 (1dp) | Level0 (0dp) | Level0 (0dp) |
| DraggedContainerElevation | Level4 (8dp) | Level3 (6dp) | Level3 (6dp) |
| FocusContainerElevation | Level1 (1dp) | Level0 (0dp) | Level0 (0dp) |
| HoverContainerElevation | Level2 (3dp) | Level1 (1dp) | Level1 (1dp) |
| IconColor | Primary | Primary | Primary |
| IconSize | 24dp | 24dp | 24dp |
| PressedContainerElevation | Level1 (1dp) | Level0 (0dp) | Level0 (0dp) |
| OutlineColor |  |  | OutlineVariant |
| OutlineWidth |  |  | 1dp |


## Components: Chips

### Shared chip tokens

| Token | Value |
|---|---|
| AvatarShape | Full |
| AvatarSize | 24dp |
| ContainerElevation | Level0 (0dp) |
| DraggedContainerElevation | Level4 (8dp) |
| Height | 32dp |
| LabelText | LabelLarge |
| LeadingIconSize | 18dp |
| PressedShape | Small 8dp |
| SelectedContainerColor | SecondaryContainer |
| SelectedLabelTextColor | OnSecondaryContainer |
| SelectedLeadingIconColor | OnSecondaryContainer |
| SelectedOutlineWidth | 0dp |
| SelectedShape | Full |
| SelectedTrailingIconColor | OnSecondaryContainer |
| TrailingIconSize | 18dp |
| UnselectedLabelTextColor | OnSurfaceVariant |
| UnselectedLeadingIconColor | OnSurfaceVariant |
| UnselectedOutlineColor | OutlineVariant |
| UnselectedOutlineWidth | 1dp |
| UnselectedShape | Medium 12dp |
| UnselectedTrailingIconColor | OnSurfaceVariant |

### Chip types

| Token | AssistChip | FilterChip | InputChip | SuggestionChip |
|---|---|---|---|---|
| ContainerHeight | 32dp | 32dp | 32dp | 32dp |
| ContainerShape | Small 8dp | Small 8dp | Small 8dp | Small 8dp |
| DraggedContainerElevation | Level4 (8dp) | Level4 (8dp) | Level4 (8dp) | Level4 (8dp) |
| ElevatedContainerColor | SurfaceContainerLow |  |  | SurfaceContainerLow |
| ElevatedContainerElevation | Level1 (1dp) | Level1 (1dp) |  | Level1 (1dp) |
| ElevatedDisabledContainerElevation | Level0 (0dp) | Level0 (0dp) |  | Level0 (0dp) |
| ElevatedFocusContainerElevation | Level1 (1dp) | Level1 (1dp) |  | Level1 (1dp) |
| ElevatedHoverContainerElevation | Level2 (3dp) | Level2 (3dp) |  | Level2 (3dp) |
| ElevatedPressedContainerElevation | Level1 (1dp) | Level1 (1dp) |  | Level1 (1dp) |
| FlatContainerElevation | Level0 (0dp) | Level0 (0dp) |  | Level0 (0dp) |
| FlatOutlineColor | OutlineVariant |  |  | OutlineVariant |
| FlatOutlineWidth | 1dp |  |  | 1dp |
| LabelTextColor | OnSurface |  |  | OnSurfaceVariant |
| IconColor | Primary |  |  |  |
| IconSize | 18dp | 18dp |  |  |
| ElevatedSelectedContainerColor |  | SecondaryContainer |  |  |
| ElevatedUnselectedContainerColor |  | SurfaceContainerLow |  |  |
| FlatSelectedContainerColor |  | SecondaryContainer |  |  |
| FlatSelectedFocusContainerElevation |  | Level0 (0dp) |  |  |
| FlatSelectedHoverContainerElevation |  | Level1 (1dp) |  |  |
| FlatSelectedOutlineWidth |  | 0dp |  |  |
| FlatSelectedPressedContainerElevation |  | Level0 (0dp) |  |  |
| FlatUnselectedFocusContainerElevation |  | Level0 (0dp) |  |  |
| FlatUnselectedHoverContainerElevation |  | Level0 (0dp) |  |  |
| FlatUnselectedOutlineColor |  | OutlineVariant |  |  |
| FlatUnselectedOutlineWidth |  | 1dp |  |  |
| FlatUnselectedPressedContainerElevation |  | Level0 (0dp) |  |  |
| SelectedLabelTextColor |  | OnSecondaryContainer | OnSecondaryContainer |  |
| UnselectedLabelTextColor |  | OnSurfaceVariant | OnSurfaceVariant |  |
| SelectedLeadingIconColor |  | OnSecondaryContainer | Primary |  |
| UnselectedLeadingIconColor |  | Primary | OnSurfaceVariant |  |
| SelectedTrailingIconColor |  | OnSecondaryContainer | OnSecondaryContainer |  |
| UnselectedTrailingIconColor |  | OnSurfaceVariant | OnSurfaceVariant |  |
| ContainerElevation |  |  | Level0 (0dp) |  |
| SelectedContainerColor |  |  | SecondaryContainer |  |
| SelectedOutlineWidth |  |  | 0dp |  |
| UnselectedOutlineColor |  |  | OutlineVariant |  |
| UnselectedOutlineWidth |  |  | 1dp |  |
| AvatarShape |  |  | Full |  |
| AvatarSize |  |  | 24dp |  |
| LeadingIconSize |  |  | 18dp | 18dp |
| TrailingIconSize |  |  | 18dp |  |
| LeadingIconColor |  |  |  | Primary |


## Components: Checkbox

| Token | Value |
|---|---|
| ContainerShape | RoundedCornerShape(2dp) |
| ContainerSize | 18dp |
| IconSize | 18dp |
| SelectedContainerColor | Primary |
| SelectedDisabledContainerOutlineWidth | 0dp |
| SelectedErrorContainerColor | Error |
| SelectedErrorIconColor | OnError |
| SelectedFocusOutlineWidth | 0dp |
| SelectedHoverOutlineWidth | 0dp |
| SelectedIconColor | OnPrimary |
| SelectedOutlineWidth | 0dp |
| SelectedPressedOutlineWidth | 0dp |
| UnselectedDisabledOutlineWidth | 2dp |
| UnselectedErrorOutlineColor | Error |
| UnselectedFocusOutlineWidth | 2dp |
| UnselectedHoverOutlineWidth | 2dp |
| UnselectedOutlineColor | OnSurfaceVariant |
| UnselectedOutlineWidth | 2dp |
| UnselectedPressedOutlineWidth | 2dp |


## Components: Radio button

| Token | Value |
|---|---|
| IconSize | 20dp |
| SelectedIconColor | Primary |
| UnselectedIconColor | OnSurfaceVariant |


## Components: Switch

| Token | Value |
|---|---|
| HandleShape | Full |
| PressedHandleHeight | 28dp |
| PressedHandleWidth | 28dp |
| SelectedHandleColor | OnPrimary |
| SelectedHandleHeight | 24dp |
| SelectedHandleWidth | 24dp |
| SelectedIconColor | OnPrimaryContainer |
| SelectedIconSize | 16dp |
| SelectedTrackColor | Primary |
| TrackHeight | 32dp |
| TrackOutlineWidth | 2dp |
| TrackShape | Full |
| TrackWidth | 52dp |
| UnselectedHandleColor | Outline |
| UnselectedHandleHeight | 16dp |
| UnselectedHandleWidth | 16dp |
| UnselectedIconColor | SurfaceContainerHighest |
| UnselectedIconSize | 16dp |
| UnselectedTrackColor | SurfaceContainerHighest |
| UnselectedTrackOutlineColor | Outline |
| IconHandleHeight | 24dp |
| IconHandleWidth | 24dp |


## Components: Slider

| Token | Value |
|---|---|
| ActiveContainerOpacity | 1 |
| ActiveHandleHeight | 44dp |
| ActiveHandleLeadingSpace | 6dp |
| ActiveHandlePadding | 6dp |
| ActiveHandleShape | Full |
| ActiveHandleTrailingSpace | 6dp |
| ActiveHandleWidth | 4dp |
| ActiveTrackColor | Primary |
| ActiveTrackHeight | 16dp |
| ActiveTrackShape | Full |
| ActiveTrackShapeLeading | Full |
| DisabledHandleWidth | 4dp |
| FocusHandleWidth | 2dp |
| HandleColor | Primary |
| HandleHeight | 44dp |
| HandleShape | Full |
| HandleWidth | 4dp |
| HoverHandleWidth | 4dp |
| InactiveContainerOpacity | 1 |
| InactiveTrackColor | SecondaryContainer |
| InactiveTrackHeight | 16dp |
| InactiveTrackShape | Full |
| LabelContainerColor | Primary |
| LabelTextColor | InverseOnSurface |
| PressedHandleWidth | 2dp |
| SliderActiveHandleColor | Primary |
| StopIndicatorColor | SecondaryContainer |
| StopIndicatorColorSelected | SecondaryContainer |
| StopIndicatorShape | Full |
| StopIndicatorSize | 4dp |
| StopIndicatorTrailingSpace | 6dp |
| ValueIndicatorActiveBottomSpace | 12dp |
| ValueIndicatorContainerColor | InverseSurface |
| ValueIndicatorLabelTextColor | InverseOnSurface |


## Components: Progress indicators

| Token | ProgressIndicator | LinearProgressIndicator | CircularProgressIndicator |
|---|---|---|---|
| ActiveIndicatorColor | Primary |  |  |
| ActiveShape | Full |  |  |
| StopColor | Primary |  |  |
| StopShape | Full |  |  |
| TrackColor | SecondaryContainer |  |  |
| TrackShape | Full |  |  |
| ActiveThickness |  | 4dp | 4dp |
| ActiveWaveAmplitude |  | 3dp | 1.6dp |
| ActiveWaveWavelength |  | 40dp | 15dp |
| Height |  | 4dp |  |
| IndeterminateActiveWaveWavelength |  | 20dp |  |
| StopSize |  | 4dp |  |
| StopTrailingSpace |  | 0dp |  |
| TrackActiveSpace |  | 4dp | 4dp |
| TrackThickness |  | 4dp | 4dp |
| WaveHeight |  | 10dp |  |
| Size |  |  | 40dp |
| WaveSize |  |  | 48dp |


## Components: Loading indicator

| Token | Value |
|---|---|
| ActiveIndicatorColor | Primary |
| ActiveSize | 38dp |
| ContainedActiveColor | OnPrimaryContainer |
| ContainedContainerColor | PrimaryContainer |
| ContainerHeight | 48dp |
| ContainerShape | Full |
| ContainerWidth | 48dp |


## Components: Lists

### List items

| Token | Value |
|---|---|
| ContainerShape | Large 16dp |
| DividerBottomSpace | 0dp |
| DividerLeadingSpace | 16dp |
| DividerTopSpace | 0dp |
| DividerTrailingSpace | 16dp |
| ItemBetweenSpace | 12dp |
| ItemBottomSpace | 10dp |
| ItemContainerColor | Surface |
| ItemContainerElevation | Level0 (0dp) |
| ItemContainerExpressiveShape | ExtraSmall 4dp |
| ItemContainerShape | None 0dp |
| ItemDisabledContainerExpressiveShape | ExtraSmall 4dp |
| ItemDraggedContainerElevation | Level4 (8dp) |
| ItemDraggedContainerExpressiveShape | Large 16dp |
| ItemFocusedContainerExpressiveShape | Large 16dp |
| ItemHoveredContainerExpressiveShape | Medium 12dp |
| ItemLabelTextColor | OnSurface |
| ItemLargeLeadingVideoHeight | 64dp |
| ItemLargeLeadingVideoWidth | 114dp |
| ItemLeadingAvatarColor | PrimaryContainer |
| ItemLeadingAvatarLabelColor | OnPrimaryContainer |
| ItemLeadingAvatarShape | Full |
| ItemLeadingAvatarSize | 40dp |
| ItemLeadingIconColor | OnSurfaceVariant |
| ItemLeadingIconExpressiveSize | 20dp |
| ItemLeadingIconSize | 24dp |
| ItemLeadingImageExpressiveShape | Small 8dp |
| ItemLeadingImageHeight | 56dp |
| ItemLeadingImageShape | None 0dp |
| ItemLeadingImageWidth | 56dp |
| ItemLeadingSpace | 16dp |
| ItemLeadingVideoShape | Small 8dp |
| ItemLeadingVideoWidth | 100dp |
| ItemOneLineContainerHeight | 56dp |
| ItemOverlineColor | OnSurfaceVariant |
| ItemPressedContainerExpressiveShape | Large 16dp |
| ItemSegmentedContainerColor | Surface |
| ItemSelectedContainerColor | SecondaryContainer |
| ItemSelectedContainerExpressiveShape | Large 16dp |
| ItemSelectedContainerShape | Large 16dp |
| ItemSelectedDisabledContainerExpressiveShape | Large 16dp |
| ItemSelectedDraggedContainerExpressiveShape | Large 16dp |
| ItemSelectedFocusedContainerExpressiveShape | Large 16dp |
| ItemSelectedHoveredContainerExpressiveShape | Large 16dp |
| ItemSelectedLabelTextColor | OnSecondaryContainer |
| ItemSelectedLeadingIconColor | OnSecondaryContainer |
| ItemSelectedOverlineColor | OnSecondaryContainer |
| ItemSelectedPressedContainerExpressiveShape | Large 16dp |
| ItemSelectedSupportingTextColor | OnSecondaryContainer |
| ItemSelectedTrailingIconColor | OnSecondaryContainer |
| ItemSelectedTrailingSupportingTextColor | OnSecondaryContainer |
| ItemSmallLeadingVideoHeight | 56dp |
| ItemSmallLeadingVideoWidth | 100dp |
| ItemSupportingTextColor | OnSurfaceVariant |
| ItemThreeLineContainerHeight | 88dp |
| ItemTopSpace | 10dp |
| ItemTrailingIconColor | OnSurfaceVariant |
| ItemTrailingIconExpressiveSize | 20dp |
| ItemTrailingIconSize | 24dp |
| ItemTrailingSpace | 16dp |
| ItemTrailingSupportingTextColor | OnSurfaceVariant |
| ItemTwoLineContainerHeight | 72dp |
| ItemUnselectedTrailingIconColor | OnSurface |
| SegmentedGap | 2dp |

### Expanded, reveal and reorder lists (M3 Expressive)

| Token | ExpandedList | RevealList | ReorderList |
|---|---|---|---|
| CollapsedItemTrailingIconContainerColor | Surface |  |  |
| CollapsedItemTrailingIconIconColor | OnSurface |  |  |
| ContainerShape | Large 16dp |  |  |
| ExpandedItemContainerColor | Surface |  |  |
| ExpandedItemSegmentedContainerColor | Surface |  |  |
| ExpandedItemTrailingIconContainerColor | SurfaceContainer |  |  |
| ExpandedItemTrailingIconIconColor | OnSurface |  |  |
| TrailingIconShape | Full |  |  |
| ItemActionButtonIconIconColor |  | OnPrimary |  |
| ItemActionIconButtonContainerColor |  | Primary |  |
| ItemButtonIconIconColor |  | OnSecondaryContainer |  |
| ItemContainerColor |  | Surface | TertiaryContainer |
| ItemContainerShape |  | Large 16dp |  |
| ItemIconButtonActionContainerShape |  | Large 16dp |  |
| ItemIconButtonContainerColor |  | SecondaryContainer |  |
| ItemIconButtonContainerShape |  | Full |  |
| ItemSegmentedContainerShape |  | Large 16dp |  |
| ItemDropZoneColor |  |  | SurfaceContainerLow |
| ItemLabelTextColor |  |  | OnTertiaryContainer |
| ItemLeadingIconColor |  |  | OnTertiaryContainer |
| ItemOverlineColor |  |  | OnTertiaryContainer |
| ItemShape |  |  | Large 16dp |
| ItemSupportingTextColor |  |  | OnTertiaryContainer |
| ItemTrailingIconColor |  |  | OnTertiaryContainer |
| ItemTrailingSupportingTextColor |  |  | OnTertiaryContainer |


## Components: Menus

### Menu (baseline)

| Token | Value |
|---|---|
| ContainerColor | SurfaceContainer |
| ContainerElevation | Level2 (3dp) |
| ContainerShape | ExtraSmall 4dp |
| ListItemSelectedContainerColor | SecondaryContainer |
| ListItemSelectedLabelTextColor | OnSecondaryContainer |
| ListItemSelectedLeadingTrailingIconColor | OnSecondaryContainer |
| MenuListItemLeadingIconColor | OnSecondaryContainer |

### Standard and vibrant menus (M3 Expressive)

| Token | StandardMenu | VibrantMenu |
|---|---|---|
| ButtonIconIconColor | OnSurfaceVariant | OnTertiaryContainer |
| ButtonSelectedIconIconColor | OnTertiaryContainer | OnTertiary |
| ContainerColor | SurfaceContainerLow | TertiaryContainer |
| IconButtonContainerColor | SurfaceContainerLow | TertiaryContainer |
| IconButtonSelectedContainerColor | TertiaryContainer | Tertiary |
| ItemContainerColor | SurfaceContainerLow |  |
| ItemLabelTextColor | OnSurface | OnTertiaryContainer |
| ItemLeadingIconColor | OnSurfaceVariant | OnTertiaryContainer |
| ItemSelectedContainerColor | TertiaryContainer | Tertiary |
| ItemSelectedLabelTextColor | OnTertiaryContainer | OnTertiary |
| ItemSelectedLeadingIconColor | OnTertiaryContainer | OnTertiary |
| ItemSelectedSupportingTextColor | OnTertiaryContainer | OnTertiary |
| ItemSelectedTrailingIconColor | OnTertiaryContainer | OnTertiary |
| ItemSelectedTrailingSupportingTextColor | OnTertiaryContainer | OnTertiary |
| ItemSupportingTextColor | OnSurfaceVariant | OnTertiaryContainer |
| ItemTrailingIconColor | OnSurfaceVariant | OnTertiaryContainer |
| ItemTrailingSupportingTextColor | OnSurfaceVariant | OnTertiaryContainer |
| ItemColor |  | TertiaryContainer |

### Segmented menu

| Token | Value |
|---|---|
| ActiveContainerShape | 24dp |
| ContainerElevation | Level2 (3dp) |
| ContainerShape | Large 16dp |
| GroupContainerColor | SurfaceContainerLow |
| GroupPadding | 4dp |
| GroupShape | Small 8dp |
| HorizontalContainerBottomSpace | 8dp |
| HorizontalContainerTopSpace | 8dp |
| HorizontalIconOnlyItemBottomSpace | 16dp |
| HorizontalIconOnlyItemLeadingSpace | 16dp |
| HorizontalIconOnlyItemSelectedShape | Full |
| HorizontalIconOnlyItemTopSpace | 16dp |
| HorizontalIconOnlyItemTrailingSpace | 16dp |
| HorizontalIconOnlySegmentedGap | 4dp |
| HorizontalItemBetweenSpace | 12dp |
| HorizontalItemBottomSpace | 6dp |
| HorizontalItemFocusedShape | Medium 12dp |
| HorizontalItemHoveredShape | Medium 12dp |
| HorizontalItemLeadingSpace | 12dp |
| HorizontalItemPressedShape | Medium 12dp |
| HorizontalItemSelectedFocusedShape | Full |
| HorizontalItemSelectedHoveredShape | Full |
| HorizontalItemSelectedPressedShape | Full |
| HorizontalItemTopSpace | 6dp |
| HorizontalItemTrailingSpace | 12dp |
| HorizontalSegmentedGap | 2dp |
| InactiveContainerShape | Small 8dp |
| Item | 44dp |
| ItemBetweenSpace | 12dp |
| ItemBottomSpace | 8dp |
| ItemFirstChildInnerCornerCornerSize | ExtraSmall 4dp |
| ItemFirstChildShape | Medium 12dp |
| ItemLastChildInnerCornerCornerSize | ExtraSmall 4dp |
| ItemLastChildShape | Medium 12dp |
| ItemLeadingIconSize | 20dp |
| ItemLeadingSpace | 16dp |
| ItemSelectedShape | Medium 12dp |
| ItemShape | ExtraSmall 4dp |
| ItemTopSpace | 8dp |
| ItemTrailingIconSize | 20dp |
| ItemTrailingSpace | 16dp |
| SegmentedGap | 2dp |


## Components: Dialogs

| Token | Value |
|---|---|
| ActionLabelTextColor | Primary |
| ContainerColor | SurfaceContainerHigh |
| ContainerElevation | Level3 (6dp) |
| ContainerShape | ExtraLarge 28dp |
| HeadlineColor | OnSurface |
| SupportingTextColor | OnSurfaceVariant |
| IconColor | Secondary |
| IconSize | 24dp |


## Components: Bottom sheet and drag handle

### Bottom sheet

| Token | Value |
|---|---|
| DockedContainerColor | SurfaceContainerLow |
| DockedContainerShape | ExtraLargeTop 28/28/0/0dp (TS/TE/BE/BS) |
| DockedDragHandleHeight | 4dp |
| DockedDragHandleWidth | 32dp |
| DockedMinimizedContainerShape | None 0dp |
| DockedModalContainerElevation | Level1 (1dp) |
| DockedStandardContainerElevation | Level1 (1dp) |

### Drag handle

| Token | Value |
|---|---|
| Color | Outline |
| ContainerWidth | 24dp |
| DraggedElevation | Level0 (0dp) |
| DraggedHeight | 52dp |
| DraggedShape | Medium 12dp |
| DraggedWidth | 12dp |
| Elevation | Level0 (0dp) |
| Height | 48dp |
| PressedElevation | Level0 (0dp) |
| PressedHeight | 52dp |
| PressedShape | Medium 12dp |
| PressedWidth | 12dp |
| Shape | Full |
| Width | 4dp |


## Components: Divider

| Token | Value |
|---|---|
| Color | OutlineVariant |
| Thickness | 1dp |


## Components: Search bar and search view

| Token | SearchBar | SearchView |
|---|---|---|
| AvatarShape | Full |  |
| AvatarSize | 30dp |  |
| ContainerColor | SurfaceContainerHigh | SurfaceContainerHigh |
| ContainerElevation | Level3 (6dp) | Level3 (6dp) |
| ContainerHeight | 56dp |  |
| ContainerShape | Full |  |
| InputTextColor | OnSurface |  |
| LeadingIconColor | OnSurface |  |
| SupportingTextColor | OnSurfaceVariant |  |
| TrailingIconColor | OnSurfaceVariant |  |
| DividerColor |  | Outline |
| DockedContainerShape |  | ExtraLarge 28dp |
| DockedHeaderContainerHeight |  | 56dp |
| FullScreenContainerShape |  | None 0dp |
| FullScreenHeaderContainerHeight |  | 72dp |
| HeaderInputTextColor |  | OnSurface |
| HeaderLeadingIconColor |  | OnSurface |
| HeaderSupportingTextColor |  | OnSurfaceVariant |
| HeaderTrailingIconColor |  | OnSurfaceVariant |


## Components: Snackbar

| Token | Value |
|---|---|
| ActionLabelTextColor | InversePrimary |
| ContainerColor | InverseSurface |
| ContainerElevation | Level3 (6dp) |
| ContainerShape | ExtraSmall 4dp |
| IconColor | InverseOnSurface |
| IconSize | 24dp |
| SupportingTextColor | InverseOnSurface |
| SingleLineContainerHeight | 48dp |
| TwoLinesContainerHeight | 68dp |


## Components: Text fields

### Filled and outlined

| Token | FilledTextField | OutlinedTextField |
|---|---|---|
| ActiveIndicatorColor | OnSurfaceVariant |  |
| ActiveIndicatorHeight | 1dp |  |
| CaretColor | Primary | Primary |
| ContainerColor | SurfaceContainerHighest |  |
| ContainerShape | ExtraSmallTop 4/4/0/0dp (TS/TE/BE/BS) | ExtraSmall 4dp |
| DisabledActiveIndicatorHeight | 1dp |  |
| ErrorActiveIndicatorColor | Error |  |
| ErrorInputColor | OnSurface | OnSurface |
| ErrorLabelColor | Error | Error |
| ErrorLeadingIconColor | OnSurfaceVariant | OnSurfaceVariant |
| ErrorSupportingColor | Error | Error |
| ErrorTrailingIconColor | Error | Error |
| FocusActiveIndicatorHeight | 2dp |  |
| HoverActiveIndicatorHeight | 1dp |  |
| InputColor | OnSurface | OnSurface |
| InputPlaceholderColor | OnSurfaceVariant | OnSurfaceVariant |
| InputPrefixColor | OnSurfaceVariant | OnSurfaceVariant |
| InputSuffixColor | OnSurfaceVariant | OnSurfaceVariant |
| LabelColor | OnSurfaceVariant | OnSurfaceVariant |
| LeadingIconColor | OnSurfaceVariant | OnSurfaceVariant |
| LeadingIconSize | 24dp | 24dp |
| SupportingColor | OnSurfaceVariant | OnSurfaceVariant |
| TrailingIconColor | OnSurfaceVariant | OnSurfaceVariant |
| TrailingIconSize | 24dp | 24dp |
| ContainerHeight |  | 56dp |
| DisabledOutlineWidth |  | 1dp |
| ErrorOutlineColor |  | Error |
| FocusOutlineWidth |  | 2dp |
| HoverOutlineWidth |  | 1dp |
| OutlineColor |  | Outline |
| OutlineWidth |  | 1dp |

### Autocomplete (exposed dropdown menu)

| Token | FilledAutocomplete | OutlinedAutocomplete |
|---|---|---|
| MenuContainerColor | SurfaceContainer | SurfaceContainer |
| MenuContainerElevation | Level2 (3dp) | Level2 (3dp) |
| MenuContainerShape | ExtraSmall 4dp | ExtraSmall 4dp |
| TextFieldActiveIndicatorColor | OnSurfaceVariant |  |
| TextFieldActiveIndicatorHeight | 1dp |  |
| TextFieldCaretColor | Primary | Primary |
| TextFieldContainerColor | SurfaceContainerHighest | SurfaceContainerHighest |
| TextFieldContainerShape | ExtraSmallTop 4/4/0/0dp (TS/TE/BE/BS) | ExtraSmall 4dp |
| TextFieldDisabledActiveIndicatorHeight | 1dp |  |
| TextFieldErrorActiveIndicatorColor | Error |  |
| FieldErrorInputTextColor | OnSurface | OnSurface |
| FieldErrorLabelTextColor | Error | Error |
| TextFieldErrorLeadingIconColor | OnSurfaceVariant | OnSurfaceVariant |
| FieldErrorSupportingTextColor | Error | Error |
| TextFieldErrorTrailingIconColor | Error | Error |
| TextFieldFocusActiveIndicatorHeight | 2dp |  |
| TextFieldHoverActiveIndicatorHeight | 1dp |  |
| FieldInputTextColor | OnSurface | OnSurface |
| FieldLabelTextColor | OnSurfaceVariant | OnSurfaceVariant |
| TextFieldLeadingIconColor | OnSurfaceVariant | OnSurfaceVariant |
| TextFieldLeadingIconSize | 20dp | 24dp |
| FieldSupportingTextColor | OnSurfaceVariant | OnSurfaceVariant |
| TextFieldTrailingIconColor | OnSurfaceVariant | OnSurfaceVariant |
| TextFieldTrailingIconSize | 24dp | 24dp |
| TextFieldDisabledOutlineWidth |  | 1dp |
| TextFieldErrorOutlineColor |  | Error |
| TextFieldFocusOutlineWidth |  | 2dp |
| TextFieldHoverOutlineWidth |  | 1dp |
| TextFieldOutlineColor |  | Outline |
| TextFieldOutlineWidth |  | 1dp |


## Components: Date picker

### Modal date picker

| Token | Value |
|---|---|
| ContainerColor | SurfaceContainerHigh |
| ContainerElevation | Level3 (6dp) |
| ContainerHeight | 568dp |
| ContainerShape | ExtraLarge 28dp |
| ContainerWidth | 360dp |
| DateContainerHeight | 40dp |
| DateContainerShape | Full |
| DateContainerWidth | 40dp |
| DateSelectedContainerColor | Primary |
| DateSelectedLabelTextColor | OnPrimary |
| DateTodayContainerOutlineColor | Primary |
| DateTodayContainerOutlineWidth | 1dp |
| DateTodayLabelTextColor | Primary |
| DateUnselectedLabelTextColor | OnSurface |
| HeaderContainerHeight | 120dp |
| HeaderContainerWidth | 360dp |
| HeaderHeadlineColor | OnSurfaceVariant |
| HeaderSupportingTextColor | OnSurfaceVariant |
| RangeSelectionActiveIndicatorContainerColor | SecondaryContainer |
| RangeSelectionActiveIndicatorContainerHeight | 40dp |
| RangeSelectionActiveIndicatorContainerShape | Full |
| RangeSelectionContainerElevation | Level0 (0dp) |
| RangeSelectionContainerShape | None 0dp |
| SelectionDateInRangeLabelTextColor | OnSecondaryContainer |
| RangeSelectionHeaderContainerHeight | 128dp |
| RangeSelectionMonthSubheadColor | OnSurfaceVariant |
| WeekdaysLabelTextColor | OnSurface |
| SelectionYearContainerHeight | 36dp |
| SelectionYearContainerWidth | 72dp |
| SelectionYearSelectedContainerColor | Primary |
| SelectionYearSelectedLabelTextColor | OnPrimary |
| SelectionYearUnselectedLabelTextColor | OnSurfaceVariant |

### Date input

| Token | Value |
|---|---|
| ContainerColor | Surface |
| ContainerElevation | Level3 (6dp) |
| ContainerHeight | 512dp |
| ContainerShape | ExtraLarge 28dp |
| ContainerSurfaceTintLayerColor | SurfaceTint |
| ContainerWidth | 328dp |
| HeaderContainerHeight | 120dp |
| HeaderContainerWidth | 328dp |
| HeaderHeadlineColor | OnSurfaceVariant |
| HeaderSupportingTextColor | OnSurfaceVariant |


## Components: Time picker and time input

### Time picker (dial)

| Token | Value |
|---|---|
| ClockDialColor | SurfaceContainerHighest |
| ClockDialContainerSize | 256dp |
| ClockDialSelectedLabelTextColor | OnPrimary |
| ClockDialSelectorCenterContainerColor | Primary |
| ClockDialSelectorCenterContainerShape | Full |
| ClockDialSelectorCenterContainerSize | 8dp |
| ClockDialSelectorHandleContainerColor | Primary |
| ClockDialSelectorHandleContainerShape | Full |
| ClockDialSelectorHandleContainerSize | 48dp |
| ClockDialSelectorTrackContainerColor | Primary |
| ClockDialSelectorTrackContainerWidth | 2dp |
| ClockDialShape | Full |
| ClockDialUnselectedLabelTextColor | OnSurface |
| ContainerColor | SurfaceContainerHigh |
| ContainerElevation | Level3 (6dp) |
| ContainerShape | ExtraLarge 28dp |
| HeadlineColor | OnSurfaceVariant |
| PeriodSelectorContainerShape | Small 8dp |
| PeriodSelectorHorizontalContainerHeight | 38dp |
| PeriodSelectorHorizontalContainerWidth | 216dp |
| PeriodSelectorOutlineColor | Outline |
| PeriodSelectorOutlineWidth | 1dp |
| PeriodSelectorSelectedContainerColor | TertiaryContainer |
| PeriodSelectorSelectedLabelTextColor | OnTertiaryContainer |
| PeriodSelectorUnselectedLabelTextColor | OnSurfaceVariant |
| PeriodSelectorVerticalContainerHeight | 80dp |
| PeriodSelectorVerticalContainerWidth | 52dp |
| TimeSelector24HVerticalContainerWidth | 114dp |
| TimeSelectorContainerHeight | 80dp |
| TimeSelectorContainerShape | Small 8dp |
| TimeSelectorContainerWidth | 96dp |
| TimeSelectorSelectedContainerColor | PrimaryContainer |
| TimeSelectorSelectedLabelTextColor | OnPrimaryContainer |
| TimeSelectorSeparatorColor | OnSurface |
| TimeSelectorUnselectedContainerColor | SurfaceContainerHighest |
| TimeSelectorUnselectedLabelTextColor | OnSurface |

### Time input

| Token | Value |
|---|---|
| ContainerColor | SurfaceContainerHigh |
| ContainerElevation | Level3 (6dp) |
| ContainerShape | ExtraLarge 28dp |
| HeadlineColor | OnSurfaceVariant |
| PeriodSelectorContainerHeight | 72dp |
| PeriodSelectorContainerShape | Small 8dp |
| PeriodSelectorContainerWidth | 52dp |
| PeriodSelectorOutlineColor | Outline |
| PeriodSelectorOutlineWidth | 1dp |
| PeriodSelectorSelectedContainerColor | TertiaryContainer |
| PeriodSelectorSelectedLabelTextColor | OnTertiaryContainer |
| PeriodSelectorUnselectedLabelTextColor | OnSurfaceVariant |
| TimeFieldContainerColor | SurfaceContainerHighest |
| TimeFieldContainerHeight | 72dp |
| TimeFieldContainerShape | Small 8dp |
| TimeFieldContainerWidth | 96dp |
| TimeFieldFocusOutlineWidth | 2dp |
| TimeFieldLabelTextColor | OnSurface |
| TimeFieldSeparatorColor | OnSurface |
| TimeFieldSupportingTextColor | OnSurfaceVariant |


## Components: Tooltips

| Token | PlainTooltip | RichTooltip |
|---|---|---|
| ContainerColor | InverseSurface | SurfaceContainer |
| ContainerShape | ExtraSmall 4dp | Medium 12dp |
| SupportingTextColor | InverseOnSurface | OnSurfaceVariant |
| ActionLabelTextColor |  | Primary |
| ContainerElevation |  | Level2 (3dp) |
| SubheadColor |  | OnSurfaceVariant |


## Components: Scrim

| Token | Value |
|---|---|
| ContainerColor | Scrim |
| ContainerOpacity | 0.32 |

