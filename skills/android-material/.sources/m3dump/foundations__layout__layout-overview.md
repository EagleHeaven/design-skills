# Layout overview

Source: https://m3.material.io/foundations/layout/layout-overview

Layout is the visual and strategic arrangement of elements on a screen


## Overview

- Use layout to organize all elements in a screen, signal hierarchy, and draw attention to key actions

- Adapt layouts to compact, medium, expanded, large, and extra-large breakpoints (previously window size classes)

- Build from an established canonical layout example (/m3/pages/canonical-examples)

- Design for bidirectionality (/m3/pages/bidirectionality-rtl) to support both left-to-right (LTR) and right-to-left (RTL) languages

- Apply consistent arrangement, sizing, and spacing to create a functional layout structure

- Material layout guidance is implemented on Android and applies to web

#### Availability & resources

| **Type**
 | **Resource**
 | **Status**
 | 
| Design
 | M3 Design Kit (https://www.figma.com/community/file/1035203688168086460) (Figma)
 | Available
 | 
| Spacing system & tokens (/m3/pages/spacing/overview)
 | Available
 | 
| Implementation
 | Jetpack Compose: Canonical layouts (https://developer.android.com/develop/ui/compose/layouts/adaptive/canonical-layouts)
 | Available
 | 
| Jetpack Compose: Rulers (https://developer.android.com/reference/kotlin/androidx/compose/ui/layout/Ruler)
 | Available
 | 
| Android Views (MDC-Android): Canonical layouts (https://github.com/android/user-interface-samples/tree/main/CanonicalLayouts)
 | Available
 | 
| Jetpack Compose: Navigation3 (https://developer.android.com/guide/navigation/navigation-3/migration-guide)
 | Available
 |

#### What's new

When creating new layouts, use the layout scaffold, start from a canonical layout example, and ensure layouts scale across breakpoints.

####### **May 2026** 
Layout structure and design:

- Introduced layout scaffold, to create adaptive layouts efficiently

- New adaptive guidelines for mobile, desktop, and spatial devices

- Updated canonical layout examples

- Spacing system (/m3/pages/spacing/overview)
Naming:

- Window size classes renamed to breakpoints

- Responsive layout renamed to adaptive design (/m3/pages/layout-overview/adaptive-design)

#### Layout terms

- **Adaptive design**: Techniques that allow an interface to dynamically respond to contexts like user preferences, device type, state, and breakpoints

- **Bars**: Can frame the page to help people navigate through a product, and typically house the app bar and bottom navigation bar

- **Bidirectionality**: A writing system that displays text and content from right-to-left (RTL) 

- **Breakpoints**: Opinionated window sizes where a layout changes to match available space, device conventions, and ergonomics (previously window size classes)

- **Column**: One or more vertical blocks of content within a pane

- **Drag handle**: The component that resizes panes

- **Fold**: A flexible area of the screen or a hinge that separates two displays on foldable devices

- **Gap**: The space between components or elements within a container

- **Margin**: The space between the edge of the screen and any elements inside of it

- **Multi-window mode**: Enables multiple apps to share the same screen simultaneously

- **Pane**: A layout container that houses other components and elements within a single app. A pane can be fixed, flexible, floating, or semi-permanent.

- **Rails**: The perimeter space surrounding panes that holds key elements such as navigation rails, toolbars, and pane control

- **Right-to-left (RTL) language**: Languages written and read right-to-left, such as Arabic, Hebrew, and Farsi, used by over 2 billion people (https://www.w3.org/International/questions/qa-scripts.en.html)

- **Rulers**: An opinionated set of global alignment lines that help organize building blocks in a layout

- **Safety region**: Zones reserved for system UI elements outside the application space, such as status bar or gesture bar

- **Scaffold**: A fundamental UI design structure that provides a standard platform for assembling key screen components

- **Spacer**: The space between two panes on a foldable device


## Parts of layout

#### Parts of layout

##### Windows
A window frames and contains an app or product.
Many systems support multi-window views, which display multiple apps at once.
Multi-window support guide for Android (https://developer.android.com/develop/ui/compose/layouts/adaptive/support-multi-window-mode)

On desktop, windows can be resized and moved around freely. They should adapt to various screen sizes.
More on adaptive design (/m3/pages/layout-overview/adaptive-design)

##### Grids
The layout grid is the foundation for every layout. It provides a structural framework for organizing components, content, and actions.
Use the grid to:

- Group related information in columns

- Apply spacing consistently

- Create focal points for primary actions

- Align building blocks like bars, rails, and panes
More on grids (/m3/pages/grids-spacing/grids)

#### Layout scaffold

##### Bars
Bars help people navigate through a product. Use bars to:

- Frame the main content

- Contain an app bar or navigation bar

- Span one or multiple panes  
More on bars (/m3/pages/scaffold/bars)

##### Rails
Rails are the next level in layout after bars, filling the perimeter space surrounding panes, or floating above them. They contain key elements such as navigation rails, toolbars, chat inputs, FABs, and other primary controls.
More on rails (/m3/pages/scaffold/rails)

##### Panes
Just like panes of glass that make up a window in the real world, panes in Material make up most of the layout in a window.
All content must be in a pane. A layout can contain 1–3 panes of various widths, which adapt dynamically to the breakpoint (formerly window size class) and the person’s language setting. For right-to-left (RTL) languages, navigation components will be on the right.
People can navigate to or between panes. Presenting multiple panes at once can make a product more efficient and easier to use.
More on panes (/m3/pages/scaffold/panes/)

###### Containment
On most devices, panes can blend in with the background. This is called implicit grouping, and helps show relationships between panes.
Explicit grouping uses distinct colors or outlines to visually delineate content.
More on spacing to group content (/m3/pages/grids-spacing/spacing#e7e6d1ac-031a-4757-afcf-b223f23654ea)

In spatial environments, panes use a container color to separate them from the passthrough or virtual environment.

##### Drag handles
Drag handles can be used to resize panes in a layout. They can:

- Adjust the width of flexible panes

- Fully collapse and expand fixed panes to quickly switch between a single and two-pane layout

##### Rulers
Rulers are a set of global alignment lines. They help to align elements across all layers of the layout.
How to implement rulers in Compose (https://developer.android.com/reference/kotlin/androidx/compose/ui/layout/Ruler)


## Adaptive design

#### What’s adaptive design?

Adaptive design is a set of techniques to change an interface to fit different contexts. While responsive design scales a single layout to fit any screen, adaptive design customizes a product to optimize the experience on each device.
Designing adaptive experiences goes beyond customizable properties like color, typography, and shape. The structure, individual components, and entire layouts can adapt based on:

- People: Individual preferences and settings

- Devices: Watch, phone, foldable, tablet, desktop, or XR device

- Usage: Screens dynamically change as a person resizes windows, changes orientation, or switches device

#### Designing adaptive experiences

Layouts must be versatile, designed to adapt fluidly across three primary experience types: **mobile**, **desktop**, and **spatial**. Start with mobile and make sure your product's layout and components can scale and adapt seamlessly all the way up to spatial environments. 
While each experience has different primary input methods, designs should be built with all inputs in mind—touch, pointer, and physical keyboard—since users may use your product in a desktop environment regardless of their device type.

##### Mobile
Mobile experiences include phones, foldables, and tablets.
On mobile, an app can be shown in several window modes:

- Full-screen: The app takes up the entire screen, the default for mobile

- Split-screen: Two or more apps share the screen simultaneously, common on tablets and foldables

- Bubbles: Floating windows that let people multitask without leaving their current context

##### Desktop
Desktop experiences use free-form windows that adapt across breakpoints.
People can use split screens, floating windows, and free-form windows for multi-tasking.
A tablet can convert to a desktop experience when a physical keyboard and mouse are connected. Similarly, Android mobile devices can transition into a desktop-like environment when connected to an external monitor.

##### Spatial
Extended reality (XR) experiences use multiple free-form windows within virtually limitless screens. Immersive modes, such as Android XR’s full space (https://developer.android.com/design/ui/xr/guides/foundations), allow components to be positioned freely in 3D space.
More on XR design (/m3/pages/xr-design)

#### Adaptive layouts

The Material 3 adaptive system uses panes and breakpoints to organize content into adaptive layouts.
Panes are the building blocks of layout; a pane is a single destination in the product. For example, in a messaging app, the list of messages is one pane, and and a specific conversation thread is another.

As the pane or window resizes—or as someone navigates a product—panes may change size, enter and exit the screen, and reorganize themselves to make the experience more usable or easier to navigate. These patterns are called adaptive strategies. Material has three adaptive strategies that create a cohesive experience across breakpoints: show and hide (/m3/pages/scaffold/panes#bbe68948-bc05-4f7c-b870-6254439e4fd8), levitate (/m3/pages/scaffold/panes#96bf71b8-04b8-4fff-97c7-9bc782fbf401), and reflow (/m3/pages/scaffold/panes#e0a573e9-8c62-4772-8d81-47955ff83196).

In Compose, the Navigation 3 (https://developer.android.com/guide/navigation/navigation-3) library allows multiple destinations to be shown on screen at the same time, and enables layouts to adapt seamlessly across window sizes and screens.

##### Adapting components

Components can adapt in appearance, placement, and behavior based on factors like:

- Where components are placed in relation to their containers, content, and pane boundaries

- How components use space

- How components enable usage across different device and input types
Most Material components respond using three main strategies: resizing, showing and hiding, and presentation changes.

###### Resizing
Components should resize in response to their content and their placement in a layout.
For example, buttons may scale along with their parent container, or hug their contents and maintain a left or right alignment.

###### Showing & hiding
Components should show and hide information, or collapse and expand to selectively reveal content that best suits the space.
For example, list items may reveal descriptions or other additional information as their parent container scales.

###### Presentation changes
Presentation changes include the orientation of elements and changes to specific properties, like color, type, and shape.
Components can also change configurations. For example, when a window size increases, a FAB can change to an extended FAB, and navigation rails can be automatically expanded.
