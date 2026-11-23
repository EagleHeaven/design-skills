# Navigation bar

Source: https://m3.material.io/components/navigation-bar


## Overview

- Use navigation bars in compact or medium window sizes

- Can contain 3-5 destinations of equal importance

- Destinations don't change. They should be consistent across app screens.

#### Availability & resources

#### M3 Expressive update

**May 2025**
A new flexible navigation bar was introduced to replace the baseline navigation bar. It’s shorter and supports horizontal navigation items in medium windows. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

Variants and naming:

- Baseline navigation bar is no longer recommended 

- Added **flexible **navigation bar

- Shorter height

- Can be used in medium window sizes with horizontal navigation items
Color:

- Active label changed from **on-surface-variant** to **secondary**

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color
- Elevation: No shadow
- Layout: Container height is taller 
- States: The active destination can be indicated with a pill shape in a contrasting color
- Name: Bottom navigation has been renamed **navigation bar**


## Specs

#### Variants

##### Baseline variants

The baseline nav bar is no longer recommended, and should be replaced by the flexible nav bar, which is shorter and supports horizontal navigation items in medium windows. View baseline nav bar specs (/m3/pages/navigation-bar/specs#46dc2521-acf0-44e3-bbc0-78dc225b9749)

| Variant
 | M3
 | M3 Expressive
 | 
| Flexible navigation bar
 | --
 | Available
 | 
| Navigation bar
 | Available
 | Not recommended.
Use **flexible navigation bar**.
 |

#### Configurations

In compact windows, navigation bars use vertical items. In medium windows, navigation bars should use horizontal items.

| Category

 | Configuration

 | M3

 | M3 Expressive

 | 
| Navigation item layout

 | Vertical (default)

 | Available

 | Available

 | 
| Horizontal

 | --

 | Available

 |

#### Tokens & specs

Use the table's menu to switch between token sets for the navigation bar and the nav items.  (/m3/pages/navigation-bar/specs#3425f33a-0b11-492a-ae5a-40d63f939384)Learn about design tokens (/m3/pages/design-tokens/overview/)

#### Anatomy

#### Color
Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens; in implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

For badge color roles, go to badge specs (/m3/pages/badges/specs).

#### States
States are visual representations used to communicate the status of a component or an interactive element.

#### Measurements

The navigation bar stretches the full window width.

Vertical navigation items dynamically change width to equally fit the container. Horizontal navigation items have a fixed width, so extra space is added to the ends of the navigation bar instead.

#### Baseline navigation bar

##### Tokens & specs

These tokens are for the baseline navigation bar.

##### Color
Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens; in implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

For badge color roles, go to badge specs (/m3/pages/badges/specs).

##### States
States are visual representations used to communicate the status of a component or an interactive element.

#### Measurements

#### Configurations


## Guidelines

#### Usage

Navigation bars provide access to three to five destinations. The nav bar is positioned at the bottom of windows for convenient access.
Each destination is represented by an icon and label text. One navigation destination is always active.
When a navigation bar icon is tapped or focused, people are taken to the navigation destination associated with that icon.

Navigation bars should be used for:

- Three to five main pages in the product
- Mobile or tablet onlyNavigation bars shouldn’t be used for accessing single tasks, such as viewing one email.

The navigation items can be **vertical** or **horizontal**.

- Use vertical items in compact windows, like mobile

- Use horizontal items in medium windows, like tablets

For products with more than five navigation items, don’t use a navigation bar; the elements may collide and there likely won’t be enough space for translated text.

Instead, consider using tabs to organize similar content within a page, or hide the navigation behind a menu icon using a modal expanded navigation rail.

[DON'T] A nav bar with 7 items in a compact window.

[DON'T] A nav bar with no labels for each page item.

[DON'T] A nav bar with 2 page items.

[DON'T] Nav bar using horizontal items in a compact window. The items are too wide and flow off screen.

#### Anatomy

##### Container
The container should always be placed at the bottom of the product and span the full length of the window. Navigation items are centered within the container.

The container has a color fill to provide separation from other content.

##### Navigation items
Navigation items hold all elements for each destination: the icon, label text, and active indicator. They can be **vertical**, with the text below the icon and indicator, or **horizontal**, with the icon and text beside each other inside the indicator. 

Vertical items are best in compact windows, and horizontal items are best in medium windows.

Horizontal items are centered in the nav bar with outer margins.

##### Icons
Navigation rail items must use icons that symbolize the content of their page. Browse popular icon (https://fonts.google.com/icons).

Use a filled icon for the active destination and outlined icons for inactive destinations. If an icon doesn’t have a filled version, apply **semibold** weight to the icon instead.

[DO] An active nav item with a filled icon compared to inactive items with outlined icons.

[CAUTION] An active nav item with a semibold icon compared to inactive items with outlined icons.

Active and inactive icons must have a minimum 3:1 contrast ratio with the container.

[DON'T] 4 nav items that are each different colors with low contrast with the background.

##### Active indicator
The active indicator shows which page from the nav bar is currently being displayed.

[DO] The current page in a nav bar has an active indicator.

[DON'T] All items in a nav bar have active indicators.

##### Label text
The label text should be a short, meaningful description of each navigation destination and another way for people to understand an icon’s meaning.

All navigation items require a label text. It should be 1-2 words.

[DO] A nav bar with 1-word labels for each page.

[DON'T] A nav bar with “Music catalog” for a label. The label is truncated.

[DON'T] A nav bar with “Music catalog” for a label. The label is a smaller size to make the text fit.

##### Badges (optional)
Navigation bars can display badges in the upper right corners of the destination icon.

Badges can contain dynamic information, such as the number of new messages.

#### Placement

The floating action button (FAB) is placed above the navigation bar. Nav bars are always placed at the bottom of the window.

[DO] The FAB should be right-aligned above the navigation bar

[DON'T] A mobile page with a FAB overlapping a nav bar.

Navigation bars can be temporarily covered by dialogs, bottom sheets, navigation drawers, the on-screen keyboard, or other elements needed to complete a flow. They should not be permanently obstructed on any screen.

#### Adaptive design

Adaptive design allows an interface to respond or change based on context, such as the user, device, and usage. More on adaptive design (/m3/pages/layout-overview/adaptive-design)

##### Resizing
Only use navigation bars for compact and medium breakpoints. 
**Compact**: For narrow windows, use a navigation bar or modal navigation rail.
**Medium**: Use a navigation bar or navigation rail. Decide based on whether horizontal or vertical space is more important.
**Expanded and extra-large**: Use a navigation rail instead. Decide based on available window space and the number of navigation destinations.

The navigation bar container spans 100% of the window width.

The navigation bar is used on smaller devices. It’s not intended for desktop.

[DON'T] Navigation bar spanning the full width of an expanded window size.

##### Presentation
In medium breakpoints, use horizontal nav items to better use available space.
Horizontal nav items should remain centered with the same padding at each breakpoint.

#### Behavior

##### Navigation
When selecting a navigation bar item not currently selected, the product navigates to that destination’s screen using a top level (/m3/pages/motion-transitions/transition-patterns#f852afd2-396f-49fd-a265-5f6d96680e16) transition pattern. It can either remember where you left off, or reset to the default view.

- **Preserve state**: If someone has interacted with this destination, it returns to their scroll position, current tab, and in-line search status.
- **Reset state**: Any prior user interactions are reset, including scroll position, tab selection, and in-line search.Choose the behavior that best suits the product and user needs. For example, an app that requires frequent switching between sections should preserve each section’s state.

Re-selecting the currently active destination should reset the scroll position to the top of the page.
**Don't swipe between destinations**
Swiping across the screen does not navigate between destinations, and is not supported by the navigation bar. Swipe behavior should be reserved for related items, such as cards in a carousel, or actions such as archiving a list item.

##### Scrolling
Upon scroll, the navigation bar can appear or disappear. 
Don’t hide the navigation bar on scroll when a screen reader (https://m3.material.io/foundations/overview/assistive-technology#ec6f3e84-a51c-4dc0-a353-6844f5bde698) is active.

##### Selection
The icon becomes filled and the active indicator expands from the center of the icon when switching between destinations.

The active indicator animation should only apply on one axis to better represent a flat, shared plane.

When a destination is tapped, the destination screens use a top level (/m3/pages/motion-transitions/transition-patterns#f852afd2-396f-49fd-a265-5f6d96680e16) transition pattern. In addition, the icon becomes filled and the active indicator expands from the center of the icon.


## Accessibility

#### Use cases

People should be able to do the following using the assistive technology:

- Move between navigation destinations
- Select a particular navigation destination from a set
- Get appropriate feedback based on input type

#### Interaction & style

**Touch**

- When a navigation item is tapped, the active indicator appears in place, providing feedback that it’s selected

- A touch ripple passes through the indicator

- The icon switches from outlined to filled

- The icon changes color

**Cursor**

- When hovered, the active indicator appears in a reduced state providing a visual cue that the destination is interactive

- When clicked (in both active and inactive states), a ripple passes through the indicator

- The icon switches from outlined to filled

- The icon changes color, becoming darker

##### Text scaling and truncation
When someone sets their device to show a larger text size, the navigation bar should grow vertically to accommodate larger labels while retaining the default padding. It’s okay for scaled text to wrap in navigation items.
To remain accessible, ensure the full label is always visible on-screen at up to 2x text sizing. Beyond this size, text can truncate.

#### Initial focus

Initial focus lands directly on the first navigation item, since that is the first interactive element of the component.

#### Visual indicators

Use a filled icon with a bold label for selected destinations. For unselected destinations use an outlined icon with a medium label.

If an icon doesn’t have a filled style, use a thicker or heavier version of the icon instead.

[DO] A nav bar with a filled icon for the selected nav item.

[DON'T] A nav bar with an outlined icon for the selected nav item.

#### Keyboard navigation

| Keys | Actions | 
| Tab | Move between navigation items | 
| Space / Enter | Selects the focused navigation item |

#### Labeling elements

The accessibility label for a navigation item is typically the same as the destination name.

When the visible UI text is ambiguous, accessibility labels need to be more descriptive. For example, a navigation destination visibly labeled **Library **would benefit from additional information in its accessibility label to clarify the destination’s intent.

Note: On Android Views (MDC-Android), a more descriptive accessibility label is not available and the role is not announced.
