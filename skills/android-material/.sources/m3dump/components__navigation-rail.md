# Navigation rail

Source: https://m3.material.io/components/navigation-rail


## Overview

- Use navigation rails in medium, expanded, large, or extra-large window sizes
- Can contain 3-7 destinations plus an optional FAB
- Always put the rail in the same place, even on different screens of an app

#### Availability & resources

#### M3 Expressive update

**May 2025**
A **collapsed** and **expanded** navigation rail have been introduced to replace the baseline nav rail. The expanded nav rail is meant to replace the navigation drawer. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

Variants and naming:

- The baseline **navigation rail** is no longer recommended

- Added two wider navigation rails:

- **Collapsed:** replaces baseline nav rail

- **Expanded**: replaces navigation drawer
Configurations:

- Expanded rail modality:

- Non-modal

- Modal

- Expanded behavior:

- Transition to collapsed navigation rail

- Hide when collapsed

- Color:

- Active label on vertical items changed from **on surface variant** to **secondary **

#### Differences from M2

- Behavior: Predictive back interaction
- Color: New color mappings and compatibility with dynamic color
- States: The active destination can be indicated with a pill shape in a contrasting color


## Specs

#### Variants

##### Baseline variants

The baseline navigation rail is no longer recommended, and should be replaced by the collapsed navigation rail. View baseline tokens (/m3/pages/navigation-rail/specs#d4d97764-20ec-496f-a6f3-0d423940ec5a)

| Variant
 | M3
 | M3 Expressive
 | 
| Collapsed navigation rail

 | --
 | Available
 | 
| Expanded navigation rail 

 | --
 | Available
 | 
| Navigation rail (baseline)

 | Available
 | Not recommended.
Use **collapsed navigation rail**.

 |

#### Configurations

| Category
 | Configuration
 | M3
 |       M3 Expressive
 | 
| Expanded layout
 | Standard (default)
 | Available as navigation drawer

 | Available
 | 
| Modal
 | Available as navigation drawer

 | Available
 | 
| Expanded behavior
 | Hide when collapsed
 | --
 | Available
 |

#### Tokens & specs

Browse the component elements, attributes, tokens, and their values. Learn about design tokens (/m3/pages/design-tokens/overview/)

#### Anatomy

#### Color
Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens; in implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### States
States are visual representations used to communicate the status of a component or an interactive element.

The navigation item’s target area always spans the full width of the nav rail, even if the item container hugs its contents.

#### Measurements

#### Common layouts

#### Baseline navigation rail

##### Tokens & specs

##### Color

Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### States

States are visual representations used to communicate the status of a component or interactive element.

##### Measurements

##### Configurations
Common arrangements of elements within a navigation rail.


## Guidelines

#### Usage

The navigation rail can display navigation items, a menu, and a floating action button (FAB) in a vertical orientation.
There are two variants of navigation rails, **collapsed** and **expanded**, which can easily transform into each other when the menu button is selected.

##### Collapsed
The **collapsed** nav rail runs along the leading edge of the window, and should contain 3–7 navigation items. It should not be hidden.
It can be used in medium to extra large breakpoints, such as tablets and desktop. In  medium windows with few destinations, consider using a navigation bar instead. Compact windows should always use a navigation bar.

##### Expanded
The **expanded** navigation rail can be standard or modal, and should always open from a menu icon. An expanded rail can reveal secondary destinations not visible when collapsed.

The **standard** configuration is placed beside body content. It’s best for larger windows with lots of available space.

The **modal** configuration overlaps the body content, and should be opened from a menu icon. Use the modal configuration for:

- Information dense layouts where space is limited
- Products with many navigation items

In immersive experiences, the expanded navigation rail can be hidden entirely, appearing only when the menu icon is selected.

The collapsed navigation rail should not be hidden.

#### Anatomy

##### Container
The navigation rail should be placed on the leading edge of the window. This is the left side for left-to-right languages, and the right side for right-to-left languages.

The container fill can be turned off so the nav rail appears directly on the surface. When doing this, make sure all items have a minimum of 3:1 color contrast.

The navigation rail should always run vertically along the side of a layout. Don’t make it horizontal.

Use a navigation bar for horizontal navigation.

[DON'T] Horizontal navigation rail on timer screen.

Navigation rail items can be aligned as a group to the top or center of a layout. On tablets, use center alignment to make it easier to reach items.

The menu icon and FAB should always be top-aligned.

##### Menu (optional)
The menu button can transition between the **collapsed **and **expanded** navigation rails.

Once expanded, the rail can reveal secondary destinations.

When the navigation rail is expanded, the menu icon should change to represent that it can be collapsed.

##### Floating action button (FAB) (optional)
The container of the navigation rail is ideal for anchoring the FAB to the top of a screen, placing the app’s key action above navigation destinations.

When nested within another component, such as the navigation rail, the FAB's resting elevation should be level 0 (/m3/pages/elevation/applying-elevation).

[DO] Navigation rail with a FAB button at the top of the screen.

[DON'T] Navigation rail with a FAB button at the bottom of the screen.

The top of the rail can also be used for a logo, however avoid using logos that could be mistaken as buttons.

Don’t use a logo as a menu button to expand the navigation rail.

[CAUTION] Navigation rail with Material design logo at the top of the screen.

##### Active indicator
The active indicator shows which page is being displayed.

[DO] Navigation rail with active indicators present for the current screen.

[DON'T] Navigation rail with active indicators present for all navigation items.

The active indicator hugs the label text in the expanded nav rail. To achieve a similar style to the baseline navigation drawer, consider modifying the active indicator to fill the container.

The target area should always span the full width.

##### Icons
Navigation rail items must use icons that symbolize the content of their page. Browse popular icons on Google Fonts (http://fonts.google.com/icons).

When a destination is selected, the icon fills and changes color. An active indicator appears behind the icon.

##### Label text
The label text should be a short, meaningful description of each navigation destination and another way for users to understand an icon’s meaning.

All navigation items require a one word label text.

[DO] Navigation rail with clear text labels.

Avoid wrapping long labels when possible. If necessary, create a line break between words, or hyphenate longer words.

[CAUTION] Navigation rail with lengthy text labels.

Labels should be short enough to not be truncated. Don’t shrink the type scale to fit longer text labels.

[DON'T] Navigation rail with truncated text label with ellipses. 

[DON'T] Navigation rail with small text label.

##### Badges
Navigation rail icons can include badges to communicate dynamic information about the  destination, such as counts or status.

In compact nav rails, the badge is placed in the upper right corner of the icon. In expanded nav rails, the badge should be placed next to the label text.

##### Divider (optional)
A vertical divider can help separate the rail from app content. The divider should be positioned on the edge of the rail container that’s adjacent to the app’s content area.

#### Placement

In adaptive layouts, the navigation rail should be placed outside any panes, always along the leading edge of the window. Don’t place it within body content.

When the navigation rail is hidden, the body content can fill in the remaining space as long as the menu icon is still accessible.

Tabs can be used alongside a navigation rail to create an extra layer of visible navigation.

#### Adaptive design

For more, see adaptive design (/m3/pages/layout-overview/adaptive-design/).

##### Resizing
When moving from a large screen to a small screen, a navigation rail can transform into a navigation bar, providing the same quick access in a configuration that’s easier to use on smaller displays. Never use the navigation rail and navigation bar simultaneously. 
Only use navigation rails for medium breakpoints and larger. Don’t use a navigation bar. If there are more than five destinations, consider using a modal expanded nav rail instead.
**Compact:** Don’t use a standard navigation rail for compact layouts due to space constraints. Use a navigation bar instead.
**Medium:** Use a navigation rail, especially if prioritizing persistent vertical navigation over maximizing vertical content space.
**Expanded to extra-large:** Use a navigation rail, not a navigation bar. Consider available horizontal space and the number of destinations when choosing between standard and modal.

##### Presentation
When the navigation rail transitions from collapsed to expanded, the contents of the page should automatically adjust to fit.

The contents of the navigation rail also expand to fill the space. For example, the FAB should transition into an extended FAB. 

Extra destinations can be shown in an expanded nav rail.

#### Behavior

##### Scrolling
Destinations in the navigation rail should remain visible and fixed when scrolling vertically.

If a layout scrolls horizontally, the rail can scroll off-screen or remain fixed. To distinguish that content is scrolling underneath the rail, use a divider or add elevation to the rail.

##### Selection
When a destination is tapped, the destination screen uses a top level (/m3/pages/motion-transitions/transition-patterns#f852afd2-396f-49fd-a265-5f6d96680e16) transition pattern. In addition, the icon becomes filled and the active indicator expands from the center of the icon.

##### Back
On Android, a gesture called predictive back allows people to swipe left or right on the screen to go back or dismiss modal components.

- Previous screen is revealed in a preview to signal the destination

- Predictive back only applies to the **modal expanded** navigation rail.A list of compatible components is available on the gestures page (/m3/pages/gestures/).


## Accessibility

#### Use cases
People should be able to do the following using the assistive technology:

- Navigate between navigation destinations
- Select a particular navigation destination from a set
- Get appropriate feedback based on input type

#### Interaction & style

When a navigation item is tapped, the active indicator appears, providing the following feedback to the user that it is selected:

- A ripple passes through the indicator
- The icon switches from outlined to filled
- The icon and text change colorWhen hovered, the hover state appears, providing a visual cue that the destination is interactive.

The target area for expanded navigation rails spans the full width of the container, even though the active indicator visually hugs the content.

Use a filled icon for the active destination and outlined icons for inactive destinations.

Active and inactive icon colors need sufficient contrast against the container.

[DO] Navigation rail with filled element.

[DON'T] Nav rail with multiple navigation destinations and multi-colored contrast.

If an icon doesn’t have a filled style, use the semibold icon weight instead.

##### Text scaling and truncation
When someone sets their device to show a larger text size, the navigation rail items should grow vertically to accommodate larger labels while retaining the default padding. It’s okay for scaled text to wrap in navigation items.
To remain accessible, ensure the full label is always visible on-screen at up to 2x text sizing. Beyond this size, text can truncate.

##### Initial focus
Initial focus lands directly on the first interactive item, whether it’s the menu, the FAB, or the first navigation item.

From the FAB or menu, **Tab** brings the person to the navigation items. **Tab** or **Arrows** then navigate between items.

##### Visual indicators
Icons give the dominant cue of the navigation state. Use a filled icon for the selected destination to contrast with outlined icons for the non-selected destinations.

[DO] Nav bar with an active, filled icon button.

[DON'T] Selected navigation item without filled icon style.

#### Keyboard navigation

| Keys | Actions | 
| Tab / Arrows | Navigate between interactive elements | 
| Space / Enter
 | Selects an interactive element |

#### Labeling elements
The accessibility label for a navigation item is typically the same as the adjacent text label.

When the visible UI text is ambiguous, accessibility labels need to be more descriptive. For example, a navigation item visibly labeled **Recent** would benefit from additional information in its accessibility label to clarify the destination's intent.

Note: On Android Views (MDC-Android), a more descriptive accessibility label is not available and the role is not announced.
