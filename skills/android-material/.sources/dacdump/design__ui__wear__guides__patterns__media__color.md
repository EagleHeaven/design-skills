# Color themes
Source: https://developer.android.com/design/ui/wear/guides/patterns/media/color

# Color themes

The system creates a theme for your app's media controls by sourcing a seed color from the current media entity's artwork. The Material 3 Expressive dynamic theme algorithm generates a secondary, tertiary and neutral palette. This theme reflects across the rest of the app screens.

## Examples of color themes

The following sections show examples of color themes.

### Example 1

<br />

Color palette (from artwork seed color)  
<br />

Media controls  
<br />

Overflow app screen

<br />

### Example 2

<br />

Color palette (from artwork seed color)  
<br />

Media controls  
<br />

Overflow app screen

<br />

### Example 3

<br />

Color palette (from artwork seed color)  
<br />

Media controls  
<br />

Overflow app screen

<br />

## Fallback theme

To prepare for an instance where there is no artwork, or seed color available, the system uses a fallback theme based on the user's current watch face.

You can also choose to use a monochrome palette and seed color in your media app. In this case, the media entity's artwork doesn't appear on the media controls screen.

### System media controls (fallback)

<br />

Color palette (from Watchface/SysUI color)  
<br />

Media controls  
<br />

Overflow app screen

<br />

### Media app controls (fallback) - mono

<br />

Color palette (monochrome color palette)  
<br />

Media controls  
<br />

Overflow app screen

<br />
