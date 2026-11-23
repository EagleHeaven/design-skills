# Breakpoints

Source: https://m3.material.io/foundations/layout/breakpoints

Breakpoints ensure layouts work across a wide range of devices


## Overview

Material uses breakpoints to create adaptive designs that work across devices:

- There are five main breakpoints: compact, medium, expanded, large, and extra-large

- Layouts typically transition from a single pane to two or three panes as window size increases

- When moving across breakpoints, decide which elements to reveal, divide, resize, reposition, or swap

#### Breakpoints overview

A breakpoint (previously window size class) is the window size at which a layout needs to change to match available space, device conventions, and ergonomics. These apply to Android and web.
All devices fall into one of five Material breakpoints: 

- Compact

- Medium

- Expanded

- Large

- Extra-large
Rather than designing for an ever-increasing number of display states, focusing on breakpoints ensures layouts work across a wide range of devices.

Large and extra-large breakpoints are used on devices like laptops, desktops, and external monitors.

**Design for breakpoints instead of specific devices because:**

- The amount of available window space is dynamic and changes based on user behavior, such as multi-window modes or unfolding a foldable device

- Devices fall into different breakpoints based on orientation

| Breakpoint
 | Width (dp)
 | Common devices
 | 
| Compact
 | Under 600dp
 | Phone in portrait
 | 
| Medium
 | 600–839dp
 | Tablet in portrait
Foldable in portrait (unfolded)
 | 
| Expanded
 | 840–1199dp
 | Phone in landscape
Tablet in landscape
Foldable in landscape (unfolded)
Desktop
 | 
| Large
 | 1200–1599dp
 | Desktop
 | 
| Extra-large
 | 1600dp+
 | Desktop
Ultra-wide monitors
 |

##### Height breakpoints
On Android, compact, medium, and expanded breakpoints are also available for height (https://developer.android.com/develop/ui/compose/layouts/adaptive/support-different-display-sizes#window_size_classes). These can be used to adjust the layout when available vertical space is unusually small or large. However, since most layouts contain vertically scrolling content, it's rare that layouts need to adjust to available height.

#### Designing across breakpoints

Each product view should have a layout for the breakpoints most appropriate for your platform and users.
Different components are recommended for performing the same function across the five layouts.

| Breakpoint
 | Panes
 | Navigation
 | Communication
 | Action
 | 
| Compact
 | 1
 | Navigation bar, modal expanded
navigation rail
 | Simple dialog
Full-screen dialog
 | Bottom sheet
 | 
| Medium
 | 1 (recommended) or 2
 | Navigation bar, modal expanded
navigation rail
 | Simple dialog
 | Menu
 | 
| Expanded
 | 1 or 2 (recommended)
 | Modal or standard expanded
navigation rail
 | Simple dialog
 | Menu
 | 
| Large
 | 1 or 2 (recommended)
 | Modal or standard expanded
navigation rail
 | Simple dialog
 | Menu
 | 
| Extra-large
 | 1 to 3 (recommended)
 | Modal or standard expanded
navigation rail
 | Simple dialog
 | Menu
 |

Start by designing for one breakpoint, then adjust the layout for the next size by asking these five questions:

##### 1. What should be revealed?
Parts of the UI that are hidden on smaller devices can be revealed in larger layouts. 
For example:

- On mobile, the navigation rail is collapsed by default

- On an expanded device, the navigation rail can be open by default, revealing more actions and features

The same can be applied to panes (/m3/pages/scaffold/panes). Larger layouts can simultaneously display an inbox pane and a pane containing a selected conversation. Additional space doesn’t just mean making the same thing bigger.

##### 2. How should a screen be divided?
When dividing a screen into layout panes, consider the breakpoint: 

- Compact and medium breakpoints:  A single pane works best

- Expanded and large breakpoints:  Two panes are recommended

- Extra-large breakpoints: Consider using three panes

At medium breakpoints, two panes are useful when they contain low-density content with clear actions.  
Don’t use two panes in medium layouts with high information density, as it can reduce usability.

Single-pane layouts can focus attention on one action or view, creating a distraction-free environment for a specific goal such as:

- Playing a game

- Watching a movie

- Video calls

- Creative applications

##### 3. What should be resized?
UI elements that are small on compact screens can grow as breakpoints increase. Panes can also expand to rearrange elements and make better use of space. 
Consider resizing:

- Cards

- Feeds

- Lists

- Panes

Resizing can highlight imagery and improve text readability. This type of adaptation affects the scale of content and the relationship between objects on screen. For example, a vertical card on mobile can adjust its margins, orientation, text size, and density to better fit a tablet.
Across all breakpoints, adjust margins and type styles to keep text between 40–60 characters per line.

##### 4. What should be repositioned?
A UI and its components can reflow or reposition to make use of additional space on expanded screens and in resized panes. Repositioning is also a way to match the ergonomic and input needs that change across device sizes, such as shifting actions from the bottom of a compact window to the leading edge of medium and expanded windows. This method is similar to responsive design on the web.
Consider:

- Repositioning cards

- Adding a second column of content

- Creating a more complex layout of photos

- Introducing more negative space

- Ensuring reachability for navigation and interactive elements

Internal elements can be anchored to the left, right, or center as a parent container scales. Internal elements can also maintain fixed positions, such as a floating action button (FAB) in a navigation rail.

In the case of a button, the icon and text label within the button container can remain anchored to each other, staying centered as the button container scales horizontally.

##### 5. What should be swapped?
As a layout changes across breakpoints, components with similar functions can also be exchanged. This makes it possible to adjust a layout for large-scale changes to the ergonomic and functional qualities of an interface.

For example, a bottom navigation bar in a compact layout can be swapped with a navigation rail in a medium layout.

[DO] A compact layout’s navigation bar becomes a navigation rail in an expanded layout.

Likewise, a navigation rail can swap from collapsed to expanded at larger breakpoints.
Use caution when swapping components. Make sure: 

- The interchangeable components are functionally equivalent

- The component swap serves a functional and ergonomic purpose
Don’t swap a button for a chip. Be careful when changing between list items and cards.

[DO] A compact layout’s navigation rail expands in an extra-large layout.

[DON'T] A button is swapped out for a menu in a food delivery app.

##### Common swappable components

| Component type
 | Compact
 | Medium
 | Expanded
 | 
| Navigation
 | Navigation bar
 | Collapsed navigation rail
 | Collapsed navigation rail
 | 
| Navigation
 | Modal expanded navigation rail
 | Modal expanded navigation rail
 | Standard expanded navigation rail
 | 
| Communication
 | Basic or full-screen dialog
 | Basic dialog
 | Basic dialog
 | 
| Supplemental selection
 | Bottom sheet
 | Menu
 | Menu
 |


## Compact

Layouts for compact breakpoints are for **screen widths smaller than 600dp.**

#### Navigation

Use a navigation bar or modal expanded navigation rail.
Place navigation components close to the edge of the screen where they’re easier to reach.

#### Panes

Use a single pane in compact layouts.

#### Spacing

Margins are 16dp from the leading and trailing edge of the window.

#### Special considerations

A compact layout will need to transition dynamically to a medium or expanded layout when:

- A foldable device is unfolded

- A mobile device is rotated from portrait to landscape

- A tablet exits split-screen mode

- A product is resized to be larger in multi-window mode

- A free-form window is resized


## Medium

Layouts for medium breakpoints are for **screen widths from 600dp to 839dp.**

#### Navigation

Place navigation components close to edges of the window where they’re easier to reach:

- Single-pane layouts: Navigation rail

- Two-pane layouts: Navigation bar
The navigation rail can be hidden in secondary destinations as long as the primary destination can still be accessed using a back button.

#### Panes

##### Single-pane layout  
In a medium layout, a single pane is recommended because of limited screen width.

##### Two-pane layout
Limit use of two panes for content with lower information density, such as a settings screen.
Each pane in a two-pane layout should take up 50% of the window width. Avoid setting custom widths. A drag handle can be used to expand or collapse panes to be 100% of the window width.

When adding navigation to a two-pane layout, use a navigation bar. This allows the panes to fully use the available window width.

#### Spacing

Medium layouts have margins of 24dp.
The spacer between panes is also 24dp.

#### Special considerations

A medium layout will need to transition dynamically to a compact or expanded layout when:

- A foldable device is folded

- A tablet is rotated from portrait to landscape

- A product goes from full-screen to split-screen

- Multi-window mode is initiated

- A free-form window is resized

##### Reachability
For horizontal tablets and unfolded foldables, the top 25% of the screen is likely out of reach, unless the grip is adjusted. To accommodate device and hand sizes, limit the amount of interactions that are placed in the upper 25% of the screen.

Avoid placing essential interactive elements too close to the bottom edge of the screen. Some users, particularly those with larger hands, might struggle to reach this area.
Specify interactions in a layout with these ergonomic regions in mind:

- Users can reach this area by extending their fingers, which makes it inconvenient

- Users can reach this area comfortably

- Reaching this area is challenging when holding the device


## Expanded

Layouts for expanded breakpoints are for **screen widths from 840dp to 1199dp.**

#### Navigation

Place navigation components close to edges of the window where they’re easier to reach. Use a navigation rail, either collapsed or expanded.
The navigation rail can be hidden in secondary destinations as long as the primary destination can still be accessed using a back button.
For sorting, filtering, or secondary navigation, use tabs or other components directly in the pane.

#### Panes

Use a single-pane or two-pane layout.
A two-pane layout is often best for expanded breakpoints. However, a single-pane layout can work when displaying visually- or information-dense content, such as videos.

When using a fixed-and-flexible (/m3/pages/scaffold/panes#92371c3b-587d-4c6f-8105-05b69dcec81a) layout, the fixed pane should have a width of 360dp by default.

A split-pane layout (/m3/pages/scaffold/panes#dc7982b7-754c-410a-9e88-18a54557c87b) uses two flexible panes and visually centers the spacer by default.

#### Spacing

Expanded layouts have a leading and trailing margin of 24dp.
The spacer between panes is 24dp.

#### Special considerations

An expanded layout will need to transition dynamically to a compact or medium layout when:

- A foldable device is folded

- A tablet is rotated from landscape to portrait

- The app goes from full-screen to split-screen

- Multi-window mode is initiated

- A free-form window is resized


## Large & extra-large

These breakpoints are most useful for creating web experiences tailored to laptop and desktop devices. Some products may not need large and extra-large breakpoints. Consider your platform’s conventions and users when making decisions on which breakpoints to design for.

- Layouts for large breakpoints are for screen widths **from 1200dp to 1599dp**

- Layouts for extra-large breakpoints are for screen widths of **1600dp and larger**

#### Navigation

Use a navigation rail, either collapsed or expanded, depending on the amount of content.  
For sorting, filtering, or secondary navigation, use tabs or other components directly in the pane.

An expanded navigation rail is best suited for extra-large windows, where there's still plenty of room for content. Consider collapsing the navigation rail when space is needed, or when on pages deeper in the page hierarchy.

#### Panes

A two-pane layout is often best for large and extra-large breakpoints.   
However, a single-pane layout can work when displaying visually- or information-dense content, such as videos.

When using a fixed-and-flexible (/m3/pages/scaffold/panes#92371c3b-587d-4c6f-8105-05b69dcec81a) layout, the fixed pane should have a width of 412dp by default.

When using a split-pane layout (/m3/pages/scaffold/panes#dc7982b7-754c-410a-9e88-18a54557c87b), the spacer should be visually centered by default, even when using an expanded navigation rail.

#### Additional panes

The extra-large breakpoint supports using a standard side sheet as a third pane. When the side sheet is present, the navigation rail can remain visible, collapse, or hide completely. Don't use more than three panes.   
Note: Fixed panes in this window size are recommended to be 412dp, but side sheets have a default maximum width of 400dp.

#### Spacing

Large and extra-large layouts have a leading and trailing margin of 24dp.
The spacer between panes is 24dp.

#### Special considerations

Large and extra-large layouts will need to transition dynamically to a smaller layout when:

- The app goes from full-screen to split-screen

- Multi-window mode is initiated

- A free-form window is resized
Pay attention to typographic elements such as line length to ensure readability on large and extra-large layouts.
