# Side sheets

Source: https://m3.material.io/components/side-sheets


## Overview

- Use side sheets to provide optional content and actions without interrupting the main content

- Two variants: standard and modal

- People can navigate to another region within the sheet

- Side sheets can contain a back icon for navigation

#### Availability & resources

#### Differences from M2

- Right-to-left (RTL) language support with left side sheet

- Color: New color mappings and compatibility with dynamic color

- Shape: Modal side sheets have a 16dp corner radius


## Specs

#### Tokens & specs
Browse the component elements, attributes, tokens, and their values. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Standard side sheet

##### Standard side sheet color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/)

##### Standard side sheet measurements

| Attribute
 | Value
 | 
| Start/end padding
 | 24dp | 
| Padding between top elements
 | 12dp | 
| Bottom actions height
 | 72dp | 
| Bottom actions top padding
 | 16dp | 
| Bottom actions bottom padding
 | 24dp | 
| Bottom actions alignment (horizontal)
 | Left | 
| Max-width
 | 400dp | 
| Margins (when detached)
 | 16dp |

#### Modal side sheet

##### Modal side sheet color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/).

##### Modal side sheet measurements

| Attribute
 | Value
 | 
| Start/end padding
 | 24dp | 
| Start padding with icon | 16dp | 
| Padding between top elements | 12dp | 
| Bottom actions height
 | 72dp | 
| Bottom actions top padding
 | 16dp | 
| Bottom actions bottom padding | 24dp | 
| Bottom actions alignment (horizontal)
 | Left | 
| Max-width
 | 400dp | 
| Margins (when detached)
 | 16dp |


## Guidelines

#### Usage

Standard side sheets are supplementary surfaces used mostly in medium to expanded breakpoints, like tablet and desktop. They provide a consistent and predictable surface for contextual actions and information.

Standard side sheets display content that complements the screen’s primary content. They remain visible while people interact with primary content.
Common uses include:

- Displaying a list of actions that affect the screen’s primary content, such as filters

- Displaying supplemental content and features

Modal side sheets are preferred in compact breakpoints, like mobile, due to limited screen size. 
They can display the same kinds of content as standard side sheets, but must be dismissed in order to interact with the underlying content.

Side sheets have a fixed width and typically span the height of the screen. 
Their dimensions depend on how the app’s layout is subdivided into UI regions.

[DO] A modal sheet at the right of a screen, with the correct inset.

[DON'T] A modal side sheet at the right of the screen with the wrong inset.

#### Anatomy

##### Container
Side sheet containers hold all side sheet elements. Their size is determined by the space those elements occupy.
 
The container is the only required element of a side sheet.

##### Back icon button (optional)
Icon buttons can provide ways to exit a side sheet or move to a different experience.

Because the primary content behind or beside a side sheet is always visible, it’s important to provide affordances for leaving a side sheet and returning to the primary content.

##### Close icon button (optional)
A close affordance provides a consistent method for dismissing a side sheet. 
A close icon button is highly recommended, increases accessibility, and makes focused side sheets easier to close.

##### Action buttons (optional)
Buttons represent actions available from a side sheet. Examples: **Save**, **Edit**, **Download**
Use elevation, fill, and tone to call attention to specific actions.

##### Divider (optional)
Dividers can separate different kinds of content and create distinct regions in a side sheet. 

Use a divider to separate:

- Action buttons from content

- User-generated content from system-generated content

##### Content (optional)
Side sheets can display a wide variety of content and layouts, ranging from a list of actions to supplemental content in a tabular layout.

#### Adaptive design

Side sheets have a default width, but can be resized depending on the needs of the layout. 

When a standard side sheet opens, the body area shrinks to accommodate the sheet’s width while maintaining a margin on the body’s trailing edge.

##### RTL language support
In right-to-left (RTL) languages, side sheets should appear on the left edge of the window with all elements reversed.

#### Behavior

Side sheets can vertically scroll independent of the rest of the UI. 
This allows their scroll position and content to persist while the page is scrolled, and vice versa.
Side sheets cannot scroll horizontally.

[DO] Animation showing a side sheet being scrolled vertically to view all the options.

[DON'T] A side sheet appears to scroll horizontally.

##### Predictive back

On Android, a gesture called predictive back (https://github.com/material-components/material-components-android/blob/master/docs/foundations/PredictiveBack.md) allows a person to swipe left or right on the side sheet. 
When predictive back is used:

- The side sheet detaches from the top and bottom edges of the screen to signal it will close

- The previous screen is revealed in a preview

- The side sheet and its content always scales in the direction of the gesture
Find a list of compatible components (/m3/pages/gestures#22462fb2-fbe8-4e0c-b3e7-9278bd18ea0d)


## Accessibility

#### Use cases

People should be able to dismiss the side sheet using assistive technology.

#### Interaction & style

Material requires that a close affordance, such as a close icon button, is always present within a side sheet.

[DO] Side sheet correctly designed with close icon in upper right corner.

[DON'T] Side sheet incorrectly designed with no close icon button.

#### Initial focus

Actions within a side sheet can be focused by tab order using a keyboard or switch control.

#### Keyboard navigation

| Keys
 | Actions
 | 
| **Tab**
 | Focus lands on (non-disabled) icon button

 | 
| **Space** or **Enter**
 | Activates the (non-disabled) icon button
 |

#### Labeling

The accessibility role for a side sheet is **Dialog**.
