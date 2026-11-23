# XR components

Source: https://m3.material.io/foundations/xr/components

Learn how Material 3 Expressive components adapt to extended reality devices


## Overview

- Leverage depth and space to create believable environments

- Design for comfort to minimize motion sickness and physical strain

- Map interactions, like gaze and gestures, to real-world expectations

- Group UI elements on floating spatial panels

- Provide feedback through spatial audio, haptics, and visual cues

#### Material XR components

The following Material components are adapted for XR:

- App bars (/m3/pages/xr-components/app-bars)

- Dialogs (/m3/pages/xr-components/dialogs)

- Navigation bar (/m3/pages/xr-components/nav-bar)

- Navigation rail (/m3/pages/xr-components/nav-rail)

- Toolbars (/m3/pages/xr-components/toolbars)


## App bars

starNote:XR guidelines are primarily intended for designers. Find what’s implemented in code in the design kit (https://www.figma.com/community/file/1035203688168086460).

Extended reality (XR) interfaces have special design requirements, like showing apps in 3D space. Material has an XR app bar with custom specs and guidance. See XR developer documentation (https://developer.android.com/design/ui/xr/guides/foundations) for more details.

#### Variants & configurations

There is one app bar orbiter. It closely aligns with the small app bar. It can be configured to be center-aligned or left-aligned.

#### Anatomy

#### Color & elevation

XR uses color to communicate the elevation of UI elements and orbiters. With spatial elevation (https://developer.android.com/design/ui/xr/guides/spatial-ui#spatial-elevation), the app bar displays above the spatial panel on the Z-axis. Elevated app bars can use any of these color options:

#### Measurements

#### Usage

An app bar can appear in an orbiter for a more immersive experience. Currently, this spatial capability is only available in full space. In home space, use a regular app bar on the same plane as the body content to mimic a 2D experience.

#### Behavior

##### Global context
When placed in global context, the orbiter is centered at the top of the app it controls. 
It stays anchored to the app during layout or content changes. 
This ensures navigation elements are always easy to find and use.

##### Local context
When placed in local context, the orbiter is centered at the top of the spatial panel it controls. 
It repositions in response to layout or content changes.

[CAUTION] An app bar orbiter placed in local context.

##### Additional app bars
In most cases, apps should only have one app bar orbiter, placed in global context.

[CAUTION] An app switches between 1 and 2 app bar orbiters.

#### Placement

##### Offset & inset positioning

In full space, an app bar orbiter can be positioned:

- Offset 20dp from the spatial panel

- Inset 12dp, overlapping spatial panel without obstructing content

[DO] App bar orbiter with offset positioning.

[DON'T] App bar orbiter with inset positioning that obstructs content..

##### Horizontal alignment

[DO] An app bar orbiter placed within the bounds of its spatial panel.

[DON'T] An app bar orbiter that extends beyond the width of its spatial panel.

##### Spatial panel alignment
By default, app bar orbiters are center-aligned to the spatial panel. Their width and placement can be adjusted to accommodate specific user needs, such as improved ergonomics or right-to-left (RTL) languages (/m3/pages/bidirectionality-rtl).

##### Width boundaries
An app bar orbiter’s width should adjust to stay in a person’s field of view (https://developer.android.com/design/ui/xr/guides/spatial-ui#where-place). 
This makes crucial navigation elements easy to find.

[DO] An app bar orbiter with a width that fits in a person’s field of view.

It’s not recommended to increase the width of an app bar orbiter beyond a person’s natural field of view (https://developer.android.com/design/ui/xr/guides/spatial-ui#where-place). 
This creates a visual imbalance and makes it difficult to find navigation elements.

[DON'T] An app bar orbiter that exceeds the panel’s width and a person’s field of view.

##### Adaptable width
When placed in a local context, an app bar orbiter can expand to the width of its adjacent spatial panel.   
Be sure the orbiter stays in a person’s field of view, and test for usability.

[CAUTION] 2 app bar orbiters with the same width as their adjacent spatial panels.

#### Accessibility considerations

XR accessibility (/m3/pages/xr-design/accessibility) guidelines are still evolving. XR app bars should follow applicable Material app bar accessibility standards (/m3/pages/app-bars/accessibility).


## Dialogs

starNote:XR guidelines are primarily intended for designers. Find what’s implemented in code in the design kit (https://www.figma.com/community/file/1035203688168086460).

Extended reality (XR) introduces spatial capabilities, such as using depth to make dialogs stand out from the background. Currently, spatial dialogs (https://www.figma.com/community/file/1035203688168086460) are only available in full space. For home space, follow Material’s general dialog guidance (/m3/pages/dialogs/overview).

#### Color & elevation

XR uses color roles to communicate the elevation of UI elements. Dialogs can use two color options: **surface container high** or **surface container highest**.
starNote:Color and elevation for spatial dialogs aren’t available in Jetpack Compose yet. These need to be customized manually.

For effective visual hierarchy, a dialog should be the most prominent element. 
Add a scrim behind a dialog to improve its visibility. Scrims prevent other content from being selected until the dialog action is complete.

[DO] Dialog with surface-container-highest color and a scrim.

The dialog should have the highest elevation in the product.
For example, if the dialog is **surface container high**, don’t use **surface container highest** for any other elements.

[DON'T] Dialog with surface-container-high color and no scrim. An orbiter is at a higher elevation than the dialog.

#### Usage

Only use basic dialogs (/m3/pages/dialogs/guidelines#97ac3858-3932-4084-ae8e-73e42b7cb752) in XR. This keeps the required action in the person’s field of view (https://developer.android.com/design/ui/xr/guides/spatial-ui#where-place).

[DO] Basic dialog in XR.

[DON'T] Full-screen dialog in XR.

#### Spatial dialogs

In full space, dialogs can be elevated spatially via overrides (https://developer.android.com/develop/xr/jetpack-xr-sdk/material-design#use-enablexrcomponentoverrides). This helps dialogs stand out from their background in XR.

#### Behavior

##### Effect
The spatial dialog should scale uniformly. It also fades in when appearing, and fades out when disappearing. 
The dialog's scrim only fades in and out.

##### Movement
When activated, the spatial dialog rises from the app to the highest resting level on the Z-axis. 
When the action is complete, it returns to a normal resting level.
The dialog's scrim stays at the app content level at all times.
To prevent motion sickness, use standard easing (/m3/pages/motion-easing-and-duration/tokens-specs#601d5552-a6e6-4d74-9886-ff8f24b9ec35) and long duration (/m3/pages/motion-easing-and-duration/tokens-specs#48bf653e-46f9-48f5-87e0-eaf8ea3fe716) motion tokens.

#### Placement

Consider factors like field of view, viewing distance, and possible interactions when deciding where to place dialogs in XR.

A dialog’s placement can be adjusted to accommodate specific needs, such as improved ergonomics or right-to-left (RTL) languages (/m3/pages/bidirectionality-rtl).

##### Elevation: Highest resting level
Display spatial dialogs at the **highest resting level**. When setting the depth value of the highest resting level, make sure the elevated dialog is at a comfortable viewing distance from the person. More on spatial elevation (https://developer.android.com/design/ui/xr/guides/spatial-ui#spatial-elevation)

##### Center spatial dialogs in field of view
Spatial dialogs should be centered in a person’s field of view (https://developer.android.com/design/ui/xr/guides/spatial-ui#where-place). If the dialog **can’t** track head movements, position it in the center of the app’s content. 
If the dialog **can** track head movements, configure it with a lazy follow behavior. This keeps the dialog anchored to the center of a person’s field of view until an action is taken.

#### Accessibility considerations

XR accessibility (/m3/pages/xr-design/accessibility) guidelines are still evolving. Spatial dialogs should follow applicable Material dialog accessibility standards (/m3/pages/dialogs/accessibility).


## Nav bar

starNote:XR guidelines are primarily intended for designers. Find what’s implemented in code in the design kit (https://www.figma.com/community/file/1035203688168086460).

Extended reality (XR) interfaces have special design requirements, like showing apps in 3D space. Material has an XR navigation bar with custom specs and guidance. See XR developer documentation (http://developer.android.com/design/ui/xr/guides/foundations) for more details.

#### Anatomy

#### Color & elevation

On XR, color is used to highlight elevated UI elements and orbiters. With spatial elevation (https://developer.android.com/design/ui/xr/guides/spatial-ui#spatial-elevation), the navigation bar displays above the spatial panel, on the Z-axis. Color communicates elevation on UI elements and orbiters. Elevated nav bars can use any of these color options:

#### Measurements

#### Usage

In full space, a navigation bar can appear in an orbiter for a more immersive experience. Currently, spatial capabilities, such as orbiters, are only available in full space. In home space, use a regular navigation bar on the same plane as the body content to mimic a 2D experience.

#### Behavior

##### Global context
When placed in global context, the navigation bar orbiter is centered at the bottom of the app it controls. It stays anchored to the app during layout or content changes. This ensures navigation elements are easy to find and use.

##### Local context
When placed in local context, the navigation bar orbiter is centered at the bottom of the spatial panel it controls. It repositions in response to layout or content changes.

[CAUTION] A navigation bar orbiter placed in local context.

#### Placement

##### Navigation context
The position of the navigation bar orbiter should communicate its navigational context:

- Use **offset positioning** for global actions that affect the overall app experience

- Use **inset positioning** for local actions that are specific to a spatial panel
A navigation bar orbiter can either overlap or be positioned adjacent to spatial panels with a 20dp margin for visual separation.

##### Inset positioning
Don’t obstruct content. To ensure a balanced and uncluttered layout, a navigation bar orbiter should overlap spatial panels by 12dp and no more than half their height.

[DON'T] Navigation bar orbiter inset positioning beyond the 12dp recommendation.

##### Horizontal alignment
The navigation bar orbiter placement shouldn't exceed the width of adjacent spatial panels.

[DON'T] Nav bar orbiter placement that exceeds the width of its spatial panel.

##### Spatial panel alignment
A navigation bar orbiter should always be placed at the bottom of a spatial panel and within the immediate field of view (FOV).
Their placement can be adjusted to accommodate specific needs, such as improved ergonomics or right-to-left (RTL) languages (/m3/pages/bidirectionality-rtl).

Avoid placing the navigation bar orbiter at the top of a spatial panel, as this area is typically reserved for app bar orbiters or other critical UI elements.

[DON'T] Nav bar orbiter incorrectly placed above a spatial panel.

#### Accessibility considerations

XR navigation bars should follow applicable Material nav bar accessibility standards (/m3/pages/navigation-bar/accessibility). More on XR accessibility (/m3/pages/xr-design/accessibility)


## Nav rail

starNote:XR guidelines are primarily intended for designers. Find what’s implemented in code in the design kit (https://www.figma.com/community/file/1035203688168086460).

Extended reality (XR) interfaces have special design requirements, like showing apps in 3D space. Material has an XR navigation rail with custom specs and guidance. See XR developer documentation (http://developer.android.com/design/ui/xr/guides/foundations) for more details.

#### Variants

There are two variants of navigation rail orbiters: the contained FAB and spatialized FAB navigation rails.

#### Anatomy

#### Color & elevation

On XR, color is used to highlight elevated UI elements and orbiters. With spatial elevation (https://developer.android.com/design/ui/xr/guides/spatial-ui#spatial-elevation), the navigation bar displays above the spatial panel (https://developer.android.com/design/ui/xr/guides/spatial-ui#spatial-panels), on the Z-axis. Color communicates elevation on UI elements and orbiters. Elevated nav rails can use any of these color options:

#### Measurements

#### Usage

In full space, a navigation rail can appear in an orbiter for a more immersive experience. Currently, spatial capabilities, such as orbiters, are only available in full space. In home space, use a regular navigation rail on the same plane as the body content to mimic a 2D experience.

#### Behavior

##### Global context
Intended for global navigation, a nav rail orbiter should be centered along the left or right edge of the app it controls. It stays anchored to the app during layout or content changes to ensure controls are easy to find.

[DO] A navigation rail orbiter placed in global context.

##### Local context
Don’t place a navigation rail orbiter in local context or between spatial panels (/m3/pages/xr-components/nav-rail#d965ae72-bd1b-45a9-b4d3-d1d542e72087). Local placement can make controls hard to find. Nav rails are designed for app-level navigation, so should only use the global context.

[DON'T] A navigation rail orbiter placed in local context.

#### Placement

##### Navigation context
The position of the navigation rail orbiter should communicate its navigational context:

- Use **offset positioning** for global actions that affect the overall app experience

- Use **inset positioning** for local actions that are specific to a spatial panel
A navigation rail orbiter can either overlap or be positioned adjacent to spatial panels with a 20dp margin for visual separation.

##### Inset positioning
Don’t obstruct content. To ensure a balanced and uncluttered layout, a navigation rail orbiter should overlap spatial panels by 12dp and no more than half their width.

[DON'T] Nav rail orbiter overlapping content by more than half its width.

##### Vertical alignment
A navigation rail orbiter can be aligned to the top, middle, or center of spatialized panels, providing different levels of visual prominence and accessibility.

Align the navigation rail orbiter based on the specific design and user experience goals for the application.

The navigation rail orbiter placement shouldn't exceed the height of adjacent spatial panels.

[DON'T] A nav rail orbiter positioning above its spatial panel.

##### Spatial panel alignment
Avoid placing a navigation rail orbiter between spatial panels. This negatively affects the interface structure.
Navigation rail placement can be adjusted to accommodate specific needs, such as improved ergonomics or right-to-left (RTL) languages (/m3/pages/bidirectionality-rtl).

For layouts that span more than two spatial panels, consider using a navigation bar orbiter (/m3/pages/xr-components/nav-bar).

[DON'T] A nav rail orbiter incorrectly positioned between spatial panels.

#### Spatialized FAB

There are two variants of navigation rail orbiters with different FAB treatments:

- **Contained FAB rail:** A contained FAB within the rail. This offers a compact and familiar layout.

- **Spatialized FAB rail:** The FAB becomes an orbiter of its own and is placed outside the navigation rail orbiter. Use this for higher emphasis and a distinct spatial effect.
Use the spatialized FAB rail to emphasize key actions and leverage XR hierarchy. Use the contained FAB rail to be more subtle, and align the experience with the baseline navigation bar.

To maintain visual association, place the spatialized FAB in close proximity to the navigation rail orbiter. Material recommends a 20dp margin.

The spatialized FAB can be placed above or below the navigation rail orbiter.

While the spatialized FAB and navigation rail orbiter are typically positioned together, their placement is adaptable.

[CAUTION] Spatialized FAB positioned with excessive spacing between itself and the navigation rail orbiter.

#### Accessibility considerations

XR accessibility (/m3/pages/xr-design/accessibility) guidelines are still evolving. XR navigation rails should follow applicable Material nav rail accessibility standards (/m3/pages/navigation-rail/accessibility).


## Toolbars

starNote:XR guidelines are primarily intended for designers. Find what’s implemented in code in the design kit (https://www.figma.com/community/file/1035203688168086460).

Extended reality (XR) interfaces have special design requirements, like showing apps in 3D space. Material has an XR toolbar with custom specs and guidance. Read XR developer documentation (https://developer.android.com/design/ui/xr/guides/foundations) for more details.

#### Variants
There is one toolbar orbiter. It closely aligns with the floating toolbar. It can be configured to be horizontal or vertical. Go to XR toolbar API reference (https://developer.android.com/reference/kotlin/androidx/xr/compose/material3/package-summary#HorizontalFloatingToolbar(kotlin.Boolean,androidx.compose.ui.Modifier,androidx.compose.material3.FloatingToolbarColors,androidx.compose.foundation.layout.PaddingValues,androidx.compose.material3.FloatingToolbarScrollBehavior,kotlin.Function1,kotlin.Function1,kotlin.Function1))

#### Anatomy

#### Color & elevation
XR uses color to communicate the elevation of UI elements and orbiters. With spatial elevation (https://developer.android.com/design/ui/xr/guides/spatial-ui#spatial-elevation), the toolbar displays above the spatial panel on the Z-axis. Elevated toolbars can use any of these color options:

#### Measurements

#### Usage
A toolbar can appear in an orbiter for a more immersive experience. Currently, this spatial capability is only available in full space. In home space, use a regular toolbar on the same plane as the body content to mimic a 2D experience.

#### Behavior

##### Local context (recommended)
When placed in local context, the toolbar orbiter is centered at the bottom of the spatial panel it controls. 
It repositions in response to layout or content changes.

##### Global context
When placed in global context, the toolbar orbiter is centered at the bottom of the app. 
It stays anchored to the app during layout or content changes.

[CAUTION] A toolbar orbiter placed in global context.

##### Expand & collapse
Toolbar orbiters with more than five items can expand and collapse to reveal or hide additional content.
When a toolbar orbiter expands, it stays within the bounds of the adjacent spatial panel.
Alternatively, more complex toolbars can be split into multiple toolbars.

##### Additional toolbars
In some cases, full space apps can have more than one toolbar orbiter, placed in either global or local context.

[CAUTION] An app switches between 1 and 2 toolbar orbiters.

#### Placement

##### Offset & inset positioning
In full space, a toolbar orbiter can be positioned adjacent to or overlap a spatial panel.

[DO] Toolbar orbiter with offset positioning.

[DON'T] Toolbar orbiter with inset positioning above 12dp that obstructs content on the spatial panel. 

##### Horizontal alignment

[DO] A horizontal toolbar orbiter placed within the bounds of its spatial panel.

[DON'T] A horizontal toolbar orbiter that extends beyond the width of its spatial panel.

##### Vertical alignment

[DO] A vertical toolbar orbiter placed within the bounds of its spatial panel.

[DON'T] A vertical toolbar orbiter that extends beyond the height of its spatial panel.

##### Spatial panel alignment
By default, toolbar orbiters are center-aligned to the spatial panel. Their placement can be adjusted to accommodate specific user needs, such as improved ergonomics or right-to-left (RTL) languages (/m3/pages/bidirectionality-rtl).

Avoid placing a vertical toolbar orbiter between spatial panels. 

This negatively affects the interface structure and can make it difficult to find.

[DON'T] A vertical toolbar orbiter is placed between 2 spatial panels.

#### Accessibility considerations
XR accessibility (/m3/pages/xr-design/accessibility) guidelines are still evolving. XR toolbars should follow applicable Material toolbar accessibility standards (/m3/pages/toolbars/accessibility).
