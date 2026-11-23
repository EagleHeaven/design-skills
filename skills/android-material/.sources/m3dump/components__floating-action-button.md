# FABs

Source: https://m3.material.io/components/floating-action-button


## Overview

- Use a FAB for the most common or important action on a screen

- Make sure the icon in a FAB is clear and understandable

- FABs persist on the screen when content is scrolling

- Three variants: FAB, medium FAB, large FAB

#### Availability & resources

#### M3 Expressive update

**May 2025**
The FAB has new sizes to match the extended FAB and more color options. The small FAB is no longer recommended. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

Variants and naming:

- Added **medium** FAB size

- **Small** FAB size is no longer recommended

- FAB and large FAB sizes are unchanged

- FAB variants are based on size, not color
Color:

- Added tone color styles: 

- Primary

- Secondary

- Tertiary

- Renamed existing tonal color styles to match their token names: 

- **Primary** to **Primary container**

- **Secondary** to **Secondary container**

- **Tertiary** to **Tertiary container**

- The values haven't changed

- Surface color FABs  are no longer recommended

#### Differences from M2


## Specs

#### Variants

##### Baseline variants
The small FAB is still available, but no longer recommended. Jump to baseline specs (/m3/pages/fab/specs#cd336045-e97d-4a6d-ac23-f778fa695e3c)

| Variant
 | M3
 | M3 Expressive
 | 
| FAB
 | Available
 | Available
 | 
| Medium FAB
 | --
 | Available
 | 
| Large FAB
 | Available
 | Available
 | 
| Small FAB
 | Available
 | Not recommended.
Use a larger size.
 |

#### Configurations

In the expressive update, the **primary**, **secondary**, and **tertiary** set colors were renamed to **primary container**, **secondary container**, and **tertiary container **to match the actual color roles used. New primary, secondary, and tertiary color styles were created to match the corresponding color roles. View details in the color styles section (/m3/pages/fab/specs#67e71ec7-b520-405a-aa06-2decfa0b92a3)

| Category
 | Configuration
 | M3
 | M3 Expressive
 | 
| Color
 | Primary container, secondary container, tertiary container
 | Available as primary, secondary, tertiary
 | Available
 | 
| Primary. secondary, tertiary
 | --
 | Available
 |

#### Tokens & specs
Use the table's menu to select a token set. FAB tokens are organized by size and color. Learn more about design tokens (/m3/pages/design-tokens/overview/)

#### Anatomy

#### Color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. In implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens)

##### Color styles
FABs can use several combinations of **color** and **on-color** styles, such as **primary** and **on-primary**. The following color mappings provide the same legibility and functionality, so the color mapping you use depends on style alone.

##### Baseline color styles

Surface FAB color styles are still available, but no longer recommended.

#### States
States are visual representations used to communicate the status of a component or interactive element.

When using a non-default color mapping for FABs, make sure the state layer color is the same as the icon color. For example, the state layer color for the **primary** color style should be md.sys.color.primary.

#### Measurements

##### FAB

##### Medium FAB

##### Large FAB

#### Baseline tokens & specs

Use the table's menu to select a token set. This only includes tokens for small and surface FABs, which are both no longer recommended. It doesn't include other colors, or large or regular FABs, since those are still currently used.


## Guidelines

#### Usage

Use a FAB for the most important action on a screen; it appears in front of all other content.

The FAB can be aligned left, center, or right. It can be positioned above the navigation bar, or nested within it.

There are three FAB sizes:

- FAB

- Medium FAB (most recommended)

- Large FAB
Choose the FAB size based on the visual hierarchy of your layout. 

Note: The small FAB is no longer recommended.

The FAB is the smallest size, and is best used in compact windows where other actions may be present on screen.

The medium FAB is recommended for most situations, and works best in compact and medium windows. Use it for important actions without taking up too much space. 

A large FAB is useful in any window size when the layout calls for a clear and prominent primary action, but is best suited for expanded and larger breakpoints, where its size helps draw attention.

[DO] A photo feed with no FAB.

[DON'T] A screen with 3 FABs makes it hard to tell what the primary action should be.

A FAB can transform into an extended FAB on larger screens, or it can transition into a FAB menu when selected. Use a FAB menu when there are many kinds of actions relevant to the FAB. 
More on FAB menus (/m3/pages/fab-menu)

#### Actions

A FAB can trigger an action on the current screen, or it can perform an action that creates a new screen.

A FAB promotes an important, constructive action such as:

- Create
- Favorite
- Share
- Start a process

[DO] FABS for 12 common actions including, create, edit, and navigate.

Avoid using a FAB for minor or destructive actions, such as:

- Archive or trash

- Alerts or errors

- Limited tasks like cutting text

- Controls better suited to a toolbar, like to adjust volume or font color

[DON'T] FABs for 18 minor or destructive actions, such as cut, trash, and volume.

#### Anatomy

##### Container
The FAB is typically displayed in a square container. The container shouldn’t be covered by other elements, such as badges.

The container must have sufficient color contrast with the surface it’s placed on.

##### Icon
An icon in a FAB should be clear and understandable. When hovering over a FAB on web products, FABs should display a tooltip with an accompanying icon text label. Use a filled icon instead of an outlined icon.

A FAB shouldn't contain notifications or actions found elsewhere on a screen.

[DO] 4 FABs each with a simple icon.

[DON'T] 4 FABs each with an ambiguous icon.

#### Adaptive design

In compact and medium breakpoints, the best place for the FAB is typically the lower right corner of a screen, since it’s easy to reach and is less likely to cover important content.

In expanded breakpoints, consider placing the FAB in the upper left corner, like in the navigation rail. This positions it as one of the first interactive elements people see when they land on the page.

Adjust the size of the FAB based on the context. Use a medium FAB for mobile layouts, and large FAB for tablets and large screens.

[DO] A screen layout with several interactive elements. A single FAB is in the navigation rail.

[DON'T] A busy screen layout with 8 cards, each with their own FAB.

#### Behaviors

##### Appearing
When a FAB animates on screen, it expands outward from a central point. The icon within it can be animated as well.

While FABs should be relevant to screen content, they aren't attached to the surface on which content appears. FABs move separately from other UI elements because of their relative importance.

**Screen transitions 
**FABs can morph to launch related actions. When a screen changes its layout, the FAB should disappear and reappear during the transition.

**Reappearance 
**The FAB should only reappear if it's relevant to the new screen. It should reappear in the same position, if possible.

##### Expanding
The FAB can expand and adapt to any shape using a container transform transition pattern. This includes a surface that's part of the app structure, or a surface that spans the entire screen.

The FAB can also transition into a FAB menu. 

More on FAB menus (/m3/pages/fab-menu)

##### Scrolling
FABs remain in place on scroll.

Extended FABs can collapse into a FAB on scroll and expand on reaching the bottom of the view.

##### Moving across tabs
When tabs are present, the FAB should briefly disappear, then reappear when the new content moves into place. This shows that the FAB is not connected to any particular tab.

[DO] FAB blinks away and reappears with new screen content.

Don't animate the FAB with body content.

[DON'T] FAB moves horizontally when scrolling between tabs.


## Accessibility

#### Use cases

People should be able to do the following using assistive technology:

- Navigate to and activate the FAB 

- Perform an action with the FAB 

- Expand and minimize an extended FAB

#### Interaction & style

Don't disable the FAB. If the action represented in the FAB is unavailable, the FAB shouldn't appear.

Ensure the icon has a minimum 3:1 contrast ratio with the container.

[DO] FAB with highly contrasting bright container and dark icon.

[DON'T] FAB with low-contrasting dark container and dark icon.

#### Focus

Ensure the FAB is prioritized in the overall focus order to create an efficient experience for people who navigate UIs with assistive tech. 

On mobile, the focus order may start with the app bar, move to the navigation bar, and then skip past any other content on the page to land on the FAB.

Consider displaying a tooltip when the FAB is focused. This is supported on web.

#### Layout & position

To make it easier for users of screen readers to reach a primary action such as a FAB on expanded breakpoints, consider placing the FAB in the upper left region. 

However, it’s critical to test placement options with users to see if the upper left region is the best position in all browser windows. For compact and medium breakpoints, the best place for the FAB is the lower right corner of a screen.

To ensure accessibility for keyboard users on the web, avoid positioning the FAB in a way that completely obscures the focus indicator of an actionable element. 

It’s okay to partially cover the desired element, as long as the focus indicators are still visible.

[DO] FAB in the lower right region doesn’t obscure the focus indicator of an actionable icon.

[DON'T] FAB in the lower right region obscures an actionable icon and its focus indicator.

#### Keyboard navigation

| **Keys**
 | **Actions**
 | 
| **Tab**
 | Focus lands on the FAB
 | 
| **Space** or **Enter**
 | Perform the default action on an item
 |

#### Labeling elements

The accessibility label should describe the action that the button is performing, such as **Compose a new message**.
