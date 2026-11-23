# Time pickers

Source: https://m3.material.io/components/time-pickers


## Overview

- Time pickers can be placed on a page, embedded directly within lists and sheets, or presented as modals

- Use **scroll pickers** inline, **dial pickers** in a modal, and have an option to swap these to **input pickers** for text input

- Can adapt to 12-hour and 24-hour time, horizontal or vertical orientations

- Only use for selecting hours and minutes

- Make sure time can easily be selected on a mobile device

#### Availability & resources

#### M3 Expressive update

The expressive update added the scroll time picker variant, updated shapes, and updated color styling to all variants. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

starNote:In Jetpack Compose, the Expressive styling is called "vibrant"

**Oct 2026**
Variants and naming

- Added **scroll time picker**

- Updated **input time picker** and **dial time picker** with expressive styles
Expressive styles

- Higher contrast on hour and minute fields, and dial selector

- Expressive button shape, color, and behavior for AM and PM buttons

- Removed **select time** label

#### Differences from M2 to M3 baseline

- Color: New color mappings and compatibility with dynamic color


## Specs

#### Expressive variants
Scroll time picker was added in the expressive update. Input and dial time pickers have updated visuals.

#### Baseline variants

Baseline variants for input time picker and dial time picker are no longer recommended. Jump to baseline time picker specs (/m3/pages/time-pickers/specs#298a79d2-01ae-42ac-bbf0-ec89cecd7d6e)

| Variant
 | M3
 | M3 Expressive
 | 
| Scroll time picker
 | --
 | Available
 | 
| Input time picker
 | Available
 | Available
 | 
| Dial time picker
 | Available
 | Available
 |

#### Configurations

##### Behavior: Inline or modal
Expressive scroll and input time pickers can be placed inline with page content. Baseline input time pickers are only available as modal.

###### Scroll time picker

###### Input time picker

###### Dial orientation: horizontal or vertical

###### Time length: 12-hour or 24-hour
24-hour time pickers don’t have the AM or PM buttons, so are have a smaller width when modal. Dial time pickers have an outer dial for 0 to 11, and an inner dial for 12 to 23.

####### Scroll time picker

####### Dial time picker

####### Input time picker

| Category
 | Configuration
 | M3
 | M3 Expressive
 | 
| Behavior
 | Inline
 | Available (input only)
 | Available (input & scroll only)
 | 
|  | Modal
 | Available
 | Available
 | 
| Time length
 | 12-hour, 24-hour
 | Available
 | Available
 | 
| Dial orientation
 | Horizontal, vertical
 | Available
 | Available
 |

#### Tokens & specs
Select a component variant below to see its elements, attributes, tokens, and their values. Learn more about design tokens (/m3/pages/design-tokens)

#### Anatomy

##### Scroll time picker

##### Input & dial time picker

#### Color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Scroll time picker color

##### Dial & input time picker  color

#### States

#### Measurements

##### Inline time picker (input & scroll)

##### Modal time picker (input & scroll)

##### Dial time picker (vertical)

##### Dial time picker (horizontal)

#### Baseline

##### Tokens & specs

Select a token set to view in the table's menu. Baseline time picker token sets are organized into dial and input sets. Learn more about design tokens (/m3/pages/design-tokens)

#### Configurations

Vertical and horizontal orientation for dial time picker is the same for expressive and baseline.

###### 24-hour dial time picker

###### 12-hour and 24-hour input time pickers

##### Anatomy

###### Input time picker

###### Dial time picker

##### Color

Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

###### Input time picker color

###### Dial time picker color

##### States

States specs can be found in the token module above (/m3/pages/time-pickers/specs#2ccd9809-9246-4667-85fa-7747f4ac7349)

##### Measurements

###### Input time picker

| Element
 | Attribute
 | Value
 | 
| Container
 | Width
 | Dynamic
 | 
| Height
 | Dynamic
 | 
| Headline alignment
 | Left
 | 
| Top/bottom padding
 | 24dp
 | 
| Left/right padding
 | 24dp
 | 
| Time input field container
 | Width
 | 96dp
 | 
| Height
 | 72dp
 | 
| Period selector container
 | Width
 | 52dp
 | 
| Height
 | 72dp
 |

###### Dial time picker (vertical)

| Element
 | Attribute
 | Value
 | 
| Container
 | Width
 | Dynamic
 | 
| Height
 | Dynamic
 | 
| Headline alignment
 | Left
 | 
| Top/bottom padding
 | 24dp
 | 
| Left/right padding
 | 24dp
 | 
| Time selector container
 | Width
 | 96dp
 | 
| Width (24h vertical)
 | 114dp
 | 
| Height
 | 80dp
 | 
| Period selector container
 | Width (vertical layout)
 | 52dp
 | 
| Height (vertical layout)
 | 80dp
 | 
| Width (horizontal layout)
 | 216dp
 | 
| Height (horizontal layout)
 | 38dp
 | 
| Clock dial container
 | Size
 | 256dp
 | 
| Clock dial selector handle
 | Size
 | 48dp
 | 
| Clock dial selector center
 | Size
 | 8dp
 | 
| Clock dial selector track
 | Width
 | 2dp
 |

###### Dial time picker (horizontal)

| Element
 | Attribute
 | Value
 | 
| Container
 | Width
 | Dynamic
 | 
| Height
 | Dynamic
 | 
| Headline alignment
 | Left
 | 
| Top/bottom padding
 | 24dp
 | 
| Left/right padding
 | 24dp
 | 
| Time selector container
 | Width
 | 96dp
 | 
| Width (24h vertical)
 | 114dp
 | 
| Height
 | 80dp
 | 
| Period selector container
 | Width (vertical layout)
 | 52dp
 | 
| Height (vertical layout)
 | 80dp
 | 
| Width (horizontal layout)
 | 216dp
 | 
| Height (horizontal layout)
 | 38dp
 | 
| Clock dial container
 | Size
 | 256dp
 | 
| Clock dial selector handle
 | Size
 | 48dp
 | 
| Clock dial selector center
 | Size
 | 8dp
 | 
| Clock dial selector track
 | Width
 | 2dp
 |


## Guidelines

#### Usage

Time pickers are used to enter a specific time value, usually hours and minutes. They can be placed inline with other content, on surfaces like bottom sheets, side sheets, menus, or in modal dialogs. Whenever possible, place time pickers inline so surrounding content remains visible.
Time pickers can be used for a wide range of use cases, like:

- Setting an alarm

- Scheduling a meeting

- Choosing a time range
There are three time pickers: **scroll**, **input**, and **dial**.

##### Scroll time picker
The scroll time picker is a compact way to select time. It’s best placed inline with other content, but can also be used on surfaces like a sheet, menu, or modal dialog.
Use **scroll** time pickers instead of **dial** pickers when you want people to see surrounding content.
**Scroll** time pickers can toggle to **input** time pickers.

##### Input time picker
The input time picker uses keyboard entry to input time. Similar to scroll time picker, it can be used inline or modal, on any kind of surface.
Both the **dial** and **scroll** time pickers are built to toggle to **input** time pickers to ensure accessible time entry.

##### Dial time picker
Dial time pickers are the most engaging way to select time, but they take up the most space, and are only available in modal dialogs, not inline.
Avoid using dial time pickers for granular time selection, such as milliseconds for a stopwatch application.
**Dial** time pickers can toggle to **input** time pickers.

##### Toggling to input selector
The input selector can be toggled from either the dial or scroll selector using the keyboard icon button.
Toggle back to dial picker with a clock icon. Toggle back to scroll picker with a swipe icon.

##### 24-hour time selection

The time picker should auto-adjust to 24-hour time settings, removing the AM and PM buttons, and adding the inner dial. For dial picker, time moves from 0-11 on the outer dial, switches to 12-23 on the inner dial, and returns to 00 on the outer dial for the 24th hour.

##### Alternate time selection components

Only use time pickers when any time can be chosen, down to the minute. If people only need to choose from preset times or intervals, consider using a simpler, smaller component like a button group, menu, or combo box.

[DO] Button groups listing multiple reservation times, with some missing.

[DO] A calendar app showing multiple times for a meeting, in 15-minute increments.

#### Customization

##### Text & containers
Typography can be customized for more expressive time selection experiences, such as stretching, narrowing, and rounding the text.
When using narrower and larger typography, use taller scroll field heights so the surrounding options are at least half-visible.

##### Color
When customizing color, make sure both active and inactive values maintain the required contrast ratio with the scroll field background.

##### Container (modal)
When in a modal dialog, the time picker container should always be visible, appearing above other screen elements in front of a scrim.
The container usually isn’t needed when inline with other content.

##### Input toggle button
An icon button must be present to toggle from a dial or scroll time picker to an input time picker.
If not using the built-in toggle, make sure a toggle is placed nearby.

[DON'T] Cropped portion of dial selector without keyboard icon, removing path to input selector.

#### Placement

##### Inline
Whenever possible, place time pickers inline with content, rather than as a modal dialog. This makes it much easier for people to reference other content on the page when making their decision.

##### Menus
On touch devices, when time pickers can't be placed inline, consider using a scroll time picker in a menu.

##### Modals
Time pickers can be in modal dialogs above a scrim. However, modals should be used rarely, when the UI is too cluttered for more components.
Dial time pickers are only available in modals.

#### Adaptive design

Scroll and input time pickers can resize to fit the container they’re placed in. Each field should resize evenly.

Dial time pickers should swap orientation or variant depending on the breakpoint and available vertical space. Avoid adding scrolling to dial time pickers.
For example:

- At larger breakpoints with more space, swap from the vertical to horizontal dial time picker

- When vertical space is reduced, like rotating a phone, swap to the landscape dial picker to avoid scrolling or cutting off the dial

- When vertical space is very limited, or the interface is zoomed in, swap from dial to a scroll or input time picker

[DON'T] A dial time picker in vertical configuration, which is too tall for mobile in landscape mode.

#### Behavior

##### Scroll time pickers
Swipe the scroll fields to select a time value. Values snap into place when released.
Tap the inactive value above or below to navigate to it.
The keyboard icon swaps the component to an input time picker.

##### Dial time pickers
When the dial time picker is opened, the hour field is selected by default. Once hour is selected by dial, the minutes field will activate to then select minutes by dial.
Selecting either field will reactivate the corresponding dial to select another option.
The keyboard icon swaps the component to an input time picker.

##### Input time picker
Select a text field to activate the keyboard entry and input a time value.
Errors should appear below the time picker, and highlight the invalid field with an error color scheme.

##### Modals & motion
When appearing in a modal, time pickers use appearing and disappearing transitions (/m3/pages/dialogs/guidelines#71058dbd-d228-4cd5-95e6-eb39761f4c29) similar to dialogs.
The **OK** button confirms the selection and closes the modal. The **Cancel** button, and interacting on the scrim, dismisses the changes and closes the modal.


## Accessibility

#### Use cases

People should be able to use assistive technology to: 

- Select or enter hours, minutes, seconds, or milliseconds

- Choose between 12-hour or 24-hour clock format

- Enter time selection directly using input fields

#### Interaction & style

Material requires time pickers to allow direct time entry through text input in addition to the scroll and dial selector. This toggle is built into the component by default.
Allowing text input makes it easier for those using keyboard inputs rather than touch screens.

##### Targets
Targets for a scroll field’s inactive values need to be at least 48dp high.
The tap targets for the AM/PM button and input toggle need to be at least 48x48dp.

Targets for each dial item need to be at least 48x48dp.

#### Keyboard navigation

| **Keys**
 | **Actions**
 | 
| **Tab**
 | Focus lands on (non-disabled) time slot, and moves to the next element
 | 
| **Shift** + **Tab**
 | Focus moves to the previous element
 | 
| **Arrow keys**
 | Focus moves between hours or minutes, once hour or minute field is selected. 
When AM/PM radio group is focused, selection moves  between AM and PM.
Up / down moves to previous / next option in scroll field.
 | 
| **Space** or **Enter**

 | Activates the (non-disabled) time slot or button.
Allows direct entry of numbers in input.
Confirms hour and minute for dial, input, and scroll.
 |

#### Labeling elements

The hour and minute fields have different roles depending on the type of time picker.

The AM/PM buttons use a **radio group** role, as only one can be selected at a time.

Each hour on the dial input is listed out of 12 for a 12-hour dial. Minutes are listed out of 60. Examples:

- “Hour 7 of 12”

- “Hour 23”

- “Minute 24 of 60”

| **Element**
 | **Accessibility label**
 | **Role (Wiz and Jetpack Compose)**
 | **Role (Android Views)**
 | 
| Hour input
 | Hour
 | Text input
 | Text input
 | 
| Hour scroll
 | Hour
 | Rotor (element)
 | Rotor (element)
 | 
| Hour dial
 | Hour
 | Toggle (element)
 | Toggle (element)
 | 
| Minute input
 | Minute
 | Text input
 | Text input
 | 
| Minute dial
 | Minute
 | Rotor (element)
 | Rotor (element)
 | 
| Minute toggle
 | Minute
 | Toggle (element)
 | Toggle (element)
 | 
| AM/PM selection
 | AM
 PM
 | Radio group
 | Radio group
 | 
| Picker toggle button
 | Toggle input picker
Toggle dial picker
Toggle scroll picker
 | Button
 | Button
 | 
| Cancel button
 | Cancel
 | Button
 | Button
 | 
| OK button
 | OK
 | Button
 | Button
 | 
| Clock dial time selection
 | 12-hour: Hour {Value} of 12
24-hour: Hour {Value}
Minutes: Minute {Value} of 60
 | Button
 | Button
 |

#### Navigation

##### Initial focus
Initial focus lands on the hour field.

##### Dial navigation
**Tab** to move through the hour, minute, and AM/PM options. Use arrow keys to toggle between AM and PM, and **Enter** to select.
**Enter** on the hour or minute field will allow selection of specific numbers. Once focus moves to the dial, it begins on minute 0 or hour 12. **Right** or **Down** will move through hours or minutes clockwise. **Left** or **Up** will move counter-clockwise.
Selecting **Enter** will confirm hour or minute.
