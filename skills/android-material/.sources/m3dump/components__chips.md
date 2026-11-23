# Chips

Source: https://m3.material.io/components/chips


## Overview

- Use chips to show options for a specific context

- Four variants: assist, filter, input, and suggestion

- Chip elevation defaults to 0 but can be elevated if they need more visual separation

#### Availability & resources

#### Updates

**Aug 2024**
Updated stroke color from **outline** to **outline variant**.

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color

- Shape: Rounded rectangle 

- Variants: Action chips have been separated into assist chips and suggestion chips. Choice chips are now a subset of filter chips


## Specs

#### Tokens & specs
Select a component variant below to see its elements, attributes, tokens, and values.

#### Assist chip

##### Assist chip color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Assist chip states
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states/overview)

##### Assist chip measurements

| Attribute
 | Value
 | 
| Height
 | 32dp | 
| Shape
 | 8dp corner radius | 
| Icon size
 | 18dp | 
| Vertical label text alignment
 | Center-aligned | 
| Horizontal label text alignment
 | Start-aligned | 
| Left/right padding
 | 16dp | 
| Left/right padding with icon
 | 8dp | 
| Padding between elements
 | 8dp |

#### Filter chip

##### Filter chip color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Filter chip states
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states/overview)

##### Filter chip measurements

| Attribute
 | Value
 | 
| Container height
 | 32dp | 
| Container shape
 | 8dp corner radius | 
| Icon size
 | 18dp | 
| Vertical label text alignment
 | Center-aligned | 
| Horizontal label text alignment
 | Start-aligned | 
| Left/right padding
 | 16dp | 
| Left/right padding with icon
 | 8dp | 
| Padding between elements
 | 8dp |

#### Input chip

##### Input chip color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Input chip states
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states/overview)

##### Input chip measurements

| Attribute
 | Value
 | 
| Container height
 | 32dp | 
| Container shape
 | 8dp corner radius | 
| Icon size
 | 18dp | 
| Avatar shape
 | 12dp corner radius | 
| Avatar size
 | 24dp | 
| Vertical label text alignment
 | Center-aligned | 
| Horizontal label text alignment
 | Start-aligned | 
| Left padding for avatar
 | 4dp | 
| Right padding for avatar
 | 8dp | 
| Left/right padding for icon
 | 8dp | 
| Padding between elements
 | 8dp | 
| Target size for close icon
 | Min 48dp |

#### Suggestion chip

##### Suggestion chip color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Suggestion chip states
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states/overview)

##### Suggestion chip measurements

| Attribute
 | Value
 | 
| Container height
 | 32dp | 
| Container shape
 | 8dp corner radius | 
| Icon size
 | 18dp | 
| Vertical label text alignment
 | Center-aligned | 
| Horizontal label text alignment
 | Start-aligned | 
| Left/right padding without icon
 | 16dp | 
| Left/right padding with icon
 | 8dp | 
| Padding between elements
 | 8dp |


## Guidelines

#### Usage

Chips help people enter information, make selections, filter content, or trigger actions. They're best used to help people accomplish their current task faster and easier.

##### Chips aren’t buttons
Chips and buttons are similar. They both provide visual cues to prompt people to take actions and make selections. 
While buttons appear consistently and with familiar calls to action, chips are dynamic to the situation, and appear as a group of interactive elements.
Use chips to enhance a person's current journey and encourage action. Use buttons to progress them through the product and for significant actions.

[DO] Chips used for “Reserve a table” and “Order delivery” in a restaurant app.

[DON'T] Chips used for Save and Cancel actions in a dialog.

Chips should dynamically offer various actions depending on the current task, whereas a button should be a persistent fixture of a layout. 
Chips represent forking paths for a current task, while buttons represent linear steps.

[DO] Button labeled “Save task” in a task management app.

[DON'T] Chip labeled “Save task” in a task management app.

Multiple chips should appear together in a set, whereas there should be no more than 3 buttons in a single arrangement.
Chip sets can be scrolled horizontally.

[DO] Multiple chips in event reminder.

[DON'T] Single chip in event reminder.

##### Variants
Choose the chip variant based on its purpose and author. 
Does the chip represent an action (assist chip) or filter results (filter chip)? 
Is its content generated by the product (suggestion chip), or by the person using the product (input chip)?

| Purpose
 | Chip variant
 | Rationale
 | Example
 | 
| Action
 | Assist chip (/m3/pages/chips/guidelines#5dd1928c-1476-4029-bdc5-fde66fc0dcb1)
 | Assist chips represent smart or automated actions that can span multiple apps
 | **Add to calendar** action
 | 
| Filter
 | Filter chip (/m3/pages/chips/guidelines#8d453d50-8d8e-43aa-9ae3-87ed134d2e64)
 | Filter chips represent filters for a collection
 | Platform selector on material.io/components
 | 
| Information, user-authored
 | Input chip (/m3/pages/chips/guidelines#4d2d5ef5-3fcd-46e9-99f2-067747b2393f)
 | Input chips represent discrete pieces of information entered by a person
 | Gmail contact in the **To** field
 | 
| Information, product-authored
 | Suggestion chip (/m3/pages/chips/guidelines#36d7bb16-a9bf-4cf6-a73d-8e05510d66a7)
 | Suggestion chips help narrow a person’s intent by presenting dynamically-generated suggestions
 | Suggested chat response
 |

#### Anatomy

##### Container
All chips are slightly rounded with an 8dp corner.

**Shadows & elevation**
Chip containers can be elevated if placed on top of an image or dynamic background.

[DO] 3 variants of chips in an outlined style.

[DO] 3 variants of chips in an elevated style above restaurant photograph.

[DON'T] 4 elevated chips above blank background.

[DON'T] Elevated chip in pressed state.

##### Label text
Chip label text should be 20 characters or fewer, and have the same typography style as buttons.
Chip labels should remain brief for the limited space available. Skip conventional grammar rules, such as articles (take "a" walk), to save space.

[DO] Filter chip in maps app labeled “Walking.”

[DON'T] Filter chip in maps app labeled “Walking navigation session."

##### Leading icon or image (optional)
Chips can contain a leading icon, logo, or circular image. Use a system icon to help identify a chip's category.

The leading icon color for unselected chips can be customized through theming. While the default color role is **primary**, the **on surface variant** color role is a good alternative when the icon style requires less emphasis.

Leading circular images are sized larger than leading icons to provide more space for detail. Icons are designed to be legible at small sizes.
See the Specs tab (/m3/pages/chips/specs/) for precise measurement values.

##### Trailing icon (optional, input and filter chips only)
The trailing icon is present for input and filter chips.
On input chips, it's required and must be used to remove the chip. On filter chips, it's optional, and can be used to open a menu or remove the chip. 
Secondary actions (such as a trailing icon button for **Remove**) must have a 48x48dp interaction target that doesn’t interfere with the chip's primary action (such as **Edit** or **Drag**). To achieve this, apply a minimum width of 88dp to the chip, or 42dp to the label text.

#### Assist chips

Assist chips represent smart or automated actions that can span multiple apps, such as opening a calendar event from the home screen. Assist chips function as though the person asked an assistant to complete the action. They should appear dynamically and contextually in a UI.
An alternative to assist chips are buttons, which should appear persistently and consistently.

Assist chips can trigger an action or show progress and confirmation.
Write assist chips like buttons: start with a verb. Adjust text dynamically if the state changes, like **Save** to **Saved**.

Assist chips are displayed after primary content, such as below a card or persistently at the bottom of a screen.

#### Filter chips

Filter chips use tags or descriptive words to filter content. They can be a good alternative to segmented buttons or checkboxes when viewing a list or search results.
Tapping on a filter chip activates it and appends a leading checkmark icon to the starting edge of the chip label.
Write filter chips with nouns that describe the category to **include** in the results. Avoid negative phrases like **Exclude images**.

Tap a chip to select it. Multiple chips can be selected or unselected.

Alternatively, a single chip can be selected. This offers an alternative to segmented buttons, radio buttons, or single select menus.
However, avoid mixing chip set behaviors. All chip sets on a page should be either single-select or multi-select.

In medium and expanded breakpoints, filter chips may contain a trailing icon to directly remove the chip or open a menu of options.
In compact windows, the trailing icon's target area is too small to be accessible on its own. However, if the whole chip can be selected to accomplish the action, the chip is likely still accessible.

When combined with a menu, the filter chip opens a list of selectable options.

[CAUTION] In a trail selector mobile app, a person selects the whole chip to change the menu selection from Walking to Cycling. 

Filter chips can be used with other components, such as search fields and sheets.

[DON'T] Single filter chip option beneath the header “Category”

#### Input chips

Input chips represent discrete pieces of information entered by a person, such as Gmail contacts or filter options within a search field.
They enable user input and verify that input by converting text into chips.

Input chips can support editing to change their contents, such as correcting an email address. In edit mode, the chip reverts back to a text string. Editing can be triggered by interacting with the chip, either by selecting it or by a second interaction after selection.

A single field can contain multiple input chips. These chips can be reordered or moved into other fields.

Input chips can expand to show more information or options. A container transform transition pattern is used to reveal additional content.

##### Placement
Input chips can be integrated with other components.
They can appear:

- Inline with the cursor in a text field
- In a stacked list
- In a list that can be horizontally scrolled

##### Icons & images
The leading icon of input chips can be an icon, logo, or circular image.

The trailing icon is always aligned to the end side of the container. It’s placed:

- On the right for left-to-right (LTR) languages, such as English
- On the left for right-to-left (RTL) languages, such as Farsi

#### Suggestion chips

Suggestion chips help narrow a user’s intent by presenting dynamically generated suggestions, such as possible responses or search filters.
Write suggestion chips as nouns or short phrases, depending on context. Avoid exceeding 20 characters when possible.

##### Placement

When displaying multiple chips together, place them inline as a row of options, not listed vertically. Overflowing chips should break to the next line. 
If the field is only one row high, chip sets can scroll horizontally instead.
Keep an 8dp minimum space between chips. Chips must also have a minimum 48dp target size, regardless of placement or density. If required, the target can extend beyond the visible container of the chip.
Text labels for chips should be concise. Chip labels will truncate when in a wrapped layout, and when they are wider than the full width of the window.


## Accessibility

#### Use cases

People should be able to do the following with assistive technology:

- Use a chip to perform an action
- Navigate to a chip 
- Activate a chip

#### Interaction & style

The chip label needs at least 3:1 contrast with the background.
A chip that performs an action should present the same semantics as a button to a platform's accessibility API.

##### Horizontal overflow
When there are too many chips to fit on one row, provide a way to display them all at once and avoid scrolling. 
**Reflow method: **Use a filter chip as a leading element to reflow the horizontal list. This should shift down the content below and make room for all chips to show.

**Menu method: **Create a leading button to display all chip options in a menu. Use this option to avoid shifting the position of the content below.
Don’t use the menu method on chips with a second action, like a remove icon.

##### Avoid applying density by default
Don't apply density to chips by default — this lowers their targets below our best practice of 48x48 CSS pixels. Instead, give people a way to choose a higher density, like selecting a denser layout or changing the theme.
To ensure that this density setting can be easily reverted when it's active, keep all the targets to change it at minimum 48x48 CSS pixels each.

#### Keyboard navigation

| Keys | Actions | 
| **Tab** | Moves focus to enabled chip or chip group | 
| **Space** or **Enter** | Activates, selects, or deselects the focused chip | 
| **Backspace** or **Delete** | Removes currently focused input chip | 
| **Arrows** | Moves focus between chips |

#### Labeling elements

| Element
 | A11y label
 | Role (Web)
 | Role (Android Views (MDC-Android))
 | Role (Jetpack Compose)
 | 
| Image / Icon within chip
 | Hide image
 | -
 | -
 | -
 | 
| Basic chip (one action)
 | “{chip content}”
 | gridcell
 | button
 | button
 | 
| Selectable chip
 | “{chip content}”
 | gridcell
 | radio button
 | checkbox
 | 
| Remove icon (no other action)
 | “Remove {chip content}”
 | -
 | -
 | -
 | 
| Two actions (e.g., select + remove)
 | “{chip content}.” Then
“Remove {chip content}”.
 | button or checkbox
 | button or checkbox
 | button or checkbox
 |

The accessibility label for a chip is the chip's label text. Additional actions, like remove, are labeled separately.

##### Multi-select
For multi-select chip sets, **Space** or **Enter** will select the focused chip and allow you to select all of the chips. **Space** or **Enter** will also deselect a focused selected chip.

##### Drop-down list
The accessibility label should align with each list item’s text label. 
For list items with text and an icon, the accessibility label should be marked as decorative to avoid redundant verbalizations.

##### Input chip remove action
Display the remove icon whenever a chip can be removed. On mobile, if remove is the only chip action, the remove icon isn't necessary. Instead the chip can be removed by selecting it and pressing the **Delete** key on the keyboard.
Each chip is a focusable element. 

- If a chip only has a remove icon, the entire chip and icon are one focusable element. 
- If a chip has a second action, like select, then the chip content and remove icon are two separate focusable elements.

##### Showing chip interactivity
Material requires that chips use a secondary indicator to show that they are interactive in context, allowing users with low vision and cognitive disabilities to see them. 

Use one of the following methods: 

- Add a label before the chip group suggesting interaction, such as **Select type**

- Provide interactive page context, such as **Filter results**, indicating chips can be selected to narrow results

- Use the **outline** color role, instead of **outline variant**, to ensure a minimum 3:1 contrast

- Include an interactive chip label, such as **Turn on lights**, or leading icon
