# Technologies (Apple HIG reference)

Distilled rules for integrating Apple technologies and services. Current as of Nov 2026 (Liquid Glass era). Each section links its source page. Brand, button, and wording rules (Apple Pay, Sign in with Apple, Wallet, AirPlay, HomeKit, HealthKit, Siri, Tap to Pay, App Clip Codes) are precise and App Review relevant: follow them literally.

## Table of contents

1. [AirPlay](#airplay)
2. [Always On](#always-on)
3. [App Clips](#app-clips)
4. [Apple In-App Purchase](#apple-in-app-purchase)
5. [Apple Pay](#apple-pay) (buttons, mark, sizes, wording)
6. [Augmented reality](#augmented-reality)
7. [CareKit](#carekit)
8. [CarPlay](#carplay)
9. [Game Center](#game-center)
10. [Generative AI](#generative-ai)
11. [HealthKit](#healthkit)
12. [HomeKit](#homekit)
13. [iCloud](#icloud)
14. [ID Verifier](#id-verifier)
15. [iMessage apps and stickers](#imessage-apps-and-stickers)
16. [Live Photos](#live-photos)
17. [Mac Catalyst](#mac-catalyst)
18. [Machine learning](#machine-learning)
19. [Maps](#maps)
20. [NFC](#nfc)
21. [Photo editing](#photo-editing)
22. [ResearchKit](#researchkit)
23. [SharePlay](#shareplay)
24. [ShazamKit](#shazamkit)
25. [Sign in with Apple](#sign-in-with-apple) (buttons, custom buttons, sizes, titles)
26. [Siri](#siri)
27. [Tap to Pay on iPhone](#tap-to-pay-on-iphone)
28. [VoiceOver](#voiceover)
29. [Wallet](#wallet)

Universal trademark rules (repeated across AirPlay, Apple Pay, HomeKit, HealthKit, Siri, App Clips, SharePlay):

- Never translate Apple trademarks; keep them in English inside localized text.
- Never pluralize or make them possessive; use exact capitalization from the Apple Trademark List. All caps only when the whole UI style is all caps.
- Never use the Apple logo to stand for the word "Apple" in text.
- Never use Apple icons/marks as buttons unless the page explicitly provides a button; never alter Apple artwork.
- Keep Apple technology references less prominent than your own app name or identity.

---

## AirPlay

Source: https://developer.apple.com/design/human-interface-guidelines/airplay

Wireless streaming from iOS, iPadOS, macOS, tvOS to Apple TV, HomePod, and AirPlay-compatible TVs and speakers.

### Best practices

- Prefer the system media player (`AVPlayerViewController`): standard controls, chapters, subtitles, closed captions, AirPlay. Build custom only if it can't meet needs.
- Ship the full resolution range in your HLS playlist; AVFoundation picks per device. Missing high resolutions look bad on big screens (720p looks poor on a 4K TV).
- Stream only what people expect. Never stream background loops or short in-app-only videos (`usesExternalPlaybackWhileExternalScreenIsActive`).
- Support both AirPlay streaming and mirroring.
- Support remote control events (Lock Screen, Siri, HomePod play/pause/skip) via Remote command center events.
- Keep playing when the app backgrounds or the device locks. Never auto-mirror (people must explicitly choose to mirror).
- Don't interrupt other apps' playback unless starting immersive content. Autoplay/launch/inline videos play locally only (audio session category `ambient`).
- Keep the app usable during playback; navigating away must not auto-start other videos that interrupt the stream.
- Custom player: provide a clear way into AirPlay, buttons matching system appearance and behavior with distinct states (starting, playing, unavailable). Use only Apple-provided symbols for AirPlay controls. Place the AirPlay icon in the lower-right corner (iOS 16 / iPadOS 16 and later).

### AirPlay icon usage

| Variant | Use when |
|---|---|
| Black icon | White/light background, other technology icons are black |
| White icon | Black/dark background, other technology icons are white |
| Custom color | Other technology icons use that same color |

- Position it consistently with other technology icons; if others sit in shapes, you may do the same.
- Never use the AirPlay icon or name in custom buttons or interactive elements; noninteractive only.
- Name may sit below or beside the icon if other technologies are labeled that way, in your layout font. Never put the icon inside text or use it in place of the word.
- Make AirPlay less prominent than your app name.

### Referring to AirPlay

- Spelling: *AirPlay*, one word, capital A and P. All caps only if layout is all caps.
- Always a noun.

| Correct | Incorrect |
|---|---|
| Use AirPlay to listen on your speaker | AirPlay to your speaker |
| [App Name] is compatible with AirPlay | You can AirPlay with [App Name] |
| You can use AirPlay with [App Name] | AirPlay-enabled speaker |
| Compatible with Apple AirPlay | [App Name] has AirPlay |
| [App Name] now supports AirPlay | |

- Use *works with*, *use*, *supports*, *compatible*. May prefix with *Apple*. Mention AirPlay where it clarifies, and in technical specs.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS. Not supported in watchOS.

---

## Always On

Source: https://developer.apple.com/design/human-interface-guidelines/always-on

Low-power dimmed state that keeps glanceable info visible.

- iPhone 14 Pro / 14 Pro Max: shows Lock Screen items (widgets, Live Activities) when set aside face up.
- Apple Watch: on wrist-down, dims the face and keeps showing your app's UI while it's frontmost or running a background session.
- Both show notifications; a tap exits Always On.

### Best practices

- Redact sensitive data (bank balances, health data), including inside notifications.
- Keep useful personal info glanceable where it helps (workout pace/heart rate; flight arrival; ride arrival). People can disable Always On.
- Keep key content legible; dim secondary text, images, fills (e.g. drop row backgrounds, dim details, keep titles). Replace rich images and big color areas with dimmed colors.
- Keep layout stable on entry/exit. Transition interactive controls to an unavailable look rather than removing them. Update rarely and subtly (sports app: update score only, pause play-by-play). Motion is especially distracting on a face-up iPhone.
- Ease motion into a resting state; never freeze it abruptly.

### Platform notes

- No additional considerations for iOS, watchOS. Not supported in iPadOS, macOS, tvOS, visionOS.

---

## App Clips

Source: https://developer.apple.com/design/human-interface-guidelines/app-clips

Lightweight, instantly available slice of an app or game for an in-the-moment task or a demo. Stays on device for a limited time; privacy-preserving.

Launch points: App Clip Code (best, most recognizable and trusted), NFC tag, QR code; Siri Suggestions (location-based, permitted), Maps, Smart App Banners, App Clip cards in Safari, links in Messages; since iOS 17, links and App Clip previews inside other apps.

Good fits: rent a bike, coffee pre-order, food-truck poster order, pay at a restaurant table, museum AR/audio. Demo fits: game demo (tutorial + first level), free workout + meditation, create and save a document.

### Designing your App Clip

- Let people finish the task, demo, or level inside the clip; never require the full app to complete it.
- Essential features only; leave advanced features to the app.
- Never purely marketing; no ads in App Clips.
- Avoid web views; use native components. If you only have web, link to your website instead.
- Linear, focused UI: no tab bars, complex navigation, or settings; minimal screens and forms.
- On launch go straight to the most relevant part for the context.
- Usable immediately: bundle required assets, no splash screen, no waiting.
- Keep it small (trim code, unused assets; avoid extra downloads).
- Make it shareable (links to specific points; Messages recipients launch inline).
- Easy payment: support Apple Pay for express checkout and no-typing shipping.
- No account required before value. If needed, ask after the task, minimize fields, offer Sign in with Apple.
- When the full app installs it replaces the clip and takes over its invocations. Keep the app familiar; never force re-login after the switch.

### Privacy

- Clips can't run background operations.
- Store minimal data; store it securely and off-device (system may delete the clip and its data between launches).
- Offer Sign in with Apple (keeps credentials off device) and Apple Pay.

### Showcasing the full app

- Clips don't appear on Home Screen and are removed after inactivity. The App Clip card and the system banner shown on first launch both link to the App Store page.
- You may show an `SKOverlay` to download the full app: only at task completion or a natural pause.
- Don't nag: no repeated install prompts, no interrupting tasks, no push notifications to install. Let demos run fully before asking. Communicate the app's extra features clearly.

### Notifications

- Clips can schedule/receive notifications for up to **8 hours** after launch.
- Request extended notification permission only if functionality spans more than a day (e.g. car rental return reminder).
- No promotional notifications; only in response to explicit user action and directly about the task (e.g. delivery updates). None may be needed if the task finishes in the clip.

### App Clips for businesses (platform providers)

- One App Clip may power many business experiences. Put the business's brand front and center; tone down yours.
- Handle multiple businesses/locations: let people switch among recent ones; verify location at launch.

### App Clip card content

- Image clearly shows the clip's purpose. Prefer photography/graphics or a photo of the location; no UI screenshots.
- No text in the header image (not localizable, hard to read).
- Image: **1800x1200 px**, PNG or JPEG, no transparency.
- Title (required) max **30 characters**; subtitle (required) max **56 characters**.
- Action button verb: **View** (media, informational, educational), **Play** (games), **Open** (everything else).

### App Clip Codes

Always Apple-generated designs (App Store Connect or App Clip Code Generator CLI). Choose badge design with App Clip logo, or without logo when space is tight. Default color pairs or custom foreground/background.

Variants:

| Variant | Center glyph | How scanned | Use when |
|---|---|---|---|
| Scan-only | Camera icon | Camera app or Code Scanner in Control Center | Physically inaccessible or digital: posters, print ads, signage behind counters, digital displays, email, social images |
| NFC-integrated | iPhone icon | Hold device near it, NFC Tag Reader in Control Center, or scan with Camera/Code Scanner | Physically reachable: restaurant tabletops, near registers, storefront windows, signage, gift cards, coupons |

Placement and display:

- Include the App Clip logo when clear space allows. Use the no-logo version if clear space can't be met, on disposable paper/plastic items, or on gambling/drinking items (playing cards, poker chips, bar coasters). The logo only appears below the code as part of the badge; never use it alone.
- Flat or cylindrical surfaces only. On cylinders, code width max **1/6 of circumference**.
- Keep it flat; avoid deformable materials (paper, plastic, fabric). On bags or flexible boxes, mount on a rigid card. Stickers must adhere flat.
- Reliable scanning: enough light for scan-only codes; no wide-angle scanning.
- Unobstructed: no overlaid text, logos, images; never animate or dim.
- Upright: don't rotate the code or tilt the center glyph.

Minimum sizes:

| Type | Minimum |
|---|---|
| Printed | 3/4 in (1.9 cm) diameter |
| Digital | 256x256 px, PNG or SVG |
| NFC-integrated | Embedded NFC tag at least 35 mm diameter (or equivalent); e.g. a 35 mm tag needs a printed code at least 1.37 in (3.48 cm) |

- Scan distance to code size ratio max **20:1**, ideally **10:1** (scanned from 40 in / 101 cm needs at least 4 in / 10.16 cm).
- Near a QR code or other scannable, make the App Clip Code at least that item's size.
- Clear space = the gap between the center glyph and the circular code; more when next to other machine-readable codes.

Messaging (calls to action):

- Scan-only: "Scan to [what people can do]." or "Scan using the camera on your iPhone or iPad to [what people can do]."
- NFC-integrated: "Scan to [what people can do]." or "Hold your iPhone near the [object name] to launch an App Clip that [what people can do]."
- Follow Apple trademark guidelines: no Apple trademarks in your app name or images; title case for *App Clips* and *App Clip Code*.

Customizing:

- Never design your own or modify a generated code: no filters, color changes, glows, shadows, gradients, reflections. Scale uniformly (keep aspect ratio, scale stroke widths).
- Three colors: foreground, background, and a generated third. Tools refuse poor-contrast combinations and can suggest a foreground for your background.

### Printing guidelines

- Test printed codes from various angles before distribution.
- Matte, non-textured materials. No gloss, shine, reflective/holographic overlays, thin laminate; laminate only with matte. Outdoors: UV-resistant materials/coatings. Pro printing: flexographic. Desktop: inkjet.
- Rasterize SVG at least **600 ppi**; print at least **300 dpi**. Level/calibrate printer; avoid misaligned channels, wrong gamma, artifacts, elliptical distortion. Receipt printers: print as close to max paper bounds as possible.
- sRGB SVG to CMYK: relative colorimetric (media-relative) intent; "Generic CMYK ICC profile" for CMYK, "Gracol 2013 ICC profile" for CMYKOV; tolerance CIELab Delta E 2.5.
- Grayscale-only printers: generate grayscale codes (color codes printed gray scan worse).
- NFC-integrated: **Type 5 NFC tags**, at least 35 mm.
- Large batches: test runs, print templates showing invocation URL and SVG filename next to each code, keep a URL-to-file mapping, version and track changes.
- Use Apple's calibration test sheets: color-pair sheet for your chosen pair; grayscale-bar sheet (light or missing grays mean calibration needed or unsuitable printer).

### Legal

- Only Apple-provided codes created in App Store Connect or the CLI and following these guidelines are approved; only to indicate an App Clip.
- Remove codes for inactive App Clips.
- Never use the codes, Apple logo, or App Clip mark in your company or product name; no copyright/trademark registration of them; no use that harms Apple or confuses source.
- Don't add symbols to codes. Never translate Apple trademarks (with approval, legal notices/credit lines may be translated outside the U.S.).

### Platform notes

- No additional considerations for iOS, iPadOS. Not supported in macOS, tvOS, visionOS, watchOS.

---

## Apple In-App Purchase

Source: https://developer.apple.com/design/human-interface-guidelines/apple-in-app-purchase

For digital goods and services inside the app (and promoted on the App Store). Apple Pay is for physical goods, real-world services, donations.

| Type | Behavior |
|---|---|
| Consumable | Depletes with use, rebuyable (lives, gems) |
| Non-consumable | Never expires (premium features) |
| Auto-renewable subscription | Renews each period until canceled |
| Non-renewing subscription | Time-limited access, bought again to extend (battle pass) |

Huge, frequently updated multi-creator catalogs, or subscriptions with add-ons: Advanced Commerce API.

### Best practices

- Let people experience the app before purchase; consider limited free access for subscriptions.
- Integrate the store visually with your app (don't feel like a different app).
- Short, non-truncating product names and plain descriptions.
- Always show the total billing price for every purchase.
- Show the store only when payments are possible (`canMakePayments`); otherwise hide it or explain (e.g. parental restrictions).
- Use the system confirmation sheet; never modify or replicate it.

### Family Sharing

- Shareable: auto-renewable subscriptions and non-consumables, with up to **5** additional family members.
- Mention it where people learn about content (e.g. "Family" or "Shareable" in the name; on sign-up screen).
- Explain benefits; Apple may notify existing subscribers (sharing off by default) and family members.
- Word messaging for both purchasers and family members (e.g. "Your family subscription includes…").

### Purchase help and refunds

- Custom help screen may assist, offer alternatives, and start the system refund flow (`beginRefundRequest(for:in:)`).
- Offer help before refund (missing purchases, FAQs, feedback, contact).
- Refund action title: "Refund" or "Request a Refund" (no need to say Apple).
- Identify recent purchases with image, name, description, original purchase date.
- Alternatives allowed (immediate fulfillment, conciliatory item) but always make clear refunds remain available.
- Refund button reachable without scrolling or another screen.
- Never characterize or predict Apple's refund policy; may link to Apple's "Request a refund" page.

### Auto-renewable subscriptions

- Show subscription value during onboarding with a strong call to action and a clear terms summary.
- Offer a range of content, service levels, durations.
- Consider free access before signup: freemium, metered paywall, free trial.
- Prompt at relevant moments (e.g. near the free monthly limit); allow subscribing anytime.
- Never pitch subscribing to current subscribers. If sold in other apps or web, offer sign-in so people don't pay twice.

Making signup effortless:

- Distinct, self-explanatory option names with price and duration. Introductory offers: list intro price, its duration, and standard price after.
- Ask only for necessary info at signup; defer the rest.
- tvOS: sign up/authenticate via another device (send a code).
- Required on the in-app sign-up screen (plus Terms of Service and Privacy Policy links in app and App Store metadata):
  - Subscription name, duration, and content/services each period.
  - Billing amount localized for territory and currency.
  - A way for existing subscribers to sign in or restore purchases.
- Billing totals most prominent; per-period breakdowns subordinate.
- Free trials: state trial length and that payment starts automatically at its end, with the amount.
- Put a sign-up option in app settings.

Offer codes (iOS, iPadOS):

| Type | Created | Redeemed via | Use when |
|---|---|---|---|
| One-time use code | Generated in App Store Connect | Redemption URL, in app (if supported), App Store (prompts install) | Small distribution or restricted access |
| Custom code (e.g. NEWYEAR) | You define | Redemption URL or in app only (not App Store account settings) | Mass campaigns |

- Explain offer details succinctly.
- Custom codes: alphanumeric ASCII only; no special characters (no Chinese or Arabic characters).
- Tell people how to redeem custom codes.
- Support in-app redemption: only custom UI needed is a button (e.g. "Redeem Code" in paywall, onboarding, settings) that opens the system flow (`presentOfferCodeRedeemSheet(from:options:)`, `offerCodeRedemption(options:isPresented:onCompletion:)`).
- Supply a promotional image (else app icon is used).
- Deliver unlocked value right after redemption; welcome new subscribers, including those who subscribe before first app launch; smooth any required sign-in.

Managing subscriptions:

- Show subscription summaries, especially next renewal date, near the manage option (`Product.SubscriptionInfo`).
- Consider system management UI (`showManageSubscriptions(in:)`).
- On cancel attempt you may remind of lost benefits, suggest another plan, or offer a discount; later win-back offers (Retention Messaging API, Win-back offers).
- Always make canceling easy and visible; never bury it.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS.
- **watchOS:** sign-up screen must show the same required info as other platforms.
  - Explain feature differences vs other devices honestly.
  - Consider a modal sheet holding all required items (scrolls; default Close returns to free content). Custom views need a Close or Cancel.
  - Make options easy to compare: one button per option (lock description to button), or a list of options plus one button whose title reflects the selection.

---

## Apple Pay

Source: https://developer.apple.com/design/human-interface-guidelines/apple-pay

For physical goods, services (memberships, hotels, tickets), donations, subscriptions, in apps and any browser. Use In-App Purchase for digital goods. Authorization via Face ID, Touch ID, Optic ID, or Apple Watch double-click; in browsers also via nearby iPhone/Apple Watch or scanning a code with iPhone/iPad.

### Offering Apple Pay

- Offer it on every supporting device and browser; never show it where unsupported (`PKPaymentAuthorizationController`, web `applePayCapabilities`).
- If you use the APIs that detect an active Wallet card, Apple Pay must be the primary (not necessarily only) option everywhere you use them. Never split it into a separate step or flow; pre-selecting it is fine.
- Apple Pay buttons only start payment or, where appropriate, Apple Pay setup. (A device without Apple Pay set up is offered setup on tap.) No other uses.
- Custom button to start Apple Pay: it must NOT show "Apple Pay" or the Apple Pay logo; then show the Apple Pay mark or mention Apple Pay in text on the same page.
- Apple Pay mark = "we accept Apple Pay" only. Never a button or styled as one. When the mark shows Apple Pay as the selected method, a separate custom button may start payment.
- Never hide or disable-look an Apple Pay button. If not yet usable (size/color unselected), explain after tap.
- Websites: list Apple Pay in semantic markup payment options for search engines.
- Required for websites: privacy statement and compliance with Acceptable Use Guidelines for Apple Pay on the web.

### Streamlining checkout

- Cohesive, branded flow; no new pages/windows (on web new windows suggest a handoff to another site).
- Assume people want Apple Pay when available: first option, larger than others, or separated by a line.
- Product detail page buttons for single-item purchase: buy only that item (exclude cart). If it's also in the cart, remove it after purchase.
- Express checkout for multi-item carts: payment sheet immediately, single shipping method and destination.
- Accept coupons/promo codes on the payment sheet (especially express).
- Collect required options (size, color) before the button. If missing, highlight, warn, and auto-navigate to the field.
- Collect optional info (gift messages, delivery instructions) before or after checkout; the sheet can't take it.
- Multiple shipping methods/destinations per item: collect before the sheet (sheet supports one per order).
- In-store pickup: choose location before the sheet; show its address on the sheet (read-only pickup address).
- Prefer Apple Pay's contact/shipping/payment data as current and complete.
- No account required before purchase; offer registration on the confirmation page, prefilled.
- Report transaction results in the sheet; errors (e.g. bad address) with actionable messages.
- Show an order confirmation / thank-you page with shipping timing and status tracking. If listing Apple Pay, put it after the last four digits or as a note: "1234 (Apple Pay)" or "Paid with Apple Pay."

### Customizing the payment sheet

- Only essential information (e.g. email but no shipping address for an e-gift card).
- Show the active coupon/promo code; allow entering one on the sheet.
- Shipping methods: clear description, cost, optional delivery/pickup date or range; use calendar and time-zone support (`PKDateComponentsRange`).
- In-store pickup: may offer pickup windows via shipping methods.
- Line items (label + cost; recurring items add frequency) explain extra charges, discounts, pending costs, add-on donations, recurring and future payments. Never list individual products (`paymentSummaryItems`).
- Keep line items short, ideally one line.
- Total line: "Pay [Business_Name]" using the exact name on bank statements.
- Intermediaries/marketplaces: "Pay [End_Merchant_Business_Name] (via [Your_Business_Name])".
- Possible later charges (distance-based rides, tips): explain on the sheet, show subtotal as **Amount Pending** where regulations allow; preauthorized amounts must be accurate.
- Handle errors gracefully; defer to the sheet's own progress UI (no extra spinners).

### Website icon

Used during payment authorization (notably Handoff) and in Wallet for subscriptions.

| @2x | @3x |
|---|---|
| 60x60 pt (120x120 px) | 60x60 pt (180x180 px) |

### Handling problems

- Validate when the sheet appears, when fields change, and after authentication. System highlights invalid fields; supply custom detail messages (`PKPaymentAuthorizationViewControllerDelegate`).
- Before authorization you only get card type and a redacted shipping address; validate what you can early and always show errors when authorization fails.
- Don't force your business logic: ignore irrelevant data, infer missing (accept Zip+4 by ignoring extra digits; accept phone numbers with/without dashes and country code).
- Report correct status codes and custom messages (`PKPaymentError`, Apple Pay Status Codes on web).
- Error messages: name the field and expected value ("Zip code doesn't match city", "Shipping not available for this state", not "Address is invalid"). Noun phrases, sentence case, no ending punctuation, max **128 characters**.
- Interruptions (cancel, timeout) dismiss the sheet: cancel in-progress payment; people restart via the button (`oncancel` on web).

### Subscriptions (recurring payments)

- Fixed (monthly) or, where allowed, variable (weekly grocery) amounts; initial authorization may include discounts and fees.
- Clarify billing frequency and terms before the sheet; frequency can show on the sheet.
- Line items restate frequency, discounts, upfront fees; if nothing charged now, say when billing occurs.
- Trials: line items show trial amount (including $0), regular amount after, and regular billing start date.
- Total line = amount billed now.
- Show the sheet for subscription changes only when fees increase (not for same or lower cost).
- Billing agreement field: plain-language summary only, concise, no duplication; leave blank when in doubt.

### Donations (approved nonprofits)

- Line item identifies the donation (e.g. "Donation $50.00").
- Predefined amounts ($25, $50, $100) plus "Other Amount".

### Apple Pay buttons

Always create buttons with Apple APIs: `PKPaymentButtonType` and `PKPaymentButtonStyle` (iOS, macOS), `WKInterfacePaymentButton` (watchOS), Apple Pay on the Web. Benefits: approved captions, fonts, colors, styles; proportional scaling; automatic localization; adjustable corner radius; built-in VoiceOver labels. Never design custom Apple Pay buttons or replicate them. Some contexts show the default card image on the button automatically.

Button types (choose to match your flow's wording):

| Type | Use for |
|---|---|
| Buy with Apple Pay | Purchase areas: product detail, cart |
| Pay with Apple Pay | Bills and invoices (utilities, plumbing, car repair) |
| Check Out with Apple Pay | Carts where other buttons start with "Check Out" |
| Continue with Apple Pay | Carts where other buttons start with "Continue" |
| Book with Apple Pay | Booking flights, trips, experiences |
| Donate with Apple Pay | Approved nonprofits' donations |
| Subscribe with Apple Pay | Subscriptions (gym, meal kits) |
| Reload with Apple Pay | Adding money where the term is "Reload" (transit, prepaid) |
| Add Money with Apple Pay | Adding money where the term is "Add Money" |
| Top Up with Apple Pay | Adding money where the term is "Top Up" |
| Order with Apple Pay | Ordering meals, flowers |
| Rent with Apple Pay | Renting cars, scooters |
| Support with Apple Pay | Giving to projects/causes where the term is "Support" |
| Contribute with Apple Pay | Giving where the term is "Contribute" |
| Tip with Apple Pay | Tipping for goods/services |
| Apple Pay (plain, logo only) | Stylistic need for smaller min width or no call to action; also the system fallback for unsupported types on older OS versions |
| Set Up Apple Pay | Device supports Apple Pay but not set up; place in Settings, profile, or an interstitial |

Styles:

| Style | Use on | Never on |
|---|---|---|
| Automatic (`PKPaymentButtonStyle.automatic`, web `ApplePayButtonStyle`) | Let system appearance decide | |
| Black | White/light backgrounds with sufficient contrast | Black or dark backgrounds |
| White with outline | White/light backgrounds lacking contrast | Dark or saturated backgrounds |
| White | Dark backgrounds with sufficient contrast | |

Size and position:

- Never smaller than other payment buttons; visible without scrolling.
- Side by side with Add to Cart: Apple Pay to the **right**. Stacked: Apple Pay **above** Add to Cart.
- Corner radius adjustable (square to capsule) to match your buttons (`cornerRadius`).
- Respect minimum size and margins; localized titles vary in length. If your size can't fit the localized title, the system substitutes the plain Apple Pay button (no substitution exists for Set Up Apple Pay).

| Button | Min width | Min height | Min margins |
|---|---|---|---|
| Apple Pay (plain) | 100 pt (100 px @1x, 200 px @2x) | 30 pt (30 px @1x, 60 px @2x) | 1/10 of button height |
| Book, Buy, Check Out, Donate, Set Up, Subscribe with Apple Pay (and other titled types) | 140 pt (140 px @1x, 280 px @2x) | 30 pt (30 px @1x, 60 px @2x) | 1/10 of button height |

### Apple Pay mark

- Shows Apple Pay as an available option among other payment options; not a button.
- Apple artwork only. Only height may change, and it must be at least as tall as other payment brand marks. Never change width, corner radius, aspect ratio; no trademark symbol or added content; keep the border; no shadows, glows, reflections; never flip, rotate, animate.
- Clear space at least **1/10 of its height**; never share a border with another graphic or button.
- Download from Apple Pay Marketing Guidelines.

### Referring to Apple Pay

- Exactly *Apple Pay*: two words, capital A and P, never plural or possessive. All caps only to match an established all-caps typographic style.
- Never use the Apple logo for "Apple".
- U.S.: ® on the first body-text mention; no ® when Apple Pay is a checkout selection option.

| Correct | Incorrect |
|---|---|
| Purchase with Apple Pay | Purchase with ApplePay |
| Purchase with Apple Pay® (first US body mention) | Purchase with [Apple logo] Pay |
| | Purchase with APPLE PAY (outside an all-caps style) |

- Match your app/site font face and size; don't mimic Apple typography.
- Never translate *Apple Pay*.
- Text-only Apple Pay in a payment selector only if all options are text-only; if any option shows a logo, use the Apple Pay mark.
- Promotion inside apps follows App Store marketing guidelines.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, visionOS, watchOS. Not supported in tvOS.

---

## Augmented reality

Source: https://developer.apple.com/design/human-interface-guidelines/augmented-reality

ARKit on iOS/iPadOS (visionOS uses ARKit for surfaces, hand positions, immersive interactions).

- Offer AR only on capable devices. AR-primary apps: restrict to ARKit devices. Optional AR features: simply hide them on unsupported devices; never show an error.

### Best practices

- Use the whole display for camera view and virtual content; avoid clutter.
- Convincing realism: detailed lifelike 3D assets, correct scale, placed on detected surfaces, matching environment lighting and camera grain, top-down diffuse shadows, updates with camera movement. Render at **60 fps** to avoid jumps/flicker.
- Prefer small or coarse reflective surfaces (ARKit reflections are approximations).
- Use audio and haptics to confirm contact and immerse.
- Minimize text in the environment.
- Put extra info/controls in screen space (fixed location). Persistent controls: indirect 2D controls in screen space, reachable without regripping, optionally translucent (like Measure).
- Expect varied environments (little space, no large flat surfaces); state requirements up front; consider feature sets per environment.
- Comfort: avoid long holds at awkward distances/angles; place objects to minimize moving closer; short game levels with breaks.
- Introduce movement gradually.
- Safety: avoid encouraging rapid, sweeping, large, or sudden motions.

### Coaching

- Use the system coaching view (`ARCoachingOverlayView`) for initialization and relocalization.
- Hide unrelated UI while coaching shows (it appears automatically).
- Custom coaching allowed; use the system view as reference.

### Placing objects

- Show when to find a surface and when placement is possible; align a custom indicator with the detected plane.
- Place immediately with current data; refine subtly as detection improves; nudge objects placed beyond surface bounds back on (`ARTrackedRaycast`).
- Guide to offscreen objects with visual/audio cues (e.g. edge indicator).
- Don't align precisely to surface edges (boundaries are approximate and change).
- Use plane classification (furniture only on "floor"; game board requires "table").

### Object interactions

- Prefer direct manipulation; indirect screen-space controls better when people move around.
- Standard gestures: one-finger drag to move, two-finger rotate to spin.
- Keep interactions simple; respond to gestures near (not exactly on) small/thin/distant objects.
- Allow scaling only when it makes sense (imaginary worlds yes; furniture shopping no). Never use scaling to fake distance.
- Test similar gestures for conflicts (pinch vs rotate).
- Movement follows your environment's physics; keep objects attached to surfaces; no jumping or vanishing while resizing, rotating, moving.
- Consider motion and proximity as inputs (a character turns to look at an approaching person).

### Multiuser

- Each participant maps independently; ARKit merges maps (`isCollaborationEnabled`).
- Support people occlusion where relevant.
- Allow late joiners via implicit map merging unless all must join first.

### Reacting to real-world objects

- Provide 2D reference images or 3D reference objects; ARKit reports detections.
- When a detected image disappears, wait up to **1 second** before fading attached content (no position tracking for detected images).
- Keep active reference images at **100 or fewer**; swap sets by context (e.g. museum area via location).
- Limit images needing accurate position (tracked images cost more); use tracked images when the image can move or attached content is small relative to it.

### Communicating

- Avoid jargon (ARKit, world detection, tracking).

| Do | Don't |
|---|---|
| Unable to find a surface. Try moving to the side or repositioning your phone. | Unable to find a plane. Adjust tracking. |
| Tap a location to place the [object]. | Tap a plane to anchor an object. |
| Try turning on more lights and moving around. | Insufficient features. |
| Try moving your phone more slowly. | Excessive motion detected. |

- Prefer 3D hints (rotation indicator around object) over 2D text overlays, unless contextual hints fail.
- Critical text in screen space. Text in 3D must face the person and keep the same size regardless of distance.
- Provide a visual "tap for more info" indicator if needed.

### Interruptions

- Tracking stops during interruptions (app switch, call); objects may misplace. Support relocalization.
- Use the coaching view to guide people back to the prior position/orientation.
- Consider hiding objects during relocalization, then reshowing.
- Embed non-AR tasks within AR to avoid exits (change upholstery without leaving AR).
- Allow canceling relocalization (it can run forever); offer reset/restart.
- Front camera: indicate loss of face tracking after about **0.5 seconds**; minimal text.

### Problem resolution

- Always allow reset.

| Problem | Suggestion |
|---|---|
| Insufficient features | Try turning on more lights and moving around. |
| Excessive motion | Try moving your phone slower. |
| Surface detection too slow | Try moving around, turning on more lights, and pointing at a sufficiently textured surface. |

### AR icon and badges

- AR glyph: only in controls that launch ARKit experiences. Only size and color may change; not for non-ARKit AR. Clear space at least **10% of glyph height**.
- AR badges (collapsed and expanded): only to mark items viewable in ARKit AR; never alter, recolor, or repurpose. Prefer the full AR badge; glyph-only badge for tight spaces. Both work at default size.
- Badge only when the collection mixes AR and non-AR items (redundant if all are AR).
- Same corner every time, large enough to see, not hiding detail. Clear space at least **10% of badge height**.

### Platform notes

- No additional considerations for iOS, iPadOS. Not supported in macOS, tvOS, watchOS.
- **visionOS:** ARKit enables surface detection, hand/finger positions for custom gestures, and physical-object interactions in immersive experiences.

---

## CareKit

Source: https://developer.apple.com/design/human-interface-guidelines/carekit

Apps for care plans (chronic illness, recovery, wellness). CareKit 2.0 = CareKit UI (prebuilt views) + CareKit Store (on-device database of patients, care plans, tasks, contacts), synchronized automatically.

### Data and privacy

- Required: privacy policy URL at App Store submission.
- Get permission before accessing data from device features; protect all data, entered or system-sourced.
- HealthKit: request access only when needed in context (weight when logging weight, not at launch); re-request each time since permissions change (`requestAuthorization(toShare:read:completion:)`). Add succinct purpose text to the standard permission screen; never replicate it with custom screens. Manage sharing only via Settings > Privacy; no in-app screens altering health data flow.
- Motion data (Core Motion), with permission: stationary/walking/running/cycling/driving, steps, pace, flights climbed; custom physical therapy data.
- Photos/camera (`UIImagePickerController`), with permission, e.g. periodic injury photos for physicians.
- ResearchKit integration: surveys, tasks, charts, informed consent module.

### CareKit views

| Category | Purpose |
|---|---|
| Tasks | Prescribed actions (medication, physical therapy); log symptoms and data |
| Charts | Graphs of treatment progress |
| Contact views | Contact info; phone, message, email; map link |

Views have a header (text, symbol, disclosure indicator, optional bottom separator) and a vertical content stack; CareKit UI manages constraints. Use each type for its intended purpose.

Task data:

| Field | Required | Example |
|---|---|---|
| Title | Yes | Ibuprofen |
| Schedule | Yes | Four times a day |
| Instructions | No | Take 1 tablet every 4 to 6 hours (max 4 daily) |
| Group ID | No | medication, exercise |

Five task styles:

- **Simple:** one-step; header with title, subtitle, button; optional custom completion image, else filled button with checkmark. No content stack.
- **Instructions:** simple plus informative text ("Take on an empty stomach").
- **Log:** button to log events (e.g. nausea), auto timestamps.
- **Checklist:** multistep list, each item with description and done button; optional instructions below.
- **Grid:** multistep compact button grid with succinct titles; optional instructions; exposes its collection view for custom UI.

Task guidance:

- Use color to reinforce meaning (medications vs activities), never as the only signal.
- Accurate yet simple wording: marketing drug names, not chemical; drop redundant words like "take".
- Add videos/images for complex tasks.

Charts (bar, scatter, line; title, subtitle, axis markers, data):

- Highlight narratives and trends (doses vs pain).
- Short labels; don't repeat units per point (BPM on axis).
- Distinct, high-contrast colors; avoid shades of one color for different meanings.
- Legend if colors aren't obvious.
- Always denote time units.
- Consolidate large data sets; offset or restructure to keep small values readable.

Contact views (simple, detailed): consider color-coding care team members.

### Notifications

- Minimize; coalesce items into one notification when possible.
- Offer a detail view for acting in place (mark pending tasks complete).

### Symbols and branding

- Prefer CareKit symbols (phone, messaging, envelope, clock); grid style suits custom symbols. Use SF Symbols for custom ones (e.g. pill, person walking).
- Custom symbols must relate to your app or health/wellness; no decorative or corporate-logo symbols.
- Branding refined and unobtrusive (color, voice); no advertising.

### Platform notes

- No additional considerations for iOS, iPadOS. Not supported in macOS, tvOS, visionOS, watchOS.

---

## CarPlay

Source: https://developer.apple.com/design/human-interface-guidelines/carplay

Apps run on iPhone and show on the car display through system templates (audio, communication, navigation, etc.). The system renders UI and handles resolutions and inputs (touchscreens, knobs, touch pads). Designed for use while driving: fast, minimal interaction. CarPlay audio and video apps also work on Apple HomeView without changes.

### iPhone interactions

- No app interaction on iPhone while CarPlay is active; do setup on iPhone before driving.
- Never lock people out because iPhone needs input (it may be in a bag or trunk); resolve after the vehicle stops.
- Work fully while iPhone is locked.

### Audio

- Don't autoplay unless the app plays a single audio source or is resuming interrupted audio. Don't start an audio session until ready to play (it silences the car radio).
- Start playback as soon as sufficiently buffered; the system shows the selection highlighted with a spinner until you signal ready.
- Show Now Playing as soon as audio is ready; load metadata in the background.
- Resume after temporary interruptions (phone calls) if audio was playing; don't resume after permanent ones (Siri-started playlist).
- You may adjust relative mix levels; never change overall output volume.

### Layout

| Dimensions (px) | Aspect ratio |
|---|---|
| 800x480 | 5:3 |
| 960x540 | 16:9 |
| 1280x720 | 16:9 |
| 1920x720 | 8:3 |

- System scales UI to look roughly the same size everywhere.
- High-value info, clean and scannable from the driver's seat; no nonessential details or embellishments.
- Consistent appearance; similar functions look similar.
- Primary content large and actionable; most important items in the upper half.

### Color

- Limited palette coordinated with your logo.
- Never the same color for interactive and noninteractive elements.
- Test in a real car across lighting (time of day, weather, tint, night glare, sunlight washout).
- Support light and dark appearances (may switch automatically with lighting).
- Inclusive color choices.

### Icons and images

- Landscape and portrait displays; @2x (low res) and @3x (high res). Supply both for all artwork.
- Mirror your iPhone icon; no second design needed.
- No black icon backgrounds; lighten or add a border.

| @2x | @3x |
|---|---|
| 120x120 px | 180x180 px |

### Errors

- Report only when absolutely necessary, in CarPlay. Never tell people to pick up iPhone to read or fix an error.

### Platform notes

- No additional considerations for iOS. Not supported in iPadOS, macOS, tvOS, visionOS, watchOS.

---

## Game Center

Source: https://developer.apple.com/design/human-interface-guidelines/game-center

Apple's social gaming network (GameKit). Players discover friends' games, invite friends, and see activity in the Apple Games app, App Store, notifications. Boosts discovery (Top Played chart, friend recommendations).

### Access

- At launch, check sign-in; if not signed in, initialize Game Center then.
- **Access point:** Apple-designed element opening Game Overlay (iOS, iPadOS, macOS) or the full-screen in-game dashboard (visionOS, tvOS).
  - Show in menu screens (main menu, settings). Never during gameplay, splash screens, cinematics, or pre-menu tutorials.
  - Fixed at one of four corners; account for collapsed and expanded sizes; keep controls clear. visionOS locations vary by game type (immersive, volume).
  - Consider pausing while Overlay/dashboard shows.
- Custom UI may deep-link to Overlay/dashboard areas (leaderboards, profile). Use official Apple Design Resources artwork unaltered.

Terminology:

| Use | Never | Localization |
|---|---|---|
| Game Center | GameKit, GameCenter, game center | System translation of Game Center |
| Game Center Profile | Profile, Account, Player Info | System translation of Game Center; localize Profile |
| Achievements | Awards, Trophies, Medals | |
| Leaderboards | Rankings, Scores, Leaders | |
| Challenges | Competitions | |
| Add Friends | Add, Add Profiles, Include Friends | |

### Achievements

- Map to four states: locked, in-progress, hidden, completed. System groups into Completed and Locked.
- Upload order = display order (e.g. common progression path).
- Title and description max **2 lines** each (else truncated). Title-style caps for title, sentence-style for description.
- Progressive achievements get system encouragement messages.
- Rich, unique art per achievement (placeholder if missing). Circular mask; keep content centered.

| Achievement image | iOS, iPadOS, macOS, visionOS | tvOS |
|---|---|---|
| Format | PNG, TIF, JPG | PNG, TIF, JPG |
| Color space | sRGB or P3 | sRGB or P3 |
| Resolution | 72 DPI min | 72 DPI min |
| Image size | 512x512 pt (1024x1024 px @2x) | 320x320 pt (640x640 px @2x) |
| Mask diameter | 512 pt (1024 px @2x) | 200 pt (400 px @2x) |

### Leaderboards

- Types: **classic** (all-time best, never ends; perfect rhythm score, most coins in a run, longest endless run) and **recurring** (resets on your interval; daily puzzles, seasonal events, weekly mode boards).
- Group with leaderboard sets (difficulty, activity type, genre/theme).
- Unique image per leaderboard. iOS/iPadOS/macOS: single image. tvOS: layered images animating on focus (tvOS template).

| Leaderboard image | iOS, iPadOS, macOS | tvOS |
|---|---|---|
| Format | JPEG, JPG, PNG | PNG, TIF, JPG |
| Color space | sRGB or P3 | sRGB or P3 |
| Resolution | 72 DPI min | 72 DPI min |
| Image size | 512x512 pt (1024x1024 px @2x) | 659x371 pt (1318x742 px @2x) |
| Cropped area / focused | Cropped 512x312 pt (1024x624 px @2x) | Focused 618x348 pt (1236x696 px @2x); unfocused 548x309 pt (1096x618 px @2x) |

- System crops set artwork (iOS/iPadOS/macOS) and focus effects crop layer edges (tvOS): keep primary content safely inside.

### Challenges

- Built on leaderboards; time-limited competitions with friends.
- Short skill-based activities, **1 to 5 minutes**, playable solo (fastest lap, most enemies in a round, fewest mistakes on daily puzzle).
- Track most recent score per attempt, not overall progress or personal best (fairness).
- Deep-link to the exact mode/level; run required onboarding/tutorial first and say the challenge follows. Entry via invite links, Game Overlay, Games app (iOS, iPadOS, macOS).
- Art appears in Overlay, Games app, invite previews; keep primary content away from title/description overlay; localize any text via App Store Connect or Xcode.

### Multiplayer

- Real-time and turn-based; entry via party codes, Overlay, dashboard, Games app.
- Party codes (usually 8 alphanumeric characters, e.g. "2MP4-9CMF"): allow late join, early leave, return; show current code in game; allow manual entry.
- Support in-game multiplayer UI (default invites nearby/recent players, friends, contacts) or custom UI.

| Challenge and multiplayer activity art | Value |
|---|---|
| Format | JPEG, JPG, PNG |
| Color space | sRGB or P3 |
| Resolution | 72 DPI min |
| Image size | 1920x1080 pt (3840x2160 px @2x) |
| Cropped area | 1465x767 pt (2930x1534 px @2x) |

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, visionOS.
- **tvOS:** optional dashboard top image: simple, readable at distance; logo or wordmark OK; never the app icon. 600x180 pt (1200x360 px @2x), PNG/TIF/JPG, sRGB or P3, 72 DPI min.
- **watchOS:** GameKit APIs work, but no system Game Center UI; content appears on the paired iPhone.

---

## Generative AI

Source: https://developer.apple.com/design/human-interface-guidelines/generative-ai

### Best practices

- Design responsibly: outputs vary even for identical inputs and requests are unpredictable; prioritize inclusion, care, privacy.
- Keep people in control: honor in-scope clear requests, handle sensitive content carefully, let people dismiss, revert, retry. Clearly identify where AI is used.
- Inclusive: models favor common data and can stereotype. Ask for needed personal attributes instead of inferring them (gender identity, relationship types, culture). Test with diverse people.
- Use generative features only where they add clear value (time savings, communication, creativity).
- Provide a good experience when AI is unavailable or declined; offer a non-AI fallback when possible (Genmoji vs regular emoji; notification summaries vs reading notifications).

### Transparency

- Disclose where AI is used; never pass off AI as human. Follow regional disclosure regulations.
- Set expectations: brief tutorial, curated starter suggestions for open prompts, state known limitations and how to get good results, explain poor results.

### Privacy

- Choose model type deliberately: on-device (private, fast, offline) vs server (more power/context). For server use, process locally first, minimize data sent, tell people what's sent, stored off-device, or used for training.
- Ask permission before using personal info and usage data; use the minimum; always offer opt-out. Explicit permission for sensitive data used for improvement or storage. Vet third parties. Outputs can leak sensitive data. Kids' apps have stricter rules.
- Explain clearly how data is used and stored, and whether it trains the model.

### Models and datasets

- Evaluate capabilities hands-on early. Availability can depend on device, network, battery (Foundation Models framework needs a compatible device with Apple Intelligence on).
- Choose datasets intentionally: diverse, known provenance, licensed, tested for bias and misinformation.

### Inputs

- Guide input with diverse predefined examples.
- Reduce hallucinations: state that AI content may contain errors; scope requests narrowly; avoid factual requests without verified up-to-date data; never use AI output where a hallucination could harm.
- Get confirmation before significant actions; never automate destructive (deleting photos) or hard-to-undo (purchases) actions. Follow model usage policies and local AI regulations.

### Outputs

- Offer Edit, Undo, Retry, Adjust near results; acknowledge when corrections take effect.
- When blocked, coach toward success (Image Playground: "Unable to use that description"); suggest better example requests.
- Test for misuse and harm: out-of-scope, vague, ambiguous, sensitive, controversial, harmful prompts.
- Avoid copyrighted replication: build on protected models, curate inputs (pre-approved prompts), instruct against mimicking styles.
- Design for latency: loading states or background generation.
- Specific progress messages ("Finding substitutions for ingredients", not "Processing…"); plain-language errors with a next step.
- Consider offering multiple distinct results to choose from (Image Playground).

### Continuous improvement

- Update models over time (blocked-word lists anytime; major changes with releases); retest, re-prompt-engineer, fine-tune on base model upgrades.
- Voluntary, unobtrusive feedback (thumbs up/down, optional detailed report); act on it quickly.
- Decouple model from UX so models can be swapped.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS, watchOS.

---

## HealthKit

Source: https://developer.apple.com/design/human-interface-guidelines/healthkit

Central repository for health and fitness data in iOS, iPadOS, watchOS.

- Required: if your app has no health/fitness functionality, never request health data.

### Privacy

- Required: privacy policy URL at App Store submission.
- Request access in context, only when needed; request each time (people change permissions) (`requestAuthorization(toShare:read:completion:)`).
- Add short purpose sentences to the system permission screen; no custom screens replicating it.
- Data sharing managed only in Settings > Privacy; no in-app controls over health data flow.

### Activity rings (`HKActivityRingView`)

- Only for Move, Exercise, Stand. Never replicate rings for other data or show these metrics in other ring-like elements.
- One person only, clearly identified (label, photo, avatar).
- Not ornamental: never in labels or backgrounds.
- Not branding: never in app icons or marketing.
- Never alter rings or their background (no filters, color, opacity changes); blend surroundings to them (e.g. enclosing circle); scale appropriately.
- Outer margin at least the distance between rings; nothing may crop or encroach. For a circle, adjust the enclosing view's corner radius, don't mask.
- Separate other ring elements with padding, lines, labels, color, scale.
- Notifications: app-specific info only; never repeat system Activity updates; never show rings in notifications.

### Apple Health icon

- Apple-provided icon only (Apple Design Resources); never create or mimic.
- Display the name *Apple Health* near the icon.
- No smaller than other health app icons in the same view.
- Never a button; only indicates compatibility.
- Never alter: no masking, corner radius changes, circular shapes, borders, overlays, gradients, shadows, effects.
- Clear space at least **1/10 of its height**; never composite onto other graphics.
- Never in text or replacing *Health*, *Apple Health*, *HealthKit*.
- Never show Health app images or screenshots (copyrighted). Marketing badge: "Works with Apple Health".

### Editorial

- Call it *Apple Health* or *the Apple Health app*.
- Never say *HealthKit* to users; say "works with the Apple Health app" or "uses data from the Apple Health app".
- *Apple Health*: two words, capital A and H; all caps only in an all-caps UI.
- Use the system's localized name for Health.

### Platform notes

- No additional considerations for iOS, iPadOS, watchOS. Not supported in macOS, tvOS, visionOS.

---

## HomeKit

Source: https://developer.apple.com/design/human-interface-guidelines/homekit

Secure control of home accessories via Siri and the Home app (iPhone, iPad, Apple Watch, Mac). iOS, tvOS, watchOS apps can integrate for setup, naming, organizing, configuration, custom features, automations, support. MFi licensees: MFi portal for packaging messaging.

### Terminology and object model

Use HomeKit's terms and hierarchy (home is the root; multiple homes = multiple hierarchies).

| Term | Meaning | UI wording |
|---|---|---|
| Home | Physical home, office, or place; people can have several | home |
| Room | Named room (no size/location), e.g. Bedroom | room |
| Accessory | Physical device (fan, lamp, lock, camera) | accessory |
| Category | Accessory type (thermostat, fan, light); switches take the category of what they control | category |
| Service | Controllable feature (light switch; garage light vs door) | Never "service"; use descriptive names (garage door opener, ceiling fan light). Siri uses service names. |
| Characteristic | Controllable attribute (speed, brightness) | Never "characteristic"; use attribute names |
| Service group | Services controlled together (reading lamps) | |
| Action | Change to a characteristic | |
| Scene | Group of actions (Movie Time, Good Morning). API calls it "action set" | Always "scene" |
| Automation | Reaction to location, time, accessory state, sensor | |
| Zone | Multi-room area (upstairs, downstairs), optional | |

- Reflect the hierarchy even if your UI isn't room-based; people need locations for Siri commands.
- Surface an accessory's room/zone/home in its detail view, not buried in settings.
- Recognize multiple homes; show home info in detail views.
- Never duplicate home settings or make people re-set up their home; defer to Home app settings.

### Setup

- Use the system setup flow (`performAccessorySetup(using:completionHandler:)`): naming, network join, pairing, room and category assignment, favorites.
- Purpose string example: "Lets you control this accessory with the Apple Home app and Siri across your Apple devices."
- No account or personal info required; defer to HomeKit. Optional cloud accounts only after HomeKit setup.
- Honor HomeKit choice; don't force setup of other platforms in the flow.
- Custom setup only after the system flow and basic functionality, highlighting unique features.

Naming:

- Suggest Siri-friendly service names; never company names or model numbers.
- Validate renames against rules, explain problems, suggest alternatives:
  - Only alphanumeric, space, apostrophe.
  - Start and end with a letter or number.
  - No emoji.

| Valid | Invalid |
|---|---|
| Reading lamp | 📚 lamp |
| 2nd garage door | #2 garage door |

- Discourage location words in service names ("kitchen light"); assign the room/zone instead.

### Siri

- After setup, show example Siri phrases using the chosen service name; later teach advanced phrases (e.g. in a scene detail: "Hey Siri, set 'Movie Time.'").
- Siri resolves homes, rooms, zones, services, service groups, scenes, categories, and characteristics (e.g. "brighter", "dim" imply brightness).

| Phrase | Siri resolves |
|---|---|
| Turn on the floor lamp | Service |
| Show me the entryway camera | Service |
| Turn on the light | Category |
| Turn off the living room light | Room + category |
| Make the living room a little bit brighter | Room + implied category + brightness |
| Turn on the recessed lights | Service group |
| Turn off the lights upstairs | Category + zone |
| Dim the lights in the bedroom and nursery | Category + brightness + rooms |
| Run Good night | Scene |
| Is someone in the living room? | Implied category + occupancy |
| Is my security system tripped? | Category |
| Did I leave the garage door open? | Category + open characteristic |
| Did I forget to turn off the lights in the Tahoe House? | Category + home |
| It's dark in here | Current home + current room (via HomePod) + implied category |

- Suggest zones/service groups where useful ("upstairs", "media center").
- Shortcuts only for functionality HomeKit lacks (e.g. "Order AC filters"); never for scenes/actions HomeKit supports. Explain the difference between HomeKit voice control and shortcuts.

### Custom functionality

- Be clear what your app does vs the Home app (e.g. create a scene with your lights, then suggest adding shades and TV in Home).
- Defer to the HomeKit database; reflect external changes automatically; present conflicts visually (old vs new name side by side).
- Get permission before writing to HomeKit; never overwrite without explicit direction.
- Cameras: never cover the image (alerts can supplement); show a mic button only if bidirectional audio is supported.

### Icons

- HomeKit icon for setup/instructional communications. Apple Home app icon to reference the app or in a button opening its App Store page.
- Apple-provided icons only.
- Styles: black (light backgrounds, other icons black), white (dark backgrounds, other icons white), custom color (matching other technology icons).
- Position consistently with other technology icons (same shapes if they use shapes).
- HomeKit icon/name noninteractive only; never in buttons.
- Never in text or replacing the word; name below/beside icon in your layout font if others do the same.

### Referring to HomeKit

- Make HomeKit/Apple Home less prominent than your app.
- Trademarks: none in your app name/images; exact names; singular, never possessive; never translate Apple, Apple Home, HomeKit; no category descriptors (say iPad, not tablet); no implied sponsorship/endorsement; credit lines where legal info appears; refer to devices/OS only in specs or compatibility.

| Correct | Incorrect |
|---|---|
| Use HomeKit to turn on your lights from your iPhone or iPad. | Use HomeKit to turn on your lights from your iOS devices. |
| [Brand] lightbulbs work with HomeKit. | HomeKit-enabled thermostat. |
| You can use HomeKit with [App Name]. | HomeKit lightbulbs. |
| Back door is unlocked with HomeKit. | HomeKit unlocked the back door. |
| Compatible with Apple HomeKit. | |
| Open HomeKit settings. | |
| Open the Apple Home app. Your accessory and room will now appear in the Home app. | Open Home. |

- *HomeKit*: one word, capital H and K. *Apple Home*: two words, capital A and H. All caps only in all-caps layouts.
- Never use HomeKit as a descriptor or as the actor.
- First body mention: *Apple Home*; later: *the Home app*.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS, watchOS.

---

## iCloud

Source: https://developer.apple.com/design/human-interface-guidelines/icloud

Transparent access to latest content on all devices; people shouldn't think about where data lives.

- Work with iCloud automatically when it's on. If offering a choice, ask once at first launch: iCloud for all data or none.
- Don't ask which documents to store; automate file management.
- Keep content current, balancing storage/bandwidth. Very large documents: let people control downloads, indicate newer versions exist; show subtle feedback if a download exceeds a few seconds.
- Respect paid storage: store user-created content, not regenerable resources. Backups include every app's Documents folder; be selective.
- When iCloud is off or in Airplane Mode, don't alert; optionally note unobtrusively that changes won't sync until access returns.
- Store app state and settings in iCloud (e.g. last page read), but only settings people want on all devices.
- Warn and confirm before deletion: it removes the document from iCloud and all devices.
- Resolve conflicts automatically when possible; otherwise unobtrusive notice to compare and choose, as early as possible.
- Include iCloud content in search.
- Games: save progress via the GameSave framework (sync plus built-in alerts for offline/conflict) or custom UI on GameSave data.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS, watchOS.

---

## ID Verifier

Source: https://developer.apple.com/design/human-interface-guidelines/id-verifier

iOS 17+: iPhone reads ISO 18013-5 compliant mobile IDs in person, no extra hardware (e.g. venue age checks). Customers share minimum data without handing over ID or device; Apple handles certificate issuance, management, validation.

| Request | Behavior | API |
|---|---|---|
| Display Only | Shows data (name, age, portrait) in system UI on the verifier's iPhone; data never reaches your app | `MobileDriversLicenseDisplayRequest` |
| Data Transfer | Only with a legal requirement to store/process data (address, birth date); needs an extra entitlement | `MobileDriversLicenseDataRequest`, `MobileDriversLicenseRawDataRequest` |

### Best practices

- Request only needed data; for minimum age use an age threshold (`ageAtLeast(_:)`), never current age or birth date.
- If eligible, register with Apple Business Register so the system shows your official name and logo.
- Start with a button labeled **Verify Age** (simple age check, e.g. venue entry) or **Verify Identity** (detailed match, e.g. rental car name and birth date). No symbols implying NFC or QR. Never the Apple logo in the label.
- Display Only: give the operator feedback buttons such as **Matches Person** and **Doesn't Match Person** to return approve/reject.

### Platform notes

- No additional considerations for iOS. Not supported in iPadOS, macOS, tvOS, visionOS, watchOS.

---

## iMessage apps and stickers

Source: https://developer.apple.com/design/human-interface-guidelines/imessage-apps-and-stickers

Available in Messages conversations and effects in Messages and FaceTime; standalone or as an extension of an iOS/iPadOS app.

### Best practices

- One primary experience per iMessage app; separate apps for different functions or collections.
- Surface shareable app content (shopping list, itinerary) or simple collaboration (where to eat, which movie).
- Most-used features in the compact view (below transcript); extras in expanded view.
- Text editing generally only in the expanded view (compact is roughly keyboard-sized).
- Stickers: expressive, inclusive, versatile; legible on many backgrounds and when rotated/scaled; use transparency.
- Localized alternative description per sticker (VoiceOver).

### Icon sizes (square corners; system masks)

| Usage | @2x (px) | @3x (px) |
|---|---|---|
| Messages, notifications | 148x110 | n/a |
| Messages, notifications | 143x100 | n/a |
| Messages, notifications | 120x90 | 180x135 |
| Messages, notifications | 64x48 | 96x72 |
| Messages, notifications | 54x40 | 81x60 |
| Settings | 58x58 | 87x87 |
| App Store | 1024x1024 | 1024x1024 |

### Stickers

- One size per pack (small, regular, large); never mix. Supply @3x; system downsamples (`MSStickerSize`).

| Size | @3x (px) |
|---|---|
| Small | 300x300 |
| Regular | 408x408 |
| Large | 618x618 |

- Max file size **500 KB**.

| Format | Transparency | Animation |
|---|---|---|
| PNG | 8-bit | No |
| APNG | 8-bit | Yes |
| GIF | Single-color | Yes |
| JPEG | No | No |

### Platform notes

- No additional considerations for iOS, iPadOS. Not supported in macOS, tvOS, visionOS, watchOS.

---

## Live Photos

Source: https://developer.apple.com/design/human-interface-guidelines/live-photos

Photos with audio and extra frames before/after capture; press to play.

- Apply edits to all frames; if unsupported, offer conversion to a still.
- Keep Live Photos intact; never present frames or audio separately.
- Sharing: preview full Live Photo before sharing; always offer sharing as a still.
- Show download progress and when playable.
- In unsupported environments show a still; don't imitate the Live experience.
- Distinguish from stills with a hint of motion (custom effect; no built-in one). If motion isn't possible, show the system badge (with or without text). Never a play button that looks like video.
- Badge in the same place every photo, typically a corner.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS. Not supported in watchOS.
- **visionOS:** view only; no capture.

---

## Mac Catalyst

Source: https://developer.apple.com/design/human-interface-guidelines/mac-catalyst

### Before you start

Good candidates already support: drag and drop, keyboard navigation and shortcuts, multitasking (Split View, Slide Over, Picture in Picture, which prepares for Mac window resizing), multiple scenes (become multiple windows).

Poor candidates: essential reliance on gyroscope, accelerometer, rear camera, HealthKit, ARKit, or primary functions like marking, handwriting, navigation.

Automatic macOS features: pointer and keyboard focus/navigation, window management, toolbars, rich text (copy/paste, editing context menus), file management, menu bar menus, app settings in the system Settings app. Mac-like appearance for split view, file browser, activity view, form sheet, contextual actions, color picker.

### Choose an idiom

- Default **iPad idiom** ("Scale Interface to Match iPad"): views and text scale to **77%** (17 pt iPad body becomes 13 pt). Consistent but slightly less detailed.
- **Mac idiom**: 100% rendering, more detail, more Mac-like controls, better performance/power for graphics-heavy apps; more layout work. Best for text-heavy, detailed art, animations.
- With Mac idiom: audit and change layout; consider a separate Mac asset catalog; adjust fonts (100% may be too large; prefer text styles, no fixed sizes); verify views/images; avoid fixed font, view, layout sizes.
- Limit appearance customizations to ones macOS controls also support.

### Navigation

- iPad patterns: split views (primary, optional supplementary, secondary), tab bars, page controls.
- Replace tab bars with a split view sidebar (preferred, consistent across iPad and Mac) or a segmented control (good for flat hierarchies).
- List top-level tab items in the macOS View menu.
- Add Next/Previous buttons in addition to swipe gestures between pages.

### Input mappings (automatic)

| iPadOS gesture | Mouse | Trackpad |
|---|---|---|
| Tap | Left or right click | Click |
| Touch and hold | Click and hold | Click and hold |
| Pan | Left click and drag | Click and drag |
| Pinch | n/a | Pinch |
| Rotate | n/a | Rotate |

Pinch and rotate touches go to the view under the pointer.

### App icon, layout, menus

- Create a macOS-style app icon.
- Use width: split single columns into multiple; use regular size classes; reflow side by side on resize; inspectors beside content instead of popovers.
- Move iPad main-UI controls into the window toolbar, with matching menu bar commands.
- Top-down flow: important actions and content at the top.
- Relocate side/bottom edge buttons (ergonomics don't apply on Mac).
- All commands in the menu bar (`UIKeyCommand` for shortcuts; `UIMenuBuilder` and `UICommand` for custom menus). Pop-up/pull-down menus get Mac styling automatically.
- Context menus convert automatically; add more, since Mac users expect them on every object.

### Platform notes

- No additional considerations for iPadOS, macOS. Not supported in iOS, tvOS, visionOS, watchOS.

---

## Machine learning

Source: https://developer.apple.com/design/human-interface-guidelines/machine-learning

ML features depend on model design as much as UI (see Create ML). Design by teaching the app to interpret data. Define ML's role, then apply input/output patterns.

### Role dimensions

| Dimension | Meaning | Design implication |
|---|---|---|
| Critical vs complementary | Face ID critical; QuickType complementary | Central features need higher accuracy; secondary ones get more forgiveness |
| Private vs public | Sensitive (health) vs low-stakes (music) | Sensitive data demands accuracy; always protect privacy |
| Proactive vs reactive | Siri Suggestions vs QuickType | Proactive results get less tolerance; may need more data |
| Visible vs invisible | Image Playground vs News topic suggestions | Invisible features struggle to show reliability and get feedback |
| Dynamic vs static | Improves with use vs with app updates | Dynamic features often need calibration and feedback |

### Explicit feedback

(Favoriting and social reactions are implicit, not explicit.)

- Request only when necessary; prefer implicit.
- Always voluntary.
- Describe consequences plainly ("Suggest less pop music", "Suggest more thrillers", "Mute politics for a week"); avoid vague words like "dislike".
- Icons may supplement descriptions, never replace them.
- Offer multiple, progressively specific options.
- Act immediately and persist (hide everywhere).
- Use it to tune when and where results appear.

### Implicit feedback

- Secure all data; let people control flows of their info across apps; explain how you get and share it.
- Don't trap people in their past behavior; preserve exploration.
- Combine multiple signals to infer intent.
- Withhold suggestions from private/sensitive topics (shared devices).
- Prioritize recent feedback (Face ID), fall back to history.
- Update predictions on a cadence matching expectations (typing immediate; music not continuously).
- Expect UI changes to shift feedback patterns.
- Beware confirmation bias; don't rely only on implicit signals.

### Calibration

Only when the feature can't work without it (Face ID scan).

- Secure data; explain value (what it does, not how); collect only essentials; infer the rest.
- Once, early. Exception: calibrating objects (e.g. each new baseball field).
- Quick and easy: no info people must look up, no difficult actions.
- Show the goal and progress (Face ID tick marks); help immediately if progress stalls, never blaming people; always give a next step.
- Confirm success with a clear path forward.
- Cancel anytime without judgment or follow-up messaging.
- Let people edit/remove calibration data, also outside calibration.

### Mistakes

- Anticipate, help handle, learn when it helps. Patterns: limitations, corrections, attribution, confidence, feedback.
- Match tools to consequences (bad keyboard suggestion vs missed flight).
- Easy fixes for frequent/predictable mistakes.
- Keep updating for evolving tastes and domain trends.
- Address mistakes without complicating UI; a wrong attribution amplifies the error.
- Be extra careful with proactive features.
- Watch side effects of optimizing one area (better dogs, worse cats).

### Corrections

- Familiar, visible steps (Photos auto-crop highlights its controls for refining/undo).
- Show corrected content immediately; persist.
- Let people correct corrections.
- If correcting costs more than doing it manually, the feature fails.
- Never rely on corrections to excuse low quality.
- Learn from corrections only when it improves results.
- Prefer guided corrections (list of alternatives) over freeform; combining is fine.

### Multiple options

Contexts: suggested (proactive, Apple Music For You), requested (reactive, QuickType), corrections (Photos Auto-Crop).

- Prefer diverse options (Maps: no tolls, scenic, highways).
- Avoid too many; fit on one screen.
- Most likely first; optionally preselect.
- Make options distinguishable with brief descriptions highlighting differences; group large sets into scannable categories.
- Learn from selections when it doesn't harm UX.

### Confidence

- Verify confidence correlates with quality before showing it.
- Translate into familiar concepts: attributions ("Because you listen to pop music", not "97% match"), ranking, or semantic categories ("high chance", "low chance").
- Show numeric confidence only where people expect stats (weather, sports, polls).
- Prefer actionable phrasing ("This is a good time to buy", "Consider waiting for a better price").
- Adapt presentation by threshold (Photos asks to confirm faces at lower confidence).
- Hide low-confidence results, especially proactive ones; set a threshold.

### Attribution

- Explains basis, not mechanics ("Because you've read mysteries").
- Use to distinguish options ("New books by authors you've read").
- Balance specificity: not creepy, not generic.
- Factual, objective; no claims about emotions ("Because you've read nonfiction", not "Because you love nonfiction").
- No jargon or statistics unless the domain is statistical (weather, sports, polls, science).

### Limitations

- Set expectations before use (marketing or in context) for rare but serious limits; attribution for minor ones.
- Show how to get good results: placeholder hints (Photos search "Photos, People, Places…"), live guidance (Memoji lighting/distance), alternatives instead of empty results.
- Explain poor results (Memoji: doesn't work well in the dark).
- Consider announcing when a limitation is removed.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS, watchOS.

---

## Maps

Source: https://developer.apple.com/design/human-interface-guidelines/maps

Maps support zoom, pan, rotate, annotations, overlays, routes; standard, satellite, or hybrid views.

### Best practices

- Make maps interactive; don't cover them with noninteractive elements.
- Emphasis style (`MKStandardMapConfiguration.EmphasisStyle`): **default** (fully saturated, matches Maps app) or **muted** (desaturated, lets rich custom content stand out).
- Search with category filters (mall: clothing, housewares, electronics, jewelry, toys).
- Distinct styling (outline, color variation) for selected elements.
- Cluster overlapping points of interest; clusters expand on zoom.
- Keep the Apple logo and legal link visible (temporary covering OK):
  - Padding about **7 pt** on the sides and **10 pt** above and below, from map edges and custom controls.
  - Keep them fixed to the map, not moving with your UI.
  - For movable custom UI (bottom card), place them **10 pt** above the element's lowest resting position.
  - Not shown on maps smaller than **200x100 px**.

### Custom information

- Annotations (`MKAnnotationView`): default red tint with white pin; change tint to your colors; icon may be a string (2 to 3 characters, Unicode allowed) or image (logo).
- Make related standard map features independently selectable with custom appearance/info (`MKMapFeatureOptions`).
- Overlays (`MKOverlayLevel`): **above roads** (default; below buildings, trees; context visible) or **above labels** (hides everything beneath).
- Ensure contrast for custom controls (thin stroke, light shadow, blend modes).

### Place cards

Rich place info (hours, phone, address).

- In-map on selection of your places or of Apple features (POIs, territories, physical features).
- Styles: **automatic** (by map size); **callout** (popover next to place; **full** detailed or **compact**; default automatic callout); **caption** ("Open in Apple Maps" link); **sheet**.
- Full callout = popover on iPadOS and macOS, sheet on iOS.
- Choose per context (small map with many annotations: compact callout).
- Verify across devices/window sizes; set minimum width for full callouts.
- Don't duplicate info your app already shows (use compact or caption).
- Keep the location visible; offset the card and point it at the place.
- Outside a map (lists, store locators): required to include a map inside the place card (`mapItemDetailSheet(item:displaysMap:)`). Use location cues (name, address, details button, map pin icon) to signal tappability.
- Web: Maps Embed API can show a place card for one place by default.

### Indoor maps

- Scale detail with zoom (rooms/buildings always; stores, restrooms when zoomed).
- Distinct colors plus icons for area types.
- Floor picker for multi-level venues; short floor numbers rather than names.
- Show surrounding streets and places; dim noninteractive areas with a distinct color.
- Route to/from nearby transit and parking; offer handoff to Apple Maps.
- Limit scrolling outside the venue; keep part of the map onscreen; adjust by zoom.
- Match your app's style, not Apple Maps (Indoor Mapping Data Format).

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS.
- **watchOS:** static snapshots (`WKInterfaceMap`); tapping opens Maps; up to **5** annotations. Fit the whole element onscreen without scrolling; show the smallest region containing all points of interest.

---

## NFC

Source: https://developer.apple.com/design/human-interface-guidelines/nfc

Reads electronic tags within a few centimeters (toys to games, store coupons, inventory).

### In-app tag reading

- Single or multiple object scanning while active, with a scanning sheet.
- Don't imply contact: say *scan* and *hold near*, never *tap* or *touch*.
- Avoid jargon (*NFC*, *Core NFC*, *Near-field communication*, *tag*).

| Use | Don't use |
|---|---|
| Scan the [object name]. | Scan the NFC tag. |
| Hold your iPhone near the [object name] to learn more about it. | To use NFC scanning, tap your phone to the [object]. |

- Scanning sheet text: one complete sentence, sentence case, ending punctuation, names the object, short (avoid truncation), updated for later scans.

| First scan | Subsequent scans |
|---|---|
| Hold your iPhone near the [object name] to learn more about it. | Now hold your iPhone near another [object name]. |

### Background tag reading

- System scans whenever the screen is lit and shows a notification that hands data to your app.
- Unavailable when: scanning sheet visible, Wallet or Apple Pay in use, cameras in use, Airplane Mode, locked after restart.
- Support both background and in-app reading (devices without background support need in-app scanning).

### Platform notes

- No additional considerations for iOS, iPadOS. Not supported in macOS, tvOS, visionOS, watchOS.

---

## Photo editing

Source: https://developer.apple.com/design/human-interface-guidelines/photo-editing

Extensions edit photos/videos inside Photos; edits save as new files, originals preserved. Accessed in edit mode via the toolbar extension icon; your UI shows in a modal with a top toolbar; dismissing saves or cancels.

- Confirm Cancel when edits exist (warn they'll be lost); skip confirmation if no edits.
- Never add your own top toolbar.
- Let people preview edits before closing.
- Use your app icon as the extension icon.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS. Not supported in tvOS, visionOS, watchOS.

---

## ResearchKit

Source: https://developer.apple.com/design/human-interface-guidelines/researchkit

Framework of predesigned screens for medical research study apps.

### Onboarding (always in this order)

1. **Introduction:** subject, purpose, call to action; quick login for existing participants.
2. **Eligibility:** as early as possible; only necessary requirements; plain language; easy entry.
3. **Informed consent:** ensure understanding first; comply with App Store Guidelines and IRB/ethics requirements. Split into digestible sections (data gathering, data use, benefits, risks, time commitment, withdrawal) with plain overviews and Learn More details; full form viewable before agreeing. Optional comprehension quiz. Then confirmation, signature, contact info; typically email a consent PDF.
4. **Permissions:** location, Health, other data only if critical; explain why; notification permission if needed.

### Conducting research

Surveys:

- State question count and time estimate.
- One question per screen; show progress.
- Keep short; several short surveys beat one long.
- Explanatory text slightly smaller than the question font.
- Confirm completion.

Active tasks (speaking, tapping, walking, memory tests):

- Clear simple instructions; state timing/conditions requirements; make completion obvious.

### Personal info and encouragement

- Profile screen (always reachable): edit changing data (weight, sleep), upcoming activities, leave study, view consent and privacy policy.
- Dashboard: progress, weekly assessments, activity results, comparison with aggregated results.

### Platform notes

- No additional considerations for iOS, iPadOS. Not supported in macOS, tvOS, visionOS, watchOS.

---

## SharePlay

Source: https://developer.apple.com/design/human-interface-guidelines/shareplay

Synchronized shared activities across devices alongside FaceTime or Messages. Start from an in-app control, a FaceTime call, or a shared link; system prompts participants to open or download the app. Paid content: each participant needs their own purchase/subscription (system prompts).

### Best practices

- Real-time activities; for asynchronous work, let people share/save after the session (Freeform board link).
- Shared view for watching/browsing; role-specific views where richer (per-player perspective).
- Work across Apple platforms, settings, communication methods.
- Easy start: clear button with the SharePlay symbol; share sheet; visionOS Share button by the window bar.
- Frictionless joining: straight to content; sign-in/download/subscribe in a view that dismisses when done; provisional access or Family Sharing; defer nonessential setup (profiles after joining a match).
- Concise activity descriptions (title, summary, poster) that don't truncate.
- Keep people oriented when someone changes things (synced playback; in-app cues like Freeform initials).
- Term: *SharePlay* as a noun ("Join SharePlay") or verb in UI (a "SharePlay Movie" button). No adjectives (not "virtual"/"spatial"), no variants (SharePlayed, SharePlays, SharePlaying).

### Platform notes

- No additional considerations for tvOS. Not supported in watchOS.
- **iOS, iPadOS, macOS:** support Picture in Picture for shared video (PiP on iPhone/iPad; separate window on Mac).
- **visionOS:** standard windows share by screen mirroring via the Share button; adopt SharePlay for volumes and immersive content. System creates a *shared context* (same relative placement for all).
  - Prefer starting from a window (Share button); immersive starts need custom UI.
  - Resolve conflicts naturally: don't show take-control UI for single-user tools; let people talk/gesture; simple rules like last change wins.
  - Keep views and immersion synced; for personal immersive views, replace the person's spatial Persona with a contact photo and keep FaceTime Audio.
  - When one person changes immersion, bring others along unless it would interrupt them; then prompt them to join when ready.
  - Per-participant comfort/accessibility settings (volume, subtitles) never affect others.
  - Easy leave and rejoin; windowed version keeps multitasking connected.
  - Personas: remote Vision Pro users appear as spatial Personas (or contact photo if none); iPhone/iPad/Mac/Apple TV users appear in a 2D video window; co-located Vision Pro users see each other via passthrough with content in the same physical spot. Support non-Persona participants; offer UI alternatives to facial expressions or gestures.

Spatial templates:

| Template | Arrangement | Best for |
|---|---|---|
| Side-by-side | Participants along a curve facing content | Watching/viewing; less nonverbal interaction |
| Surround | Circle around central content | Tabletop games, 3D or per-viewer content; verbal and nonverbal interaction |
| Conversational | Circle around a center, content on the edge | Being together while the app works in background (music) |

- Split complex activities into stages with their own templates (team pick vs play); mixing system and custom beats one complex custom template.
- Template transitions only on explicit user action; smooth (infrequent, minimal movement, fade out/in, reorientation cues).

Custom templates (seats apply only to spatial Personas; others join without seats):

- Co-located people can't be moved; guide them with visual position markers.
- Set seat orientation as needed (default faces content center) (`SpatialTemplateSeatElement`).
- Support the max: Vision Pro allows up to **5** spatial Personas; define 5 seats up front; keep seats after people leave; add spectator seats for limited-player games.
- Seats at least **1 meter** apart; too-close Personas become contact photos.
- Order seat filling for balance (not strictly left to right).
- Keep roles independent of seats; reserve specific seats only when a role requires it (game host) (`isSpatial`, `isNearbyWithLocalParticipant`).

---

## ShazamKit

Source: https://developer.apple.com/design/human-interface-guidelines/shazamkit

Audio recognition against the Shazam catalog or a custom catalog. Uses: genre-matched visuals, synced captions or sign language for accessibility, syncing app content in learning or retail.

- Microphone access requires a permission request explaining why.
- Stop recording as soon as you have the sample.
- Let people opt in before saving recognized songs to their iCloud library (Music Recognition and Shazam show your app as source).

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS, watchOS.

---

## Sign in with Apple

Source: https://developer.apple.com/design/human-interface-guidelines/sign-in-with-apple

Sign in or sign up with an existing Apple Account; no forms, email verification, or passwords. Optional name and email, with an option to share a private relay address forwarding to the personal address. Face ID, Touch ID, Optic ID; built-in two-factor. Apple doesn't profile users. Available on all versions of your app and website, including non-Apple platforms (Authentication Services).

### Offering it

- Ask to sign in only in exchange for clear value (personalization, features, sync); describe benefits briefly.
- Delay sign-in as long as possible; let people explore first.
- If an account is required, explain why, have people set it up, then offer Sign in with Apple and other methods.
- Offer linking existing accounts (matching shared email; or a suggestion in account settings for username/password users).
- Commerce: account creation after purchase (guest checkout); offer it on the order confirmation page; don't re-ask name/email given via Apple Pay.
- Welcome people immediately after sign-in; don't ask for nonrequired info.
- Indicate sign-in status, e.g. "Using Sign in with Apple" in account settings.

### Collecting data

- Minimize requests; explain why; display what you receive.
- Label extra data as required (terms acceptance, country/region, birth date, real-identity law data) or optional with benefits.
- Never ask for a password (unless they stopped using Sign in with Apple).
- Never ask for a personal email when people chose a private relay. Instead: show the relay address in your app; direct to Settings > Apple Account > Password & Security > Apps using Apple Account; or use order or phone numbers.
- Ask for optional data later in context (phone for texts, social for friends); never gate features on optional data.
- Be transparent: greet with the shared name or email (also shows where the relay address lives).

### Buttons: general

- Never smaller than other sign-in buttons; visible without scrolling.

System-provided buttons (`ASAuthorizationAppleIDButton` for iOS, macOS, tvOS; `WKInterfaceAuthorizationAppleIDButton` for watchOS; Sign in with Apple JS for web, with live preview tool): guaranteed approved appearance, correct proportions, auto-translated titles, configurable corner radius (iOS, macOS, web), system VoiceOver label.

Titles (pick one fitting your flow; use consistently):

| Platform | Available titles |
|---|---|
| iOS, macOS, tvOS, web | Sign in with Apple; Sign up with Apple; Continue with Apple |
| watchOS | [Apple logo] Sign in |

Styles:

| Style | Platforms | Use on | Never on |
|---|---|---|---|
| White | All platforms and web | Dark backgrounds with sufficient contrast | |
| White with outline | iOS, macOS, web | White/light backgrounds lacking contrast with white fill | Dark or saturated backgrounds (outline adds clutter; use white) |
| Black | All platforms and web | White/light backgrounds with sufficient contrast | Black or dark backgrounds |

- watchOS "black" is the system dark gray (not pure black) to contrast with the black watch background.
- Corner radius adjustable (square to capsule) on iOS, macOS, web (`cornerRadius`).

System button minimums (iOS, macOS, web):

| Min width | Min height | Min margin |
|---|---|---|
| 140 pt (140 px @1x, 280 px @2x) | 30 pt (30 px @1x, 60 px @2x) | 1/10 of button height |

### Custom Sign in with Apple buttons (iOS, macOS, web)

Allowed for aligned logos across providers, logo-only buttons, or font/bezel/background coordination. Must be instantly recognizable; App Review evaluates every custom button.

Logo artwork:

- Only Apple Design Resources artwork (PNG, SVG, PDF; black and white; logo-only and logo-with-text variants, with built-in padding). Never draw a custom Apple logo.
- Use the logo file to position the logo inside a button; never use the logo itself as the button.
- Logo file height = button height. Never crop it. Never add vertical padding.

Never change:

- **Titles:** only *Sign in with Apple*, *Sign up with Apple*, or *Continue with Apple*.
- **Shape:** logo plus text buttons always rectangular; logo-only may be circular or rectangular.
- **Colors:** logo and title both black or both white; no custom colors.

May change:

- Title font, weight, size.
- Title case: may set all caps.
- Background: overall black or white; subtle texture or gradient allowed.
- Corner radius to match your buttons.
- Bezel and shadow (stroke, drop shadow).

Logo plus text buttons:

- Logo format by height: SVG/PDF any height; PNG only for **44 pt** tall buttons (iOS default and recommended). Logos come in small, medium, large to match other providers' buttons.
- Prefer the system font. Whatever the font, keep system proportions: title font size = **43%** of button height (button height = **233%** of font size, rounded to nearest integer).
- Keep default capitalization: capitalize first word (*Sign*, *Continue*) and *Apple*, rest lowercase; all caps only if UI is all caps.
- Vertically center the title; add the logo at full button height (its padding keeps alignment).
- May inset the logo from the leading edge to align with other providers' logos.
- Margin between title and trailing edge at least **8% of button width**.
- Minimums: width 140 pt (140 px @1x, 280 px @2x), height 30 pt (30 px @1x, 60 px @2x), margin around button 1/10 of button height.

Logo-only buttons:

- SVG/PDF any size; PNG only at **44x44 pt**.
- Always 1:1 aspect ratio; never add horizontal padding (artwork includes it).
- Change shape only with a mask (circle, rounded rect); never crop artwork padding, use the bare logo, or add padding.
- Margin around button at least **1/10 of button height**.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, visionOS, watchOS.

---

## Siri

Source: https://developer.apple.com/design/human-interface-guidelines/siri

Siri (voice, swipe down from Dynamic Island, Siri app). On supported devices, Siri AI is powered by Apple Intelligence: run app actions from anywhere, act on onscreen content, follow up conversationally (e.g. "Add this photo to my Landscapes album", then "And email it to Josh"; "Make this black and white").

### Integration

- Expose actions (intents) and content (entities) with the App Intents framework; they surface in Siri, Spotlight, Shortcuts.
- Adopt App schema domains (email, music, photos, etc.) for built-in natural-language handling.
- Share context: annotate onscreen views with app entities; donate entities to the on-device Spotlight index; donate performed actions as intents so Siri can anticipate them.

### Best practices

- Identify most popular actions and their contexts (hands-free, specific devices) to prioritize what to expose.
- Use familiar terms (track vs song vs podcast).
- Offer relevant content (recent searches, favorites, wishlists), not everything; email/messaging may justify full catalogs.
- Never advertise, market, or upsell in Siri content.
- Custom responses only when built-ins fall short.

### Customizing

- Outside schema domains, use App Shortcuts for custom actions.
- Optional intent/entity properties can enrich responses (e.g. a playback snippet); they may not always appear (non-visual contexts).
- Response dialogue:
  - Clear and descriptive; customize follow-ups ("Which soup?" not "Which one?").
  - Succinct; no filler or humor (repeated often).
  - Work both audibly and visually; voice must stand alone.
  - Inclusive; avoid unnecessary pronouns ("Who should I send it to?" not "What's his or her name?").
  - Long option lists: ask an open-ended question ("What kind of shoes are you interested in?").
  - Device-independent wording; accurate if a device must be named.
  - Omit your app name (system attributes it).
  - No offensive language; respect parental controls; responses may be heard by others.
  - Specific errors ("Sorry, we're out of chicken noodle soup", not "Sorry, we can't complete your order").

### Editorial

- Call it *Siri*; never *she*, *him*, *her*.
- Never impersonate Siri, replicate its functionality, or appear to speak for Apple. Never use reserved phrases like "Call 911" or "Hey Siri".
- Localizing "Hey Siri": translate only *Hey*; *Siri* never translated.

| Locale | Phrase | Locale | Phrase |
|---|---|---|---|
| ar_AE, ar_SA | يا Siri | fr_BE, fr_CA, fr_CH, fr_FR | Dis Siri |
| da_DK | Hej Siri | it_CH, it_IT | Ehi Siri |
| de_AT, de_CH, de_DE | Hey Siri | ja_JP | Hey Siri |
| en_AU, en_CA, en_GB, en_IE, en_IN, en_NZ, en_SG, en_US, en_ZA | Hey Siri | ko_KR | Siri야 |
| es_CL, es_ES, es_MX, es_US | Oye Siri | ms_MY | Hai Siri |
| fi_FI | Hei Siri | nb_NO, no_NO | Hei Siri |
| nl_BE | Hé, Siri | nl_NL | Hé Siri |
| pt_BR | E aí Siri | ru_RU | привет Siri |
| sv_SE | Hej Siri | th_TH | หวัดดี Siri |
| tr_TR | Hey Siri | zh_CN | 嘿Siri |
| zh_HK | 喂 Siri | zh_TW | 嘿 Siri |

---

## Tap to Pay on iPhone

Source: https://developer.apple.com/design/human-interface-guidelines/tap-to-pay-on-iphone

Merchants accept contactless payments on iPhone with no extra hardware (alongside existing hardware). Requires a supported payment service provider (PSP), the Tap to Pay on iPhone entitlement, and ProximityReader APIs (directly or via PSP SDK).

### Enabling

- Merchant must accept terms and conditions before device configuration; check status via ProximityReader and show acceptance only when needed.
- Get acceptance before customer-facing flows (from messaging or onboarding buttons).
- Show terms only to admin users; non-admins see "administrator access required". Enterprise apps may let admins accept via web or another app (any device).
- If the PSP requires a specific iOS version, show terms only after updating.

### Educating merchants

- Tutorial on supported payment types and how to accept each, offered via Learn More, auto after accepting terms, auto for new users, and in help/settings.
- Use Apple-approved assets from marketing guidelines or `ProximityReaderDiscovery` (prebuilt, localized, kept current by Apple).
- Custom tutorial must show: launching checkout per payment type; positioning the customer's card or wallet; PIN entry including accessibility mode. End with a chance to accept terms.

### Checking out

- Always offer the Tap to Pay on iPhone option, enabled or not; tapping shows terms if needed, then opens the screen after configuration.
- Prepare at app start and on every return to foreground (`prepare(using:)`) to avoid waits.
- Option selectable even while configuring; then show progress (indeterminate generally; determinate when ProximityReader reports ongoing configuration via `PaymentCardReader.Event.updateProgress(_:)`).
- With multiple acceptance methods, make it findable without scrolling. If it's the only method, open it automatically at checkout.
- Easy switching between Tap to Pay and hardware accessories (e.g. Bluetooth chip and PIN reader), set up together, chosen in checkout without visiting settings.
- **Button label: "Tap to Pay on iPhone", or "Tap to Pay" if space is tight.** Exception: if it's your only method, reuse existing Charge or Checkout buttons. If payment buttons use icons, use SF Symbols `wave.3.right.circle` or `wave.3.right.circle.fill`. Never the Apple logo.
- The "Tap to Pay on iPhone" label is only for payment actions.
- Button color and shape may match your app.
- Finalize the amount (tips, etc.) before opening the screen; show the final amount there.
- Pre-payment options (payment type selection) go after the button tap and before the Tap to Pay screen.

### Displaying results

- Successful tap (and PIN if required) shows a checkmark and returns encrypted payment data for your PSP; failed tap shows an error screen. Your app shows results or alternatives.
- Start processing ASAP (`returnReadResultImmediately`).
- Show an authorization progress indicator after the screen's animation finishes (`PaymentCardReader.Event.readyForTap`).
- Clearly show declined or successful; offer digital receipts (QR code, text).
- On failure (unreadable card, unsupported network, amount not allowed, no online PIN): alternate payment (cash), another method (hardware, payment link), or relaunch for another card.
- Regional cases (consult PSP): Strong Customer Authentication may require showing PIN entry after processing; Offline PIN markets may need PIN fallback with partial data.
- Errors requiring merchant action: clear description plus fix (e.g. alert recommending iOS update) (`PaymentCardReaderSession.ReadError`).
- Easy access to help content and support contact.

### Additional interactions

- Reading a card without an amount (look up, store card, verify, refund): generic labels like "Look Up", "Store Card", "Verify", "Refund"; never "Tap to Pay on iPhone" or "Tap to Pay".
- Loyalty cards/passes in Wallet can be read with or without a payment card. Standalone loyalty flows get a separate, clearly labeled button with no payment terms.

### Platform notes

- No additional considerations for iOS. Not supported in iPadOS, macOS, tvOS, visionOS, watchOS.

---

## VoiceOver

Source: https://developer.apple.com/design/human-interface-guidelines/voiceover

Screen reader for blind and low-vision people; supported in Apple-platform apps and Unity games via Apple's Unity plug-ins.

### Descriptions

- Descriptive accessibility labels for all key elements, custom ones included; replace generic system labels with functional ones; keep them current (Accessibility modifiers).
- Describe meaningful images, only what the image itself conveys (captions are read separately).
- Charts/infographics: concise summary plus accessible interactions (see Charts).
- Hide purely decorative images (`accessibilityHidden(_:)`, `accessibilityElement`, `isAccessibilityElement`).

### Navigation

- Unique, succinct screen titles; accurate section headings.
- Express visual-only grouping, order, relationships (`shouldGroupAccessibilityChildren`). Reading order follows locale (US English: top to bottom, left to right); group image + caption so they read together.
- Announce visible content and layout changes (`AccessibilityNotification`).
- Support the rotor (headings, links, content types; braille keyboard) via `AccessibilityRotorEntry` (SwiftUI), `UIAccessibilityCustomRotor` (UIKit), `NSAccessibilityCustomRotor` (AppKit).

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, tvOS, watchOS.
- **visionOS:** with VoiceOver on, apps with custom gestures don't receive hand input by default; Direct Gesture mode lets people opt in (disables standard VoiceOver gestures). Don't rely on custom gestures alone.

---

## Wallet

Source: https://developer.apple.com/design/human-interface-guidelines/wallet

Stores payment cards, IDs, transit cards, tickets, keys on iPhone and Apple Watch. Apps can add passes, verify identity, and provide order tracking.

### Passes

- Offer adding new passes with one-tap system UI. For frequent predictable actions (flight check-in), add in the background after one-time authorization (`PKPassLibrary.Capability.backgroundAddPasses`); Wallet notifies on each add. For review-first, custom view with Add to Apple Wallet button (`addPasses(_:withCompletionHandler:)`, `PKAddPassesViewController`).
- Passes created elsewhere (web, other device): suggest adding on next app open; if declined, never ask again.
- Add related passes as a group (multi-leg boarding passes; bundled event tickets).
- Show an Add to Apple Wallet button (`PKAddPassButton`) wherever pass info appears, for passes not in Wallet (declined or removed). Emails/web use the Add to Apple Wallet badge.
- Link to existing passes with a label like "View in Wallet".
- Set expiration date, relevant date, and voided properties so Wallet hides expired passes correctly.
- Always get permission before deleting passes (in-app setting for manual vs automatic; alert if needed).
- Provide relevance (time, place) so the pass appears on the Lock Screen when needed (gym card at the gym); event tickets can start a Live Activity.
- Keep passes current (delays, gate changes).
- Change messages only for time-critical updates (gate change yes, support phone change no); never marketing. Per field.

### Pass anatomy

- Pass fields define layout; semantic tags describe content for system features (relevance, featured actions like directions or event guides). Required for poster event tickets and semantic boarding passes (enable automatic layout); include pass fields too for older iOS.
- Front-linked sheets hold supplemental info; back holds rarely needed info (legal).

| Field area | Content |
|---|---|
| Logo and logo text | Brand icon and name; visible when collapsed |
| Header | Critical info; visible when collapsed |
| Primary | Most important info |
| Secondary, auxiliary | Useful, less critical |
| Footer | Supplemental (category like "Family", "Annual") |
| Back | Details shown in pass details |

### Designing passes

- Clean, Wallet-native design, not a physical replica. Use Pass Designer (templates: boarding pass, coupon, event ticket, store card, generic, poster generic).
- Works on all devices; Apple Watch shows less; don't put essentials in elements missing on some devices; no image padding (watchOS crops whitespace).
- Uncluttered front; essentials (date, balance) in header; rare details in the additional info sheet.
- Instantly identifiable via brand colors, images, icons, full-art backgrounds.
- Sufficient text/background contrast, including over images.
- Device-neutral language (not "Slide to view").

Pass styles:

| Style | For |
|---|---|
| Boarding pass | Air, train, bus, boat, transit; one trip each. Airline: semantic tags; others: pass fields |
| Coupon | Coupons, offers, discounts |
| Event ticket | Events (sports, concerts, movies, plays); one or multiple (season). Poster style supports full-art background; non-poster uses fields, background image, thumbnail |
| Store card | Loyalty, discount, points, gift cards; usually shows balance |
| Poster generic | Full background image, distinct layout, any use case |
| Generic | Everything else (gym card, coat check) |

### Pass images

PNG at @2x and @3x.

- Images only for visuals; no embedded text (inaccessible); add barcodes via Pass Designer/APIs, not images.
- Keep files small (email/web delivery).
- Provide a pass icon (Lock Screen, Mail, Wallet); app icon or a separate one.

| Image | Styles | Filename | Size |
|---|---|---|---|
| Logo | Non-semantic airline boarding, non-airline boarding, coupons, non-poster event tickets, generic, store cards | logo.png | Width 50 to 160 pt, height 50 pt. No inner drop shadows |
| Primary logo | Airline boarding (semantic), poster event tickets, poster generic | primaryLogo.png | Width 30 to 126 pt, height 30 pt |
| Secondary logo | Poster event ticket (bottom trailing, issuer/organizer) | secondaryLogo.png | Width 12 to 135 pt, height 12 pt |
| Icon | All | icon.png | 38x38 pt; square, system rounds corners |
| Strip | Coupon, store card | strip.png | 375x144 pt. Contrast with text, uncluttered behind text, key visuals toward bottom or trailing edge, no embedded text |
| Thumbnail | Event ticket, generic | thumbnail.png | Width 60 to 90 pt, height 90 pt; square, rounded corners, transparent PNG |
| Background (non-poster) | Event tickets | background.png | 343x503 pt |
| Background (poster) | Poster event tickets, poster generic | artwork.png | 358x448 pt; keep content in safe area (material strip covers bottom edge), plan for barcode (`footerBackgroundColor`) |
| Footer | Airline boarding passes only | footer.png | 268x15 pt |

### Order tracking

- Wallet dashboard of active/completed orders with item and fulfillment (shipping, pickup) details via the Wallet Orders schema; supply as much data as possible.
- Add orders easily: auto-add after Apple Pay (`PKPaymentOrderDetails` app, `ApplePayPaymentOrderDetails` web). iOS 17+: system **Track with Apple Wallet** button (`AddOrderToWalletButton`) on confirmation, status, tracking pages or in emails; re-adding opens the existing order.
- Show the order immediately, even if details are pending ("Check back later for full order details.").
- Supply fulfillment info ASAP and keep status current; statuses include Order Placed, Processing, Ready for Pickup, Picked Up, Out for Delivery, Delivered, Issue, Canceled; system may notify.
- Logo: 300x300 px PNG or JPEG, nontransparent background.
- Product images: 300x300 px PNG or JPEG, plain depiction, solid nontransparent background (no lifestyle or busy backgrounds).
- Brief, clear, localized text; prices must match the final confirmed price.

Order and fulfillment details:

- Provide a universal link to order management (works without the app).
- Describe each item (`LineItem`: price, name, image); fulfillments list only their items; optional PDF receipts per transaction.
- Supply a prioritized app list; system links to the highest installed app or the first if none.
- Avoid duplicate notifications (suppress Wallet notifications when your app is installed).
- Merchant contact: at minimum a website/landing page link; optionally Messages for Business, phone, email, support page (Contact button menu).
- Tracking: per-fulfillment ETA; carrier website link plus tracking number; pickup barcode in Wallet; clear receive/pickup instructions.
- Fulfillment screen prioritizes tracking over promotions.
- Shipping values: set `carrier` if known (else default "Track Shipment"); use step statuses `onTheWay`, `outForDelivery`, `delivered` when known, else `shipped`; include tracking link.
- Status descriptions approachable, accurate, on-brand. Issue/Canceled: explain why and what to do.

### Identity verification (Verify with Wallet)

iOS 16+: apps and App Clips read IDs stored in Wallet without leaving context. Apple never sees ID documents; apps receive encrypted data unreadable on device. (In-person verification: see ID Verifier.)

- Show the option only on supporting devices; provide a fallback verification method (`VerifyIdentityWithWalletButton`).
- Ask only at the moment of need (completing the transaction), never at account creation or before the process starts.
- Purpose string required, shown in the sheet: brief complete sentence, direct, specific, sentence case, active voice, period at end.

| Verifying | Use case | Example purpose string |
|---|---|---|
| Identity | Account opening legally requiring ID to prevent fraud | Federal law requires this information to verify your identity and also to help [App Name] prevent fraud. |
| Driving privilege | Vehicle rental | Applicable state law requires [App Name] to verify your driving privileges. |

- Request minimum data; age thresholds (`age(atLeast:)`) instead of age or birth date.
- State whether and how long you keep data (period, indefinitely, only for this verification) via `PKIdentityIntentToStore`; system explains it in the sheet.
- Choose the matching system button (`PKIdentityButton.Label`):

| Label | Use when |
|---|---|
| Verify Age with Apple Wallet | Transaction completes after age check (e.g. making a car available to lease) |
| Verify Identity with Apple Wallet | Transaction completes after identity check (e.g. car rental) |
| Continue with Apple Wallet | Wallet is one part of a flow needing more info (SSN, phone), e.g. financial account, background check |
| Verify with Apple Wallet | Flow completes without extra steps but other labels don't fit (e.g. government service signup) |

- All labels have an automatic multiline variant for tight widths.
- Always white letters on black; optional light-outline style for dark backgrounds (`PKIdentityButton.Style.blackOutline`); adjustable `cornerRadius`.

### Platform notes

- No additional considerations for iOS, iPadOS, macOS, visionOS. Not supported in tvOS.
- **watchOS:** passes in a scrolling card carousel (added even without a watch app); tap for scrolling details; some transactions tappable. Each style defines visible fields/images; overflow goes to details. watchOS always crops the strip image to the card aspect ratio and may crop whitespace from other images.
