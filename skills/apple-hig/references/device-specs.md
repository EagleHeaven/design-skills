# Device specs and App Store screenshot sizes

## Contents
- Layout rule: size classes, not device sizes
- App Store screenshot sizes (official)
- Derived point sizes (iPhone, iPad)
- Apple Wallet badges (local assets)

## Layout rule: size classes, not device sizes

- On 2026-09-09 Apple removed the per-device screen dimension tables from the HIG Layout page. The guidance is to lay out by size class (compact/regular width and height), safe areas and layout margins, never by device model or a fixed breakpoint. The iPhone Duo guidance says the same: no fixed widths, no device-tied metrics.
- Use device sizes only for mockups, screenshots and test matrices. Never branch code on a device name or exact screen size.
- Test matrix to cover: smallest supported iPhone (compact width), a Dynamic Island medium iPhone, a large iPhone, iPhone Duo outer (compact) and inner (regular) displays, iPad in full screen and in a narrow window, the largest accessibility text size.

## App Store screenshot sizes (official)

Source: https://developer.apple.com/help/app-store-connect/reference/app-information/screenshot-specifications/ (read 2026-11-19)

- 1 to 10 screenshots per device size, `.jpeg`, `.jpg` or `.png`, no alpha channel or transparency.
- Required: iPhone with Dynamic Island (medium display); iPad 13-inch if the app runs on iPad; Mac, Apple TV, Vision Pro and Watch sizes when the app runs there.
- Uploading only the highest required resolution is enough when the UI is identical across sizes; App Store Connect scales down.
- iPhone Duo: screenshots become required from April 2027 for apps built with the iOS 27.1 SDK or later; supplying them adds a "made for iPhone Duo" badge on the product page.

| Display group | Devices (examples) | Portrait pixels (landscape = swapped) |
|---|---|---|
| iPhone Duo, outer display | iPhone Duo | 1398 x 2034 |
| iPhone Duo, inner display | iPhone Duo | 2007 x 2853 |
| iPhone Dynamic Island, large | iPhone Air, 18/17/16 Pro Max, 16 Plus, 15 Pro Max, 15 Plus, 14 Pro Max | 1260 x 2736, 1290 x 2796, 1320 x 2868 |
| iPhone Face ID, large | 14 Plus, 13/12/11 Pro Max, 11, XS Max, XR | 1284 x 2778, 1242 x 2688 |
| iPhone Dynamic Island, medium (required) | 18 Pro, 17 Pro, 17, 16 Pro, 16, 15 Pro, 15, 14 Pro | 1179 x 2556, 1206 x 2622 |
| iPhone Face ID, medium | 17e, 16e, 14, 13 Pro, 13, 13 mini, 12 Pro, 12, 12 mini, 11 Pro, XS, X | 1170 x 2532, 1125 x 2436, 1080 x 2340 |
| iPhone Home button, large | 8 Plus, 7 Plus, 6S Plus, 6 Plus | 1242 x 2208 |
| iPhone Home button, medium | SE (2nd, 3rd gen), 8, 7, 6S, 6 | 750 x 1334 |
| iPad 13-inch (required for iPad) | iPad Pro (M5, M4, earlier 12.9), iPad Air (M4, M3, M2) | 2064 x 2752, 2048 x 2732 |
| iPad 11-inch | iPad Pro 11, iPad Air 11, iPad (A16, 10th gen), iPad mini (A20 Pro, A17 Pro, 6th gen) | 1488 x 2266, 1512 x 2316, 1668 x 2420, 1668 x 2388, 1640 x 2360 |
| iPad 10.5-inch | iPad Pro 10.5, iPad Air 3, iPad 7th to 9th gen | 1668 x 2224 |
| Mac (16:10) | Mac | 1280 x 800, 1440 x 900, 2560 x 1600, 2880 x 1800 |
| Apple TV | Apple TV | 1920 x 1080, 3840 x 2160 |
| Apple Vision Pro | Vision Pro | 3840 x 2160 |
| Apple Watch | Ultra 4/3: 422 x 514; Ultra 2/1: 410 x 502; Series 12/11/10: 416 x 496; Series 9/8/7: 396 x 484; Series 6/5/4, SE: 368 x 448; Series 3 to 1: 312 x 390 | same size across all localizations |

Older 4-inch, 3.5-inch, 12.9-inch (2nd gen) and 9.7-inch sizes are still accepted; fetch the source page if needed.

## Derived point sizes (iPhone, iPad)

Points = screenshot pixels / scale factor. These are calculations, not an Apple table; confirm in the Xcode simulator when a value matters.

| Pixels (portrait) | Scale | Points | Typical devices |
|---|---|---|---|
| 1320 x 2868 | 3x | 440 x 956 | iPhone 16/17 Pro Max |
| 1290 x 2796 | 3x | 430 x 932 | iPhone 15 Pro Max, 15 Plus, 16 Plus |
| 1260 x 2736 | 3x | 420 x 912 | iPhone Air |
| 1206 x 2622 | 3x | 402 x 874 | iPhone 16 Pro, 17 Pro, 17 |
| 1179 x 2556 | 3x | 393 x 852 | iPhone 15, 15 Pro, 16 |
| 1170 x 2532 | 3x | 390 x 844 | iPhone 12 to 14, 16e |
| 750 x 1334 | 2x | 375 x 667 | iPhone SE (2nd, 3rd gen) |
| 2064 x 2752 | 2x | 1032 x 1376 | iPad Pro 13 (M4, M5) |
| 2048 x 2732 | 2x | 1024 x 1366 | iPad Pro 12.9, iPad Air 13 |
| 1668 x 2420 | 2x | 834 x 1210 | iPad Pro 11 (M4, M5) |
| 1640 x 2360 | 2x | 820 x 1180 | iPad Air 11, iPad (10th gen, A16) |
| 1488 x 2266 | 2x | 744 x 1133 | iPad mini (6th gen and later) |

iPhone Duo scale factors are not published on the screenshot page; read them from the simulator or Apple's iPhone Duo documentation rather than guessing.

## Apple Wallet badges (local assets)

- Official "Add to Apple Wallet" badges (RGB SVG) for English (US/UK), French (France), French (Canada), Dutch and German are in `assets/wallet-badges/`.
- All 45 languages (RGB and CMYK EPS, SVG) are in the original archive at `~/Downloads/Add-to-Apple-Wallet.zip` (Apple's 2021 badge set).
- Use the badge unmodified, in the person's language, and follow the Wallet section of `technologies.md` and Apple's Add to Apple Wallet guidelines: https://developer.apple.com/wallet/Add-to-Apple-Wallet-Guidelines.pdf
