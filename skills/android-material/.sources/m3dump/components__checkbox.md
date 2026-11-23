# Checkbox

Source: https://m3.material.io/components/checkbox


## Overview

- Use checkboxes (instead of switches or radio buttons) if multiple options can be selected from a list
- Label should be scannable
- Selected items are more prominent than unselected items

#### Availability & resources

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color

- States: New indeterminate states as well as error states for unselected, selected, and indeterminate


## Specs

#### Tokens & specs
Browse the component elements, attributes, tokens, and their values.

#### Checkbox

#### Color

Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Adjacent text label color
Use the color role **on surface** for adjacent text labels. This remains the same even if interacting with the label or component.

#### States

States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states/overview)

#### Measurements

| Attribute | Value | 
| Container size
 | 18dp
 | 
| Container corner shape
 | 2dp
 | 
| Icon size
 | 18dp
 | 
| Icon alignment
 | Center-aligned
 | 
| Target size
 | 48dp
 | 
| State-layer size | 40dp |


## Guidelines

#### Usage

Use checkboxes to: 

- Select one or more options from a list
- Present a list containing sub-selections
- Turn an item on or off in a desktop environment
- Visually group similar options together

Checkboxes should be used instead of switches if multiple, related options can be selected from a list. Checkboxes visually group similar items effectively and take up less space than switches.

[DO] List indicating choice with checkbox selection.

[DON'T] A list with multiple switches selected.

##### Alternate selection controls
Checkboxes, radio buttons, and switches are the three main  selection controls. They all help people make choices, like selecting options or switching settings on or off.

- Use checkboxes to select multiple related options in a list.

- Use radio buttons to select a single option in a list.

- Use switches to select standalone or more verbose options in a list, like settings.

#### Anatomy

#### Responsive layout

In expanded breakpoints, placing checkboxes within a contained region such as a side sheet can help group related controls and available actions.

#### Behavior

Multiple checkboxes in a list can be selected.

Checkboxes can have a parent-child relationship with other checkboxes.

- When the parent checkbox is checked, all child checkboxes are checked
- If a parent checkbox is unchecked, all child checkboxes are unchecked
- If some, but not all, child checkboxes are checked, the parent checkbox becomes an indeterminate checkbox. Checking an indeterminate checkbox checks all child items.

When selected, a checkbox clearly and instantly communicates its selected state.
If used to turn something on or off, the action should be immediately executed.


## Accessibility

#### Use cases

People should be able to use assistive technology to:

- Navigate to a checkbox   

- Toggle the checkbox on and off

- Get appropriate feedback based on input type documented under Interaction & style (/m3/pages/checkbox/accessibility#6a2f55e5-2fa0-4204-b6d1-62362dda89c7)

#### Interaction & style

Users should be able to select either the text label or the checkbox to select an option.

The parent checkbox has three states: selected, unselected, and indeterminate. 
Checkboxes can be selected or unselected regardless of the state of the other checkboxes in a group. 
If some, but not all, child checkboxes are checked, the parent checkbox becomes indeterminate. Selecting an indeterminate parent checkbox will check all of its child checkboxes.

#### Avoid applying density by default

Don't apply density to checkboxes by default — this lowers their targets below our best practice of 48x48 CSS pixels. Instead, give people a way to choose a higher density, like selecting a denser layout or changing the theme.
To ensure that this density setting can be easily reverted when it's active, keep all the targets to change it at minimum 48x48 CSS pixels each.

#### Keyboard navigation

| Keys | Actions | 
| **Tab** | Moves focus to enabled chip or chip group | 
| **Space** or **Enter** | Activates, selects, or deselects the focused chip | 
| **Backspace** or **Delete** | Removes currently focused input chip | 
| **Arrows** | Moves focus between chips |

#### Labeling elements

If the UI text is correctly linked to the checkbox, assistive tech (such as a screen reader) will read the UI text followed by the component’s role.
The accessibility label for an individual checkbox is typically the same as its adjacent text label.
