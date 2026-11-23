# Design for desktop

Source: https://m3.material.io/foundations/desktop

Create desktop experiences with adaptive layouts and multiple inputs


## Overview

- People can use any Android app in a desktop environment by opening it on a Chromebook or Googlebook, docking a tablet to a folio, or connecting a phone to an external monitor

- Design apps so they’re easy to use on desktop, rather than feeling like a stretched mobile app

- Take advantage of the expanded space and longer viewing distances, and consider denser layouts that show more information at once

- Use adaptive components (/m3/pages/desktop/components) and layouts (/m3/pages/layout-overview/adaptive-design) so apps scale smoothly across breakpoints

- Support external devices for efficient navigation across every input type, including mice, trackpads, and physical keyboards

#### Availability & resources

| Type
 | Resource
 | Status
 | 
| Design
 | M3 Design Kit (https://www.figma.com/community/file/1035203688168086460) (Figma)
 | Available
 | 
| Android design guidelines (https://developer.android.com/design/ui/desktop)
 | Available
 | 
| Material layout guidelines (/m3/pages/layout-overview/overview)
 | Available
 | 
| Implementation
 | Android large screen dev docs (https://developer.android.com/guide/topics/large-screens)
 | Available
 | 
| Jetpack Compose (https://developer.android.com/jetpack/androidx/releases/compose-material3)
 | Available
 | 
| Android media query API (https://developer.android.com/develop/adaptive-apps/guides/mediaquery)
 | Available
 |

#### Design principles

##### Adaptive from the start
Adapting an app to the desktop experience shouldn’t be an afterthought. Design an app's layout and information hierarchy in a flexible and modular way, so it can seamlessly adapt from mobile to a larger screen.
More on adaptive design (/m3/pages/layout-overview/adaptive-design)

##### More screen, more done
Use the expanded window to show more information in a denser layout. Don’t simply scale elements to fill empty space.

More on desktop layouts (/m3/pages/desktop/layout)

##### Refine the motion
Desktop transitions can be faster with small elements and short distances because the screen is unobstructed. When moving large elements across long distances, slow down or simplify transitions to prevent visual overwhelm.

##### Multitasking at the core
People expect to work on more than one thing at a time on desktop. While the multi-window OS supports working across apps, allow people to multitask within an app too.

##### Balance efficiency with simplicity
While mobile design focuses on simplicity, people expect to accomplish more in fewer steps on desktop.
Balance shorter task flows with clear layouts to avoid overwhelming people with information.

##### All input types are equally important
People frequently switch between touch, pointer, and physical keyboard inputs while on desktop. Support pointer and keyboard interactions to ensure efficient navigation across every input type.

More on desktop interactions (/m3/pages/desktop/interaction)


## Layout

#### Adaptive desktop layouts

Desktop apps typically open at medium or large breakpoints and can expand to extra-large. The quality bar is higher because of the larger window sizes and people’s expectation for greater information density. Make sure the app makes good use of the expanded space.

Use these guidelines to scale a mobile app to a desktop layout.

##### Use adaptive pane layouts
Consider using multi-column or multi-pane layouts for medium, large, and extra-large breakpoints to show more content at once.
If keeping a single pane on desktop, cap and center the content width to avoid looking like a stretched phone UI.
More on pane layouts (/m3/pages/scaffold/panes)

##### Consider navigation & usability
Start with Material canonical layouts to automatically adapt mobile layouts to fill the available space on desktop. These make app navigation simple and predictable:

- Feed (/m3/pages/canonical-examples/feed): For long scrolling pages of content

- List-detail (/m3/pages/canonical-examples/list-detail): For selecting and opening an item, like chat or email

- Supporting pane (/m3/pages/canonical-examples/supporting-pane): For showing additional tools or supporting information
More canonical layout examples (/m3/pages/canonical-examples/overview)

##### Adapt components
Material components can adapt their layout across breakpoints to optimize space and support mouse and keyboard inputs.
For example, at medium and larger breakpoints, changing the navigation bar to a navigation rail gives more vertical space to the content.
More on adapting components for desktop (/m3/pages/desktop/components)


## Components

#### Adapt components for desktop experiences
Components like navigation rails, menus, side sheets, dialogs, and carousels are optimized for larger screens and desktop inputs.

##### Don’t overstretch components
While full-width buttons and text fields work well on mobile, they can feel imprecise on large screens. On desktop, maintain default component widths and padding, and don’t stretch these components to fill the pane.

##### Use navigation rails
If a mobile app uses a navigation bar, switch to a navigation rail at medium breakpoints and above.   
At extra-large breakpoints, consider expanding the navigation rail by default to improve label readability.

##### Replace bottom sheets
On mobile, bottom sheets are easy to reach, and their attachment to the device edge and scrim creates an immersive view.
However, on desktop, bottom sheets often require excessive cursor travel and can obstruct primary content. For an improved desktop experience, consider replacing bottom sheets with:

- Context menus

- Side sheets

- Dialogs
If using a bottom sheet on desktop, it must be detached from the bottom edge of the window.

###### Context menus
Use right-click context menus when replacing bottom sheets triggered by press-and-hold or overflow actions on mobile.

###### Side sheets
Use a side sheet with no scrim to show complex tools or configuration panels on desktop without obstructing the main content.

###### Dialogs
Use a dialog when replacing modal bottom sheets that require a decision, since attention on desktop is focused higher on the screen.

##### Ensure carousels work with desktop inputs
For better cursor and keyboard interaction control, carousels can display direct targets for navigation when hovered. 

Only hero carousels have built-in next and previous actions. If adding these buttons to other carousels, they should appear when the carousel is hovered or focused. 

Consider adding a **Show all** button near the carousel to give people a persistent way to view all items.

Hero and full-screen carousels can also include pagination dots for quicker navigation.

###### Scrolling carousels on desktop
People can use a mouse wheel to scroll vertical hero carousels, or hold **Shift** to scroll horizontal carousels. On touchpad, people can scroll using a two-finger swipe. A single-pointer alternative is also required.


## Interaction

#### Support desktop interactions & inputs
People navigate desktop apps using touch, pointer devices, and physical keyboards. To make sure interactions like drag and drop, zoom, and refresh work across inputs:

- Provide single-click controls

- Support keyboard shortcuts

- Show clear hover and focus states

#### Drag & drop
Drag and drop allows people to quickly move or copy files, text, cards, list items, or input chips.

##### Provide clear visual feedback
Use Material states to give clear feedback throughout a drag-and-drop interaction:

- When dragging starts, apply the dragged state and elevation to create depth and focus

- Make the dragged item translucent so drop targets are visible beneath it

- Highlight valid drop targets with a border or insertion point when an item hovers above them
All drag-and-drop actions should include a single-click alternative, like a + icon button that opens a menu to upload an image without dragging.

##### Show clear error states
Display a prohibitive cursor symbol when hovering over invalid drop targets. 
If an item is dropped where the action can't be completed, it should return to its original location or visually dissolve.

##### Make pointer dragging instant
Pointer dragging should be instantaneous, unlike touch interactions that often require a long press.

#### Zooming & panning
Support zooming and panning across pointer, keyboard, and touch inputs so people can efficiently navigate large-scale content.

##### Provide multiple ways to zoom
On desktop, people should be able to zoom with keyboard shortcuts, scroll actions, and touch gestures:

- Zoom-first content: Scroll to zoom in and out on a map

- Pan-first content: Hold **Control** or **Cmd** while scrolling a canvas

- Single-pointer control: Include dedicated + and - icon buttons

- Touchpads: Support a two-finger pinch-to-zoom gesture

##### Adapt panning interactions
For zoom-first content, people should be able to pan by clicking and dragging with a mouse or touchpad once zoomed in.
For pan-first content, people should be able to pan by:

- Scrolling vertically, or holding **Shift** and scrolling horizontally

- Swiping with two fingers on a touchpad

#### Secondary actions
To save screen space and reduce visual complexity on desktop, consider hiding secondary actions and revealing them only when necessary.

##### Use context menus
A context menu helps people maintain focus in the main window during element-specific tasks, like copy and paste.
Context menus should open with a secondary click, a long press, or an overflow icon button.

##### Reveal actions on hover
Secondary actions can also appear when a cursor or stylus hovers over an area. 
Don’t use hover as the only way to access these actions.

#### Making multiple selections
Multi-select helps people complete bulk actions.

On desktop, people can use the following pointer and keyboard interactions to select multiple items:

- Select one-by-one: **Control** + click. or **Cmd** + click (Mac)

- Select a range: **Shift** + click

- Select a group: Click + drag

- Select all: **Control** + A, or **Cmd** + A (Mac)

#### Refreshing
When designing a refresh action, make sure to consider all input types.

On desktop, people can refresh a page by pressing **Control** + R, or **Cmd** + R on Mac.
Include a dedicated button so people using non-touch pointer devices or assistive technologies can refresh content with a single click.
