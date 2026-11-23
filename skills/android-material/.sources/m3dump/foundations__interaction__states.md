# States

Source: https://m3.material.io/foundations/interaction/states

States show the interaction status of a component or UI element


## Overview

- States have two visual indicators to ensure accessibility
- States can be combined, such as selection and hover
- Apply states consistently across components

#### Resources

| Type | Link | Status | 
| Design | Design Kit (http://goo.gle/m3-design-kit) | Available |

1. Enabled
 (/m3/pages/interaction-states/applying-states#39b2fc90-01db-41b5-b6f8-47be61ed1479)An enabled state communicates an interactive component or element.
2. Disabled (/m3/pages/interaction-states/applying-states#4aff9c51-d20f-4580-a510-862d2e25e931)
A disabled state communicates an inoperable component or element.

3. Hover (/m3/pages/interaction-states/applying-states#71c347c2-dd75-485b-892e-04d2900bd844)
A hover state communicates when a user has placed a cursor above an interactive element.
4. Focused (/m3/pages/interaction-states/applying-states#bc6d6853-48ef-490e-8076-448e89e69f0f)
A focused state communicates when a user has highlighted an element, using an input method such as a keyboard or voice.

5. Pressed (/m3/pages/interaction-states/applying-states#c3690714-b741-492d-97b0-5fc1960e43e6)
A pressed state communicates a user tap.
6. Dragged (/m3/pages/interaction-states/applying-states#c97582c4-5fef-42ce-9c34-71f8dcc5b8ad)
A dragged state communicates when a user presses and moves an element.


## State layers

#### State layers

A state layer is a semi-transparent covering on an element that indicates its state. State layers provide a systematic approach to visualizing states by using opacity. A layer can be applied to an entire element or in a circular shape and only one state layer can be applied at a given time.

To transition from an enabled style to a stateful style requires the addition of a state layer. 
The state layer is an overlay with a fixed opacity for each state and uses the same color as the content. 
For example, if the enabled style uses the **secondary container** color for the container and **on secondary container** for content, the state layer will be an overlay using the **on secondary container** color.  
If the enabled style uses the **surface** color for the container and the **primary** color role for content, then the state layer will be an overlay using the **primary** color.

The size of state layers is 40dp while the interactive target size is 48dp.

##### On colors
By default, a component’s state layer color is derived from the color of its content, either the color of an icon or label text if no icon is present.
An on color (/m3/pages/color-roles#19e75989-7485-4f5b-a769-940c4e4364bc) is a color role used by the content. Each container color has its own corresponding on color. For example, if a container color is **secondary container**, the content will use the **on secondary container** color role.

##### State layer tokens & values
The state layer uses a fixed percentage for the opacity for each state. A state layer uses the color used by content (usually the on color (/m3/pages/color-roles#19e75989-7485-4f5b-a769-940c4e4364bc)) and the percentage opacity for its respective state.


## Applying states

#### Enabled

An enabled state communicates an interactive component or element. Enabled states use the default styling for each interactive component.

#### Disabled

A disabled state communicates when a component or element isn’t interactive. This state is visually communicated through color changes and reduced elevation.
**Disabled states don't need to meet Material's contrast requirements.**

Disabled states **are** inherited by action, selection, and input components:

- Buttons
- Cards
- Checkboxes
- Chips
- List items
- Radio buttons
- Switches
- Text fields

Disabled states **aren't** inherited by communication, containment, navigation, and some actions components: 

- App bars
- Badges
- Dialogs
- Floating action buttons (FABs)
- Menus
- Navigation bar, drawer, and rail
- Sheets
- Tabs
- Tooltips

[DON'T] Screen erroneously showing edit FAB in inoperable state, though the edit function is unavailable.

##### Behavior
Disabled components can’t be focused, dragged, or pressed, and they don’t change state when tapped or hovered over.

There can be any number of disabled states in a layout.

#### Hover

Hover states are initiated by the user pausing over an interactive element using a cursor.
The lower-emphasis surface overlay for hover states can be applied to the entire component, elements within a component, or as a circular shape over part of the component.

Hover states **are** inherited by action, selection, and input components:

- Buttons
- Cards
- Checkbox
- Chips
- Date and time pickers
- List items
- Slider
- Switch
- Text fields

Hover states **aren’t** inherited by communication, containment, or navigation components: 

- App bars
- Badges
- Dialogs
- Menus
- Navigation bar, drawer, and rail
- Sheets
- Tabs

[DON'T] Mobile screen with the whole  app bar wrongly in hover state.

##### Behavior
Hover states are initiated by the user pausing over an interactive element using a cursor.

Hover states can be combined with focused, activated, selected, or pressed states.

There can only be one hover state at a time in a layout.

#### Focused

A focused state communicates when a user has highlighted an element using a keyboard or voice. Focus states apply to all interactive components.
The higher-emphasis surface overlay for focused states can be applied to the entire component, elements within a component, or as a circular shape over part of the component.

Focus states **are** inherited by action, selection, and input components:

- Buttons
- Cards
- Checkbox
- Chips
- Date and time pickers
- List items
- Selection controls
- Text fields

Focus states **aren’t** inherited by most communication, containment, or navigation components:

- App bars
- Badges
- Banner
- Card
- Dialogs
- Navigation bar, drawer, and rail
- Sheets

[DON'T] Mobile screen showing  entire app bar in focus state, which is an error.

##### Keyboard focus indicator
Many people use the **Tab** key or other shortcut to navigate the interactive elements of a web page, like links, buttons, and chips.
When an element is tabbed to, it appears in its focused state with a ring-like **keyboard focus indicator**. This indicator helps web users know where they are on the page.
While focused, an element can be acted on with the keyboard.

##### Behavior
Focus states are initiated by the user by pressing the **Tab **key on the keyboard (or equivalent).
Focus states can be represented in combination with hover, activated, or selected states.

There can only be one focus state at a time in a layout.

#### Pressed

A pressed state communicates a user-initiated tap or click via cursor, keyboard, or voice input. This state applies to all interactive components.
Pressed states trigger a change in composition and should be high-emphasis.
A ripple overlay signifies a pressed state. It can be applied to an entire component or elements within a component, or as a circular shape over part of the component.

Some components, such as buttons or cards, can inherit elevation to signify a pressed state.

Pressed states **are** inherited by action, selection, and some containment components: 

- Buttons
- Cards
- Checkbox
- Chips
- List items
- Text fields

Pressed states **aren’t** inherited by communication, navigation, or some containment components: 

- App bars
- Badges
- Bottom navigation
- Dialogs
- Menus
- Sheets
- Tabs

[DON'T] Mobile screen showing  entire app bar in pressed state is an error.

##### Behavior
Pressed states are initiated by user keyboard or voice input on an interactive element.

Pressed states can be combined with hovered, focused, activated, or selected states.

There may only be a single pressed state at a time in a layout.

#### Dragged

A dragged state occurs when a user presses and moves an element or component. Dragged states should be low emphasis, to avoid distracting users from their task.
Dragged states use a lower emphasis overlay. It can be applied to the entire component or to elements within a component.
Some components, such as list items, chips, or cards, can inherit elevation to signify a dragged state.

Dragged states **are** inherited by some containment and selection components: 

- Cards
- Chips
- List items
- Sliders

Dragged states **aren’t** inherited by action, communication, navigation, or some containment components: 

- App bars
- Badges
- Buttons
- Dialogs
- Menus
- Navigation bar, drawer, and rail

[DON'T] Mobile screen with app bar in dragged state is an error.

##### Behavior
Dragged states are initiated when users touch and hold elements, using an input method such as a tap or click.

There may only be a single dragged state at a time within a layout.
