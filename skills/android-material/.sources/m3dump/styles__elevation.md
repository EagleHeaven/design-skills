# Elevation

Source: https://m3.material.io/styles/elevation

Elevation is the distance between two surfaces on the z-axis


## Overview

- Elevation is applied to all surfaces and components
- Tokens codify the distance on the z-axis to ensure components appear consistently relative to each other
- Tokens have no shadows or color; each platform determines the specific shadows and values to use at each elevation level
- Elevation can be shown as tonal surface colors or shadows
- Avoid changing the default elevation of Material 3 components
- Stick to using a small amount of elevation levels

Elevation is measured as the distance between components along the z-axis in density-independent pixels (dps).

#### Availability & resources

| 
 | Resource
 | Status
 | 
| Design
 | Design Kit (Figma) (https://www.figma.com/community/file/1035203688168086460)

 | Available
 | 
| Implementation
 | Flutter (https://api.flutter.dev/flutter/material/ElevationOverlay-class.html)

 | Available
 | 
|  | Jetpack Compose (https://developer.android.com/develop/ui/compose/designsystems/material3?_gl=1*zh4ff1*_up*MQ..*_ga*MTQ4NTEwOTIzLjE3NDA0MDY2Njk.*_ga_6HH9YJMN9M*MTc0MDQwNjY2OC4xLjAuMTc0MDQwNjY2OC4wLjAuNjU3NTAyNDY.#elevation)

 | Available
 | 
|  | MDC - Android (https://github.com/material-components/material-components-android/blob/d56070586102b66486f7f8697de077c3d7689922/docs/theming/Color.md#using-surface-colors)

 | Available
 | 
|  | MWC - Web (https://github.com/material-components/material-web/blob/919fe12badcfee4dcd72c390c0869dd8f996b51c/docs/components/elevation.md)

 | Available
 |

#### Differences from M2

- Shadows: Instead of applying shadows by default to all levels, use shadows only when required to create additional protection against a background or to encourage interaction
- Color: New color mappings and compatibility with dynamic color
- Levels: Elevation is now described in terms of levels

#### All surfaces and components have elevation values

Surfaces at different elevations do the following:

- Allow surfaces to move in front of and behind other surfaces, such as content scrolling behind app bars

- Reflect spatial relationships, such as how a FAB's shadow indicates it's separate from a card collection

- Focus attention on the highest elevation, such as a dialog temporarily appearing in front of other surfaces

##### Resting elevation (default)

All components have a default resting elevation. Avoid changing the default elevation of Material components.

##### Changing elevation

Components should change elevation in response to system events or user interaction, like hovering. This elevation change should be consistent across all similar elements.
For example, hovering a FAB temporarily increases the elevation by 1 level, from level 3 to level 4. All Material buttons increase elevation by 1 level when hovered.


## Applying elevation

Material 3’s elevation system is deliberately limited to just a handful of levels. This creative constraint means you need to make thoughtful decisions about your UI’s elevation story.

#### Depicting elevation

Elevation can be depicted using shadows or other visual cues, such as surface fills with a tone difference or scrims.

To successfully depict elevation, a surface must show:

- Surface edges, contrasting the surface from its surroundings
- Overlap with other surfaces, either at rest or in motion
- Distance from other surfaces

##### Tonal difference

Tonal difference between surfaces helps to express the tactile quality of Material surfaces. They show where one surface ends and another begins by separating different parts of a UI into identifiable components. For example, the edges of an app bar show that it's separate from a grid list, communicating to the user that the grid list scrolls independently of the app bar.
By default, Material 3's surfaces use tonal difference to indicate separation. Other methods can be used to indicate edges, such as:

- Giving surfaces a drop shadow

- Placing a scrim behind a surface

For interactive components, edges must create sufficient contrast between surfaces (by meeting or exceeding accessible contrast ratios) for them to be seen as separate from one another.

[DO] FAB separated from the surface beneath it using a shadow.

[DON'T] FAB without shadows, insufficiently separated from the surface beneath it.

##### Surface color roles & elevation

You can pick from a range of surface and surface container color roles. These roles are not tied to elevation, and provide flexibility for defining containment areas.

Any overlapping containment areas or components should have different color roles in order to visually communicate separation.

More on surface color roles (/m3/pages/color-roles/tab-1#89f972b1-e372-494c-aabc-69aea34ed591)

#### Shadows

Shadows can express the degree of elevation between surfaces in ways that other techniques can't.
Both a shadow’s size and amount of softness or diffusion express the degree of distance between two surfaces. For example, a surface with a shadow that's small and sharp indicates a surface’s close proximity to the surface behind it. Larger, softer shadows express more distance.

When it comes to applying shadows, less is more. The fewer levels in your UI, the more power they have to direct attention and action.

##### When to use visible shadows

###### **Protect elements**
When a background is patterned or visually busy, the hairline style might not provide sufficient protection. In these cases, use elevation to separate and emphasize elements such as cards, chips, or buttons.

###### **Encourage interaction**
Elements can temporarily lift on focus, selection, or another kind of interaction, like swipe. A raised element can also lower when a higher element appears.

#### Scrims

A scrim can bring focus to specific elements by increasing the visual contrast of a large layered surface. Use the scrim beneath elements like modals and expanded navigation menus.
Scrims use the scrim color role at an opacity of 32%.


## Tokens

#### Tokens

Elevation levels can be implemented with tokens. Surface tint color is deprecated. Use elevation level tokens (0–5) instead. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Component elevation

Most components have a default elevation. Component elevation is only used to determine where the component sits in relation to other components, including when hovered or focused (which usually raises elevation by one level). Elevation has no shadow or value of its own by default.

| Resting level
 | Component
 | DP Height
 | 
| 5
 | (not assigned as resting level) 
 | 12dp
 | 
| 4
 | (not assigned as resting level)
 | 8dp
 | 
| 3
 | Date pickers
Dialogs (modal)
Extended FAB
FAB
FAB menu (close button)
Search
Time pickers
 | 6dp
 | 
| 2
 | App bar (scrolled)
Menu
Navigation bar
Rich tooltip
Toolbar
 | 3dp
 | 
| 1
 | Banner
Bottom sheet (modal)
Button (elevated)
Card (elevated)
Chips (elevated)
Navigation drawer (modal)
Side sheet (modal)
 | 1dp
 | 
| 0
 | App bar (not scrolled)
Buttons (filled, tonal, outlined)
Button groups
Cards (filled, outlined)
Carousel
Chips
Dialog (full-screen)
Extended FAB (in navigation rail)
FAB (in navigation rail)
FAB menu (list items)
Icon buttons
List
Navigation rail
Segmented button
Side sheet (docked)
Slider
Split button
Tabs
 | 0dp
 |
