# Apple HIG: Foundations

Distilled from Apple's Human Interface Guidelines (state as of Nov 2026, Liquid Glass era). Rules are paraphrased; follow the source links for the authoritative text.

## Contents

1. [Accessibility](#accessibility)
2. [App icons](#app-icons)
3. [Branding](#branding)
4. [Color](#color)
5. [Dark Mode](#dark-mode)
6. [Icons](#icons)
7. [Images](#images)
8. [Immersive experiences](#immersive-experiences)
9. [Inclusion](#inclusion)
10. [Layout](#layout)
11. [Materials](#materials)
12. [Motion](#motion)
13. [Privacy](#privacy)
14. [Right to left](#right-to-left)
15. [SF Symbols](#sf-symbols)
16. [Spatial layout](#spatial-layout)
17. [Typography](#typography)
18. [Writing](#writing)

---

## Accessibility

Source: https://developer.apple.com/design/human-interface-guidelines/accessibility

Goal: an interface that is intuitive (familiar, consistent interactions), perceivable (never a single channel for information) and adaptable (honors system accessibility features and personalization). Audit with Accessibility Inspector; declare support on the App Store with Accessibility Nutrition Labels.

### Vision
- Let text scale to at least 200% (140% on watchOS), via Dynamic Type or custom UI.
- Custom type: respect platform default and minimum sizes.

| Platform | Default text | Minimum text |
|---|---|---|
| iOS, iPadOS | 17 pt | 11 pt |
| macOS | 13 pt | 10 pt |
| tvOS | 29 pt | 23 pt |
| visionOS | 17 pt | 12 pt |
| watchOS | 16 pt | 12 pt |

- Thin custom font weights need sizes larger than the recommended values.
- Meet contrast minimums (WCAG or APCA). Accessibility Inspector uses WCAG AA:

| Text size | Weight | Minimum contrast |
|---|---|---|
| Up to 17 pt | Any | 4.5:1 |
| 18 pt and up | Any | 3:1 |
| Any | Bold | 3:1 |

- If defaults fall short, at least provide a higher-contrast scheme when Increase Contrast is on. Check contrast in both light and dark appearances.
- Prefer system colors: they ship accessible variants that adapt to Increase Contrast and appearance changes.
- Never rely on color alone (red/green and blue/orange are common problem pairs): add shapes, icons or text. Consider user-customizable palettes (charts, game characters).
- Describe all UI and content for VoiceOver.

### Hearing
- Never deliver dialogue or crucial info through audio alone. Offer, as appropriate, with customizable presentation:
  - Captions: text of audible info synced to media (cutscenes, clips).
  - Subtitles: dialogue in the viewer's chosen language (shows, films).
  - Audio descriptions: narration of visual-only info in natural pauses.
  - Transcripts: full text of audio and visual content (podcasts, audiobooks).
- Pair audio cues (success chime, error sound) with matching haptics. iOS/iPadOS: Music Haptics and Audio graphs.
- Pair audio cues with visual indicators, especially in games and spatial apps where action may be offscreen.

### Mobility
- Control sizes:

| Platform | Default control | Minimum control |
|---|---|---|
| iOS, iPadOS | 44x44 pt | 28x28 pt |
| macOS | 28x28 pt | 20x20 pt |
| tvOS | 66x66 pt | 56x56 pt |
| visionOS | 60x60 pt | 28x28 pt |
| watchOS | 44x44 pt | 28x28 pt |

- Spacing matters as much as size: about 12 pt padding around bezeled elements, about 24 pt around the visible edges of unbezeled elements.
- Use the simplest gesture for frequent actions; avoid custom multifinger or multihand gestures.
- Every gesture needs an onscreen alternative (for example a Close button in addition to swipe-to-dismiss).
- Label elements so Voice Control works.
- Integrate with Siri and Shortcuts (invokable from Siri, Action button, Home Screen, Control Center).
- Test with VoiceOver, AssistiveTouch, Full Keyboard Access, Pointer Control, Switch Control.

### Speech
- Make the app fully keyboard-operable (Full Keyboard Access); never override system keyboard shortcuts.
- Support Switch Control (external switches, game controllers, mouth sounds).

### Cognitive
- Prefer familiar system gestures over custom ones.
- Avoid timed auto-dismissing UI; dismiss via explicit action.
- Games: offer difficulty accommodations (lower completion criteria, reaction time, control assistance).
- No autoplay audio/video without discoverable start/stop controls; consider a global autoplay opt-out (`isVideoAutoplayEnabled`).
- Honor Dim Flashing Lights in video playback.
- Honor Reduce Motion: cut automatic and repetitive animation (zoom, scale, peripheral motion). Techniques: tighter springs (less bounce), animations tracking gestures directly, no z-axis depth animation, fades instead of x/y/z transitions, no animating into or out of blur.
- Assistive Access (iOS, iPadOS): keep only core functionality, one interaction per screen, and ask for confirmation twice before hard-to-undo actions (like deleting a file).

### Platform notes
- visionOS: features include head and hand Pointer Control and Zoom. Comfort rules: keep UI in field of view; prefer horizontal over vertical layouts (neck strain); do not demand attention in different locations in quick succession; slow and soften animation, especially peripheral; gentle camera motion, never make the world seem to move uncontrollably; do not head-anchor content (feels confining and breaks Pointer Control); minimize large or repetitive gestures.
- No extra notes for iOS, iPadOS, macOS, tvOS, watchOS.

---

## App icons

Source: https://developer.apple.com/design/human-interface-guidelines/app-icons

### Layers
- iOS, iPadOS, macOS, watchOS: one background layer plus one or more foreground layers. The system adds Liquid Glass effects (specular highlights, refraction, translucency) that scale with icon size and may change across OS versions.
- tvOS: 2 to 5 layers; focused icon lifts, sways and lights up with parallax driven by remote touch.
- visionOS: background plus 1 or 2 upper layers; forms a 3D object that subtly expands when looked at; system adds inter-layer shadows and uses upper-layer alpha for an embossed look.
- Workflow: draw foreground layers in your design tool; for iOS/iPadOS/macOS/watchOS assemble in Icon Composer (ships with Xcode): set background, position layers, apply highlights and refraction, annotate default, dark and mono variants, preview across OS versions, export. For tvOS/visionOS, build an image stack in Xcode; use Parallax Previewer and Parallax Exporter from Apple Design Resources.
- Foreground layers: crisp, defined edges; no soft or feathered edges.
- Vary opacity across foreground layers for depth; import opaque layers and set transparency in Icon Composer.
- Background: make it stand out and support the foreground. Icon Composer handles solid colors and gradients; imported backgrounds must be full-bleed and opaque; gradients must react well to system lighting.
- Prefer vector (SVG, PDF); outline artwork and convert text to outlines. Use PNG for mesh gradients and raster art.

### Formats
- Two options on iOS/iPadOS/macOS/watchOS: flat bitmap (PNG) or layered Icon Composer file. Prefer Icon Composer for control over Liquid Glass per element and color across variants.
- With a bitmap, the system segments it into two layers (foreground and background) for dark/tinted compatibility. It applies Liquid Glass only to large simple shapes, not to text or thin lines.

### Shape
| Platform | Supplied layer shape | Final shape |
|---|---|---|
| iOS, iPadOS, macOS | Square | Rounded rectangle, corners concentric with UI and device bezel |
| tvOS | Rectangle | Rounded rectangle, concentric edges |
| visionOS, watchOS | Square | Circle |

- Supply unmasked layers; pre-masked art spoils specular highlights and gives jagged edges.
- Center primary content to survive masking (especially circular visionOS/watchOS); use the grids in Apple Design Resources templates.

### Design
- Simple concept, minimal shapes; simple solid or gradient background; no need to fill the canvas.
- Keep the design consistent across all platforms.
- Consider filled, overlapping shapes, with transparency and blur, for depth.
- Text only when essential to the brand: it is not localizable or accessible, often illegible. A single-letter mnemonic is fine; never words like "Watch", "Play", "New", "For visionOS". On tvOS put text on the top layer so parallax does not crop it.
- Prefer illustration over photos; avoid very thin lines and sharp corners; do not copy standard UI components or screenshots.
- Never depict Apple hardware.

### Visual effects
- Let the system draw highlights, shadows, bevels, blur and glow; custom static effects conflict with dynamic system ones. If you add any, test in Icon Composer, Device Hub simulator and real devices.
- Group layers in Icon Composer to apply effects at group level, with extra Liquid Glass controls (specular, refraction, translucency).

### Appearances
- iOS, iPadOS, macOS Home Screen variants: default, dark, clear, tinted. System generates any you omit.
- Keep core features identical across variants; do not swap elements.
- Dark and tinted icons should sit well beside system icons and widgets; dark is more subdued, clear and tinted more so.
- Derive dark from light: complementary colors, nothing overly bright; colored backgrounds give the best contrast in dark.
- Alternate icons (iOS, iPadOS, tvOS, compatible visionOS apps) chosen in app settings: keep them related to the app, never confusable with another app. On iOS/iPadOS each alternate needs its own dark, clear and tinted variants; all are subject to App Review.

### Platform notes
- tvOS: keep a safe zone; focus scaling and motion crop edges, foreground layers more than background.
- visionOS: avoid background shapes meant to look like holes or concavities; system shadows make them pop out.
- watchOS: avoid black backgrounds; lighten them so the icon does not vanish against the display.

### Specifications
| Platform | Layout shape | Masked shape | Layout size | Style | Appearances |
|---|---|---|---|---|---|
| iOS, iPadOS, macOS | Square | Rounded rectangle | 1024x1024 px | Layered | Default, dark, clear light, clear dark, tinted light, tinted dark |
| tvOS | Landscape rectangle | Rounded rectangle | 800x480 px | Layered (parallax) | N/A |
| visionOS | Square | Circle | 1024x1024 px | Layered (3D) | N/A |
| watchOS | Square | Circle | 1088x1088 px | Layered | N/A |

- The system downsizes for Settings, notifications and other locations.
- Color spaces: sRGB, Gray Gamma 2.2, Display P3 (wide gamut on iOS, iPadOS, macOS, tvOS, watchOS only).

---

## Branding

Source: https://developer.apple.com/design/human-interface-guidelines/branding

- Carry the brand's voice and tone through all written copy.
- Use the accent color sparingly: primary actions and status (unread badges, selected tab icon), not every control. To express brand color, put it in the content layer so it scrolls under Liquid Glass controls and gets picked up dynamically (refined Sept 9, 2026).
- Custom font: must be legible at all sizes and support Bold Text and Dynamic Type. A good split: custom font for headlines and subheads, system font for body and captions.
- Express the brand through familiar components; if customized, keep standard sizing, placement and behavior.
- Branding defers to content: no screen space spent solely on brand assets.
- Keep standard patterns: expected locations, standard symbols, established navigation and modality.
- Do not repeat the logo throughout the app unless it gives needed context.
- Do not brand the launch screen; it vanishes too fast. Use a welcome or onboarding screen instead.
- No Apple trademarks in app names or images.
- No platform-specific notes.

---

## Color

Source: https://developer.apple.com/design/human-interface-guidelines/color

System colors look right on varied backgrounds and appearances and adapt to vibrancy and accessibility settings; custom colors add personality. Same rules apply to both.

### Best practices
- One color, one meaning. If brand color marks interactive borderless buttons, do not also use it for static text.
- Every color must work in light, dark and increased-contrast contexts (iOS, iPadOS, macOS, tvOS have light and Dark Mode). For custom colors supply light and dark variants plus a markedly higher-contrast variant of each. Supply light and dark colors even if the app ships one appearance, so Liquid Glass can adapt.
- Test under varied lighting: bright light mutes and darkens colors, dim light makes them saturated. In visionOS, surrounding walls and objects shift perceived color.
- Test on varied devices: True Tone shifts white point (reading, photo, video, gaming apps can tune via `UIWhitePointAdaptivityStyle`); test tvOS on several HD and 4K TV brands and settings; on Mac, switch P3 and sRGB profiles in System Settings > Displays.
- Adjust nearby colors to suit artwork (Maps: light scheme for map mode, dark for satellite). Translucent elements such as toolbars alter colors behind or on them.
- For user color choice use system pickers (`ColorPicker`); they share saved colors across apps.

### Inclusive color
- Never use color alone to distinguish objects, show interactivity or convey essential info; add labels or glyph shapes.
- Avoid low-contrast and colorblind-confusable combinations.
- Check cultural meaning (red means danger in some cultures, good fortune in others).

### System colors
- Never hard-code system color values; documented values are design references and change between releases. Use APIs such as `Color` (SwiftUI), `UIColor`, `NSColor`.
- iOS, iPadOS, macOS, visionOS provide dynamic system colors defined by purpose (background levels, labels, links, separators) that adapt to light and dark.
- Never repurpose semantics (no separator color for text, no secondary label color as a background).

### Liquid Glass color
- Liquid Glass has no inherent color; it takes color from content behind it. It can be tinted (stained-glass look) to emphasize a control; the system does this for prominent buttons. Labels and symbols on glass can also be colored.
- Small elements (toolbars, tab bars) flip between light and dark glass based on underlying content; their symbols and text are monochrome by default (darker over light content, lighter over dark). Larger elements such as sidebars are more opaque for legibility.
- Color glass and its labels sparingly: status indicators and primary actions only. For primary actions, tint the background, not the symbol or text (system tints prominent buttons like Done with the accent color). Never tint the backgrounds of several controls.
- Over colorful backgrounds or rich content, use monochrome toolbars and tab bars or a strongly differentiated accent. In mostly monochrome apps, brand color as accent works well.
- Avoid similar colors overlapping between content layer and controls; content may pass under controls while scrolling, but the resting state (top of scroll) must stay legible.

### Color management
- Color space (gamut) examples: sRGB, Display P3. A color profile maps colors to numbers; images embed it.
- Embed color profiles in images; sRGB is accurate on most displays.
- Use wide color (P3) where appropriate: Display P3 profile, 16 bits per channel, export as PNG. Design P3 assets on a wide-color display.
- Provide per-color-space image and color variants in the asset catalog when P3 colors become indistinguishable or gradients clip on sRGB.

### Platform notes

**iOS, iPadOS backgrounds**: two dynamic sets, each with primary, secondary, tertiary: primary for the overall view, secondary for groups within it, tertiary for groups within secondary.
- Grouped table views: `systemGroupedBackground`, `secondarySystemGroupedBackground`, `tertiarySystemGroupedBackground`.
- Otherwise: `systemBackground`, `secondarySystemBackground`, `tertiarySystemBackground`.

**iOS, iPadOS foreground colors**
| Color | Use | UIKit API |
|---|---|---|
| Label | Primary text | `label` |
| Secondary label | Secondary text | `secondaryLabel` |
| Tertiary label | Tertiary text | `tertiaryLabel` |
| Quaternary label | Quaternary text | `quaternaryLabel` |
| Placeholder text | Placeholders in controls and text views | `placeholderText` |
| Separator | Separator letting content show through | `separator` |
| Opaque separator | Separator hiding content | `opaqueSeparator` |
| Link | Link text | `link` |

**macOS dynamic colors** (also in the Color panel's Developer palette)
| Color | Use | AppKit API |
|---|---|---|
| Alternate selected control text | Text on a selected list/table surface | `alternateSelectedControlTextColor` |
| Alternating content backgrounds | Alternating rows or columns | `alternatingContentBackgroundColors` |
| Control accent | User's accent from System Settings | `controlAccentColor` |
| Control background | Large elements (browser, table) | `controlBackgroundColor` |
| Control | Control surface | `controlColor` |
| Control text | Available control text | `controlTextColor` |
| Current control tint | System control tint | `currentControlTint` |
| Unavailable control text | Disabled control text | `disabledControlTextColor` |
| Find highlight | Find indicator | `findHighlightColor` |
| Grid | Table gridlines | `gridColor` |
| Header text | Table header cells | `headerTextColor` |
| Highlight | Virtual light source | `highlightColor` |
| Keyboard focus indicator | Focus ring for keyboard navigation | `keyboardFocusIndicatorColor` |
| Label | Primary label text | `labelColor` |
| Link | Links | `linkColor` |
| Placeholder text | Placeholder strings | `placeholderTextColor` |
| Quaternary label | Lowest-priority text, watermarks | `quaternaryLabelColor` |
| Secondary label | Subheadings, extra info | `secondaryLabelColor` |
| Selected content background | Selected content in key window | `selectedContentBackgroundColor` |
| Selected control | Selected control surface | `selectedControlColor` |
| Selected control text | Selected control text | `selectedControlTextColor` |
| Selected menu item text | Selected menu text | `selectedMenuItemTextColor` |
| Selected text background | Behind selected text | `selectedTextBackgroundColor` |
| Selected text | Selected text | `selectedTextColor` |
| Separator | Section separators | `separatorColor` |
| Shadow | Shadow of raised objects | `shadowColor` |
| Tertiary label | Below secondary | `tertiaryLabelColor` |
| Text background | Behind text | `textBackgroundColor` |
| Text | Document text | `textColor` |
| Under page background | Behind document content | `underPageBackgroundColor` |
| Unemphasized selected content background | Selection in non-key window | `unemphasizedSelectedContentBackgroundColor` |
| Unemphasized selected text background | Selected text background, non-key | `unemphasizedSelectedTextBackgroundColor` |
| Unemphasized selected text | Selected text, non-key | `unemphasizedSelectedTextColor` |
| Window background | Window background | `windowBackgroundColor` |
| Window frame text | Title bar text | `windowFrameTextColor` |

- macOS 11+: an app accent color tints buttons, selection highlight and sidebar icons only when the user's accent setting is multicolor; otherwise the user's choice wins, except sidebar icons with a fixed meaningful color.

**tvOS**: small palette coordinated with the logo; never show focus with color alone (use scaling and responsive animation).

**visionOS**: color sparingly, especially on glass (surroundings show through and affect legibility); use color for important info or relationships; prefer color in bold text and large areas; in full immersion keep brightness balanced (no bright, flashing or moving object on a near-black background; go fully bright only when the whole scene is bright). visionOS system colors use the default dark values.

**watchOS**: background color must communicate (Activity ring views match ring colors) or establish place; avoid full-screen background color in long-lived views (workouts, audio playback). Graphic complications may be shown in tinted mode based on the wearer's color.

### System color set
Each has default light, default dark, increased-contrast light and increased-contrast dark variants. Reference RGB values below (from the HIG swatches, 2026-11-19) are for design files and web/RN mockups only; in native code use the system color APIs, since values change between releases.

| Color | Light | Dark | Light, increased contrast | Dark, increased contrast |
|---|---|---|---|---|
| red | 255,56,60 | 255,66,69 | 233,21,45 | 255,97,101 |
| orange | 255,141,40 | 255,146,48 | 197,83,0 | 255,160,86 |
| yellow | 255,204,0 | 255,214,0 | 161,106,0 | 254,223,67 |
| green | 52,199,89 | 48,209,88 | 0,137,50 | 74,217,104 |
| mint | 0,200,179 | 0,218,195 | 0,133,117 | 84,223,203 |
| teal | 0,195,208 | 0,210,224 | 0,129,152 | 59,221,236 |
| cyan | 0,192,232 | 60,211,254 | 0,126,174 | 109,217,255 |
| blue | 0,136,255 | 0,145,255 | 30,110,244 | 92,184,255 |
| indigo | 97,85,245 | 109,124,255 | 86,74,222 | 167,170,255 |
| purple | 203,48,224 | 219,52,242 | 176,47,194 | 234,141,255 |
| pink | 255,45,85 | 255,55,95 | 231,18,77 | 255,138,196 |
| brown | 172,127,94 | 183,138,102 | 149,109,81 | 219,166,121 |

iOS/iPadOS system grays (RGB):

| Gray | Light | Dark | Light, increased contrast | Dark, increased contrast |
|---|---|---|---|---|
| systemGray | 142,142,147 | 142,142,147 | 108,108,112 | 174,174,178 |
| systemGray2 | 174,174,178 | 99,99,102 | 142,142,147 | 124,124,128 |
| systemGray3 | 199,199,204 | 72,72,74 | 174,174,178 | 84,84,86 |
| systemGray4 | 209,209,214 | 58,58,60 | 188,188,192 | 68,68,70 |
| systemGray5 | 229,229,234 | 44,44,46 | 216,216,220 | 54,54,56 |
| systemGray6 | 242,242,247 | 28,28,30 | 235,235,240 | 36,36,38 |

API names per color:

| Name | SwiftUI |
|---|---|
| Red | `red` |
| Orange | `orange` |
| Yellow | `yellow` |
| Green | `green` |
| Mint | `mint` |
| Teal | `teal` |
| Cyan | `cyan` |
| Blue | `blue` |
| Indigo | `indigo` |
| Purple | `purple` |
| Pink | `pink` |
| Brown | `brown` |

iOS/iPadOS grays (UIKit): `systemGray`, `systemGray2`, `systemGray3`, `systemGray4`, `systemGray5`, `systemGray6`. SwiftUI `gray` equals `systemGray`.

---

## Dark Mode

Source: https://developer.apple.com/design/human-interface-guidelines/dark-mode

Systemwide dark palette for low light (iOS, iPadOS, macOS, tvOS). People expect every app to follow it. Not supported in visionOS or watchOS.

### Best practices
- Do not add an app-specific appearance setting; follow the system choice.
- Look good in both modes, and handle Auto switching while the app runs.
- Test legibility with Increase Contrast and Reduce Transparency, separately and together; dark text on dark backgrounds often fails.
- Rarely, a permanently dark UI is justified (immersive media viewing).

### Colors
- Dark palette: dimmer backgrounds, brighter foregrounds; not simple inversions.
- Use semantic colors (`labelColor`, `controlColor` on macOS, `separator` on iOS). For custom colors add a Color Set in the asset catalog with light and dark variants; never hard-code.
- Contrast at least 4.5:1; aim for 7:1 for custom foreground/background pairs, especially small text.
- Slightly darken content images with white backgrounds so they do not glow.

### Icons, images, text
- Use SF Symbols (adapt automatically with dynamic tint or vibrancy).
- Make separate light/dark interface icons when needed (full moon needs a dark outline on light; oil drop needs a border on dark).
- Reuse one asset if it works in both modes; otherwise create variants combined under one named image in the asset catalog.
- Use system label colors (primary through quaternary) and system text fields and text views; they handle vibrancy.

### Platform notes
- iOS, iPadOS: two background sets, base (dimmer, recedes) and elevated (brighter, advances). The system switches to elevated for foreground UI (popovers, sheets) and to separate multitasking apps and windows. Prefer system backgrounds; custom ones hide these distinctions.
- macOS: with graphite accent, desktop tinting pulls color from the wallpaper into window backgrounds. Give custom components with a visible background or bezel some transparency, but only in neutral (uncolored) states, so colored states do not fluctuate.
- tvOS: no extra notes.

---

## Icons

Source: https://developer.apple.com/design/human-interface-guidelines/icons

Interface icons (glyphs) express one concept with streamlined shapes, unlike richly rendered app icons. Design your own or use SF Symbols; both use black and clear areas, and the system recolors the black.

### Best practices
- Keep icons highly simplified with familiar metaphors tied directly to the action or content.
- Keep every icon (custom and system) consistent in size, detail level, stroke weight and perspective; adjust dimensions for visual weight.
- Match icon weight to adjacent text unless you intend emphasis.
- Optically center asymmetric icons (a download arrow looks too low if geometrically centered): bake the offset into the asset as padding, then center the asset.
- Skip selected-state variants for icons in toolbars, tab bars and buttons; the system handles selection.
- Use inclusive imagery: gender-neutral figures, culturally recognizable metaphors.
- Text in icons only when essential (formatting glyphs); localize characters; for abstract text blocks, provide a right-to-left flipped version.
- Custom icons in vector PDF or SVG (auto-scaled). PNG requires multiple resolutions. Or build a custom SF Symbol with a scale matching adjacent text.
- Add accessibility labels for VoiceOver to every custom icon.
- Do not replicate Apple hardware; if needed, use Apple Design Resources images or the product SF Symbols.

### Standard SF Symbols for common actions
| Action | Symbol |
|---|---|
| Cut | `scissors` |
| Copy | `document.on.document` |
| Paste | `document.on.clipboard` |
| Done | `checkmark` |
| Cancel, Deselect | `xmark` |
| Delete | `trash` |
| Undo / Redo | `arrow.uturn.backward` / `arrow.uturn.forward` |
| Compose | `square.and.pencil` |
| Duplicate | `plus.square.on.square` |
| Rename | `pencil` |
| Move to | `folder` |
| Attach | `paperclip` |
| Add | `plus` |
| More | `ellipsis` |
| Select | `checkmark.circle` |
| Superscript / Subscript | `textformat.superscript` / `textformat.subscript` |
| Bold / Italic / Underline | `bold` / `italic` / `underline` |
| Align left / Center / Justify / Align right | `text.alignleft` / `text.aligncenter` / `text.justify` / `text.alignright` |
| Search | `magnifyingglass` |
| Find | `text.page.badge.magnifyingglass` |
| Filter | `line.3.horizontal.decrease` |
| Share | `square.and.arrow.up` |
| Print | `printer` |
| Account | `person.crop.circle` |
| Like / Dislike | `hand.thumbsup` / `hand.thumbsdown` |
| Bring to front / Send to back | `square.3.layers.3d.top.filled` / `square.3.layers.3d.bottom.filled` |
| Bring forward / Send backward | `square.2.layers.3d.top.filled` / `square.2.layers.3d.bottom.filled` |
| Alarm / Archive / Calendar | `alarm` / `archivebox` / `calendar` |

The HIG also lists standard icons (symbol shown in its table art) for Save, Close, Folder, Find and Replace, Find Next/Previous, Use Selection for Find, Export, User, Profile; look them up in the SF Symbols app.

### Platform notes: macOS document icons
- Custom document types can have a document icon (paper with folded top-right corner). If none is provided, macOS composites the app icon and file extension.
- Supply any mix of background fill, center image and text; the system masks, layers and adds the folded corner.
- Simple shapes, small distinct palette; must read at 16x16 px. A single expressive background fill works well (Xcode, TextEdit).
- Simplify small sizes (fewer, thicker grid-aligned lines; drop detail at 16x16).
- Keep important content out of the top-right corner of the fill.
- Background fill sizes: 512x512 @1x / 1024x1024 @2x; 256 / 512; 128 / 256; 32 / 64; 16 / 32 px.
- Center image is half the canvas (16x16 for a 32x32 icon). Sizes: 256 / 512; 128 / 256; 32 / 64; 16 / 32 px (@1x / @2x).
- Keep a margin of about 10%; image occupies about 80% of its canvas (about 205x205 in a 256x256 canvas).
- Optionally replace an obscure extension with a short descriptive term (SceneKit shows "scene" not "scn"); the system auto-scales it and capitalizes every letter.

---

## Images

Source: https://developer.apple.com/design/human-interface-guidelines/images

### Resolution
- A point is an abstract unit: on 2D displays it maps to a device-dependent number of pixels; in visionOS it is angular, scaling with distance.
- Scale factor = pixel density per point: @1x is 1:1, @2x is 2:1, @3x is 3:1.
- Ship high-resolution bitmaps for every supported device; suffix filenames @1x, @2x, @3x in the asset catalog.

| Platform | Scale factors |
|---|---|
| iPadOS, watchOS | @2x |
| iOS | @2x and @3x |
| visionOS | @2x or higher |
| macOS, tvOS | @1x and @2x |

- Design at the lowest resolution and scale up; put vector control points on whole values so they stay pixel-aligned at 2x and 3x.

### Formats
| Image type | Format |
|---|---|
| Bitmap / raster | De-interlaced PNG |
| PNG not needing 24-bit color | 8-bit palette |
| Photos | JPEG (optimized) or HEIC |
| Stereo or spatial photos | Stereo HEIC |
| Flat icons and artwork needing high-res scaling | PDF or SVG |

- Embed a color profile in each image. Test on real devices for pixelation, stretching, compression.

### Platform notes
**tvOS (layered images and parallax)**
- Parallax: focused element lifts, sways and gains a shine; after inactivity, unfocused content dims and the focused item grows.
- Layered image: 2 to 5 layers. App icons must be layered; other focusable images (including Top Shelf) strongly should be.
- Runtime-downloaded layered images must be `.lcr` (generate with Xcode's `layerutil` from LSR or Photoshop files); never embed `.lcr` in the app.
- Use standard views and focus APIs (`FocusState`) to get parallax automatically.
- Layers: foreground for prominent elements and text, middle for secondary content and shadows, background as an opaque backdrop (non-opaque background is an error).
- Keep depth subtle; keep a safe zone around foreground content; preview in Xcode, Parallax Previewer, or the Parallax Exporter Photoshop plug-in, then on a real TV.

**visionOS**
- Images are shown at a huge range of sizes; pixels may not map 1:1 to screen pixels.
- App icon: layered (2 to 3 layers).
- Prefer vector art for 2D images. Raster: @2x is fine at normal distances but not sharp up close; higher resolutions cost file size and performance, especially above @6x. Above @2x, apply high-quality image filtering.
- Spatial photo: stereo photo with spatial metadata (iPhone 15 Pro or later, Vision Pro, compatible cameras). Spatial scene: 3D image generated from 2D with head-tracked parallax. Use RealityKit `ImagePresentationComponent`.
- Use stereo HEIC with spatial metadata so the system applies comfort treatments.
- Text over spatial photos: use the feathered glass background effect (`GlassBackgroundEffect`).
- Be careful with disparity adjustments when converting 2D to spatial.
- Show spatial photos and scenes in standalone views (sheet, window), not inline; if inline is unavoidable, add generous spacing.
- Spatial scene generation can take several seconds; trigger it by explicit action, show few at once, use scrolling or pagination.
- Immersive display: minimal UI (small caption, one Back button, swipe between items). Prefer large, centered spatial scenes for stronger parallax.

**watchOS**
- Avoid transparency to keep files small (bake in a solid background), except for template images (complications, menu icons) where transparency defines tinting.
- Use autoscaling PDFs designed for 40 mm and 42 mm at 2x; WatchKit scales:

| Screen | Scale |
|---|---|
| 38 mm | 90% |
| 40 mm | 100% |
| 41 mm | 106% |
| 42 mm | 100% |
| 44 mm | 110% |
| 45 mm | 119% |
| 49 mm | 119% |

---

## Immersive experiences

Source: https://developer.apple.com/design/human-interface-guidelines/immersive-experiences

visionOS only. Apps launch in the Shared Space (alongside others, Mac-like switching) or a Full Space (runs alone). Apps can move between them at any time.

### Immersion and passthrough
- Passthrough is real-time camera video of surroundings.
- Digital Crown: press and hold to recenter content; double-click to briefly hide all content and show passthrough.
- In `mixed`, getting close to a physical object briefly dims the content in front.
- In `progressive` and `full`, the system sets a boundary about 1.5 m from the initial head position; nearing it fades the experience and raises passthrough; crossing it replaces visuals with the app icon until the person returns or recenters.

### Immersion styles
| Option | Behavior |
|---|---|
| Dimmed passthrough | Dim or tint passthrough (black by default, custom tint allowed) in Shared or Full Space. `SurroundingsEffect` |
| `mixed` (Full Space) | Unbounded 3D blended with passthrough; can request room and object data (ARKit); no boundary, nearby content goes semi-opaque near objects |
| `progressive` (Full Space) | Custom environment partially replaces passthrough; Digital Crown adjusts immersion within the default 120 to 360 degree range or a custom range; portrait or landscape; about 1.5 m boundary |
| `full` (Full Space) | 360-degree environment fully replaces passthrough; about 1.5 m boundary |

### Best practices
- Offer multiple ways to use the app and support accessibility features.
- Launch in the Shared Space or `mixed`; let people choose when to go deeper.
- Reserve immersion for meaningful moments (Photos: browse in a window, expand one photo immersively).
- Guide attention with dimming, tint, motion, scale and Spatial Audio, starting subtle.
- Tint passthrough subtly (visionOS 2+); avoid bright or dramatic tints.

### Comfort
- Keep 3D content within the field of view; keep motion comfortable.
- Pick the style matching expected movement; if people may need to go beyond 1.5 m, avoid `progressive`/`full` (or drop back to `mixed`).
- Do not encourage movement in progressive or full immersion; let people pull objects closer instead.
- In `mixed`, do not block too much passthrough; switch to `full` or `progressive` if you must.
- Blending with surroundings or using hand positions requires ARKit and permission (`SceneReconstructionProvider`).

### Transitions
- Make transitions smooth and trackable; no abrupt jumps.
- Let people choose to enter and exit; provide a clear, prominent exit (Keynote Rehearsal Exit button); never require system controls to reduce immersion.
- Label exit controls: return to a less immersive context, or quit. If exiting quits, offer pause or a save point first.

### Virtual hands
- In a Full Space, apps may request to hide real hands and show virtual ones; match real positions and gestures.
- Be cautious with oversized hands (block content, feel clumsy, seem too close to the face).
- If tracking drops, fade virtual hands out and reveal real ones; fade back in when tracking returns; never show frozen hands.

### Custom environments
- Minimize motion and high-contrast detail during primary tasks like video; focus attention with best textures in key areas, lower quality and dimming elsewhere.
- Proximity signals interactivity: near objects invite touch, far ones do not.
- Keep animation subtle (drifting clouds); avoid motion at the edge of the field of view.
- Make environments expansive, never claustrophobic.
- Spatial Audio for atmosphere; avoid obvious loops; lower or stop it when other audio plays.
- Avoid flat 360-degree images (no sense of scale); use lit meshes and shaders for subtle animation.
- Always provide a ground plane mesh.
- Avoid repeating the same assets.

### Platform notes
- Not supported on iOS, iPadOS, macOS, tvOS, watchOS.

---

## Inclusion

Source: https://developer.apple.com/design/human-interface-guidelines/inclusion

Inclusive design is iterative: examine assumptions, use empathy, and consider shared human dimensions (age, gender identity, race and ethnicity, sexuality, physical and cognitive attributes, permanent/temporary/situational disability, language and culture, religion, education, political or philosophical views, social and economic context). Being inoffensive is not the same as being inclusive.

### Welcoming language
- Check tone from different perspectives (an academic tone signals "experts only"); be clear, direct, respectful.
- Address people as "you/your", not "the user/the player". Reserve "we/our" for the app or company.
- Define specialized terms or replace them with plain language.
- Replace colloquialisms (some, like "peanut gallery" or "grandfathered in", have exclusionary origins).
- Use humor cautiously: it is subjective and hard to translate.

### Approachability
- Clear, platform-native interface; onboarding that teaches step by step but is skippable.

### Gender identity
- Avoid unnecessary gendered references ("Subscribers can post recipes" rather than "his or her recipes"); helps localization into gendered languages.
- Let people customize avatars, emoji, characters. Depict generic people with nongendered figures (SF Symbols `person`, `figure` families).
- Ask for gender only if required (health, legal); offer options like nonbinary, self-identify, decline to state; consider asking for pronouns.

### People, settings, stereotypes
- Show diverse races, body types, ages, abilities; avoid occupational and hero/villain stereotypes.
- Prefer relatable settings over conspicuous affluence.
- Question built-in assumptions (narrow definitions of family; security questions like "first car" or "college subject"). Prefer universal prompts ("favorite activity", "first friend's name", "quality that describes you best").

### Accessibility in inclusion
- Support VoiceOver, Display Accommodations, closed captions, Switch Control, Speak Screen.
- Never assume a disability means disinterest. Disabilities are spectra; everyone has temporary or situational ones.
- Include people with disabilities in imagery; never use disability as a metaphor for a negative quality.
- Write people-first; ask how individuals or communities self-identify.
- Prioritize simplicity and perceivability (sight, hearing, touch).

### Languages
- Internationalize (language, region formats for date, time, money) then localize. Plain language, no gender assumptions and no culture-specific content ease localization.
- SF Symbols include language-specific and RTL-ready glyphs.
- Verify color meaning per locale (white: mourning in some places, purity in others).

No platform-specific notes.

---

## Layout

Source: https://developer.apple.com/design/human-interface-guidelines/layout

Use Apple Design Resources templates and layout guides.

### Visual hierarchy
- Put the most important items near the top and leading side (reading order). Use system components so RTL flips automatically.
- Align elements for scanning; indent to show subordination.
- Group related items with negative space, container shapes or separators.
- Use progressive disclosure: disclosure triangles, menus, nested views, scrollable sections.
- Differentiate controls from content with Liquid Glass. Do not place solid or semi-opaque fills behind controls; use a scroll edge effect to lift controls above content.
- Extend full-screen background content beneath sidebars, toolbars and tab bars to fill the window.
- If sidebars or inspectors would hide part of a background image, use the background extension effect (mirror and blur beneath adjacent components): `backgroundExtensionEffect()` (SwiftUI), `UIBackgroundExtensionView` (UIKit).

### Adaptability
Handle, with SwiftUI or Auto Layout:
- Regular and compact horizontal and vertical size classes
- Screen sizes, orientations, aspect ratios
- System features such as the Dynamic Island
- External displays, Display Zoom, resizable windows on iPad and Mac
- Text size changes
- Locale: LTR/RTL direction, date/time/number formats, font variants, text length

Rules:
- Respect safe areas, margins and layout guides; fine-tune with layout modifiers. Even orientation-locked games must resize well.
- Support Dynamic Type: stack side-by-side views vertically at large sizes, let rows grow, allow single-line rows to wrap. Unity games: Apple's accessibility plug-in.
- Preview across devices, size classes, localizations and text sizes; test the largest and smallest layouts first. Use Device Hub (simulated devices), including iPad resizing and iPhone Mirroring on Mac.
- Scale background artwork to fill new aspect ratios; never distort its aspect ratio; expect to need art beyond the usual visible area for very wide or tall windows.

### Size classes (iOS, iPadOS)
- Two values per axis: compact or regular. Horizontal = narrow vs wide; vertical = short vs tall. Set by device, window configuration and multitasking (full screen, Slide Over, mirrored to Mac). APIs: `UITraitChangeObservable`, `UserInterfaceSizeClass`.
- Base layout on size classes, never on device idiom or orientation.
- Design for every combination in both aspect ratios (do not waste vertical space on a resized iPad, or width on a wide window).
- Keep functionality identical across size classes; only how much is visible changes (for example, tab bar becomes sidebar, overflow items surface). Idiom stays fixed, so keep the layout recognizably platform-native.

### Guides and safe areas
- Layout guides: rectangles for standard margins and readable text width (`UILayoutGuide`, `NSLayoutGuide`); custom guides allowed.
- Safe area: region not covered by hardware (Dynamic Island) or bars (toolbar, tab bar, status bar). Always respect it (`SafeAreaRegions`).

### Platform notes
**macOS**
- No controls or critical info at the bottom of windows (windows get dragged partly offscreen).
- No content behind the camera housing at the top (`NSPrefersDisplaySafeAreaCompatibilityMode`).

**tvOS**
- Safe area: inset primary content 60 pt top and bottom, 80 pt left and right (overscan).
- Pad between focusable items; focused items grow and must not cover important info.
- `UICollectionViewFlowLayout` computes columns automatically.

| Columns | Unfocused content width | Horizontal spacing | Min vertical spacing |
|---|---|---|---|
| 2 | 860 pt | 40 pt | 100 pt |
| 3 | 560 pt | 40 pt | 100 pt |
| 4 | 410 pt | 40 pt | 100 pt |
| 5 | 320 pt | 40 pt | 100 pt |
| 6 | 260 pt | 40 pt | 100 pt |
| 7 | 217 pt | 40 pt | 100 pt |
| 8 | 184 pt | 40 pt | 100 pt |
| 9 | 160 pt | 40 pt | 100 pt |

- Titled rows need extra space between the previous row's bottom and the title's center, and between title and items.
- Keep spacing consistent; keep partially offscreen items equally wide on both sides.

**visionOS** (windows and volumes; see Spatial layout for depth)
- Support resizing; keep content horizontally centered at very large sizes. Min and max sizes are for preventing overlap and unwieldiness, not to block resizing (Safari's navigation ornament has a fixed max size).
- Use 3D content in windows sparingly, inset so it does not collide or spill beyond the edge; larger 3D belongs in a volume or immersive space.
- Show supplemental content in an adjacent window (`defaultWindowPlacement(_:)`), not an ornament; ornaments are for app controls (toolbars, playback).
- Space controls so hover effects do not obscure neighbors: button centers at least 60 pt apart.

**watchOS**
- At most three glyph buttons or two text buttons per row; full-width text buttons are usually best; two short side-by-side text buttons only on non-scrolling screens.
- Support autorotation (`isAutorotating`) for content people show others (images, QR codes).

---

## Materials

Source: https://developer.apple.com/design/human-interface-guidelines/materials

Materials separate foreground (text, controls) from background (content, solid color) while letting color pass through. Two kinds: Liquid Glass (dynamic functional layer for controls and navigation) and standard materials (structure within the content layer).

### Liquid Glass
- Forms a distinct layer for controls and navigation (tab bars, sidebars) floating above content; content scrolls and peeks beneath it while controls stay legible.
- Never use Liquid Glass in the content layer; use standard materials there (for example app backgrounds). Exception: transient interactive parts of content-layer controls (sliders, toggles) take on glass while being manipulated.
- Use it sparingly on custom controls; standard components adopt it automatically. Limit to the most important functional elements.
- Variants (appearance also responds to the user's preferred glass look, Reduce Transparency, Increase Contrast):
  - Regular: blurs and adjusts luminosity behind it; most system components use it. Use when legibility is at risk or for text-heavy components (alerts, sidebars, popovers). Scroll edge effects add blur and reduce opacity of content beneath.
  - Clear: highly translucent; only for components over visually rich media (photos, video).
- Clear glass dimming: over bright content add a dark dimming layer at 35% opacity; skip it over dark content or with AVKit playback controls (they supply their own).
- Color on glass: see Color > Liquid Glass color.

### Standard materials
- APIs: `UIBlurEffect`, `UIVibrancyEffect`, `NSVisualEffectView.BlendingMode`, SwiftUI `Material`. Use them for structure beneath Liquid Glass.
- Choose by semantic purpose, never by the tint it appears to give (settings change appearance).
- Put system vibrant colors on top of materials for legibility.
- Thicker (more opaque) materials give better contrast for text and fine detail; thinner ones preserve context.

### Platform notes
**iOS, iPadOS**: four standard materials for the content layer: ultra-thin, thin, regular (default), thick. Vibrant colors per material:
- Labels: `UIVibrancyEffectStyle.label` (default), `.secondaryLabel`, `.tertiaryLabel`, `.quaternaryLabel`. Avoid quaternary on thin and ultraThin (too little contrast).
- Fills: `.fill` (default), `.secondaryFill`, `.tertiaryFill` on any material.
- Separator: single `.separator` value, works on all materials.
- Level names indicate contrast: default highest, quaternary lowest.

**macOS**: purpose-specific materials with vibrant versions (`NSVisualEffectView.Material`). Test where vibrancy helps in custom views. Blending modes: behind window, within window.

**tvOS**: Liquid Glass in navigation, Top Shelf, Control Center; image views and buttons adopt it on focus. Standard materials:

| Material | Use for |
|---|---|
| ultraThin | Full-screen views needing a light scheme |
| thin | Partial overlays needing a light scheme |
| regular | Partial overlays |
| thick | Partial overlays needing a dark scheme |

**visionOS**: windows use the unmodifiable system glass, which lets light, environment and surroundings show through while limiting background color range; it adapts brightness to surroundings (no Dark Mode setting).
- Prefer translucency over opaque areas in windows.
- Custom components: thin material to highlight interactive or selected items; regular to separate sections (sidebar, grouped table); thick for a dark element on a regular background.
- Vibrancy: `UIVibrancyEffectStyle.label` for standard text, `.secondaryLabel` for footnotes and subtitles, `.tertiaryLabel` only for inactive elements where legibility is not critical.

**watchOS**: use materials to give context in full-screen modals; do not remove or replace default material backgrounds on modal sheets.

---

## Motion

Source: https://developer.apple.com/design/human-interface-guidelines/motion

System components animate automatically and adapt to settings and input (Liquid Glass reacts more strongly to direct touch than to trackpad).

### Best practices
- Add motion only with purpose; gratuitous motion distracts and can cause discomfort.
- Make motion optional: never the only carrier of important info; add haptics and audio. Honor Reduce Motion (see Accessibility).

### Feedback
- Make feedback motion realistic and gesture-consistent (a view revealed by sliding down is dismissed by sliding up, not sideways).
- Keep feedback brief and precise (visionOS Photos panorama expands quickly and smoothly).
- Do not add motion to frequent interactions in apps; system elements already animate subtly.
- Let people interrupt or cancel animations; never force waiting, especially for repeated ones.
- Use animated SF Symbols (SF Symbols 5+) where it fits.

### Games
- Target a consistent 30 to 60 fps with good defaults per platform.
- Let players trade visuals for performance or battery (for example power modes when external power is detected).

### Platform notes
**visionOS** (motion plus depth gives gaze feedback; avoid distraction and discomfort)
- Avoid motion at the edges of the field of view; if needed in immersion, match its brightness to the rest of the scene.
- Large moving objects that fill the view feel like the world is moving: raise translucency or lower contrast. Even moving a big window yourself can cause discomfort; keep windows fairly small.
- Relocate objects by fading out, moving, fading in when the path carries no meaning.
- Do not let people rotate a virtual world; use instant direction changes during a quick fade.
- Provide a stationary frame of reference; avoid auto-moving the whole surroundings.
- Avoid sustained oscillation, especially around 0.2 Hz; if needed, low amplitude and translucent.

**watchOS**: prefer SwiftUI; WatchKit animations use `WKInterfaceImage`. Layout and appearance animations always include fixed ease-in/ease-out that cannot be changed.

---

## Privacy

Source: https://developer.apple.com/design/human-interface-guidelines/privacy

Every app submission must declare privacy practices and collected data (shown on the App Store product page; managed in App Store Connect).

### Best practices
- Request only data you need, as narrowly as possible, and only once the person shows interest in the feature.
- Be transparent about collection and use; respect Hide My Email and Mail Privacy Protection; know your app tracking obligations.
- Process on device where possible (Apple Neural Engine, Create ML models).
- Use system protections (for example CloudKit encryption and key management for strings, numbers, dates in iOS 15+).

### What needs permission
- Personal data: location, health, financial, contacts, other PII.
- User content: email, messages, calendar, contacts, gameplay info, Apple Music activity, HomeKit data, audio, video, photos.
- Protected resources: Bluetooth peripherals, home automation, Wi-Fi, local network.
- Camera and microphone.
- visionOS Full Space ARKit data: hand tracking, plane estimation, image anchoring, world tracking.
- Advertising identifier (tracking).

The system alert shows your purpose string; people can change their choice in Settings > Privacy.

### Requesting permission
- Ask in context when a feature needs it (Location button after interest is shown).
- Ask at launch only if the app cannot function without it (navigation needs location; a visionOS wall-bounce game needs surroundings).
- Purpose string: brief complete sentence, specific, sentence case, active voice, ending with a period.

| Verdict | Example | Why |
|---|---|---|
| Good | "The app records during the night to detect snoring sounds." | Active, says how and why |
| Bad | "Microphone access is needed for a better experience." | Passive, vague |
| Bad | "Turn on microphone access." | Imperative, no reason |

### Pre-alert screens
- Optional custom screen before the system alert (camera, mic, location, contacts, calendar, tracking) only if context is not enough.
- Exactly one button, titled "Continue" or "Next" (never "Allow"), which opens the system alert.
- No other actions (no close or cancel) unless needed for legal consent.

### Tracking (App Tracking Transparency)
- If tracking at launch, show the system alert before collecting any tracking data.
- Never precede it with misleading screens. Rejected patterns: incentives, screens imitating a request, images of the alert, annotations pointing at the alert. A legal consent screen before or after the ATT alert is allowed (App Review Guideline 5.1.1(iv)).

### Location button (iOS, iPadOS, watchOS)
- Grants one-time location access at the moment of need (`LocationButton` SwiftUI, `CLLocationButton`). First tap shows an explanatory alert once; later taps grant access directly; each grant expires when the app is no longer in use.
- With no status, a tap equals Allow Once; if status is While Using the App, tapping changes nothing.
- Use it for lightweight sharing (attach location to a post, find a store, identify a plant), especially if people usually pick Allow Once.
- Customizable: system title ("Current Location", "Share My Current Location"), filled or outlined glyph, background, title and glyph colors, corner radius. Nothing else.
- You must ensure no truncation at all accessibility sizes and localizations. The system warns on low contrast or excess translucency; persistent problems disable location access for the button.

### Protecting data
- Prefer passkeys over passwords; if passwords remain, require two-factor; add Face ID, Optic ID or Touch ID for persistent sessions (Local Authentication).
- Store secrets in the keychain; never in plain-text files.
- Do not invent authentication; use passkeys, Sign in with Apple, Password AutoFill.

### Platform notes
**macOS**: sign with Developer ID when distributing outside the store; sandbox (required for Mac App Store); do not assume who is signed in (fast user switching).

**visionOS**
- ARKit runs continuously for persistence, world mapping, segmentation, matting, lighting, but sends no data to Shared Space apps. Open a Full Space to use ARKit APIs; plane estimation, scene reconstruction, image anchoring and hand tracking need permission.
- Gaze is private: hover effects on SwiftUI/RealityKit components give feedback without revealing where people look before they tap.
- Cameras: back camera gives blank input (compatibility only); front camera input only with permission. Remove or replace camera features in ported iOS/iPadOS apps (offer import instead).

---

## Right to left

Source: https://developer.apple.com/design/human-interface-guidelines/right-to-left

System frameworks flip standard components automatically for RTL languages (Arabic, Hebrew). Fine-tune for alignment, numerals, currency and math symbols.

### Text alignment
- Mirror text alignment to the interface direction if the system does not.
- Align paragraphs (3+ lines) by their own language, not by context; one- and two-line blocks follow the context direction.
- Use one alignment for every item in a list, including items in another script.

### Numbers
- Hebrew uses Western Arabic numerals; Arabic may use Western or Eastern Arabic numerals, varying by country and region. Number-centric apps should pick the right form per locale; others can rely on system formatting.
- Never reverse the digits within a number (541, phone, card numbers).
- Reverse the order of numerals that express progress or counting direction (slider scales, ratings, ordered sequences); never mirror numeral glyphs.

### Controls
- Flip progress controls (sliders, progress bars) and their end-value glyphs.
- Flip ordered navigation (Back points right in RTL; next/previous flip).
- Do not flip controls referring to a physical direction or a screen area ("to the right" always points right).
- Next to all-caps Latin, enlarge Arabic or Hebrew text by about 2 pt for balance (no uppercase in those scripts).

### Images
- Do not flip photos, illustrations or artwork (meaning changes; copyright risk); create a new version if direction matters.
- Reverse positions of images whose order is meaningful (chronological, alphabetical, favorites).

### Interface icons
- SF Symbols ship RTL variants and localized Arabic/Hebrew symbols; custom symbols can declare directionality.
- Flip icons representing text or reading direction (left-aligned bars become right-aligned).
- Localize icons that contain real text (SF Symbols has Latin, Hebrew, Arabic versions of signature, rich text, I-beam); for concepts unrelated to writing, redesign without letters.
- Flip icons showing forward/backward motion (speaker waves emanate rightward in RTL).
- Never flip logos or universal marks (checkmark).
- Generally do not flip real-world objects (clocks; right-handed tools stay right-handed).
- For complex icons, judge components individually: keep design-language elements (the prohibition slash stays the same); flip badges that depict mirrored UI; move badges if needed for balance (cart badge); keep tool orientation while flipping the base if handedness is implied.

No platform-specific notes.

---

## SF Symbols

Source: https://developer.apple.com/design/human-interface-guidelines/sf-symbols

Thousands of configurable symbols aligned with the San Francisco font in all weights and sizes; use anywhere interface icons go (toolbars, tab bars, context menus, inline text). Features and symbols are tied to OS version (new ones unavailable on older OSes). License forbids using symbols, or lookalikes, in app icons, logos or any trademarked use.

### Rendering modes
Symbols are built from layers (`cloud.sun.rain.fill`: primary cloud, secondary sun, tertiary rain).

| Mode | Behavior |
|---|---|
| Monochrome | One color on all layers |
| Hierarchical | One color, opacity varies by layer level (depth) |
| Palette | One color per layer; with 2 colors on a 3-level symbol, secondary and tertiary share |
| Multicolor | Intrinsic meaningful colors (`leaf` green, `trash.slash` red); some layers accept custom color |

- Use system colors so symbols adapt to accessibility, vibrancy and Dark Mode (`renderingMode(_:)`).
- Verify the mode in every context (size, background contrast); "automatic" picks the preferred mode but check it.
- Gradients (SF Symbols 7+): smooth linear gradient from one source color, all modes, system/custom colors and custom symbols; best at large sizes.

### Variable color
- Colors layers as a value crosses thresholds from 0 to 100% to express changing quantities (`speaker.wave.3` waves by volume; speaker body opts out). Any number of layers can participate.
- Use for change, never for depth (use Hierarchical for depth).

### Weights and scales
- Nine weights (ultralight to black) matching SF font weights.
- Three scales relative to SF cap height: small, medium (default), large; adjust emphasis without breaking weight match. APIs: `imageScale(_:)`, `UIImage.SymbolScale`, `NSImage.SymbolConfiguration`.

### Design variants
- Outline (most common, text-like), fill (solid areas, more emphasis), slash (unavailable), enclosed (circle, square, rectangle; better legibility at small sizes); enclosed and slash combine with outline or fill.
- Script variants: Latin, Arabic, Hebrew, Hindi, Thai, Chinese, Japanese, Korean, Cyrillic, Devanagari, several Indic numeral systems; switch automatically with device language.
- Outline next to text (toolbars, lists); fill for iOS tab bars, swipe actions and accent-colored selection. Containers often choose automatically (iOS tab bar uses fill, toolbar uses outline).

### Animations (`SymbolEffect`)
Work on all symbols, modes, weights, scales and custom symbols; play once or repeat until a condition; configurable speed and reversal.

| Effect | Meaning / use |
|---|---|
| Appear / Disappear | Gradually enter or leave |
| Bounce | Brief elastic scale up or down then back; action happened or is needed (plays once by default) |
| Scale | Persistent size change; highlight selection or feedback |
| Pulse | Opacity varies (annotated layers or all); ongoing activity |
| Variable color | Layer opacity steps, cumulative or iterative, optional autoreverse and hide inactive layers; progress, playback, connecting, broadcasting. Open-loop vs closed-loop layer arrangements (closed loops repeat seamlessly) |
| Replace | Swap symbols: down-up (state change), up-up (state change with forward progress), off-up (emphasize next state or action) |
| Magic Replace | Default replace; smart transition between related shapes (slashes draw, badges appear); falls back to down-up for unrelated symbols (direction customizable) |
| Wiggle | Back-and-forth along an axis; flag overlooked change or call to action, reinforce direction |
| Breathe | Opacity and size pulse; living status such as active recording |
| Rotate | Whole symbol or a layer (By Layer, fan blades); work in progress |
| Draw On / Draw Off | SF Symbols 7+: draw along guide points, all layers, staggered or one by one; progress (download), directional meaning |

- Animate judiciously; each animation needs a clear purpose and must not confuse; use it to convey information compactly; match the app's tone.

### Custom symbols
- Start from an exported template of a similar symbol; edit in a vector tool. Match system detail, optical weight, alignment, position, perspective. Aim for simple, recognizable, inclusive, directly related.
- Annotate layers with colors or hierarchy levels (primary, secondary, tertiary) to support rendering modes.
- Apple product and feature symbols (marked with an Info badge in the app) can be displayed but never customized; never draw Apple product replicas.
- Use negative side margins for optical alignment when badges widen a symbol; name margins in the pattern "left-margin-Regular-M".
- For animation: annotate layers; Z-order sets variable color order (front-to-back or back-to-front); group related layers.
- Draw whole shapes and use erase layers for gaps (as in `person.2.fill`) so animations behave; test with every preset.
- Do not bake in enclosures or badges; use the SF Symbols component library.
- Provide accessibility labels.

No platform-specific notes.

---

## Spatial layout

Source: https://developer.apple.com/design/human-interface-guidelines/spatial-layout

visionOS only.

### Field of view
- The space visible without moving the head; varies by Light Seal fit and peripheral acuity. The system does not expose it to apps.
- Apps launch in front of the person. Keep important content centered; no distracting motion or bright, high-contrast objects in the periphery.
- Do not anchor content to the head; anchor it in space so people can look around.

### Depth
- The system adds color temperature, reflections and shadows to convey depth; SwiftUI adds depth effects to views in 2D windows. Use RealityKit for 3D objects, shown anywhere or in a volume (window-like, no visible frame).
- Depth cues must be accurate and consistent with reality to avoid discomfort.
- Use depth for hierarchy (a sheet comes forward as the window recedes on z).
- Avoid depth on text (floating text is hard to read).
- Use depth where it adds value, on large important elements (tab bar, toolbar), not small ones (a button's symbol). Limit how many depth levels; refocusing is tiring.

### Scale
- Dynamic scale: windows grow as they move away and shrink as they approach, appearing constant in size. A visionOS point is an angle.
- Fixed scale: objects keep real size and look smaller with distance. Use it sparingly, for noninteractive objects that must be life-size (product previews).

### Best practices
- Avoid too many windows (overwhelming, hard to relocate).
- Prioritize indirect gestures (work at any distance, hands stay low); reserve direct touch for nearby objects meant for brief close manipulation.
- The Digital Crown press recenters content; no app work needed.
- Space interactive elements for comfortable gaze and hover: regular-size buttons with centers at least 60 pt apart and 16 pt or more between them; never overlap controls with other interactive elements.
- Let people use the app with minimal or no physical movement.
- Place large floor-rising immersive content on a horizontal plane aligned with the floor.

---

## Typography

Source: https://developer.apple.com/design/human-interface-guidelines/typography

### Legibility
| Platform | Default size | Minimum size |
|---|---|---|
| iOS, iPadOS | 17 pt | 11 pt |
| macOS | 13 pt | 10 pt |
| tvOS | 29 pt | 23 pt |
| visionOS | 17 pt | 12 pt |
| watchOS | 16 pt | 12 pt |

- Apply these to system and custom fonts. Thin custom weights need larger sizes.
- Test legibility per context and platform (games on every platform); fix with larger size, more contrast, or system fonts.
- Prefer Regular, Medium, Semibold, Bold; avoid Ultralight, Thin, Light, especially small.

### Hierarchy
- Use weight, size and color to show importance; preserve relative hierarchy when text size changes.
- Use as few typefaces as possible.
- When text grows, prioritize content people care about (tab titles need not grow; dialogue matters more than transient damage numbers).

### System fonts
- San Francisco (sans serif): SF Pro, SF Compact, SF Arabic, SF Armenian, SF Georgian, SF Hebrew, SF Mono. Rounded variants of all but Mono for soft UI or an alternate voice.
- New York (NY): serif, pairs with SF.
- Both are variable fonts with dynamic optical sizes (Text and Display merged into one continuous design interpolated per point size); discrete optical sizes only needed in tools lacking variable font support.
- Weights Ultralight to Black; SF also has widths including Condensed and Expanded. SF Symbols weights match.
- Text styles bundle weight, size and leading per text size; they scale with Dynamic Type and Larger Text.
- Prefer built-in text styles. Modify via symbolic traits: bold for another hierarchy level; loose leading for wide columns and long passages; tight leading for height-limited rows, but never for 3+ lines (`leading(_:)`).
- Never embed system fonts; access via `Font.Design` (`.default` for SF, `.serif` for NY).
- The running system adjusts tracking per size; in mockups apply the tracking tables below.

### Custom fonts
- Keep them legible at the minimum sizes.
- Implement Dynamic Type and Bold Text for them. Unity: Apple's Unity plug-ins, or another way to resize text.

### Dynamic Type
Available on iOS, iPadOS, tvOS, visionOS, watchOS (not macOS). Size tables also in Apple Design Resources.
- Layout must adapt to every size; test with Larger Accessibility Text Sizes (Settings > Accessibility > Display & Text Size > Larger Text).
- Scale meaningful icons with text (SF Symbols do automatically).
- Minimize truncation: show as much at the largest accessibility size as at the largest standard size; no truncation in scroll regions unless a detail view exists; let labels use multiple lines (`numberOfLines`).
- At large sizes stack text above secondary items (glyphs, timestamps) and reduce column count (`isAccessibilityCategory`).
- Keep hierarchy stable: primary elements stay near the top.

### Platform notes
- iOS, iPadOS: SF Pro system font; NY available.
- macOS: SF Pro; NY only for Mac Catalyst apps; no Dynamic Type. Match standard controls with dynamic font variants:

| Variant | AppKit API |
|---|---|
| Control content | `controlContentFont(ofSize:)` |
| Label | `labelFont(ofSize:)` |
| Menu | `menuFont(ofSize:)` |
| Menu bar | `menuBarFont(ofSize:)` |
| Message | `messageFont(ofSize:)` |
| Palette | `paletteFont(ofSize:)` |
| Title | `titleBarFont(ofSize:)` |
| Tool tips | `toolTipsFont(ofSize:)` |
| Document text | `userFont(ofSize:)` |
| Monospaced document text | `userFixedPitchFont(ofSize:)` |
| Bold system | `boldSystemFont(ofSize:)` |
| System | `systemFont(ofSize:)` |

- tvOS: SF Pro; NY available.
- visionOS: SF Pro; NY requires specifying styles. Body and title styles are bolder; adds Extra Large Title 1 and Extra Large Title 2 for wide editorial layouts. Prefer 2D text (depth hurts reading). Test legibility as windows scale. Default text is white for contrast on glass; test any other color. Text floating without a background: make it bold, avoid shadows (no reliable surface). Billboard labels tied to points in space so they always face the viewer (rotate around the y-axis).
- watchOS: SF Compact; NY available; complications use SF Compact Rounded.

### Specifications
Emphasized variants via symbolic traits: SwiftUI `bold()`, UIKit `traitBold` (`UIFontDescriptor`). Emphasized weights can be medium, semibold, bold or heavy.

**iOS, iPadOS Dynamic Type** (cells are size/leading in pt; xSmall to xxxLarge standard, AX1 to AX5 accessibility; Large is default)

| Style | Weight / emph. | xSmall | Small | Medium | Large (def.) | xLarge | xxLarge | xxxLarge | AX1 | AX2 | AX3 | AX4 | AX5 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Large Title | Regular / Bold | 31/38 | 32/39 | 33/40 | 34/41 | 36/43 | 38/46 | 40/48 | 44/52 | 48/57 | 52/61 | 56/66 | 60/70 |
| Title 1 | Regular / Bold | 25/31 | 26/32 | 27/33 | 28/34 | 30/37 | 32/39 | 34/41 | 38/46 | 43/51 | 48/57 | 53/62 | 58/68 |
| Title 2 | Regular / Bold | 19/24 | 20/25 | 21/26 | 22/28 | 24/30 | 26/32 | 28/34 | 34/41 | 39/47 | 44/52 | 50/59 | 56/66 |
| Title 3 | Regular / Semibold | 17/22 | 18/23 | 19/24 | 20/25 | 22/28 | 24/30 | 26/32 | 31/38 | 37/44 | 43/51 | 49/58 | 55/65 |
| Headline | Semibold / Semibold | 14/19 | 15/20 | 16/21 | 17/22 | 19/24 | 21/26 | 23/29 | 28/34 | 33/40 | 40/48 | 47/56 | 53/62 |
| Body | Regular / Semibold | 14/19 | 15/20 | 16/21 | 17/22 | 19/24 | 21/26 | 23/29 | 28/34 | 33/40 | 40/48 | 47/56 | 53/62 |
| Callout | Regular / Semibold | 13/18 | 14/19 | 15/20 | 16/21 | 18/23 | 20/25 | 22/28 | 26/32 | 32/39 | 38/46 | 44/52 | 51/60 |
| Subhead | Regular / Semibold | 12/16 | 13/18 | 14/19 | 15/20 | 17/22 | 19/24 | 21/28 | 25/31 | 30/37 | 36/43 | 42/50 | 49/58 |
| Footnote | Regular / Semibold | 12/16 | 12/16 | 12/16 | 13/18 | 15/20 | 17/22 | 19/24 | 23/29 | 27/33 | 33/40 | 38/46 | 44/52 |
| Caption 1 | Regular / Semibold | 11/13 | 11/13 | 11/13 | 12/16 | 14/19 | 16/21 | 18/23 | 22/28 | 26/32 | 32/39 | 37/44 | 43/51 |
| Caption 2 | Regular / Semibold | 11/13 | 11/13 | 11/13 | 11/13 | 13/18 | 15/20 | 17/22 | 20/25 | 24/30 | 29/35 | 34/41 | 40/48 |

**macOS built-in text styles** (no Dynamic Type)
| Style | Weight | Size | Line height | Emphasized |
|---|---|---|---|---|
| Large Title | Regular | 26 | 32 | Bold |
| Title 1 | Regular | 22 | 26 | Bold |
| Title 2 | Regular | 17 | 22 | Bold |
| Title 3 | Regular | 15 | 20 | Semibold |
| Headline | Bold | 13 | 16 | Heavy |
| Body | Regular | 13 | 16 | Semibold |
| Callout | Regular | 12 | 15 | Semibold |
| Subheadline | Regular | 11 | 14 | Semibold |
| Footnote | Regular | 10 | 13 | Semibold |
| Caption 1 | Regular | 10 | 13 | Medium |
| Caption 2 | Medium | 10 | 13 | Semibold |

**tvOS built-in text styles**
| Style | Weight | Size | Leading | Emphasized |
|---|---|---|---|---|
| Title 1 | Medium | 76 | 96 | Bold |
| Title 2 | Medium | 57 | 66 | Bold |
| Title 3 | Medium | 48 | 56 | Bold |
| Headline | Medium | 38 | 46 | Bold |
| Subtitle 1 | Regular | 38 | 46 | Medium |
| Callout | Medium | 31 | 38 | Bold |
| Body | Medium | 29 | 36 | Bold |
| Caption 1 | Medium | 25 | 32 | Bold |
| Caption 2 | Medium | 23 | 30 | Bold |

**watchOS Dynamic Type** (size/leading in pt; defaults: Small on 38 mm, Large on 40/41/42 mm, xLarge on 44/45/49 mm)

| Style | Weight / emph. | xSmall | Small (def. 38mm) | Large (def. 40mm/41mm/42mm) | xLarge (def. 44mm/45mm/49mm) | xxLarge | xxxLarge | AX1 | AX2 | AX3 |
|---|---|---|---|---|---|---|---|---|---|---|
| Large Title | Regular / Bold | 30/32.5 | 32/34.5 | 36/38.5 | 40/42.5 | 41/43.5 | 42/44.5 | 44/46.5 | 45/47.5 | 46/48.5 |
| Title 1 | Regular / Semibold | 28/30.5 | 30/32.5 | 34/36.5 | 38/40.5 | 39/41.5 | 40/42.5 | 42/44.5 | 43/46 | 44/47 |
| Title 2 | Regular / Semibold | 24/26.5 | 26/28.5 | 28/30.5 | 30/32.5 | 31/33.5 | 32/34.5 | 34/41 | 35/37.5 | 36/38.5 |
| Title 3 | Regular / Semibold | 17/19.5 | 18/20.5 | 19/21.5 | 20/22.5 | 21/23.5 | 22/24.5 | 24/26.5 | 25/27.5 | 26/28.5 |
| Headline | Semibold / Semibold | 14/16.5 | 15/17.5 | 16/18.5 | 17/19.5 | 18/20.5 | 19/21.5 | 21/23.5 | 22/24.5 | 23/25.5 |
| Body | Regular / Semibold | 14/16.5 | 15/17.5 | 16/18.5 | 17/19.5 | 18/20.5 | 19/21.5 | 21/23.5 | 22/24.5 | 23/25.5 |
| Caption 1 | Regular / Semibold | 13/15.5 | 14/16.5 | 15/17.5 | 16/18.5 | 17/19.5 | 18/20.5 | 18/20.5 | 19/21.5 | 20/22.5 |
| Caption 2 | Regular / Semibold | 12/14.5 | 13/15.5 | 14/16.5 | 15/17.5 | 16/18.5 | 17/19.5 | 17/19.5 | 18/20.5 | 19/21.5 |
| Footnote 1 | Regular / Semibold | 11/13.5 | 12/14.5 | 13/15.5 | 14/16.5 | 15/17.5 | 16/18.5 | 16/18.5 | 17/19.5 | 18/20.5 |
| Footnote 2 | Regular / Semibold | 10/12.5 | 11/13.5 | 12/14.5 | 13/15.5 | 14/16.5 | 15/17.5 | 15/17.5 | 16/17.5 | 17/19.5 |

### Tracking values (mockups only)
Format `size pt: tracking in 1/1000 em` (multiply by size/1000 for points). macOS and tvOS use the SF Pro table.

- SF Pro (iOS, iPadOS, visionOS, macOS, tvOS): `6:+41 7:+34 8:+26 9:+19 10:+12 11:+6 12:0 13:-6 14:-11 15:-16 16:-20 17:-26 18:-25 19:-24 20:-23 21:-18 22:-12 23:-4 24:+3 25:+6 26:+8 27:+11 28:+14 29:+14 30:+14 31:+13 32:+13 33:+12 34:+12 35:+11 36:+10 37:+10 38:+10 39:+10 40:+10 41:+9 42:+9 43:+9 44:+8 45:+8 46:+8 47:+8 48:+8 49:+7 50:+7 51:+7 52:+6 53:+6 54:+6 56:+6 58:+5 60:+4 62:+4 64:+4 66:+3 68:+2 70:+2 72:+2 76:+1 80:0 84:0 88:0 92:0 96:0`
- SF Pro Rounded: `6:+87 7:+80 8:+72 9:+65 10:+58 11:+52 12:+46 13:+40 14:+35 15:+30 16:+26 17:+22 18:+21 19:+20 20:+18 21:+17 22:+16 23:+16 24:+15 25:+14 26:+14 27:+14 28:+13 29:+13 30:+12 31:+12 32:+12 33:+12 34:+12 35:+11 36:+11 37:+10 38:+10 39:+10 40:+10 41:+10 42:+10 43:+9 44:+8 45:+8 46:+8 47:+8 48:+8 49:+8 50:+7 51:+6 52:+6 53:+6 54:+6 56:+6 58:+4 60:+4 62:+4 64:+3 66:+2 68:+2 70:+2 72:+2 76:+1 80:0 84:0 88:0 92:0 96:0`
- New York: `6:+40 7:+32 8:+25 9:+20 10:+16 11:+11 12:+6 13:+4 14:+2 15:+0 16:-2 17:-4 18:-6 19:-8 20:-10 21:-10 22:-10 23:-11 24:-11 25:-11 26:-12 27:-12 28:-12 29:-12 30:-12 31:-13 32:-13 33:-13 34:-14 35:-14 36:-14 38:-14 40:-14 42:-14 44:-14 46:-14 48:-14 50:-14 52:-14 54:-15 58:-15 62:-15 66:-15 70:-16 72:-16 80:-16 88:-16 96:-16 100:-16 120:-16 140:-16 160:-16 180:-17 200:-17 220:-18 240:-18 260:-18`
- SF Compact (watchOS): `6:+50 7:+30 8:+30 9:+30 10:+30 11:+24 12:+20 13:+16 14:+14 15:+4 16:0 17:-4 18:-8 19:-12 20:0 21:-2 22:-4 23:-6 24:-8 25:-10 26:-11 27:-12 28:-12 29:-14 30:-14 31:-15 32:-16 33:-17 34:-18 35:-18 36:-20 37:-20 38:-20 39:-20 40:-20 41:-20 42:-20 43:-20 44:-20 45:-20 46:-20 47:-20 48:-20 49:-21 50:-21 51:-21 52:-21 53:-22 54:-22 56:-22 58:-22 60:-22 62:-22 64:-23 66:-24 68:-24 70:-24 72:-24 76:-25 80:-26 84:-26 88:-26 92:-28 96:-28`
- SF Compact Rounded (watchOS): `6:+28 7:+26 8:+24 9:+22 10:+20 11:+18 12:+16 13:+14 14:+12 15:+10 16:+8 17:+6 18:+4 19:+2 20:0 21:-2 22:-4 23:-6 24:-8 25:-10 26:-11 27:-12 28:-12 29:-14 30:-14 31:-15 32:-16 33:-17 34:-18 35:-18 36:-20 37:-20 38:-20 39:-20 40:-20 41:-20 42:-20 43:-20 44:-20 45:-20 46:-20 47:-20 48:-20 49:-21 50:-21 51:-21 52:-21 53:-22 54:-22 56:-22 58:-22 60:-22 62:-22 64:-23 66:-24 68:-24 70:-24 72:-24 76:-25 80:-26 84:-26 88:-26 92:-28 96:-28`

---

## Writing

Source: https://developer.apple.com/design/human-interface-guidelines/writing

### Getting started
- Define the app's voice from its audience and desired feeling (banking: trust and stability; game: excitement). Keep a glossary of common terms and use it consistently.
- Vary tone with context: direct and serious for errors or payments, light and celebratory for achievements.
- Be clear: cut unneeded words; read copy aloud.
- Write for everyone: plain language, no jargon or gendered terms, ready for accessibility and localization.

### Best practices
- Order each screen by importance; format for readability; split multiple ideas across screens with a deliberate flow.
- Be action oriented: active voice; buttons and links almost always start with a verb ("Send", not "Let's do it!"). Use descriptive link text ("Learn more about UX Writing"), never "Click here" (screen readers).
- Build repeatable language patterns.
- Pick a capitalization style per element type (title case is more formal, sentence case more casual) and apply it everywhere (for example title case for all alerts).
- Multi-step flows: start with "Get Started", advance with consistent "Continue" or "Next" (or a label hinting the next step), finish with "Done".
- Use "my/your" sparingly ("Favorites" over "Your Favorites"), keep perspective consistent, avoid "we" ("Unable to load content", not "We're having trouble loading this content").
- Match each device: "tap" on touch devices, never "click"; be brief on small screens (iPhone, Watch) and on TV (large distant text, shared audience, so consider who is addressed).
- Empty states: welcome, teach, and give a clear next step with a button or link; never put crucial info there (it disappears).
- Errors: prevent them first; show them near the problem; no blame; say how to fix ("Choose a password with at least 8 characters" beats "That password is too short"); skip "oops" and "uh-oh". If many people hit the same error, redesign the interaction.
- Choose the delivery method by urgency, importance, context and needed detail (notifications, alerts, action sheets).
- Settings: practical labels; if needed, describe what the setting does when on (the off state is inferred). Link directly to a setting instead of describing its path.
- Text fields: clear labels plus hint or placeholder ("name@example.com", "Your name"); show errors beside the field with positive instruction ("Use only letters for your name" over "Don't use numbers or symbols"); never robotic messages like "Invalid name".

No platform-specific notes.
