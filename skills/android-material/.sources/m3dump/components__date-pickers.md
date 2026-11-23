# Date pickers

Source: https://m3.material.io/components/date-pickers


## Overview

- Date pickers can display past, present, or future dates

- Three variants: docked, modal, modal input

- Clearly indicate important dates, such as current and selected days

- Follow common patterns, like a calendar view

#### Availability & resources

#### Differences from M2

- Typography and spacing: Titles and labels are larger and have increased spacing to accommodate 48dp target size

- Color: New color mappings and compatibility with dynamic color

- Variants: The three variants of date pickers have been renamed to not be device-dependent. The former desktop date picker is now known as the docked date picker. The former mobile date picker and date input are now known as modal date picker and modal date input to reinforce that the user must take an action.


## Specs

#### Tokens & specs
Select a component variant below to see its elements, attributes, tokens, and their values.

#### Docked date picker

##### Docked date picker color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/)

##### Docked date picker measurements

##### Docked date picker configurations

#### Modal date picker

##### Modal date picker color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/)

##### Modal date picker measurements

##### Modal date picker configurations

#### Modal date input

##### Modal date input color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/)

##### Modal date input measurements

##### Modal date input configurations

#### Element states


## Guidelines

#### Usage

Date pickers let people select a date or range of dates. They should be suitable for the context in which they appear.
Date pickers can be embedded into:

- Dialogs on compact breakpoints (/m3/pages/breakpoints) like mobile

- Text field drop-downs on medium and expanded breakpoints like tablet and desktop

There are three variants of date pickers:

- Docked date picker

- Modal date picker

- Modal date input

#### Anatomy

##### Docked date picker

##### Modal date picker

##### Modal date input

##### Full-screen date picker

#### Docked date picker

##### Usage
Docked date pickers allow the selection of a specific date and year. The docked date picker displays a date input field by default, and a dropdown calendar appears when the user taps on the input field. Either form of date entry can be interacted with.

Docked date pickers are ideal for navigating dates in both the near future or past and the distant future or past, as they provide multiple ways to select dates.

##### Behavior
Dates can be added by using a keyboard or by navigating the calendar UI; both options are immediately available when the docked date picker is accessed.

##### Month selection
Month selection can be navigated with the corresponding back and next arrows or by tapping the dropdown menu.

##### Year selection
Year selection can be navigated with the corresponding back and next arrows or by tapping the dropdown menu.

#### Modal date picker

##### Behavior
Modal date pickers navigate across dates in several ways:

- To navigate across months, swipe horizontally
- To navigate across years, scroll vertically
- To access the year picker, tap the yearDon’t use a modal date picker to prompt for dates in the distant past or future, such as a date of birth. In these cases, use a modal input picker or a docked date picker instead.

##### Date range selection
Date range selection provides a start and end date. Common use cases include:

- Booking a flight
- Reserving a hotelModal date pickers navigate across date ranges in several ways:

- To select a range of dates, tap the start and end dates on the calendar
- To navigate across months, scroll vertically

#### Modal date input

##### Usage
Modal date inputs allow the manual entry of dates using the numbers on a keyboard. People can input a date or a range of dates in a dialog.

[DO] A modal date input component showing a day in 1979, which would be difficult to choose using UI.

[DO] A modal date input with hint text for entering the date.

##### Behavior

You can swap between the modal date picker and modal date input using the edit or calendar icon.

##### Compact breakpoint
On compact breakpoints (/m3/pages/breakpoints/overview), such as mobile, a full-screen modal date picker is recommended to increase readability and touch target size. It can cover the entire screen.

##### Medium and expanded breakpoints
The docked date picker works best for medium and expanded breakpoints. It displays a date input field by default, and a dropdown calendar appears when a person taps on the input field. A person can interact with either form of date entry.

Docked date pickers are ideal for navigating dates in both the near future or past, and in the distant future or past, as they provide multiple ways to select dates.

##### Selection
Selection is indicated through color, drawing visual attention. In date ranges, start and end dates are selected, while dates in-between appear connected with a subtle highlight.

##### Appearing and disappearing
Like other kinds of dialogs, modal date pickers use an enter and exit transition pattern to appear on the screen.

To exit a date picker, the input can either be confirmed (**OK**) or dismissed (**Cancel**). Interacting outside of the dialog will also dismiss the time picker. Unless one of these actions is taken, a time picker will continue to retain focus. Mobile full-screen pickers also have an additional close affordance (x) icon button and **Save** confirmation.

Docked date pickers appear just below the input field.

##### Responsive layout
The sizing of the docked and modal date picker components don’t scale responsively to different breakpoints.

[DON'T] Docked date picker enlarged on a large screen responsively.


## Accessibility

#### Use cases

People should be able to:

- Enter dates manually by inputting text, without using the picker
- Use multiple input methods, making it accessible to those using assistive technologyOn the docked date picker, the text field can be used for input.
On the modal date picker, the date input option should be available using the edit icon.

#### Interaction & style

The edit icon indicates the ability to switch to the modal date input.

Interactive targets for all elements meet Material's 48x48dp minimum touch target requirement. Increasing density would negatively impact accessibility by limiting tappable/clickable targets.

#### Date entry methods

The date entry component offers two ways to enter a date:

- Direct text entry into a text field
- Through the date pickerThe calendar icon is the exclusive entry point for the date picker.

This improves efficiency for a screen reader and other keyboard users, as it makes interaction with the date picker optional and reduces the amount of key presses required to input a date.

Each input is a separate tab stop, which improves discoverability of the control.

#### Accessible date input

Automatically format the date after the user hits “Enter“ or navigates out of the text field. Don't automatically format the date by adding slashes or other special characters while the user is typing (also known as input masks). This can cause confusion for people using screen readers because it changes what they typed.  
To reduce errors, accept a range of formats including dashes, spaces, slashes, dots, and 0 to the left of a single digit month/day. This is especially helpful for assistive technology users who might be more prone to errors when interacting with complex inputs.

#### Optional **Clear** button

If it's not needed for your use case, remove the **Clear** button from the screen to reduce the number of tab stops for keyboard users.

#### Affordance for keyboard shortcuts

Ensure keyboard shortcuts are readily available for keyboard and screen reader users by providing the shortcut key in the tooltip. It should be included in the hint description to be read out by the screen reader.

As shown here, the previous year button is interactive and can therefore be focused via the keyboard. Upon focus, the tooltip explains the behavior of the button and shows the shortcut key.

#### Truncated labels & tooltips

Truncating labels isn't ideal, but tooltips allow the full text to be shown on hover or keyboard focus.

Days of the week are not interactive and are therefore not focusable via keyboard, yet the tooltip is available on hover. The date picker relies on the conventionality of these abbreviations for some assistive technology users.

#### Color contrast between dates

Dates should have contrast of at least 4.5:1 between the link text colors and the background.

#### Keyboard navigation

| **Keys** | **Actions** | 
| Enter/return | Enter/return | 
| Enter/return | Closes the calendar and saves the selected date | 
| Page up/down | Move to the same date on next/previous month | 
| Home/End     | Move to the first day of the month | 
| Shift + Page up/down | Moves to the same date in the next/previous year | 
| Shift + M | Moves to the month list dropdown | 
| Shift + Y | Moves to the year list dropdown |

#### Labeling elements

The text field's accessibility label should clearly state the purpose of the input (for example, event date or reservation date) and should match the placeholder text when the field is empty.

The helper text (below the text field) should specify the date format (for example, MM/DD/YYYY or YYYY/MM/DD) and act as a description for the text field. The default helper text is "MM/DD/YYYY," but this can be customized.

| **Element** | **A11y label** | **Role** | 
| Previous / next month and year | “{label}” | Button | 
| Month and year dropdowns | “{label}” | Button | 
| Days of the week | Column header |  | 
| Month grid | Grid |  |

#### Screen reader verbalizations

To support screen reader users, labels are used to enumerate the complete date. This allows screen reader users to hear the full context of "Monday, August 17” instead of just part of the date.
