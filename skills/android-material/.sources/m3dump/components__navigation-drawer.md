# Navigation drawer

Source: https://m3.material.io/components/navigation-drawer


## Overview

starNote:The navigation drawer is no longer recommended in the Material 3 Expressive update. For those who have updated, use an expanded navigation rail (/m3/pages/navigation-rail/overview/), which has mostly the same functionality of the navigation drawer and adapts better across breakpoints.

- Use standard navigation drawers in expanded, large, and extra-large breakpoints

- Use modal navigation drawers in compact and medium breakpoints 

- Can be open or closed by default

- Two variants: standard and modal

- Put the most frequent destinations at the top and group related destinations together

#### Availability & resources

#### M3 Expressive update

**May 2025**
The navigation drawer is no longer recommended. Use the expanded navigation rail instead. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color

- Variants: Distinguishes two separate variants of navigation drawer: Standard and modal

- Shape: Rounded corners at the ending edge of the drawer

- States: Updated color and shape for indicating selected state


## Specs

starNote:The navigation drawer is no longer recommended in the Material 3 Expressive update. For those who have updated, use an expanded navigation rail (/m3/pages/navigation-rail/overview/), which has mostly the same functionality of the navigation drawer and adapts better across breakpoints.

#### Tokens & specs

The navigation drawer has one token set. Learn about design tokens (/m3/pages/design-tokens/overview/)

#### Color

Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

For divider color roles, go to divider specs (/m3/pages/divider/specs).

#### States
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states/overview)

State specs are in the tokens module above (/m3/pages/navigation-drawer/specs#6207b00f-a259-41d2-8146-b6efc6380976)

#### Measurements

##### Standard navigation drawer

| Attribute | Value | 
| Container height
 | 100% | 
| Container width
 | 360dp | 
| Container shape
 | 0,16,16,0dp corner radii | 
| Icon size
 | 24dp | 
| Active indicator height
 | 56dp | 
| Active indicator shape
 | 28dp | 
| Active indicator width
 | 336dp | 
| Horizontal label alignment
 | Start-aligned | 
| Left padding
 | 28dp | 
| Right padding
 | 28dp | 
| Active indicator padding
 | 12dp | 
| Padding between elements
 | 0dp |

##### Modal navigation drawer

| Attribute | Value | 
| Container height
 | 100% | 
| Container width
 | 360dp | 
| Icon size
 | 24dp | 
| Active indicator height
 | 56dp | 
| Active indicator shape
 | 28dp | 
| Active indicator width
 | 336dp | 
| Horizontal label alignment
 | Start-aligned | 
| Left padding
 | 28dp | 
| Right padding
 | 28dp | 
| Active indicator padding
 | 12dp | 
| Padding between elements
 | 0dp |


## Guidelines

starNote:The navigation drawer is no longer recommended in the Material 3 Expressive update. For those who have updated, use an expanded navigation rail (/m3/pages/navigation-rail/overview/), which has mostly the same functionality of the navigation drawer and adapts better across breakpoints.

#### Usage

Navigation drawers provide access to destinations and app functionality, such as switching accounts. They can either be permanently on-screen or opened and closed by a navigation menu icon. One navigation destination is always active.
Navigation drawers are recommended for:

- Apps with 5 or more top-level destinations
- Apps with 2 or more levels of navigation hierarchy
- Quick navigation between unrelated destinations
- Replacing the navigation rail or navigation bar on large screens

[DO] Navigation drawer with multiple destinations in a mail app.

Avoid using a navigation drawer with other primary navigation components, such as a navigation bar.
Instead, choose a single navigation component based on product requirements and breakpoints:

- Navigation bars for compact breakpoints

- Navigation rails for medium and expanded breakpoints 

- Standard navigation drawers for expanded, large and extra-large breakpoints

[CAUTION] Standard navigation drawer and navigation bar used together.

There are two variants of navigation drawers:

- Standard navigation drawer

- Modal navigation drawer

##### Standard navigation drawer

Standard navigation drawers provide access to drawer destinations and app content for layouts in expanded, large, and extra-large breakpoints. 
Standard drawers can be permanently visible (best for frequently switching destinations) or opened and closed by tapping a menu icon (best for focusing more on screen content).
In medium and compact breakpoints, use modal drawers instead.

##### Modal navigation drawer

Modal navigation drawers use a scrim to block interaction with the rest of an app’s content, and don’t affect the screen’s layout grid.
Modal navigation drawers can be used in any breakpoint, but are primarily used in compact and medium sizes where space is limited or prioritized for app content.
They can be swapped with standard drawers on expanded, large, and extra-large breakpoints.

Modal navigation drawers are always opened by an action outside of the drawer, such as clicking a navigation menu icon in a navigation rail.
Modal drawers can be dismissed by:

- Selecting a drawer item
- Tapping the scrim
- Swiping toward the drawer’s anchoring edge (for example, swiping right-to-left for a left-aligned navigation drawer)

Modal drawers can be dismissed by tapping the scrim or swiping the drawer toward its anchoring screen edge.

#### Anatomy
Navigation drawers are essentially a list contained within a side sheet. They can also include headers, subheads, and dividers to organize longer lists.

##### Sheet
A sheet holds all navigation drawer elements. Side sheets are used as the container for standard and modal navigation drawers.
Navigation drawers that open from the side are always placed on the start edge of the screen, on the left for left-to-right (LTR) languages, and on the right for right-to-left (RTL) languages.

[DO] Modal navigation drawer opening from left side of screen.

##### Divider (optional)
Dividers can be used to separate groups of destinations within the navigation drawer.

[DO] Navigation drawer using horizontal dividers to separate a group of destinations

[DON'T] Navigation drawer using horizontal dividers to separate individual destinations

##### Active indicator
The active indicator is a background shape communicating which destination of the navigation drawer is currently being displayed.

##### Label text and icons
Destinations in a navigation drawer take the form of actionable list items. Each item describes its destination using label text and an optional icon.

Label text should be clear and short enough that it isn’t cut off by the sheet.

[DO] Navigation drawer with 1 truncated text label.

[DON'T] Navigation drawer with 1 text label with wrapped label text.

[DON'T] Navigation drawer with 1 text label featuring smaller text.

Icons can supplement labels as indicators of a destination. When used, they should always be placed before text. Other app components and content should reference these icons.

[DO] Navigation drawer with active destination “Inbox” featuring recognizable icon.

[DON'T] Navigation drawer with 4 destinations, 2 with text label and icon, 2 with only text label.

##### Section label (optional)
Short subhead section labels can help group related destinations in the navigation drawer.

##### Scrim (modal only)
Modal navigation drawers use a scrim to block interaction with the rest of the app. The scrim is placed directly behind the drawer’s sheet and can be tapped or clicked to dismiss the drawer.

#### Responsive layout

A product’s navigation component should change to suit the breakpoint and form factor of the screen.
Modal navigation drawers can be used at any breakpoint but are most common in compact and medium breakpoints.
Standard navigation drawers are best for expanded, large, and extra-large breakpoints. 
Use a transition when swapping components. For example, when switching from a portrait to landscape layout, the navigation rail should transform into a navigation drawer.

##### Compact breakpoint
Use modal navigation drawers in compact breakpoints. Or swap the drawer for a navigation bar.
On web, when the screen size is smaller than 320 CSS pixels, swap the navigation drawer for a navigation bar to ensure accessibility.

##### Medium & expanded breakpoints
Use a modal navigation drawer alone or with a navigation rail on medium and expanded breakpoints.
When a navigation rail and modal navigation drawer are used together, the drawer can repeat destinations in the navigation rail as long as the drawer offers enough visual separation between levels of the navigation hierarchy.
A standard navigation drawer can be used in single pane layouts (/m3/pages/understanding-layout/parts-of-layout) in expanded breakpoints.

##### Large and extra-large breakpoints
For web experiences on laptop and desktop devices, use either a standard navigation drawer, or a navigation rail that transitions into a modal navigation drawer.

#### Behavior

##### Scrolling
Navigation drawers can be vertically scrolled, independent of the rest of the screen’s content and UI. If the list of navigation destinations is longer than the height of the drawer, the drawer’s contents can be scrolled within the drawer.

##### Visibility
**Dismissible standard drawers** can be used for layouts that prioritize content (such as a photo gallery) or for apps where users are unlikely to switch destinations often. They should use a visible navigation menu icon to open and close the drawer.

Permanently visible standard drawers allow quick navigation between unrelated destinations. They can’t be closed or dismissed by the user.

##### Appearing
When a navigation drawer animates on screen, it uses an enter and exit (/m3/pages/motion-transitions) transition pattern.


## Accessibility

starNote:The navigation drawer is no longer recommended in the Material 3 Expressive update. For those who have updated, use an expanded navigation rail (/m3/pages/navigation-rail/overview/), which has mostly the same functionality of the navigation drawer and adapts better across window size classes.

#### Use cases

Users should be able to: 

- Move between navigation destinations with assistive technology
- Select a particular navigation destination from a set
- Get appropriate feedback based on input type

#### Interaction & style

**Touch**

- When a navigation item is tapped, the active indicator appears in place, providing feedback to the user that it is selected
- A touch ripple passes through the indicator
- The icon switches from outlined to filled
- The icon changes color, becoming darker

**Cursor**

- When hovered, the hover indicator appears providing a visual cue that the destination is interactive
- When clicked, a ripple passes through the indicator
- The icon switches from outlined to filled
- The icon changes color, becoming darker in light theme and lighter in dark theme, to increase the contrast

#### Initial focus

Initial focus lands directly on the first navigation item, since that is the first interactive element of the component.

#### Closing

The modal navigation drawer can be dismissed by selecting the scrim that covers the rest of the screen.

#### Visual indicators

Icons are the primary focus of the navigation and such give the dominant cue of its state. Use a filled icon for the selected destination to differentiate from the outlined icons of non-selected destinations.

[DO] A navigation drawer with the home destination using a filled icon.

[DON'T] A navigation drawer with the home destination using an outlined icon.

#### Keyboard navigation

| **Keys** | **Actions** | 
| Tab | Focus lands on the first navigation destination  | 
| Space or Enter | Selects the focused navigation destination, and focus moves to the newly opened section (if applicable) | 
| Arrow | Navigate between destinations within the navigation drawer |

#### Labeling elements

The accessibility label for a navigation item is typically the same as the destination name.

If the UI text is correctly linked, assistive tech (such as a screenreader) will read the UI text followed by the component’s role.

For Android Views (MDC-Android), a more descriptive accessibility label is not available to be set and the role is not announced.

When the visible UI text is ambiguous, accessibility labels need to be more descriptive. For example, a navigation destination visibly labeled **Recents** would benefit from additional information in its accessibility label to clarify the destination’s intent.
