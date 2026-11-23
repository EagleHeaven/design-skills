# Toolbars

Source: https://m3.material.io/components/toolbars


## Overview

- Two expressive variants: **docked toolbar** and **floating toolbar**

- Use the vibrant color style for greater emphasis

- Can display a wide variety of control types, like buttons, icon buttons, and text fields

- Can be paired with FABs to emphasize certain actions

- Don’t show at the same time as a navigation bar

#### Availability & resources

#### M3 Expressive update

The **bottom app bar** is no longer recommended and should be replaced with the **docked toolbar**, which functions similarly, but is shorter and has more flexibility. The **floating toolbar** was created for more versatility, greater amounts of actions, and more variety in where it's placed. More on GM3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

Variants and naming:

- Added **docked toolbar **to replace **bottom app bar**

- Size: Shorter height

- Color: Standard or vibrant

- Flexibility: More layout and element options

- Added **floating toolbar** with the following configurations:

- Layout: Horizontal or vertical

- Color: Standard or vibrant

- Flexibility: Can hold many elements and components. Can be paired with FAB.

- **Bottom app bar **is still available, but not recommended

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color
- Elevation: No shadow
- Layout: Container height is taller and the FAB is now contained within the app bar container


## Specs

#### Variants

##### Baseline variant

The baseline bottom app bar is no longer recommended. It should be replaced with the docked toolbar, which is very similar and more flexible.

| Variant
 | M3
 | M3 Expressive
 | 
| Docked toolbar
 | --
 | Available
 | 
| Floating toolbar
 | --
 | Available
 | 
| Bottom app bar
 | Available
 | Not recommended.  
Use **docked toolbar**.
 |

starNote:Implementation differs per platform. On Jetpack Compose, the floating toolbar is a separate component from the docked toolbar and bottom app bar.

#### Configurations

| Category

 | Configuration

 |  M3

 | M3 Expressive

 | 
| Color

 | Standard (default)

 | Available as bottom app bar

 | Available

 | 
| Vibrant

 | --
 | Available

 | 
| Floating toolbar layout

 | Horizontal (default)

 | --
 | Available

 | 
| Vertical

 | --
 | Available

 | 
| Other elements
 | With FAB
 | Available as bottom app bar
 | Available*
 |

starNote:*Implementation differs per platform. On Jetpack Compose, floating toolbar with FAB is fully supported (https://developer.android.com/reference/kotlin/androidx/compose/material3/package-summary#HorizontalFloatingToolbar(kotlin.Boolean,androidx.compose.ui.Modifier,androidx.compose.material3.FloatingToolbarColors,androidx.compose.foundation.layout.PaddingValues,androidx.compose.material3.FloatingToolbarScrollBehavior,androidx.compose.ui.graphics.Shape,kotlin.Function1,kotlin.Function1,androidx.compose.ui.unit.Dp,androidx.compose.ui.unit.Dp,kotlin.Function1)). On other platforms, each component needs to be added separately.

#### Tokens & specs
Browse the component elements, attributes, tokens, and their values. Jump to baseline bottom app bar specs (/m3/pages/toolbars/specs#ad142675-3e3b-43b8-ba53-12c1f0b7138d)

#### Anatomy

##### Flexibility & slots

When configuring a toolbar, think of it as a container with several slots. 
Each slot can be a different element. The most common elements are icon buttons, buttons, and text fields.

#### Color

Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Standard

##### Vibrant

#### Measurements

By default all toolbars are 64dp high, center-aligned, have equal padding between items, and have a minimum outside padding of 16dp.

##### Docked toolbar

##### Floating toolbar

#### Bottom app bar (baseline)

##### Tokens & specs

Bottom app bar tokens are in one token set.

##### Color

Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens. In implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Measurements

##### Common layouts


## Guidelines

#### Usage

Use a toolbar to provide actions related to the current page. 
Toolbars can contain many actions and can scale to show more actions in larger windows.

There are two variants of toolbars:

- **Docked toolbar** 
Spans the full width of the window. It’s best used for global actions that remain the same across multiple pages.

- **Floating toolbar** 
Floats above the body content. It’s best used for contextual actions relevant to the body content or the specific page.
The baseline **bottom app bar **is no longer recommended, but is still supported.

When actions don’t fit in a toolbar, add a menu.

There are two color configurations:

- **Standard** 
A low-emphasis color scheme best used for focusing attention on the body content.

- **Vibrant** 
A high-emphasis color scheme that draws attention to the controls. It can also indicate a temporary change in the page behavior, such as entering edit mode.Consider using alternative color roles to create greater or lesser emphasis depending on the needs of the app. Experiment with different color roles to achieve different effects.

##### Toolbars & navigation bars

The toolbar and navigation bar are both placed at the bottom of the window, so should **not** be shown at the same time. Show the navigation bar on primary pages, and toolbars on subsequent pages with actions.

Floating toolbars can be used as tabs between related subsequent pages in the product hierarchy. 
This helps group similar pages together, and shows that the selection affects the body content underneath.

[DO] Floating toolbar with secondary navigation labels.

Consider the existing app hierarchy when using a toolbar for local navigation. 

Avoid redundant or confusing navigation combinations in the same view.

[DON'T] Floating toolbar with secondary navigation labels displaying above a bottom navigation bar.

#### Anatomy

##### Container
The docked toolbar’s container spans the full width of the window. 

Avoid applying rounded corners to the container. This can imply the container expands or changes upon interaction.

[DO] Docked toolbar with square corners.

[DON'T] Docked toolbar with rounded corners.

As long as there's a minimum of 16dp padding on the leading and trailing edge, arrange controls inside however you see fit. The 32dp padding between items is just the default. 

All elements need a minimum 48x48dp target area to be accessible.

Be cautious of including too many controls as it can be overwhelming.

[DON'T] Docked toolbar with too many controls.

The floating toolbar’s container should be fully visible on screen. If more actions are needed, use an overflow menu.

[DO] Floating toolbar with overflow menu icon.

[DON'T] Floating toolbar that expands off edge of screen.

###### Elevation
Floating toolbars have elevation by default. 

If the content beneath the toolbar is visually distinct, elevation can be removed.

##### Flexibility & slots
When configuring a toolbar, think of it as a container with several slots.

These slots can be populated by buttons, icon buttons, images, text fields, or any kind of custom component.

Icon buttons provide an even hierarchy of controls. Mixing in a filled icon button can help add emphasis to a single action.

Visually emphasizing a single action more than others is an effective way to create hierarchy and guide people to controls they use most often. Avoid emphasizing more than one action at a time.

Some common ways to add emphasis to toolbar actions include:

- Use different icon button color styles, such as filled, tonal, and standard
- Customize the color roles of a single action, such as a primary or secondary palette
- Use wide and narrow icon buttons 

- Pair the toolbar with a FAB

[DON'T] Floating toolbar with primary action and FAB.

[DON'T] Floating toolbar with different control designs.

Avoid using square icon buttons in floating toolbars. Their square shape conflicts with the fully-rounded shape of the floating toolbar container.
Square buttons can be used in the docked toolbar.

[DON'T] A floating toolbar, which is rounded, with squared icon buttons inside.

##### Floating toolbar with FAB
A FAB can be placed next to a floating toolbar to present one high-priority action alongside a unified set of toolbar actions.
Use a FAB for the highest-priority action in the view, or to complement the controls.

#### Position & orientation

Only place docked toolbars at the bottom of the window. 
If using other bottom-aligned elements, such as a navigation bar, don't use a docked toolbar.

Floating toolbars can be horizontal or vertical. 

Horizontal toolbars should have a minimum 16dp margin from the edge of the window.

In larger breakpoints, floating toolbars can be vertical and placed on either side of the screen.
Vertical toolbars should have a minimum 24dp margin.

To keep vertical toolbars compact, don’t use wide icon buttons. 
Use narrow or default icon buttons instead.

[DON'T] Toolbar showing local navigation.

Vertical toolbars should be positioned opposite the navigation rail to balance out the screen and keep actions easy to access.
When showing a navigation rail and vertical floating toolbar at once, use the centered configuration of the navigation rail.

#### Adaptive design

Adaptive design allows an interface to respond or change based on context, such as the user, device, and usage. More on adaptive design (/m3/pages/layout-overview/adaptive-design)

##### Resizing

###### Docked
The docked toolbar should always span 100% of the screen width.
In compact breakpoints, elements in the toolbar should be evenly spaced.
In medium breakpoints and larger, adjust the padding between controls to create a comfortable layout. This can be achieved by: 

- Centering all elements

- Customizing to center a key action, and aligning other elements to the edges

On web and large screens, the docked toolbar can be rounded. Dividers can be used to organize large amounts of items. Only shrink the height and use extra small buttons if vertical space is limited.

###### Floating
The container should only be as big as needed to hold the items inside before reaching the 16dp margin.
If there’s not enough space for all items, put them in an overflow menu in the trailing slot. As the breakpoint expands, more actions can be revealed.
The floating toolbar width can also be capped to keep it smaller and hide more elements.

[DON'T] Floating toolbar in compact window with excess padding.

Vertical toolbars aren’t recommended for compact windows.

They take up a significant area of the screen and may feel visually overwhelming, especially on screens with complex layouts.
Only use them when the screen is simple or when the toolbar has a few controls.

[CAUTION] Vertical toolbar in a compact window.

##### Presentation

In larger breakpoints, floating toolbars can be aligned to opposite edges of the screen so they're easy to reach and group similar actions. For example, consider placing the undo and redo actions in one toolbar, and editing controls like highlight, erase, and select in another. Stylistic differences can help emphasize each toolbar’s purpose and clarify hierarchy.

Don’t use multiple toolbars in compact windows. There typically isn’t enough room on screen. 

Instead, use one toolbar for all actions.

[DON'T] Multiple toolbars in a compact window.

Actions at the trailing edge of the toolbar can collapse into an overflow menu at smaller breakpoints, and become visible again at larger sizes.

##### Right-to-left languages
In right-to-left (RTL) languages, mirror individual items that need it, like icons and text direction. If the order of actions is important, flip the order of the actions as well.

#### Behavior

##### Scrolling
Docked toolbars can either remain on the screen during scroll, or animate offscreen.

Floating toolbars can remain on the screen, animate offscreen, or collapse into a single, high-emphasis action on scroll.

On Jetpack Compose, the floating toolbar can collapse to a FAB or key action on scroll.

Don't collapse actions and scroll at the same time.

[DON'T] A toolbar collapsing to one action, and moving off screen when the page is scrolled.


## Accessibility

#### Use cases
People should be able to the following with assistive technology:

- Navigate and activate any actions in the toolbar

- Select a destination from a menu

- Activate a back button

- Maintain access to toolbar controls when the content is scrolled or collapsed

#### Interaction & style
The toolbar has no interactions by default. All interactions are with the elements placed inside.

**Touch**

- When tapping on an icon button in the toolbar, a touch ripple appears, indicating interaction feedback.

**Cursor**

- When hovered, the hover state provides a visual cue to the user that the element is interactive. 

- When clicked (in both active and inactive states), a ripple appears, showing the user feedback.

##### Initial focus
Focus lands on the first interactive element. 
Use **Tab** to navigate through all other actions.

#### Keyboard navigation

| Keys | Actions | 
| Tab or Arrows
 | Navigate between interactive elements | 
| Space or Enter
 | Activate the focused element |

##### Labeling elements
On web, the toolbar container should have the **toolbar** role. 
On mobile, it can be a generic container. 
All actions inside the toolbar should follow their respective accessibility guidelines.
