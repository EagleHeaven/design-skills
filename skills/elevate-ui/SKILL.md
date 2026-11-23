---
name: elevate-ui
description: Elevates a website or app UI toward an editorial, high-end studio look, using a curated reference set (Typewolf, Recent.design, Awwwards, Land-book, Godly, Mobbin, Coolors, and the shader and liquid-glass reels). Use when asked to make a page, landing, app screen or component look more premium, more designed, more original, or "like the references". Gives a direction system (paper editorial, dark gallery, or shader/liquid accent), a grid and type system, mobile-first rules, motion limits, and a verification pass.
---

# Elevate UI

Use this skill to lift a UI from "competent template" to "studio-made". It encodes what the reference set has in common, then turns it into decisions you can apply and check.

The reference set, and what each one teaches:

| Reference | What it teaches |
|---|---|
| Typewolf, Recent.design, Awwwards, Land-book | Editorial framing: a large serif title, a short sans deck, a right-aligned slug, a framed product window below. Use them for layout and type. |
| Coolors, Typewolf, Godly, Mobbin | Palette discipline and gallery grids: one neutral ground, one accent, real product tiles. |
| "Design" reel (React Three Fiber, Liquid Glass JS, Scroll World, Liquid Logo, Shader Gradient) | Effects vocabulary: 3D, liquid glass, animated shader gradients. Powerful, easy to overuse. |
| WhatsApp-style doodle and chat backgrounds | Texture as a quiet background, not as content. |

The rules that matter most are below.

## Step 0: Read the project first

Precedence, highest first:
1. The user's explicit words.
2. The project's own system: `CLAUDE.md`, tokens, theme files, existing components. Extend them, never replace them silently.
3. This skill.

Before changing anything, find the existing tokens (colors, fonts, spacing) and the existing routes or screens. Preserve every behavior and copy. Only the surface changes.

Project rules always override the defaults below: house fonts, banned imagery (for example no AI photos or no app screenshots on a marketing site), brand name casing, page structure. Find them in the project's docs or `CLAUDE.md` before changing anything.

## Step 1: Choose one direction

Pick one. Do not mix two directions on the same screen.

| Direction | Ground | Ink | Accent | Best for |
|---|---|---|---|---|
| A. Paper editorial | warm off-white, around `#F1EEE8` | near-black, around `#111` | one saturated color, for example a bright yellow | sites, landing pages, press kits, reports |
| B. Dark gallery | near-black, around `#0B0B0C` | off-white | one light accent, or the brand color used once | product showcases, dashboards, portfolios |
| C. Shader or liquid accent | the brand ground | the brand ink | an animated gradient or liquid element in one hero only | launches, event pages, campaign moments |

Rule of 60-30-10: 60% ground, 30% ink or secondary tone, 10% accent. The accent appears only where the eye must land: the primary action, one number, one highlight.

## Step 2: Apply the editorial system (A, and parts of B)

These are the moves that carry the references. Use them with restraint.

1. **Hairline grid.** Draw thin rules, about 1px at 12 to 14% opacity, that divide the page into bands. Align text to the same two or three columns in every band.
2. **Registration marks and metadata.** Small corner labels: a "++++" mark on one side, a year or edition on the other, and a footer row with three short labels. Keep them at 11 to 12px, uppercase, with slight tracking. They signal craft without content.
3. **Title block.** Large serif title (one or two words), a short sans deck of two or three lines, and a right-aligned slug in light grey (`/example.com`) on the same baseline as the deck.
4. **Framed product window.** Show the product inside a rounded frame with a thick dark border and a radius of about 20 to 28px. Never show a bare screenshot floating on the page.
5. **Carousel affordance.** When there is a sequence, use small round arrow buttons at the edges of the frame, not dots alone.
6. **Accent use.** One accent block per screen, for example a half-circle cut from the top or bottom edge of a card, used as a shape, not as a fill for text.

## Step 3: Type system

- Display: a high-contrast or condensed serif. Instrument Serif is a strong free choice. Use one display face only.
- Text: one grotesk or humanist sans. Figtree or Inter are safe choices.
- Scale: about 1.6 between steps. Example mobile scale: 14, 16, 22, 36, 58px. Headings at line-height 1.0 to 1.05, body at 1.5.
- Title size on mobile: use `clamp()` so the hero title fits in two lines at 375px. Let it break, never shrink to illegibility.
- Hierarchy: one large element, one or two medium, the rest small. If everything is big, nothing is.
- Balance headings with `text-wrap: balance`. Keep running text near 65 characters.

## Step 4: Layout and mobile

- Left alignment everywhere on phones. The eye reads a left edge in an F-pattern. Center only short hero lines.
- A 16px side gutter at every width, with `env(safe-area-inset-*)` on top of it.
- Generous space between bands, around 80 to 112px on desktop and 56 to 72px on mobile. Whitespace is part of the premium look.
- Stack to one column below about 400px. No horizontal page scroll.
- Test at 375 x 667 and 390 x 844, light and dark. Check the first screen fully, without scrolling, on the small size.

## Step 5: Effects (C, and only as accents)

- Animated shader gradients and liquid glass are allowed on one hero or one moment, never on every card.
- Keep 3D and shader work behind `prefers-reduced-motion` with a static fallback.
- Keep the frame rate honest: pause off-screen canvases, cap pixel ratio at 2.
- Never place body text over an animated gradient without a solid or blurred panel behind it.

## Step 6: Motion

- Use ease-out curves such as `cubic-bezier(0.22, 1, 0.36, 1)`. No `linear` and no bounce on text.
- Durations: 180 to 320ms for UI, 600 to 900ms for a hero reveal, once.
- Animate transform and opacity only. Reveal on scroll once, then leave it still.
- Honor `prefers-reduced-motion: reduce`: remove transforms, keep opacity.

## Step 7: Texture and doodles

- A doodle or pattern is a background, never content. Keep its contrast low: a tint close to the ground, about 8 to 15% opacity, in one hue.
- Test it under real text. If a line of body text is harder to read on the pattern than on a plain ground, the pattern is too strong.
- Offer it as a setting where the user owns the choice (chat wallpapers), in line with how messaging apps let people change or remove it.

## Anti-patterns

Reject these on sight:
- Default purple-to-blue gradients, glassmorphism on every card, and emoji used as icons.
- Stock or AI-generated people photos.
- Heavy drop shadows (`shadow-md` and up) and gray 1px borders on every card.
- Three identical feature cards in a row.
- A sticky header that covers the first title on mobile.
- Five or more type sizes on one screen, or two display faces.
- Accent color on more than one element per block.
- Centered paragraphs longer than two lines.

## Verification pass

Before you call the work done:
1. Screenshot or preview the first screen at 375 x 667 and at desktop width. Compare against one reference from the table above, and say which one.
2. Check the hierarchy in one glance: one large element, the rest subordinate.
3. Check contrast of every text color on its ground, in both themes (4.5:1 for body, 3:1 for large text).
4. Check that the accent appears in no more than one spot per block.
5. Check reduced motion: turn it on and confirm nothing essential moves.
6. Check that nothing the project forbids slipped in (for example app screenshots on the site, or photos generated by AI).
7. Report what changed, what was kept from the project's system, and what you could not verify.
