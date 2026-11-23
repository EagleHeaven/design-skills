# Switch

Source: https://m3.material.io/components/switch


## Overview

- Use switches (not radio buttons) if the items in a list can be independently controlled

- Switches are the best way to let people adjust settings

- Make sure the switch’s selection (on or off) is visible at a glance

#### Availability & resources

#### Differences from M2

- Accessibility: Visual presentation is more accessible

- Color: New color mappings meet Material's non-text-contrast requirements in addition to compatibility with dynamic color

- Icons: Ability to have an optional icon within the switch handle

- Layout: Track is taller and wider


## Specs

#### Tokens & specs

Browse the component elements, attributes, tokens, and their values. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/)

##### Adjacent text label color
Use the color role **on surface** for adjacent text labels. This remains the same even if interacting with the label or component.

#### States
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states)

State specs are in the token module above (/m3/pages/switch/specs#3708644e-b4d7-4237-bb0a-7afeeae4a9b0)

#### Measurements

| Element
 | Attribute
 | Value
 | 
| Track
 | Height
 | 32dp
 | 
| Width
 | 52dp
 | 
| Outline width
 | 2dp
 | 
| Shape
 | md.sys.shape.corner.full (/m3/pages/shape/corner-radius-scale#56e2bfb5-4bec-49bd-b3a3-bd822c8ab88e)
 | 
| Handle
 | Height (unselected)
 | 16dp
 | 
| Height - with icon
 | 24dp
 | 
| Height (selected)
 | 24dp
 | 
| Height (pressed)
 | 28dp
 | 
| Width (unselected)
 | 16dp
 | 
| Width - with icon
 | 24dp
 | 
| Width (selected)
 | 24dp
 | 
| Width (pressed)
 | 28dp
 | 
| Shape
 | md.sys.shape.corner.full (/m3/pages/shape/corner-radius-scale#56e2bfb5-4bec-49bd-b3a3-bd822c8ab88e)
 | 
| State layer
 | Size
 | 40dp
 | 
| Shape
 | md.sys.shape.corner.full (/m3/pages/shape/corner-radius-scale#56e2bfb5-4bec-49bd-b3a3-bd822c8ab88e)
 | 
| Target
 | Size
 | 48dp
 | 
| Icon
 | Size (selected)
 | 16dp
 | 
| Icon
 | Size (unselected)
 | 16dp
 |

#### Configurations

- Without icons
- Icon on selected switch
- Icon on selected and unselected switch


## Guidelines

#### Usage

Switches are best used to adjust settings and other standalone options. 
They make a binary selection:

- On and off

- True and false
The effects of a switch should start immediately, without needing to save.

Use switches to:

- Toggle a single item on or off
- Immediately activate or deactivate something

Switches control binary options, not opposing ones. A binary option represents a single selection that's either on or off.
Opposing options are when only one option in a set can be selected at a time, like a list or map view. Use a connected button group instead.

[DO] A connected button group with options of List View and Map View.

[DON'T] A switch with non-binary options of List View and Map View.

##### Alternate selection controls
Checkboxes, radio buttons, and switches are the three main kinds of selection controls. They help people make choices, like selecting options or turning settings on and off.
Use checkboxes to select multiple related options in a list.
Use radio buttons to select a single option in a list.
Use switches to select standalone or more verbose options in a list, like settings.

[DO] Mobile screen with checkboxes to select list items and call to action button to update the list.

[DON'T] Mobile screen with checkboxes to select list items and call to action switch to update the list.

[DO] Radio buttons used to select a language for a mobile app.

[DON'T] Mobile screen with switches to select list items and call to action button to update the list.

#### Anatomy

##### Icon (optional)
The switch handle can contain an optional icon.

Icons can be used to visually emphasize the switch’s selection. The icon’s meaning should be clear and unambiguous to help the people understand whether switch is on or off.

[DO] 2 switches, the unselected state icon is an X, and the selected state is a checkmark.

[DON'T] A switch’s unselected handle icon is a moon and the selected state icon is a pencil.

##### Label text
Switches should always be paired with an inline label describing what the switch controls when selected.

[DO] Switch label text: 1. Permission manager, App has access to your data. 2. Camera access, app has access to your camera. 3. Show password.

[DON'T] On a mobile screen’s privacy settings, 2 switches have “On” label text and checkmark icons. The last switch has “Off” label text and no icon.

#### Placement

Switches are often arranged in stacked layouts.

#### Behavior

A switch is successfully toggled when the handle slides to the other side of the track after an interaction.

When a person toggles a switch, its handle size changes and the corresponding action takes effect immediately.


## Accessibility

#### Use cases
People should be able to do the following with assistive technology:

- Navigate to a switch with a keyboard or switch input

- Toggle the switch on and off

- Get appropriate feedback based on input type documented under Interaction & style (/m3/pages/switch/accessibility#c0e9fae1-48df-428b-b028-4f7be071ada3)

#### Interaction & style

The switch handle increases in size to indicate interactivity for both touch and cursor control interactions.
**Touch**
When tapped or dragged, the handle size grows, providing interaction feedback.
**Cursor**
When hovered (in both on and off states), the hover area grows, providing a visual cue that the handle is interactive. When clicked, the handle size grows.

##### Avoid applying density by default
Don't apply density to switches by default — this lowers their targets below our best practice of 48x48 CSS pixels. Instead, give people a way to choose a higher density, like selecting a denser layout or changing the theme.
To ensure that this density setting can easily be reverted when it's active, keep all targets to change it at a minimum 48x48 CSS pixels each.

#### Initial focus

Initial focus lands directly on the switch’s handle, since it’s the primary interactive element of the component.

#### Keyboard navigation

| Keys | Actions | 
| **Tab** | Focus lands on the switch handle | 
| **Space **or** Enter** | Toggles the handle on and off |

#### Labeling elements

The accessibility label for a switch uses the adjacent label text if implemented correctly. 
Assistive tech such as a screen reader will read the UI text followed by the component’s role.

When the visible UI text is ambiguous, accessibility labels need to be more descriptive. For example, a switch visibly labelled **Photo album** would benefit from additional information to clarify the switch’s function.
Consider making the adjacent label text more descriptive when possible. This reduces the need for different accessibility text.
