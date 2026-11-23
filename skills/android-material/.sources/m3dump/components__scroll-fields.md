# Scroll fields

Source: https://m3.material.io/components/scroll-fields


## Overview

- Two different modes of input: scroll and input

- Three recommended sizes: small (1-2 digits), medium (3 digits), and large (4 digits)

- Can be finite or an infinitely looping list

- Can be combined to select different measurements and include multiple values

#### Availability & resources

#### M3 Expressive update

The scroll field was introduced in the expressive update. More on M3 Expressive


## Specs

#### Tokens & specs

Select a component variant below to see its elements, attributes, tokens, and their values. Learn more about design tokens (/m3/pages/design-tokens)

#### Anatomy

#### Color

Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens)

#### States

#### Measurements

Scroll fields hug the contents by default, down to a minimum width and height per size. In larger windows, the fields can fill the container instead, or have a custom fixed size.

#### High contrast

High contrast mode is an accessibility feature that aims to maximize legibility by using a limited color palette, like black and white. Learn more about high contrast (/m3/pages/color/how-the-system-works#0207ef40-7f0d-4da8-9280-f062aa6b3e04)


## Guidelines

#### Usage

Scroll fields are an expressive way to select from a list of options. They're best used for numbers, but can be customized to many different use cases.

Scroll fields can be used for time selection, as well as other units of measurement like distance, weight, or temperature.

Use scroll fields alongside other controls, like button groups, to set more specific filters or add greater choice.
If using scroll fields to choose time, use a time picker instead.

Multiple scroll fields can be placed side by side. If each scroll field is tracking a different value, clearly label each field.

##### Support keyboard input
For accessibility, scroll fields should have an option to swap to text input for keyboard users. Place this button near the scroll field.
In scroll time pickers, this button is built-in.

#### Anatomy

The scroll field has different parts that can be customized.

#### Behavior

##### Scrolling
To scroll between values in a field, swipe the field, or tap the inactive value above or below to navigate to it.

##### Motion
Scrolled items snap to always be vertically centered. The active value is darker with an increased font size.

##### Input behavior
When text input is selected, the numeric or standard keyboard can be used to select values.
For strings, the selection should auto-complete based on the initial character entered.
Any errors should appear below the scroll fields, and should highlight the incorrect value.

#### Sizing

Material recommends only using up to four digits in scroll fields. However, more digits can still be added as needed. There are three size options with their own minimum widths:

- Small (1-2 digits): 100dp

- Medium (3 digits): 144dp

- Large (4 digits): 186dp

Avoid very long lists in scroll fields, such as consecutive numbers with five or more digits. Values should be quick to scroll to.
To avoid excessive scrolling time, add intervals between values, or use a different component for precise entry, like a text field.

[DON'T] A banking app set to transfer money with the dollar amount running to five digits on a scroll field.

#### Placement

##### Inline is preferred
Whenever possible, place scroll fields inline with content. When scroll fields are inline, people can easily see surrounding content.

##### Non-modal dialog
When scroll fields can’t be placed inline, use a popup container like a non-modal dialog.

##### Modal dialog
Modal dialogs should be used rarely, when the UI is too cluttered for a non-modal dialog.

[CAUTION] A modal listing temperature settings through two scroll fields.

#### Adaptive design

On larger screens, consider increasing scroll field height and width to more comfortably fill the containers they’re placed within.

##### Customizations

Scroll fields can be customized to have a fixed size, or to adapt in size depending on the space they’re placed in. To preserve usability:

- Visually crop inactive values to indicate that more values are available by scrolling

- Corner radius shouldn't be less than 16dp


## Accessibility

#### Use cases

People should be able to use assistive technology to: 

- Select or enter values and units of measurement

- Enter measurement selection manually using input fields

#### Interaction & style

##### Include both swipe & text input options
Any scroll field needs a way to also input text with a keyboard, like a toggle button next to the scroll fields, or a separate text field.
Material's scroll time picker has a built-in button that toggles to an input time picker. Consider using a similar pattern.

##### Targets
Targets for inactive values need to maintain a minimum height of 48dp, which stretches outside the container by default.

#### Keyboard navigation

| Keys
 | Actions
 | 
| **Tab**
 | Focus lands on scroll field
 | 
| **Space** or **Enter**
 | Activates the scroll field
 | 
| **Up** / **Down**
 | Selects option above or below in scroll field’s list
 |
