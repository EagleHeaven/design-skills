# Segmented buttons

Source: https://m3.material.io/components/segmented-buttons


## Overview

starNote:Segmented buttons are no longer recommended in the Material 3 expressive update. For those who have updated, use the connected button group (/m3/pages/button-groups/overview/) instead, which has mostly the same functionality but with an updated visual design.

- Segmented buttons can contain icons, label text, or both

- Two variants: single-select and multi-select

- Use for simple choices between two to five items (for more items or complex choices, use chips)

#### Availability & resources

#### M3 Expressive update

**May 2025**
The segmented button is no longer recommended. Use the connected button group (/m3/pages/button-groups/overview/) instead. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

#### Differences from M2

- **Color:** New color mappings and compatibility with dynamic color

- **Icons:** Optional check icon to indicate selected state

- **Layout:** Taller container height of 40dp

- **Name and variants:** Segmented buttons were previously known as toggle buttons. They now have two official variants: single-select and multi-select.

- **Shape:** Fully rounded corners

- **Typography: **Labels use sentence case instead of all caps


## Specs

starNote: Segmented buttons are no longer recommended in the Material 3 expressive update. For those who have updated, use the connected button group (/m3/pages/button-groups/overview/) instead, which has mostly the same functionality but with an updated visual design.

#### Tokens and specs

Browse the component elements, attributes, tokens, and their values. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### States
States are visual representations used to communicate the status of a component or interactive element.  Learn more about interaction states (/m3/pages/interaction-states/overview)

##### Unselected

##### Selected

#### Measurements

| Attribute | Value | 
| Container width
 | Dynamic based on labels | 
| Segment width | Container width / total segments (Example: 1/3) | 
| Height
 | 40dp | 
| Outline width | 1dp | 
| Label alignment
 | Center | 
| Left/right padding
 | Min 12dp | 
| Padding between elements
 | 8dp | 
| Target size | 48dp |

##### Density
Density can be used in denser UIs where space is limited. Density is only applied to the height.


## Guidelines

starNote:Segmented buttons are no longer recommended in the Material 3 expressive update. For those who have updated, use the connected button group (/m3/pages/button-groups/overview/) instead, which has mostly the same functionality but with an updated visual design.

#### Usage

Segmented buttons help people select options, switch views, or sort elements.

There are 2 variants of segmented buttons:

- Single-select

- Multi-select

#### Anatomy

##### Segments
Segmented buttons can have 2-5 segments. Each segment is clearly divided and contains label text, an icon, or both.

[DO] Mobile UI of data usage screen with segmented button

[DON'T] Incorrect use of segmented button with 6 segments

##### Container
Like common buttons, segmented buttons have fully rounded corners by default.

##### Icons
Icons may be used as labels by themselves or alongside text. 
If an icon is used without label text, it must clearly communicate the option it represents.

##### Label text
Labels should be short and succinct. If a label is too long to fit within its segment, consider using an icon alone.

[DO] Segmented button with options for day, week, month

[DON'T] Segmented button with 4 segments. 3 are next to each other. The 4th is wrapped on a new line.

[DO] Segmented button with text labels reading day, week, month

[CAUTION] Segmented button with icons only labels for walking, transit, driving

[DON'T] Segmented button with 2 icon only options indicating favorite and bookmark and 3rd option with text label reading recent

#### Single-select

Use a single-select segmented button to select one option from a set, switch between views, or sort elements from up to five options. 
For example, use a single-select segmented button to choose one of a set of sizes, such as this beverage size selector.

#### Multi-select

Use a multi-select segmented button to select or sort from two to five options. Unlike single-select, selection is not required and a user may concurrently select anywhere from all to none of the options. 
For example, multi-select segmented buttons can be used to filter by price range when searching for a restaurant.

#### Placement

Segmented buttons should have adequate margins from the edge of the viewport or frame. 
On larger screens, set a maximum padding for all button segments so the set doesn't fill the screen.

[DO] Mobile UI with 2-segment segmented button and 4-segment segmented button each with same margins to the viewport edge.

[DO] Game store UI with a segmented button the proper width

[DON'T] Game store UI with a segmented button improperly spanning the entire width of the screen

Segmented buttons can be placed on other components, such as bottom sheets or full-screen dialogs.

#### Behavior

When using both icons and label text in segmented buttons, the icon label is replaced by the checkmark icon when the segment is selected.


## Accessibility

starNote:Segmented buttons are no longer recommended in the Material 3 expressive update. For those who have updated, use the connected button group (/m3/pages/button-groups/overview/) instead, which has mostly the same functionality but with an updated visual design.

#### Use cases

Users should be able to:

- Navigate to and activate segmented buttons with assistive tech
- Understand what each segment selection will do

##### Interaction & style
For keyboard navigation, **Tab** navigates to the button, and arrow keys navigate between the individual segments.
For single-select segments, **Space** or **Enter** will select or unselect the focused segment. 
For multi-select segments, **Space** or **Enter** will:

- Select an unselected segment

- Select all of the segments

- Unselect a selected segment

##### Color contrast
Segmented buttons are clusters of similar components, so the outline should have at least a 3:1 contrast ratio with the background or surface. This helps distinguish each button.
Both a checkmark icon and a color change are used to distinguish selection. Make sure color isn’t the only way to show selection.

[DO] The outline of segmented buttons on the surface passes the minimum contrast of 3:1.

[DON'T] The outline of segmented buttons on the surface fails the minimum contrast of 3:1.

##### Initial focus
Focus will start in the first segment. Depending on the direction of the language, it is either the most left or the most right segment.
For single select and multi-select, the first segment will be focused regardless of selection state.

##### Keyboard navigation

| Keys
 | Actions
 | 
| **Tab**
 | Navigate between buttons
 | 
| Arrow keys
 | Navigate inside the component
 | 
| **Space** or **Enter**
 | Activate a focused button
 |

##### Labeling elements
The accessibility label for a segmented button comes from the visible label text on such as **Relevance** and **Distance**. 

If the segmented button displays icons without label text, the accessibility label describes the action that the button is expressing, such as **Inexpensive** for one currency symbol.

Single-select segmented buttons behave like radio buttons: only one option can be selected at a time. The label is **Radiogroup**.
Multi-select buttons behave like checkboxes: more than one option can be selected. The label is **Checkbox**.
