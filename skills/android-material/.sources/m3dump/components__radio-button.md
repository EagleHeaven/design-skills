# Radio button

Source: https://m3.material.io/components/radio-button


## Overview

- Use radio buttons (not switches) when only one item can be selected from a list
- Label should be scannable
- Selected items are more prominent than unselected items

#### Resources & availability

#### What’s new

- Color: New color mappings and compatibility with dynamic color


## Specs

#### Tokens & specs
Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Color

Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Adjacent text label color
Use the color role **on surface** for adjacent text labels. This remains the same even if interacting with the label or component.

#### States
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states/overview)

State specs are in the token module above (/m3/pages/radio-button/specs#3eef19a6-cdcb-4ecf-b1af-2b8095d485ac)

#### Measurements

| Attribute
 | Value
 | 
| Icon size
 | 20dp | 
| State layer size
 | 40dp | 
| Target size
 | 48dp |


## Guidelines

#### Usage

Radio buttons are the recommended way to allow users to make a single selection from a list of options. 
Only one radio button can be selected at a time.

Use radio buttons to:

- Select a single option from a set
- Expose all available options

[DO] Filter page with 4 sort by options as radio buttons. Relevance is selected.

[DO] Meal options page with the Additions item selected, along with 4 nested checkboxes for selecting various toppings. All checkboxes are selected.

Avoid nesting radio buttons or using radio buttons to select multiple options.

[DON'T] Selected radio button with 2 nested radio buttons.

[DON'T] 2 radio buttons selected at once from a list of 3 buttons.

##### Alternate selection controls
Radio buttons are one of several selection controls, which allow people to make choices such as selecting options or switching settings on or off.
Switches and checkboxes are alternative selection controls that can be used to change settings or preferences.

Use radio buttons when there are five or fewer options.
Consider using a drop-down menu instead of radio buttons when it’s important to save space on a screen. However, drop-down menus require additional steps for a person, both in the number of clicks and cognitive effort.

[DO] A filter UI with 1 radio button selected from a list of 3 buttons.

[DO] A dropdown menu with a list of 4 options.

#### Anatomy

##### Adjacent label text
Always pair radio buttons with an adjacent label describing what the radio button selects.
Because only one radio button can be selected at a time, each choice must have its own label.

#### Placement

Radio buttons are often arranged in stacked layouts.

Radio buttons should be vertically listed and have one option always selected.

[DO] 3 radio buttons with 1 option selected.

[CAUTION] 2 radio buttons side by side with 1 option selected.

#### Behavior

A radio button is successfully selected when a person clicks or taps either the radio button icon or the label.


## Accessibility

#### Use cases
People should be able to do the following with assistive technology:

- Navigate to a radio button

- Select a radio button

- Get appropriate feedback based on input type

#### Interaction & style
A radio button can be either selected or unselected. Selecting one radio button deselects any others. A radio group can start with one radio button selected, or none selected.
Once a radio button is selected, the group can’t be deselected. To let people opt out of their selection, either provide a **Not applicable** or **No option** radio button, or provide a separate way to deselect all radio buttons, like **Clear selection**.
People should be able to select either the text label or the radio button to select an option.

##### Avoid applying density by default
Don't apply density to radio buttons by default. This lowers their targets below Material's recommendation of 48x48 CSS pixels. Instead, give people a way to choose a higher density, like selecting a denser layout or changing the theme.
To ensure this density setting can be easily reverted when it's active, keep all targets to change it at a minimum of 48x48 CSS pixels each.

#### Initial focus

When outside the radio group, **Tab** moves focus directly to the selected radio button, or the first one if none are selected. 
**Shift+Tab** instead focuses on the last radio if none are selected. 
Use the **arrows** to navigate between options.

#### Keyboard navigation

| Keys | Actions | 
| **Tab** | Moves focus into the group to the selected radio button, or the first if none are selected | 
| **Shift** + **Tab** | Moves focus into the group to the selected radio button, or the last if none are selected | 
| **Arrows** | Moves focus and selects the previous or next radio button. Wraps focus and selection between the first and last radio buttons. | 
| **Space** | Selects a focused radio button. If already selected, does nothing. |

#### Labeling elements

If the UI text is correctly linked to the radio button, assistive tech such as a screenreader will read the UI text, followed by the component’s role.
The accessibility label for a group of radio buttons is typically the same as its title. The role is **Radio group**.

The accessibility label for an individual radio button is typically the same as its adjacent text label.
