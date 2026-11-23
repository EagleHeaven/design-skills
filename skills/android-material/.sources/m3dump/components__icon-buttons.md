# Icon buttons

Source: https://m3.material.io/components/icon-buttons


## Overview

- Icon buttons must use a system icon with a clear meaning

- Two variants: default and toggle

- Many configurations: Color, size, width, and shape

- On web, display a tooltip describing the action while hovering

- In toggle buttons, use the outlined style of an icon for the unselected state, and the filled style for the selected state

#### Availability & resources

#### M3 Expressive update

**May 2025**
Icon buttons now have a wider variety of shapes and sizes, changing shape when selected. When placed in button groups, icon buttons interact with each other when pressed. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

Variants and naming:

- Default and toggle (selection)

- Color styles are now configurations. (filled, tonal, outlined, standard)
Shapes:

- Round and square options

- Shape morphs when pressed

- Shape morphs when selected
Sizes:

- Extra small

- Small (default)

- Medium

- Large

- Extra large
Widths: 

- Narrow

- Default

- Wide

#### Differences from M2

- **Color:** New color mappings and compatibility with dynamic color

- **Variants and naming: **Icon buttons were called toggle buttons. There are now two variants of icon buttons: default and toggle.


## Specs

#### Variants

| Variant
 |  M3

 | M3 Expressive

 | 
| Default

 | Available

 | Available

 | 
| Toggle (selection)

 | Available

 | Available

 |

#### Configurations

| Category
 | Options

 | M3

 | M3 Expressive

 | 
| Size

 | Small (default)

 | Available

 | Available

 | 
| XS, M, L, XL

 | --

 | Available
 | 
| Shape

 | Round (default)

 | Available

 | Available

 | 
| Square

 | --

 | Available

 | 
| Color

 | Filled (default), tonal, outlined, standard

 | Available

 | Available

 | 
| Width

 | Default

 | Available

 | Available

 | 
| Narrow, wide

 | --

 | Available
 |

#### Tokens & specs
Icon button token sets are organized by common tokens, color, and size. Select the token set from the table’s menu. Learn about design tokens (/m3/pages/design-tokens/overview/)

#### Anatomy

#### Color

Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens; in implementation, a color value will be a token that references a value.
There are four built-in color styles: filled, tonal, outlined, and standard. Default and toggle buttons use different color roles per style.

starNote:These color roles were chosen to create design coherence and familiarity. Other color roles can be used as long as the container and text have a 3:1 contrast ratio. For example, tertiary and on tertiary.

| 
 | 1. Default
 | 2. Toggle, unselected
 | 3. Toggle, selected
 | 
| Filled container
Filled icon
 | Primary 
On primary
 | Surface container
On surface variant
 | Primary 
On primary
 | 
| Tonal container
Tonal icon
 | Secondary container
On secondary container
 | Secondary container
On secondary container
 | Secondary 
On secondary 
 | 
| Outlined container
Outlined icon
 | Outline variant (outline)
On surface variant
 | Outline variant (outline)
On surface variant
 | Inverse surface
Inverse on surface
 | 
| Standard icon
 | On surface variant
 | On surface variant
 | Primary
 |

#### States

States are visual representations used to communicate the status of a component or interactive element. State layers slightly change button color. Disabled states have different base colors. View tokens for details (/m3/pages/design-tokens/overview)

##### Filled button states

###### Default

###### Toggle

##### Tonal button states

###### Default

###### Toggle

##### Outlined button states

###### Default

###### Toggle

##### Standard icon button states

The standard icon button’s container is invisible at rest, but visible when the state layer is applied.

###### Default

###### Toggle

#### Shape morph

##### Pressed state
While pressed, icon buttons can morph to become more square. 
Both round and square icon buttons should have the same pressed shape radius.

The corner radius value differs for each button size. See full icon button corner measurements (/m3/pages/icon-buttons/specs#b3df1f02-d313-44e9-9542-37f7e0e24dc7)

##### When selected
In addition to changing shape when pressed, toggle icon buttons also change the resting shape from round (unselected) to square (selected) by default.

If the resting shape is square, the selected shape should be round.

#### Measurements

##### Target sizes
Extra small and small icon buttons must have a target size of 48x48dp or larger to be accessible.

##### Button corner radius

| 
 | XS | S | M | L | XL | 
| A. Round button | Full | Full | Full | Full | Full | 
| B. Square button | 12dp | 12dp | 16dp | 28dp | 28dp | 
| C. Pressed state | 8dp | 8dp | 12dp | 16dp | 16dp |

#### Baseline tokens

Use the table's menu to select a token set. Filled, tonal, and outlined icon button tokens are now deprecated in favor of the new token sets. All other tokens are still available in the module at the top of the page.


## Guidelines

#### Usage

Use icon buttons to display common actions. There are two variants: **default** and **toggle**. 

- Default icon buttons can open other elements, such as a menu or search.

- Toggle icon buttons can represent binary actions that can be toggled on and off, such as **favorite** or **bookmark**.
Icon buttons can be placed directly on the background or in most container components, such as cards, app bars, and toolbars.
Multiple icon buttons can be placed in a standard button group to add interaction and motion between the buttons when pressed. More about standard button groups (/m3/pages/button-groups/overview)

##### Color
There are four icon button color styles, in order of emphasis:

- Filled
- Tonal
- Outlined
- StandardFor the highest emphasis, use the filled style. For the lowest emphasis, use standard.

Use a filled, tonal, or outlined icon button when the button needs more visual separation from the background.

Choose the right style and emphasis for the situation.

[DO] ‘Heart” icon on a background about a cooking show.

[DO] Text button and icon button in an app together.

Use the **filled** style for visual impact and key actions that require high emphasis.

Avoid overusing the filled style on a screen. Use them sparingly.

Use the **tonal** style as a middle ground between filled and outlined icon buttons. It’s useful for secondary actions paired with a high emphasis action.

For example, use the tonal style for actions like **Raise hand **in a video meeting. When selected, its visual emphasis is greater than the outlined menu button, but less than the filled **End call** button.

Use the **outlined** style for medium-emphasis buttons. It’s useful when the button isn’t the main focus of the interaction, such as browsing through sets of cards.

Use the **standard** style for low-emphasis buttons, or when placing buttons on a colorful surface.

##### Size & width
Icon buttons are available in five different sizes:

- Extra small - 32dp
- Small - 40dp (default)
- Medium - 56dp
- Large - 96dp
- Extra large - 136dpAnd three widths:

- Default
- Narrow
- WideUse size and width to provide emphasis and visual hierarchy in a page with multiple buttons. The main action should be the most visually prominent, whether through color or size, like starting and stopping a timer or playing and pausing a song.

Not all icon buttons will need to emphasize a primary and secondary action. 
When buttons have a similar importance, they should be the same size.

#### Anatomy

##### Icon
Icons visually communicate the button’s action. Their meaning should be clear and unambiguous. Browse popular icons (https://fonts.google.com/icons)

Default icon buttons should use filled icons.
Toggle buttons should use an outlined icon when unselected, and a filled version of the icon when selected.

###### Icon accessibility requirements
For selected toggle buttons, if a filled version of an icon doesn’t exist, increase the icon weight to semibold. If semibold doesn’t provide enough visual change, use bold.
This is to ensure that selection is communicated through at least two properties, rather than just color. This requirement doesn't apply to default non-toggle buttons.

##### Container
The container provides increased contrast and hierarchy in places that need more visual separation from the background or other elements.

#### Placement

Icon buttons are commonly used in other components, such as app bars and cards. 
These buttons should be used for common, easily understandable actions. 
Only use a few icon buttons at once.

In dense layouts, group popular actions by placing many icon buttons next to each other in components like a toolbar or button group. 
These components draw attention or add interaction between buttons.

#### Behavior

##### Hover
On hover, the icon button displays a tooltip describing its action, rather than the name of the icon itself.

##### Selection
Toggle icon buttons allow a single choice to be selected or deselected, such as adding or removing something from favorites. 

When placed in a button group, icon buttons change shape to help the selected button stand out.

More on button groups (/m3/pages/button-groups/overview)

[DO] A star-shaped toggle icon button to add or remove a song from favorites.


[DON'T] A toggle icon button to open an overflow menu.

The icon should become filled to represent selection.
If a filled version of the icon doesn't exist, use semibold weight instead.


## Accessibility

#### Use cases

People should be able to do the following using assistive technology:

- Understand meaning of the icon
- Navigate to and activate an icon button
- When applicable, a tooltip should be available to help describe the icon button's purpose

#### Interaction & style

Ensure the icon has contrast of at least 3:1 with the surface or background.

[DO] Icon button with correct contrast ratio.

[DON'T] Icon button with insufficient contrast ratio.

#### Keyboard navigation

| **Keys** | **Actions** | 
| Tab | Focus lands on (non-disabled) icon button | 
| Space or Enter | Activates the (non-disabled) icon button |

#### Labeling elements

The accessibility label for icon buttons describes the action the button is executing, such as **Add to favorites**, **Bookmark**, or **Send message**.

#### Layout & density

Groups of similar components can be nested together inside a component, or they can stand alone.

The target size of each icon button should be at least 48dp, even when nested.

##### Avoid applying density by default
Don't apply density to icon buttons by default. This lowers their targets below the required 48x48 CSS pixels minimum size. 
Provide density options that allow people to choose a higher density, such as selecting a denser layout or changing the theme. Controls for adjusting density must maintain a target size of at least 48x48 CSS pixels.

#### Hover

On web, icon buttons should display a tooltip with an accessibility label.
