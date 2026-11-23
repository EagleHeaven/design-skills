# Advanced customizations

Source: https://m3.material.io/styles/color/advanced

Apply, define, or adjust colors to create a fine-tuned, unique color experience


## Overview

From changing a component’s default color mapping to creating additional color roles, advanced customizations fall within one of three general actions: applying, defining, or adjusting colors.

#### Apply colors
You can apply colors in places or ways that aren’t provided by default.
Combine multiple color schemes (/m3/pages/advanced/apply-colors#5ceacf6b-364e-4dab-83db-299c691cb21d)
Use multiple color schemes in the same app experience, such as a baseline scheme combined with a dynamic content-based scheme.
Map or remap colors onto UI elements (/m3/pages/advanced/apply-colors#d15f5373-c03b-4282-a309-db569975d395)
Change a component’s default color mapping, or apply colors to your own custom components.

#### Define new colors
You can add colors to your color scheme, extending the default color roles.
Define static colors (/m3/pages/advanced/define-new-colors#f13116d1-3023-44b9-b0b5-2ee07dc1af5f) (formerly known as custom colors)
Add colors to a dynamic color scheme that stay static, which are useful for semantic colors.
Define custom color roles (/m3/pages/advanced/define-new-colors#baed14ce-4be8-46aa-8223-ace5d45af005)
Create new color roles to use alongside the 26+ standard color roles.

#### Adjust existing colors
You can control the color algorithm’s output to adjust the appearance of dynamic colors.
Define your own baseline scheme (/m3/pages/advanced/adjust-existing-colors#c6810874-a320-4684-8df6-3869887ea49c)
You can input colors to define your own baseline scheme.
Define your own dynamic scheme (/m3/pages/advanced/adjust-existing-colors#e169ea0f-a190-4cd1-b0d4-4e3616964129)
You can define color algorithm rules to produce your own custom dynamic scheme.
Use color fidelity (/m3/pages/advanced/adjust-existing-colors#cb49eeb4-3bbd-4521-9612-0856c27f91ef)
You can apply color fidelity to make scheme colors better match your input colors.


## Apply colors

You can apply colors in places or ways that aren’t provided by default.

#### Combine multiple color schemes

Use multiple color schemes in the same app experience, such as a baseline scheme combined with a dynamic content-based scheme.

##### Why
If your app features content-rich moments, such as a media player, it can enhance a user’s experience by applying local color based on that content.

##### How

- Start from a baseline (/m3/pages/static/baseline) or user-generated dynamic (/m3/pages/dynamic/user-generated-source) scheme to create a consistent color foundation in your app.
- On top of this foundation, map content-based color roles to contained spaces (/m3/pages/dynamic/content-based-source) to emphasize or celebrate content. For example, a music app might derive color from a specific album’s artwork to build upon the personal connection to a music library.
##### Best practices

- Consider where content exists in the UI and where content-based color can enhance a person’s experience. Your existing app structure can suggest contained areas for content-based color to live.
- **Build hierarchy & direct attention:** When many types of information and actions share a screen, use content-based color to add hierarchy and draw attention to the content.
- **Link and associate content on a screen:** In lists and collections of repeated items that benefit from differentiation, content-based color can help associate related elements. This helps people quickly distinguish and pair related information, such as a list item and its associated action.
- **Immerse users in content color:** Full-screen content-based color moments can orient users within a content-driven experience, such as a media control or a purchase flow. 
- **Pair content-based color with its source content:** Keep the source for content-based color visible on a screen using the content color. This way users are shown where a content-based color originates. Avoid applying content-based color in spaces where the content itself isn’t visible.
- **Limit the number of color source types per screen:** Limit a screen to two color schemes from different source types. Too many color schemes on the same screen may lead to confusion and visual disarray. For example, a baseline or user-generated color scheme can be combined with one type of on-screen content (such as album art).
- **Don’t replace semantic colors:** Use caution when applying content-based color in places where a semantic color or conventional color meaning is important for usability. For example, a common red error message or a common green positive action shouldn’t be replaced with dynamic content-based color because it may interfere with someone’s understanding.

#### Map or remap colors on UI elements

You can change a component’s default color mapping, or apply colors to your own custom components.

##### Why
You want to map colors to a custom-built component or change a Material Component’s default color mapping to improve its function (such as visual contrast) or style.

##### How
Choose an appropriate color role based on how the color is used (see color roles (/m3/pages/color-roles)) and how well the role supports your intended design expression.

###### Design

- In Figma, select the component or element you want to remap so that you see its colors in the Design panel on the right of the screen
- To remap a color, hover on the color row in the Design panel and select the **Style** icon (four dots). This opens a selection dialog.
- Search for your theme name to see the available color roles
- Select the color role that most closely matches that color's use case in the component. For example, the background color of a component could be replaced with the **surface** color role and the color for text or icons could be **on surface**. See Color roles (/m3/pages/color-roles) for more information on what color to use where.
- Select **Use style** to apply that color to the selected objects
- Repeat until all colors in the component have been replaced with color roles from your scheme
##### Best practices

- Make sure to use color roles that support Material's contrast requirements for the component. Any color roles starting with "on-" are guaranteed to have sufficient contrast with the corresponding color role. Other color role pairs may not meet the 4.5:1 (small text) and 3:1 (large text) Material contrast requirements.
- If you’re applying a dynamic scheme, test how the color on the component appears under different themes (such as light and dark; red, yellow, green and blue) to ensure it looks as desired in dynamic color
- Always apply color roles rather than static values or tonal palette values, as these colors will break with light and dark themes, contrast control, and other features. If the color in a role does not meet your needs, you can define new colors or adjust existing colors.


## Define new colors

You can add colors to your scheme to extend the color roles provided by Material out of the box.

#### Define static colors

*Formerly known as custom colors*
You can define additional colors in your scheme that stay static even when other colors dynamically change. When you input a desired reference color, Material will return four derived color roles that align with the design of existing roles in the color scheme.

##### Why
You may need to apply static colors in your app for brand expression or to communicate semantic meaning, like a green success state. By defining these colors using the Material system, they'll work with existing Material colors and support features like dynamic color and user-controlled contrast.

##### How
Use the Material Theme Builder to input a custom color. Material will return four color roles derived from that reference color. The main color, on-main color, container color, and on-container color all follow the conventions of the accent colors in the main scheme, and can be applied to your UI according to the same relationships. See map or remap colors on UI elements (/m3/pages/advanced/apply-colors#d15f5373-c03b-4282-a309-db569975d395) for more information.

##### Best practices

- If the colors provided back from your input color appear differently than expected, you can enable or disable color fidelity. Color fidelity (/m3/pages/advanced/adjust-existing-colors#cb49eeb4-3bbd-4521-9612-0856c27f91ef) is a feature that adjusts colors’ tones to match that of your input color.
- Material provides the red Error color out of the box as an example of a static color, so you do not need to define your own static color for a semantic red color.
- If you are using static colors in a dynamic scheme, you can choose to harmonize your static colors (/m3/pages/advanced/adjust-existing-colors#1cc12e43-237b-45b9-8fe0-9a3549c1f61e) to the scheme’s primary color. This will shift your static colors’ hues slightly warmer or cooler for a more harmonious overall appearance, while retaining the semantic meaning associated with the colors’ hue range.

#### Define custom color roles

You can define custom color roles in addition to those already existing in the color scheme. By defining these roles the same way Material does (specifying a reference palette, starting tones, and contrast requirements), these roles can achieve colors more specific to your needs while working seamlessly with features such as user-controlled contrast.

##### Why
You may need to define your own custom color roles if the scheme’s existing colors or additional static colors don’t meet your product’s needs. In particular, you should create them within the Material system to respect dynamic colors and unlock other features like user-controlled contrast.

##### How
Abstract your new color into a color role by specifying the following criteria:

- **Palettes and reference tones:** For each color role, you must assign its value from a Material palette (primary, secondary, tertiary, neutral, neutralVariant, error) and a reference tone (for example: primary70, primary80, primary90…) for both light and dark themes.
- **Color pairings:** You must specify any visual relationships in your design, such as color pairs that are used together as foreground and background, or which should retain a tone delta between them (difference in lightness or darkness).
- **Contrast:** Confirm that custom foreground and background color pairings meet Material's contrast minimums (/m3/pages/designing/color-contrast).Once the above criteria are known, you can define the new color roles in your own dynamic color object. For each color role, you may then call Material Color Utilities (MCU) to generate the color value dynamically, according to different conditions such as user theming or contrast level.

##### Best practices
Defining custom color roles should be considered only if you cannot achieve your desired colors with other Material color solutions.


## Adjust existing colors

You can control the color algorithm’s output to adjust the appearance of colors within the roles provided by default.

#### Define your own baseline scheme
You can input colors to define your own baseline scheme.

##### Why
You may want to define your own baseline scheme so your app’s colors stay static (ie. does not change with dynamic color), such as to reflect your brand colors. By providing your own custom input colors for the primary, secondary, tertiary, and neutral colors in the scheme, Material will provide back the scheme’s regular color roles with values derived from your reference colors.

##### How
Using the Material Theme Builder, input your own colors for primary, secondary, tertiary, neutral, and neutral variant. The Theme Builder will generate a color scheme with values based on your inputs, and the given color roles can be used in the same manner as those from any other Material scheme.

##### Best practices

- Conventionally, primary and tertiary colors are the most visually prominent in the scheme, with tertiary appearing complementary to primary by changing its hue. Secondary, neutral variant, and neutral colors match primary in hue but are progressively less chromatic in that order. Input your colors into the appropriate category to maintain similar relationships as designed by Material, and ensure expected and visually pleasing results when those colors are mapped to components.
- If the colors provided back from your input color appear differently than expected, you can enable or disable color fidelity (/m3/pages/advanced/adjust-existing-colors#cb49eeb4-3bbd-4521-9612-0856c27f91ef). Color fidelity is a feature that adjusts colors’ tones to match that of your input color.
- If the 26+ standard color roles do not meet your needs, you may need to define custom color roles (/m3/pages/advanced/define-new-colors#baed14ce-4be8-46aa-8223-ace5d45af005).

#### Define your own dynamic scheme
You can define color algorithm rules to produce your own dynamic scheme.

##### Why
Control the appearance of your app’s colors while respecting dynamic color. For example, you may want your app to match the user’s wallpaper theme, but appear more vibrant than the default dynamic theme colors.

##### How

- Material generates the color scheme by following hue and chroma values specified for each group of colors (primary, secondary, tertiary, neutral, and neutral variant). For more information, see how the system works (/m3/pages/color/how-the-system-works). To adjust the appearance of these colors and produce your own dynamic scheme, you must provide your own hue and chroma values for each of these color groups.
- Once these values are known, you may define your own scheme variant and call Material Color Utilities (MCU) to dynamically generate the scheme and provide color values for each role in the scheme.
##### Best practices

- Defining custom color roles should be considered only if you cannot achieve your desired colors with other Material color solutions.
- If the colors provided back from your input color appear differently than intended, you can enable or disable color fidelity (/m3/pages/advanced/adjust-existing-colors#cb49eeb4-3bbd-4521-9612-0856c27f91ef). Color fidelity is a feature that adjusts colors’ tones to match that of your input color.
- If the color roles provided by Material out of the box do not meet your needs, you may need to define custom color roles (/m3/pages/advanced/define-new-colors#baed14ce-4be8-46aa-8223-ace5d45af005) for greater control over their appearance.

#### Use color fidelity
You can apply color fidelity to make scheme colors better match your input colors.

##### Why
Material scheme colors are mapped to tones (lightness or darkness) to achieve visually accessible color pairings with sufficient contrast between foreground and background elements. In some cases, these tones can prevent colors from appearing as intended, such as when a color is too light to appear vibrant. Color fidelity is a feature that adjusts tones in these cases to produce the intended visual results without harming visual contrast.

##### How

- In the Material Theme Builder, you can toggle the “match color” option on your input color to enable or disable fidelity. By default, fidelity is enabled when you use Theme Builder to create a custom baseline scheme (/m3/pages/advanced/adjust-existing-colors#c6810874-a320-4684-8df6-3869887ea49c) or define static colors (/m3/pages/advanced/define-new-colors#f13116d1-3023-44b9-b0b5-2ee07dc1af5f).
- In code, you can flag color roles in your scheme with a boolean which will enable or disable fidelity for those colors.
##### Best practices

- When producing a custom baseline scheme or defining static colors, you may wish to toggle fidelity on and off to determine which setting better suits your desired design.
- Because color fidelity adjusts tones (lightness or darkness of colors), to ensure accessible contrast, remember to pair appropriate colors roles (/m3/pages/color-roles) together, such as a background color with its corresponding foreground “on” color.

#### Harmonize colors
In dynamic schemes, you can automatically adjust the hue of static colors so they look better alongside the scheme’s primary color.

##### Why
Static colors may visually clash with a  scheme’s dynamically changing colors. To improve visual harmony, Material provides an optional ‘harmonize’ function that slightly adjusts static colors to look better in dynamic schemes.
Colors that are closer in hue appear more pleasing together than colors with hues farther apart. Based on this principle, harmonization adjusts the hue of static colors, making them closer to the hue of the scheme’s primary color.

To preserve the semantic meaning of static colors (such as a red to communicate errors), harmonization limits the amount that a color’s hue can change. Harmonized colors will become warmer or cooler in hue without appearing like another type of color.

##### How

- In the Material Theme Builder, you can toggle harmonization on and off within the overflow menu for each static color you have added to the scheme.
- In code, use the ‘Blend’ function from Material Color Utilities (https://github.com/material-foundation/material-color-utilities) to harmonize colors
##### Best practices

- Harmonization will adjust a static color differently depending on the scheme’s primary color, so check the results under a variety of schemes to see the range of how they can appear in dynamic color.
- Don’t harmonize colors whose appearance should stay absolutely consistent, such as brand colors.
