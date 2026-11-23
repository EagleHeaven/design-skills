# Lists

Source: https://m3.material.io/components/lists


## Overview

- Use lists to help people find a specific item and act on it

- Order list items in logical ways, like alphabetical or numerical

- Keep items short and easy to scan

- Show icons, text, and actions in a consistent format

- Choose between standard and segmented styles

#### Availability & resources

#### M3 Expressive update

Lists have a new segmented visual style, improved selection treatment, and support for slots. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

**December 2025** 
Variants:

- Added **expressive** list

- Recommended for new designs

- List (baseline) is still available
New visual styles:

- Standard or segmented

- Highlighted selection states

- Flexible slots
Supported platforms:

- Android Views (MDC-Android) (https://github.com/material-components/material-components-android/blob/master/docs/components/List.md#m3-expressive)

- Jetpack Compose (https://developer.android.com/reference/kotlin/androidx/compose/material3/package-summary#ListItem%28kotlin.Function0,androidx.compose.ui.Modifier,kotlin.Function0,kotlin.Function0,kotlin.Function0,kotlin.Function0,androidx.compose.material3.ListItemColors,androidx.compose.ui.unit.Dp,androidx.compose.ui.unit.Dp%29)

#### Differences from M2 to M3 baseline

- **Color:** New color mappings and compatibility with dynamic color

- **Layout:** Padding and spacing rules are updated to be more consistent

- **Height:** The tallest element within a list item determines the list item’s height - either 56dp, 72dp, or 88dp

- **Alignment:**

- In most cases, elements in a list item are middle-aligned

- If a list is 88dp or larger, or contains three or more lines of text, elements are top-aligned


## Specs

#### Variants

##### Expressive lists
Use the expressive list variant for more flexible styling, highlighted selection states, and customizable slots.

##### Baseline lists
Baseline lists are still available to use, but don’t have the latest visual style, selection treatment, and slot functionality.

On web, expressive lists are built on top of baseline lists.
See baseline list specs (/m3/pages/lists/specs#94cf7f4d-fe29-4fab-9aae-a99e9b754329)

| **Variants**
 | **M3**
 | **M3 Expressive**
 | 
| Lists (expressive)
 | --
 | Available
 | 
| Lists (baseline)
 | Available
 | Not recommended.  
Use expressive lists instead.
 |

#### Configurations

##### Styles
The standard and segmented styles are a visual choice, and don’t affect a list’s behavior.

##### List selection
A list can have only one selection mode at a time. For example, a single-action list can change to a multi-select list, but can’t be both at once.

##### List interactions

Lists can:

- Expand and collapse (/m3/pages/lists/guidelines#90a236ee-b587-4361-8911-34006f25a6f1)

- Swipe to reveal (/m3/pages/lists/guidelines#01204f7d-ce32-4739-aece-e95db24858c9)*
More on list interaction accessibility (/m3/pages/lists/accessibility#a6f937f5-3e1f-4db4-ba35-ac6dd9fef140)

| **Category**
 | **Configuration**
 | **M3**
 | **M3 Expressive**
 | 
| Styles
 | Standard
 | Available
 | Available
 | 
| Segmented
 | --
 | Available
 | 
| Selection modes
 | Single-action, multi-action,
single-select, multi-select
 | Available
 | Available
 | 
| Interactions
 | Expand, swipe*
 | Available
 | Available
 |

* Swipe-to-reveal interactions are only available on Android Views

#### Tokens & specs
Use the table's menu to select a token set. The **common** set combines baseline tokens with new expressive shapes and sizes. The **expand** set has tokens for the expand interaction. Learn about design tokens (/m3/pages/design-tokens/overview)

#### Anatomy

##### Flexibility & slots
The M3 Design Kit (https://www.figma.com/community/file/1035203688168086460) includes lists with custom slots for designing flexible item layouts. Think of a custom list as a container with three different slots: leading, content, and trailing. Each slot can hold a different element.

###### **Slot accessibility**
Slots are not accessible by default. Consider the following:

- Elements must follow the rules, structure, and interaction patterns for lists

- Use standard list item padding

- Target size must be at least 48x48dp

- Don't add interactive elements that make the list item difficult to navigate, especially for people using screen readers
More on required accessibility guidelines (/m3/pages/lists/accessibility#538f23f7-689c-4516-bfc8-5f6933a43f5e)

[CAUTION] A diagram with leading, content, and trailing slots.

warningCaution:Slots require custom code implementation that you must create and maintain

The **leading** and **trailing** slot positions must be a smaller width than the **content** section.
1. **Leading slots** can contain:

- Visual elements: Avatar, icon, image, or video thumbnail

- Selection controls: Checkbox, radio button, or switch

- Customizations: Badge or larger image
2. **Content slots** must be the largest-width slot and can contain:

- Default content: Label text, supporting text

- Optional add-ons: Badge, icon, in-line label, or more text elements

- Avoid long lines of text to preserve readability

3. **Trailing slots** can contain:

- Action elements or text: Icon, icon button, or trailing text

- Selection controls: Checkbox, radio button, or switch

###### Selection lists
For selection lists, use only one selection interaction per list item.

[DO] A selected list item with a checkmark in the leading slot.

[DON'T] A selected list item with both a checkmark in the leading slot and a bookmark in the trailing slot.

#### Color

Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens. In implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### States

States are visual representations used to communicate the status of a component or an interactive element. Learn more about interaction states

 (/google-material-3/pages/interaction-states/overview)More on list focus (/m3/pages/lists/accessibility#f7e067e1-722f-40c5-a95a-63929869bf3e)

##### Default list items

##### Selected list items

#### Measurements

##### Shape morphing
When a list item is selected, the corner shape changes to highlight the active item:

- Unselected corner radius: 4dp inner, 16dp outer

- Selected corner radius: 16dp

#### List (baseline)

The baseline list variant is available and continues to work in existing products. However, the expressive list (/m3/pages/lists/specs#ebf87f58-d5bf-4cb5-a856-d2bb104eec4d) variant is recommended for new designs.

##### Tokens & specs
Baseline list tokens are in the **common** token set. Note: This set also includes several expressive tokens.

##### Color
Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens. In implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### States
States are visual representations used to communicate the status of a component or interactive element.

##### Layout

###### One-line lists

###### Two-line lists

###### Three-line lists

| Attribute | Value | 
| Label alignment
 | Center
 | 
| Label alignment when height is 88dp or taller
 | Top
 | 
| Label left padding
 | 16dp
 | 
| Leading element alignment (vertical)
 | Center
 | 
| Leading element alignment (vertical) when height is 88dp or taller
 | Top
 | 
| Leading element left padding
 | 16dp
 | 
| Leading icon alignment (vertical)
 | Top
 | 
| Leading icon top padding
 | 8dp
 | 
| Leading icon top padding when height is 88dp or taller
 | 12dp
 | 
| Trailing element alignment (vertical)
 | Center
 | 
| Trailing element alignment (vertical) when height is 88dp or taller
 | Top
 | 
| Trailing element left padding
 | 16dp
 | 
| Trailing element right padding
 | 24dp
 | 
| Padding above/below divider
 | 0dp
 | 
| Targets
 | 48dp
 | 
| Divider full-width
 | 100%
 | 
| Divider inset left padding
 | 16dp
 | 
| Divider inset right padding
 | 24dp
 |

##### Configurations

###### Leading avatar

###### Leading image or thumbnail

###### Leading video

###### Leading icon

###### Text-only

###### Leading checkbox

###### Leading radio button

###### Trailing switch


## Guidelines

#### Usage

Lists are vertical groups of text, icons, images, and other elements, optimized for reading comprehension.

List items can contain multiple actions at once, like selection, icon buttons, overflow menus, and more.

Use lists for communicating or selecting discrete items, such as choosing from a set of colors.

A list should be easy to scan. Any element can be used to anchor and align list item content.
Place supporting visuals and primary text in the same position in each list item.
Don’t vary the position of elements within a list.

List items can adapt to different lengths of text:
**Label text only 
**A list item can contain a single line of label text. If the text doesn’t fit on one line, it can wrap or be truncated.
**Label text with supporting text 
**A list item can include supporting text below the label text. Both the label and supporting text can wrap or be truncated.

#### Anatomy

##### Container
List containers hold all list items and their elements. List item size is determined by the tallest element within the list item. See layout measurements (/m3/pages/lists/specs#1824b94d-7d17-4a29-889f-d277037a1313)  
When a list item features an image, consider customizing the container color to use a content-based color scheme. This should be applied to either the enabled state or for an interaction.

##### Label & supporting text
Keep label text brief.   

To ensure list items are scannable:

- Limit supporting text to one to three lines

- Truncate supporting text, depending on screen size
See adaptive guidance (/m3/pages/lists/guidelines#561cc637-aa43-4055-be1e-0716faeef7af)

##### Icons
**Leading icon**
A leading icon should provide a quick visual cue that relates to the item's label text, helping people scan the list.
**Trailing icon** 
A trailing icon is often used to communicate status or indicate an action, like **Show more**.

##### Leading media
List items can contain a leading avatar, image, or video. Anchor visuals to the leading edge of the list to improve scannability.
Leading video thumbnails can open a video player or even play within the list.

[DO] A list of plants with images at leading edge.

[CAUTION] A list of plants with an image in the middle of the row makes it difficult to align the name and price.

###### Avatars
List items can include images in circular or expressive shapes to represent a person or entity.
Use square or rectangular images for other content, such as products or videos.

###### Primary & secondary actions
Use spacing to draw attention to the most important aspect of the list item, usually the primary action area or key content.

##### Trailing text
Trailing text can provide additional meta-information about a list item, such as a price, count, or other details.

##### Selection controls
Selection controls display list item actions. Position controls at the leading or trailing end of a list item:

- Use checkboxes to select multiple items

- Use switches to toggle settings on or off

- Use radio buttons to select a single item

##### Gaps & dividers
Gaps or dividers can separate lists into items and groups:

- Use **gaps** for contained lists. Gaps leverage expressive shape and containment tactics.

- Limit **dividers** to uncontained or complex lists, only when a stronger visual separation is necessary.

[DO] Filled list items in an inbox separated by gaps.

[CAUTION] An uncontained list with city names separated by dividers.

#### Adaptive design

##### Line length
In fluid layouts, avoid excessively long lines of text when expanding containers and text-heavy components. This often means changing margins and typography properties as the container scales.

[DO] 4 list items with 2-line supporting text have adjusted margins to preserve readability.

Adapt the width of the list container based on a line’s length, or by switching to a multi-column layout.

[DO] List items in a 2-column layout, with each item showing text preview.

The ideal line length for text is typically between 40 to 60 characters, but large-screen devices can accommodate up to 120 characters per line. If a line of text is close to 120 characters in length, consider increasing the line height to improve readability .

[DON'T] List items with elongated line length.

A list with a compact breakpoint can become part of a two-column layout at an expanded breakpoint, adjusting the amount of information shown in each list item.

##### Adapt list elements & layout
Lists can change their layout to adapt to different breakpoints. This affects the size and placement of content.
For example, a list at a compact breakpoint can adjust margins, spacing, or density to better fit an expanded window.

##### Swap components
Lists are just a compact composition of images, text, and actions. Other components, like cards and carousels, use the same elements but take up more space.   
At larger breakpoints, consider swapping a list to a component with a similar purpose to take advantage of available space.

##### Compact breakpoints
Lists should extend edge-to-edge in compact windows. Selecting a list item should open a page with the details.

##### Medium & expanded breakpoints
Medium and expanded breakpoints, such as tablet and desktop screens, can display primary and secondary content in the same view.
For example, a list and the detailed information can appear side-by-side.

At a larger breakpoint, a list may transform into a carousel.

Lists can also show more or less content as they scale up and down in size.
For example, a list item can reveal more content when the component expands.

#### Behavior

##### List selection modes
The selected state applies to the entire list item. For example, when an item with a checkbox is selected, both the list item and the checkbox show a selected state.

###### Single-select
Lists can feature a single-selection component such as a radio button.
Single-select list items:

- Don’t support multi-actions

- Can’t have secondary nested actions

- Shouldn’t use checkboxes

###### Multi-select
Multi-select lists allow for multiple list items to be toggled on.
Multi-select list items:

- Pair well with checkboxes and switches

- Can’t have secondary nested actions

- Shouldn’t use radio buttons

###### Single-action
In a single-action list, the entire list item performs one action, such as navigating to a new page.
Single-action list items:

- Can’t have secondary nested actions

- Can’t be toggled into a persistent selected state

###### Multi-action
Multi-action lists can support multiple nested actions within a list item.
The primary action should take up the majority of the space in the leading and content positions.
Place supplementary actions, like a bookmark or menu, in the trailing position.  
More on multi-action accessibility (/m3/pages/lists/accessibility#b69b89a9-7ca0-4249-b25b-2d0c85a41dc0)

###### Non-interactive
Non-interactive lists can organize information in a scannable way. They don’t perform any actions and can’t be selected.

##### List interactions

###### Expand & collapse
List items containing other list items can expand and collapse in a folder-like manner, to reveal or hide content. 
Tapping a list item expands it vertically across the entire screen using a container transform transition pattern.

###### Swipe
On Android, list items can reveal buttons on swipe. Use a mix of button styles for visual interest and hierarchy.  
The primary action must be the final end-aligned option. A full swipe triggers this action, clearing the list item and all other actions off-screen. 
Swipeable list items should include alternative ways to access hidden actions, such as a more icon.
More on swipe accessibility (/m3/pages/lists/accessibility#32f5115c-b15e-4af6-8c1a-4807bee2bf7a)


## Accessibility

#### Use cases

People should be able to do the following with assistive technology:

- Navigate to a list item 

- Select a list item

#### Indicate selection with more than color

To make selected items clear for everyone, don't rely on color as the only visual cue.   
Use an additional indicator that an item is selected such as:

- Radio buttons or checkboxes

- Leading or trailing icons

- A visual style not related to color, like underlined text

#### Interaction & style

##### Touch
When a person taps on a list item, a touch ripple appears, indicating interaction feedback.

##### Cursor
When hovered, the hover state provides a visual cue that a list item is interactive.

##### Keyboard & switch
When a person tabs to a single-action list, a focus indicator appears, providing a visual cue that the first list item is now focused and action can be taken.
When a person interacts with the focused list item via **Space** or **Enter**, the action is performed.

##### Swipe
List items that can be swiped should include alternative ways to access hidden actions, such as a **more** icon.   

Swipe alternatives can be:

- Single tap

- Double tap

- Long press

- Other single-point interactions

#### Focus

##### Single-action lists
The first element in a list should always receive focus, unless the list has a selected element. In that case, focus should go to the selected list item instead.

After an element is focused, a person should be able to navigate within the list using arrow keys.

All list items must be able to be activated using the **Space** or **Enter** key.  

More on single-action lists (/m3/pages/lists/guidelines#3e45f939-457a-44a8-8551-a2354c521d26)

##### Multi-action lists
Multi-action list items contain a primary action and at least one supplementary action.  

The list item as a whole isn't selectable; only the individual actions are.
 A person should be able to use a keyboard to:

- **Tab** to the list item, which focuses the first element

- Move between between all focusable elements in the list using the **Up**, **Down**, **Left**, and **Right** arrow keys

- Activate a focused element using **Space** or **Enter**   
More on multi-action lists (/m3/pages/lists/guidelines#db85439b-0e67-43b0-a2dc-61395738af64)

#### Keyboard navigation

| **Keys**
 | **Actions**
 | 
| **Tab**
 | To move focus to the first list item, last list item, or outside of the list component
 | 
| Down and right arrow keys
 | Moves to the next element in the list; if the focused element is the last in the list, it wraps back to the top of the list
 | 
| Up and left arrow keys
 | Moves to the previous element in the list; if the focused element is the first in the list, it wraps back to the bottom of the list
 | 
| **Space** or **Enter**
 | To select a list item not yet selected
 |

#### Labeling elements

Accessibility labels are used with assistive devices like screen readers.
The accessibility label for a list item is typically the same as the **label text** and **supporting text**.
Some labels, roles, and states are dependent on platform (/m3/pages/lists/accessibility#09e32b7d-78a1-45c1-be12-4c6646cfe1d1).

##### Platform-specific labels

###### Single-select lists

| **Trait**
 | **Web**
 | **Android Views (MDC-Android)**
 | **Jetpack Compose**
 | 
| Aria label
 | Container label: Should describe selection type
List item: Should match the visible label text 
 | List item: Should match the visible label text 
 | List item: Should match the visible label text 
 | 
| Role
 | Container: List box  List item: Option
 | List item: Radio button
 | List item: Radio button
 | 
| State
 | Selected or Not-selected
 | Checked or Not-checked
 | Checked or Not-checked
 |

###### Multi-select lists

| **Trait**
 | **Web**
 | **Android Views (MDC-Android)**
 | **Jetpack Compose**
 | 
| Aria label
 | Container label: Should describe selection type
List item: Should match the visible label text 
 | List item: Should match the visible label text
 | List item: Should match the visible label text 
 | 
| Role
 | Container: List box  List item: Option
 | List item: Checkbox
 | List item: Checkbox
 | 
| State
 | Selected or Not-selected
 | Checked or Not-checked
 | Checked or Not-checked
 |

On web, a list container’s accessibility label describes the type of selection that can be made, and the role is **List box**.

On Jetpack Compose, the role applies to the list item as a whole.
If a list isn't selectable, the label text is read out without a role.

On Android Views (MDC-Android), components contained within the list should be labeled according to that component’s specific guidelines:

- Checkbox (/m3/pages/checkbox/accessibility)

- Radio button (/m3/pages/radio-button/accessibility)
