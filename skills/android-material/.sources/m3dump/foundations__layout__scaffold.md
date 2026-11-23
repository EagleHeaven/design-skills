# Scaffold

Source: https://m3.material.io/foundations/layout/scaffold

A fundamental UI design structure that provides a standard platform for assembling key components


## Overview

- The layout scaffold structures every piece of an adaptive layout into bars, rails, and panes

- Bars can frame the page to help people navigate through a product

- Rails create the perimeter space surrounding panes, creating space for elements like navigation and toolbars

- Panes hold a product’s primary content, adapting to breakpoints (previously window size classes) and other conditions

#### Availability & resources

| Type
 | Resource
 | Status
 | 
| Design
 | M3 Design Kit (Figma) (https://www.figma.com/community/file/1035203688168086460)
 | Available
 | 
|  | Spacing system & tokens (/m3/pages/spacing)
 | Available
 | 
| Implementation
 | Jetpack Compose: Rulers (https://developer.android.com/reference/kotlin/androidx/compose/ui/layout/Ruler)
 | Available
 |


## Bars

#### Bars

Bars frame the screen to help people navigate through a product. They typically contain an app bar or bottom navigation bar.
Bars can span a single pane or across the full width of a window.

App bars are placed at the top of the screen to help people navigate, providing a title and 1–2 essential actions like search or back.

Navigation bars let people switch between 3–5 primary UI views at compact or medium breakpoints.

##### Safety region
Bars are placed adjacent to the safety regions, which contain system UI (https://developer.android.com/develop/ui/compose/system/system-bars) elements.
The safety region shouldn’t contain primary content.


## Rails

#### Rails
Rails are the next level in layout after bars, filling the perimeter space surrounding panes or floating above them.

On compact screens, the top and bottom rail regions can be used for components like:

- Toolbars

- Chat inputs

- FABs

- Other primary controls related to an individual screen

On larger screens, there are rails on the sides of the screen (as well as top and bottom). The leading side rail region commonly holds the navigation rail.

The rail region on the trailing side of a large screen can hold supporting controls or actions that modify or relate to the content in a pane.

In XR (/m3/pages/xr-design/overview/), rail components can become orbiters (https://developer.android.com/design/ui/xr/guides/spatial-ui#orbiters), which float outside the visible content area.


## Panes

#### Panes
All layouts are made up of 1–3 panes. The type of layout and amount of panes you choose should depend on the breakpoint (previously window size classes) and the type of product being built.

All layouts are made up of 1–3 visible panes. The type of layout and amount of panes you choose should depend on the breakpoint and the type of product you're building.

| Breakpoint
 | Recommended pane total
 | Other pane totals
 | 
| Compact
 | 1
 | --
 | 
| Medium
 | 1
 | 2
 | 
| Expanded
 | 2
 | 1
 | 
| Large
 | 2
 | 1
 | 
| Extra-large
 | 2
 | 1, 3
 |

Panes can be:

- Fixed: Width doesn’t change based on available space

- Flexible: Width changes based on available space, and can grow and shrink
All layouts need at least one flexible pane.

Panes can be permanent or temporary. Temporary panes can appear and be dismissed when necessary, affecting the layout and size of other panes.

##### Single-pane layouts
Single-pane layouts use one flexible pane that extends to fit the available space in a layout’s width. They can be used at any breakpoint, but are recommended for compact and medium.

##### Two-pane layouts
**Split-pane layout**
A split-pane layout keeps the spacer visually centered. It’s best for foldable devices and dynamic layouts.
When a navigation rail or drawer is present, it only reduces the size of one pane. The other pane remains at 50% of the window width.

With a navigation bar, or no navigation, both panes span 50% of the window width by default.

**Fixed-and-flexible layout**
This layout is common for expanded, large, and extra-large breakpoints. The fixed-and-flexible panes can appear in whichever order is best for the content.
The fixed pane is often temporary, and used for side sheets or lists with light information density.

##### Three-pane layouts
While less common, the extra-large breakpoint supports using a standard side sheet as a third pane. When the side sheet is present, the expanded navigation rail can remain visible, change into a collapsed navigation rail, or hide completely. Don't use more than three panes. 
Note: Fixed panes at this breakpoint are recommended to be 412dp, but side sheets have a default maximum width of 400dp.

#### Pane expansion & resizing

Panes can be resized, expanded, and collapsed using drag handles. 

- In a split-pane layout, both flexible panes can be freely adjusted, or can snap to certain widths.

- In a fixed-and-flexible layout, the drag handle can fully collapse and expand the fixed pane. This makes it easy to switch between a single-pane and two-pane layout.
The drag handle should also toggle between layout sizes when selected. This can be a tap, double tap, or long press.

At expanded, large, and extra-large breakpoints, two-pane layouts can be customized to snap to set widths when resized.
The recommended custom widths are:

- 360dp

- 412dp

- Split-pane with spacer centered visually

##### Persistent pane resizing
The persistent resizing behavior remembers a person's pane width preference. Use this for most resizable layouts.

The width persists even after a breakpoint change. This means that if a two-pane layout is collapsed to one pane at any size, it’ll remain collapsed even when changing breakpoints.

##### Temporary pane resizing
The temporary resizing behavior doesn't remember a person’s preferences for pane width. This is primarily used in supporting pane layouts where resizing is uncommon.

With temporary resizing, panes should always return to the default layout after the pane or product is closed and reopened. This ensures content is a suitable size for most interactions.

#### Displaying multiple panes

Multiple panes can be displayed in three ways: co-planar, floating, or docked. The layout depends on breakpoint, what the pane does, and how people interact with it:

- Co-planar: Two side-by-side panes. To stay accessible, persistent utilities like tool panels should be co-planar with primary content.

- Floating: A small pane displays above larger panes. Temporary tasks should remain floating regardless of breakpoint, such as a dialog.

- Docked: A small pane pinned to the edge of a window. For example, a bottom sheet can be docked to show additional actions.

#### How panes adapt

Pane layouts can adapt using three strategies: **show and hide, levitate,** or **reflow**. When a window is resized or changes orientation, these strategies allow panes to reorganize themselves to preserve context and meaning.

##### Show and hide
As the breakpoint size or orientation changes, panes can enter and exit the screen or appear next to one another.

##### Levitate
Panes can be elevated above other content as **floating** or **docked** panes. This strategy helps panes appear relative to their triggers.
Floating panes:

- Appear in front of the body content

- Can be customized to be dragged or resized
When adding controls that resize or move a floating pane, provide accessible controls.

On large screens:

- Floating panes are the default

- The scrim behind a floating pane is optional

Docked panes are usually at the bottom of the window, like a bottom sheet.
At medium and expanded breakpoints, docked panes can adapt into floating panes.

Alternatively, at medium and expanded breakpoints, a docked pane can adapt into a co-planar pane.

On large screens, consider changing docked panes into co-planar panes.

##### Reflow
Panes can be reorganized on screen as the breakpoint or orientation changes, also known as reflow. 
For example, in a vertical orientation, the supporting pane can move underneath the primary pane.

Reflow also applies to breakpoints. When there’s not enough horizontal space for panes, they can stack vertically instead.

#### Spatial panels
On XR devices, pane layouts can be presented in disconnected spatial panels. These panels must have clear containment to make them easy to see on any background.

The content in a spatial panel can use implicit grouping when the pane has an explicit container to distinguish it from the environment.

#### Accessibility considerations

**Coplanar panes**

- The focus order should match the visual arrangement of the panes on screen
**Floating panes**
Modal floating pane:

- When active, the elements behind it can’t be interacted with

- Focus moves automatically to the first element in the pane, and when the pane is closed, focus moves back to the element that triggered it, like a dialog

- If triggered automatically, focus should still move to it, but when it’s closed, focus should go to the next most logical element on screen

- It disappears when a person interacts with something behind it.
Non-modal floating pane:

- When open, other parts of a product can be interacted with

- Focus should be able to move to and from the pane

- The pane should be available in a logical reading order of the screen
**Docked panes**

- Have the same focus requirements as modal and non-modal panes

- The focus order should match the visual arrangement of the panes on screen
