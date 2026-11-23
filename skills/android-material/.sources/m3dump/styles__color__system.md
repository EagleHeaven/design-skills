# Color system

Source: https://m3.material.io/styles/color/system

Create accessible, personal color schemes communicating your product's hierarchy, state, and brand


## Overview

**The Material color system includes:**

- Built-in set of accessible color relationships
- 26+ color roles mapped to Material Components
- Built-in dark theme colors
- Static baseline color scheme with default colors assigned to each color role
- Dynamic color features including user-generated and content-based colorLearn how the system works (/m3/pages/color/how-the-system-works)

View transcript

Products with dynamic color can automatically generate and assign colors to each element in the UI.
This provides:

- Personalized UI
- Accessible contrast
- User-controlled contrast
- Automatic dark theme

#### Resources

| Type
 | Link
 | Status
 | 
| Design
 | Design Kit (https://www.figma.com/community/file/1035203688168086460) (Figma)
 | Available
 | 
| Implementation
 | Android Views (MDC-Android) (https://github.com/material-components/material-components-android/blob/master/docs/theming/Color.md)
 | Available
 | 
| Jetpack Compose (https://developer.android.com/develop/ui/compose/designsystems/material3#dynamic_color_schemes)
 | Available
 | 
| Flutter (https://pub.dev/packages/dynamic_color)
 | Available
 | 
| Tools
 | Material Theme Builder (https://www.figma.com/community/plugin/1034969338659738588/material-theme-builder)
 | Available
 |

#### What's new

May 2025

##### Three levels of contrast
Color roles support three levels of contrast so people can select the one that best suits their vision needs. Contrasts also are tokenized.

August 2024

##### More colorful text and icons
The following color roles are updated in light theme to be more colorful while still having accessible color contrast:

- On primary container
- On secondary container
- On tertiary container
- On error container Affected components:

- Badges
- Buttons
- Buttons
- Extended FAB
- FAB
- Icon buttons
- Segmented buttons
- Chips
- Lists
- Menus
- Navigation bar
- Navigation drawer 
- Navigation rail 
- Switches
- Toolbars

Oct 2023

##### Reorganized guidelines
Same color system, explained in a new way. Updated sections include:

- How the system works (/m3/pages/color/how-the-system-works)
- Advanced customizations (/m3/pages/advanced/overview)
- Color resources (/m3/pages/color-resources)

Feb 2023

##### Tone-based surface colors
Tone-based surface color roles (https://material.io/blog/tone-based-surface-color-m3) have replaced the previous approach of surfaces at +1 to +5 elevation.  The new color roles are not tied to elevation and offer more flexibility and support for color features, such as user-controlled contrast.

Technical changes were made to align the color system with Android SysUI:

- Updated the default light theme surface from tone 99 to tone 98
- Updated the chroma for the neutral palette, increasing it from 4 to 6
- Slightly darkened surface roles in dark theme

Feb 2023

##### Additional accent colors
Additional accent colors in the scheme provide more flexibility and choice for color application. In particular, a new set of fixed colors for the **primary**, **secondary**, and **tertiary** accent groups provide colors which stay the same across light and dark themes.


## How the system works

#### It's like paint-by-number

Imagine your product screen as a paint-by-number canvas:

- Each element on the screen has a number
- Each number is assigned a color

You can hand-pick a color for every "number" to create a static color scheme.

But now, you can also use Material's dynamic color system to automatically generate an entire palette of accessible colors for each "number" from a single source.
This source can be a user's wallpaper, or in-app content like imagery. If the source changes, the product colors update to match.

You can customize how dynamic color appears in your product by:

- Setting the color source
- Adding static or harmonized colors
- Changing which "numbers" are assigned to which elementsLearn about advanced customizations (/m3/pages/advanced/define-new-colors)

#### Essential terms

##### Color role 
Like the "numbers" on a paint-by-number canvas, color roles are assigned to specific UI elements. They have semantic names like **primary**, **on primary**, and **primary container,** and matching color tokens. See all color roles (/m3/pages/color-roles)

##### Dynamic color
Dynamic color takes a single color from a user's wallpaper or in-app content and creates an accessible color scheme assigned to elements in the UI. If the user's wallpaper or the in-app content changes, the colors in the UI will change to match.

##### Static color
UI colors that don't change based on the user's wallpaper or in-app content. Static colors can be hand-picked or generated in design tools like the Material Theme Builder. Once assigned to their respective color roles and UX elements, the colors remain constant.

###### **Baseline static color**
The default static color scheme for Material products. See the baseline color scheme (/m3/pages/static/)

#### How dynamic color generates color schemes

##### 1. It starts with a source color
There are three ways to get a source color.

###### **A. Generate it from a wallpaper**
User-generated color is sourced from a user's personal wallpaper. The wallpaper is digitally analyzed through a process called quantization, and a single color is selected as the source color.

###### **B. Generate it from in-app content**
Content-based color is sources from in-app content, like an album thumbnail image, logo, or video preview. 
Like user-generated color, the image is digitally analyzed through quantization, and a single color selected as the source color.

###### **C. Pick it by hand**
A hand-picked source color is deliberately selected by a designer.
**Did you know? **The baseline static color scheme uses a hand-picked source color.

##### 2. Feed the source color into an algorithm
Dynamic color is powered by the Material Color Utilities (https://github.com/material-foundation/material-color-utilities) (MCU), a set of color libraries containing algorithms and utilities that develop color themes and schemes in your app.
There are many color algorithms, but the most common ones are:

- **User-generated color algorithm
**Uses personal wallpaper to identify source color. Maps colors of specific tones (lighter or darker) into the scheme according to a combination of system design choices and user preferences.

- **Content-based color algorithm**
Uses image for source color. Tones are adjusted to match the appearance of the source image, while maintaining accessible contrast. 

- **Custom colors **
Colors closely match the chosen input colors, such as those representing brand or semantic meaning.

##### 3. The algorithm generates key colors

Material's color algorithms manipulate the source color's hue and chroma to generate **five complimentary key colors**.

- Primary
- Secondary
- Tertiary
- Neutral
- Neutral variant

##### 4. The algorithm creates tonal palettes
The system then manipulates tone and chroma values to create a **tonal palette** for each key color. Colors in these palettes are given a number from 0 to 100 in increments of 10, as well as 95, 98, and 99. Some palettes include more values.

##### 5. The algorithm assigns tones to color roles
The algorithm uses accessible color relationships to **assign specific tones to the 26 ****color roles** in both light and dark theme.

For example, the algorithm assigns the color tone primary40 to the **p****rimary** role and the tone primary100 to the **o****n primary** role.
See all color roles (/m3/pages/color-roles)

Dark theme colors are also automatically assigned so that apps receive both light and dark themes through a single set of color roles.

##### 6. The new colors are applied to the UI
The 26 standard color roles are already assigned to elements of the UI. When a new source color is picked, the UI dynamically changes color.

#### Color roles support three levels of contrast

In addition to light and dark theme, color roles also support three levels of contrast. This helps people select the contrast setting that best suits their vision needs:

- Standard (default)
- Medium
- HighThe standard contrast emphasizes visual hierarchy using high and low contrast elements. People with vision disabilities may choose medium or high contrast options for better support.

The contrast settings are automatically applied to both light and dark themes.

Custom components can support contrast levels by using Material's appropriate color roles. For example, use **primary container** and **on primary container**.
Use design tokens to apply color roles to custom components.

#### Pairing accessible tones

The system manipulates hue, chroma, and tone (HCT) values to **create a tonal palette for each color** with tones ranging from 0 to 100.
Color has physical limitations—whether it's actual physics, our own biological visual limitations, or the limitations of on-screen color rendering. For example, some hues cannot exist with certain chroma or tones. Color limitations are the reason colors such as bright light blue or bright light red are not quite possible. This is why the chroma value may increase or decrease for some tones in a tonal palette.

Material's color algorithms use these palettes to find and **pair contrasting tones, **creating accessible color combinations.

Because tone can describe the lightness or darkness of a color, it's used to define accessible color relationships. Those relationships are built into Material's color algorithms.
For example, the algorithms assign a dark tone to a button's container color and a light tone to its label color, ensuring that the colors have a 3:1 contrast.

For even more contrast, the algorithms assign tones even farther apart, achieving a 7:1 contrast.
This is the concept powering **user-controlled contrast** features.

#### Defining colors with hue, chroma, and tone (HCT)

**The system uses a color space called HCT**, which defines all colors using three dimensions: hue, chroma, and tone.
Changing HCT values lets you manipulate colors in flexible but predictable ways. Unlike other color spaces (like HSL or RGB), HCT allows the manipulation of a color's hue and chroma without affecting its tone. Watch to learn more:

##### Hue
Hue is the perception of a color as red, orange, yellow, green, blue, violet, and so on. Hue is quantified by a number ranging from 0-360 and is a circular spectrum (values 0 and 360 are the same hue).

##### Chroma
Chroma is how colorful or neutral (grey, black or white) a color appears. Chroma is quantified by a number ranging from 0 (completely grey, black or white) to infinity (most vibrant), though Chroma values in HCT top out at roughly 120.
Because of biological and screen rendering limitations, different hues and different tones will have different maximal chroma values.

##### Tone
Tone is how light or dark a color appears. Tone is sometimes also referred to as luminance. Tone is quantified by a number ranging from 0 (pure black, no luminance) to 100 (pure white, complete luminance).
Tone is crucial for visual accessibility because it determines contrast. Colors with a greater difference in tone create higher contrast, while those with a smaller difference create lower contrast.

##### HCT isn't interchangeable with other color spaces
Values from models like hue, saturation, and lightness (HSL) won't perfectly map to Material's hue, chroma, and tone (HCT). Don’t conflate color spaces when inspecting or adjusting colors.
For example, colors with the same perceived brightness share the same tone value in HCT, but can have different HSL lightness values.
