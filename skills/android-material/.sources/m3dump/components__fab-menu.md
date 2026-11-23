# FAB menu

Source: https://m3.material.io/components/fab-menu


## Overview

- Opens from a FAB to show 2–6 related actions floating on screen
- One FAB menu size for all sizes of FABs
- Not used with extended FABs
- Available in primary, secondary, and tertiary color sets

#### Availability & resources

#### M3 Expressive update

May 2025
The FAB menu adds more options to the FAB. It should replace the speed dial and any usage of stacked small FABs. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

New component added to catalog:

- One menu size that pairs with any FAB
- Replaces any usage of stacked small FABsColor:

- Contrasting close button and item colors
- Supports dynamic color
- Compatible with any FAB color style

#### Differences from M2


## Specs

#### Variants

| Variant
 |  M3
 | M3 Expressive
 | 
| FAB menu
 | --
 | Available
 |

#### Configurations

| Category
 | Configuration
 |  M3
 | M3 Expressive
 | 
| Color
 | Primary set, secondary set, tertiary set
 | --
 | Available
 |

#### Tokens & specs

Use the table's menu to switch token sets. The FAB menu has a common token set and six color sets, three for each element (close button and menu item). Learn about design tokens (/m3/pages/design-tokens/overview/)

#### Anatomy

#### Color
Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens. In implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### States
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states)

##### Close button

##### Menu item

#### Measurements

FAB menu items share the same measurements as the medium button specs. 
The close button should always be 56dp.

The FAB menu animates from the top trailing edge of the FAB to ensure a smooth animation.

Larger FABs will place the FAB menu slightly higher, with larger margins underneath.

On web, the FAB menu opens from the FAB, and inherits its states and specs from the baseline menu component. 
The gap between the FAB and menu can vary, but 4dp is recommended.


## Guidelines

#### Usage

A FAB menu opens from a FAB to show multiple related actions. It should always appear in the same place as the FAB that opened it.
This makes actions immediately accessible, and keeps the UI clean by concealing actions when they’re not needed.
Don’t open a FAB menu from an extended FAB or any other component.

The FAB menu should be aligned to the trailing edge of the window. 
In right-to-left (RTL) languages, this means the FAB and FAB menu should be aligned to the left edge, and the layout of elements should be mirrored.

FAB menus can contain 2–6 items. These should be closely related under a single action, like **Share**. 
Avoid grouping unrelated actions in the same FAB menu.

[DO] A FAB menu with 5 options on a photo gallery UI.

[DON'T] A FAB menu with 1 option on a photo gallery UI.

When a FAB is paired with other components, like the floating toolbar or navigation rail, don’t use the FAB menu. This prevents cognitive overload and interface clutter.

[DO] A toolbar with a FAB directly next to it.

[DON'T] A toolbar with a FAB menu next to it.

##### Color sets
FAB menus have three color sets: primary, secondary, and tertiary. Use the color set that best matches the FAB color style.   
Use the primary FAB menu color set with the **primary** or **primary container** FAB color styles.

Use the secondary FAB menu color set with the **secondary** or **secondary container** FAB color styles.

Use the tertiary FAB menu color set with the **tertiary** or **tertiary container** FAB color styles.

#### Anatomy

FAB menu items should always have label text. The icons shouldn’t be removed since they make each item easy to identify.

[CAUTION] A FAB menu with 3 options for selecting Food, People, or Nature. There are no icons next to the text.

[DON'T] A FAB menu with 3 options for selecting Food, People, or Nature. The options are only icons, no text.

The list item should always hug its contents and look consistent. Avoid truncating text or setting fixed widths. All FAB menu elements should be rounded.

[DO] A FAB menu used out of the box with no configurations.

[DON'T] FAB menu items are equal width despite having different lengths of text.

[DON'T] FAB menu items are square instead of round.

#### Adaptive layout

The FAB menu can open from any sized FAB. Use with a FAB size suitable for the window size class. For example, larger FABs are recommended for larger windows.

The FAB menu should remain anchored to the same corner or edge regardless of window size. 
In large and extra large windows, the FAB and FAB menu margins should increase from 16dp to 24dp.

On web, the FAB menu uses a menu component for an experience that's consistent with other desktop apps.

#### Behavior

##### Appearing
The FAB should transform into the close button of the FAB menu. The menu items should appear using the enter and exit (/m3/pages/motion-transitions/transition-patterns#e1c2a650-d7a4-4a6d-9025-e6b7845291ed) transition.
Originate the transition from one of the FAB's trailing corners, preferably the top-aligned corner.

To ensure accessibility for keyboard users on the web, avoid positioning the FAB menu to completely obscure the focus indicator of an actionable element. 

Partially covering the desired element is fine, as long as the focus indicator is visible.

[DO] FAB menu doesn’t obscure actionable element and its focus indicator.

[DON'T] FAB menu obscures both an actionable element and its focus indicator.

##### Scrolling
When window height is limited, like when viewing phones in horizontal orientation, FAB menu items can scroll. 
The items should scroll behind the close button.

##### Expanding
Any FAB menu item can expand and adapt to any shape using a container transform (/m3/pages/motion-transitions/transition-patterns#b67cba74-6240-4663-a423-d537b6d21187) transition pattern. This includes a surface that is part of the app structure, or a surface that spans the entire screen.


## Accessibility

#### Use cases

People should be able to do the following using assistive technology:

- Navigate and interact with the FAB menu
- Ensure focus is correct when navigating through the menu

#### Interaction & style

FAB menu elements meet the minimum target size of 48dp.

When the FAB menu can scroll, make sure the items scroll behind the close button. 
The close button should always be easy to access and unobstructed.

[DO] FAB menu items are scrolling behind the close button.

[DON'T] FAB menu items are scrolling in front of the close button.

#### Initial focus

When the FAB is selected, the FAB menu opens, and initial focus remains on the close button, which takes the place of the original FAB.
Then the focus moves from the top menu item to the bottom.

#### Keyboard navigation

| **Keys**
 | **Actions**
 | 
| **Tab**
 | Navigate to the next interactive element
 | 
| **Space** or **Enter**
 | Activate the focused button or item
 |

#### Labeling elements

##### Android
On Android, a FAB menu’s close button should include a state to tell screen readers what action will occur when it's toggled. The close button should be labeled: 

- Label: Toggle menu

- Role: Button

- State: Expanded or collapsed

FAB menu items should be labeled:

- Label: Match the item’s UI text, such as **Reply all **

- Role: Button

##### Web
On web, a FAB menu is a combination of a FAB and a menu component. The FAB opens the menu. Follow the accessibility guidelines for FABs (/m3/pages/fab/accessibility) and menus (/m3/pages/menus/accessibility).
The FAB's accessibility label should describe the menu that the FAB will open.
