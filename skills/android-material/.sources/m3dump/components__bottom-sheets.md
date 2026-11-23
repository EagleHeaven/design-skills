# Bottom sheets

Source: https://m3.material.io/components/bottom-sheets


## Overview

- Use bottom sheets in compact and medium breakpoints

- Two variants: standard and modal

- Content should be additional or secondary (not the app’s main content)

- Bottom sheets can be dismissed in order to interact with the main content

#### Availability & resources

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color
- Shape: Bottom sheets have a 28dp top corner radius
- Layout: New max-width of 640dp and an optional drag handle with an accessible 48dp hit target


## Specs

Modal bottom sheets are above a scrim while standard bottom sheets don't have a scrim. Besides this, both variants of bottom sheets have the same specs.

#### Tokens and specs
Browse the component elements, attributes, tokens, and their values. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Measurements

Bottom sheets span the full window width up to 640dp. When the window width exceeds 640dp, bottom sheets adjust to have a top margin of 56dp and side margins of 56dp. 

| Attribute | Value | 
| Drag handle alignment (horizontal)
 | Center
 | 
| Drag handle padding top/bottom
 | 22dp
 | 
| Top margin
 | 72dp
 | 
| Top margin (window width > 640dp) | 56dp | 
| Start/end margin (window width > 640dp)
 | 56dp
 | 
| Width
 | Full width, up to max-width 640dp
 | 
| Height | Variable |


## Guidelines

#### Usage

Bottom sheets display supplementary content and actions on a mobile screen.

Bottom sheets are a versatile component that can contain a wide variety of information and layouts, including menu items (in list or grid layouts), actions, and supplemental content.

#### Anatomy

A container is the only required element of a bottom sheet. Bottom sheet layouts can vary widely to support the kinds of content they contain.

##### Container

Bottom sheet containers hold all bottom sheet elements. Their size is determined by the space those elements occupy.
The container is the only required element of a bottom sheet. All other elements are optional.

##### List items (optional)

Lists are a continuous group of text or images. List items can include label text, icons, and text buttons, among other elements.

##### Dividers (optional)

Dividers can be used to separate related content in bottom sheets.

##### Media (optional)

**Thumbnail**
Bottom sheets can include thumbnails for an avatar or logo.
**Image**
Bottom sheets can include photos, illustrations, and other graphics, such as weather icons.
**Video**
Bottom sheets can include video.

#### Standard bottom sheets

Standard bottom sheets co-exist with the screen’s main UI region and allow for simultaneously viewing and interacting with both regions, especially when the main UI region is frequently scrolled or panned.
Use a standard bottom sheet to display content that complements the screen’s primary content, such as an audio player in a music app.

At full-screen height, standard bottom sheets contain a collapse icon in an app bar to return to their initial position.
Standard bottom sheets can contain supplementary content that continues below the screen, such as location information over a map.

#### Modal bottom sheets

Like dialogs, modal bottom sheets appear in front of app content, disabling all other app functionality when they appear, and remaining on screen until confirmed, dismissed, or a required action has been taken.

Use a modal bottom sheet as an alternative to inline menus or simple dialogs on mobile, especially when offering a long list of action items, or when items require longer descriptions and icons.
Modal bottom sheets are used in mobile apps only.

##### Visibility

To provide access to its top actions, the initial vertical position of modal bottom sheets is capped at 50% of the screen height.
Modal bottom sheets whose contents exceed 50% of the screen height can then be pulled across the full screen and scrolled internally to access their remaining items.

Modal bottom sheets appear when triggered by a user action, such as tapping a button or an overflow icon. They can be dismissed by:

- Tapping a menu item or action within the bottom sheet
- Tapping the scrim
- Swiping the sheet down
- Using a close affordance within the bottom sheet’s app bar, if availableDisplay a close affordance in a full-screen modal bottom sheet.

#### Responsive layout

##### Compact breakpoint
In compact breakpoints, like mobile devices, bottom sheets extend across the width of a screen and are elevated above the primary content.

##### Medium and expanded breakpoints
For larger screens with medium and expanded breakpoints, bottom sheets have a default max-width to prevent undesired layouts and awkward spacing. However, this can be overridden if needed. For more complex tasks and flows, consider using a non-transient surface such as a floating sheet.

On larger expanded breakpoints, like desktop, a bottom sheet can be swapped for a side sheet that shows similar content.

#### Behavior

Bottom sheets can offer an expansion option where the sheet is fully raised and toggled between a collapsed and expanded state. This provides a more predictable footprint of the sheet, and can be set by the system or toggled by the user.

##### Custom positioning

The drag handle can be dragged or selected to change the bottom sheet height. 

Sheets should be able to cycle through preset heights and close completely without dragging. Selecting the drag handle should toggle through preset heights or close the sheet, while selecting the scrim should always close the bottom sheet.

If the bottom sheet has multiple preset heights but can’t use a drag handle, Material requires the inclusion of a single-pointer alternative to change height.

##### Scrolling

Bottom sheets can be horizontally scrolled, independent of the rest of the screen’s content.

##### Back

On Android, a gesture called predictive back allows a user to swipe left or right on the bottom sheet. 

- Bottom sheet detaches from the left and right edges of the screen to signal it will close
- Previous screen is revealed in a preview
A list of compatible components is available in the gestures article (/m3/pages/gestures).


## Accessibility

#### Use cases

Users should be able to:

- Resize bottom sheets without having to rely on touch gestures

#### Interaction & style

##### Touch target area
The top 48dp portion of the bottom sheet is interactive when user-initiated resizing is available and the drag handle is present.

##### Initial focus
The optional drag handle can be focused in the tab order and interacted with using non-touch inputs, such as keyboard or switch controls.

##### Dragging
Include a single-pointer alternative for any action that can be completed by dragging.
Drag handles should cycle the bottom sheet through available heights when selected. If a drag handle can’t be used, add a button to do this action.

#### Keyboard navigation

| Keys | Actions | 
| Tab | Focus lands on drag handle | 
| Space / Enter | Toggles between available heights |

#### Labeling

Label only the drag handle. The accessibility role for the drag handle is “button.”
