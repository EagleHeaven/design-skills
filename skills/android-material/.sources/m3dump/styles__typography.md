# Typography

Source: https://m3.material.io/styles/typography

Use typography to make content readable and beautiful


## Overview

- M3 type scale has 30 type styles: 15 baseline and 15 emphasized
- Use variable fonts for more control over expression in editorial treatments
- Use Material tokens to easily define font, line height, size, tracking, weight, and more

#### Availability & resources

This shows where the type scale is available and implemented into Material components.

| Type
 | Link
 | Status
 | 
| Design
 | Design Kit (https://goo.gle/m3-design-kit)
 | Available
 | 
| Google Fonts (https://fonts.google.com/)
 | Available
 | 
| Implementation
 | Flutter (https://api.flutter.dev/flutter/material/Typography/Typography.material2021.html)
 | Available
 | 
| Jetpack Compose (https://developer.android.com/develop/ui/compose/designsystems/material3#typography)
 | Available
 | 
| Jetpack Compose: Expressive (https://developer.android.com/reference/kotlin/androidx/compose/material3/Typography)
 | Available
 | 
| Android Views (MDC-Android) (https://github.com/material-components/material-components-android/blob/master/docs/theming/Typography.md)
 | Available
 | 
| Android Views (MDC-Android): Expressive (https://github.com/material-components/material-components-android/blob/master/docs/theming/Typography.md)
 | Available
 | 
| Web (https://github.com/material-components/material-web/blob/main/docs/theming/typography.md)
 | Available
 | 
| Web: Expressive
 | Unavailable
 |

#### Updates

**Aug 2026**

##### Language script height support
Material’s type scale can adapt line height automatically based on language script height category: small, medium, large, and extra large.
Components can then adapt their size based on these language heights.
More on language height (/m3/pages/typography/type-scale-tokens#fcae9063-6c70-4512-87f9-3b6e0d8aea04)

#### M3 Expressive update

May 2025

##### Updated M3 type scale with emphasized styles
Material’s type scale includes fifteen **baseline** type styles, the same as before, and fifteen new **emphasized** type styles. 
The emphasized type styles add more expression to highlighted moments.
Roboto Flex can be used on its own to show a range of emotional states, but is not yet part of the M3 typescale.
More on how to use emphasized styles (/m3/pages/typography/type-scale-tokens#0020d4d9-4f5b-4666-b3ce-c26db849bd73)
More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

##### Emphasized type style tokens
Design tokens offer an improved way to define typography in products by assigning an element's type style by a configurable value, rather than a set value.
Emphasized tokens allow for clearer hierarchies and prioritized components within a layout.
Type roles describe size—such as small, medium, and large—enabling them to adapt and respond to the device or context.

##### Google Design: Making Google Sans Flex
Learn how seven design problems shaped Google’s iconic typeface — from inception to going open-source.

Read the article on design.google (https://design.google/library/google-sans-flex-font)

#### Previous updates

##### Variable fonts
**Roboto Flex, Roboto Serif, & Roboto Mono**
Updated considerations for using variable fonts and different combinations of their customizable axes, including grade, width, weight, slant, and optical size.

##### Style roles
Type styles are defined by five roles: display, headline, title, body, and label.
These names are more descriptive, allowing for easier matching of type style to use case.


## Fonts

Static fonts like Roboto (https://fonts.google.com/specimen/Roboto) are currently applied by default to all Material 3 components. Variable fonts (https://fonts.google.com/knowledge/introducing_type/introducing_variable_fonts) like Roboto Flex (https://fonts.google.com/specimen/Roboto+Flex) have many more axes for expression, but aren't yet part of the M3 typescale.

#### Default typefaces

##### Roboto
Roboto (https://fonts.google.com/specimen/Roboto) is the default typeface for Android, and is used in the M3 typescale (/m3/pages/typography/type-scale-tokens#6a9f9f26-99bb-4185-82fc-a49725da0d01). 
Roboto includes over 3,300 glyphs for representing hundreds of languages around the world.

##### Roboto Flex
Roboto Flex (https://fonts.google.com/specimen/Roboto+Flex) is a variable font which adds more flexibility to typography. It has an extended range of weights, widths, and additional customizable attributes (like size-specific designs), and includes over 900 glyphs with support for Latin, Greek, and Cyrillic.
Roboto Flex is available (https://fonts.google.com/specimen/Roboto+Flex) as a standalone font.

##### Roboto Serif
Roboto Serif (https://fonts.google.com/specimen/Roboto+Serif) is another variable font family, designed to create a comfortable reading experience. Minimal and highly functional, it can be used anywhere (even in app interfaces) due to its extensive set of weights and widths across a broad range of sizes.

##### Roboto Mono
Roboto Mono (https://fonts.google.com/specimen/Roboto+Mono?query=roboto) is a monospaced version of the classic Roboto design. Being monospaced means each letter has equal space, and letterforms are adjusted to properly fill the space. 
Monospaced fonts are easier to scan vertically, so are particularly useful for code and keeping numbers aligned. Learn more about monospaced numbers (/m3/pages/typography/applying-type#f0f79df7-3174-4012-871e-93ce9a89d08b)

##### Noto Sans
Noto Sans (https://fonts.google.com/noto/specimen/Noto+Sans) is a global font collection for all modern and ancient languages.
Each Noto Sans family is compatible with Roboto and Noto Sans supports more than 150 scripts and thousands of languages. It is used as a “fallback” font, when a language is unsupported.
Learn more about typography language considerations (https://m2.material.io/design/typography/language-support.html#language-considerations)

| Variable font
 | Available axes
 | 
| Roboto Flex | Slant, Width, Weight, Grade, Optical Size. 
**Advanced axes****: **Thick stroke (XOPQ), thin stroke (YOPQ), counter width (XTRA), uppercase height (YTUC), lowercase height (YTLC), ascender height (YTAS), descender depth (YTDE), figure height (YTFI)
 | 
| Roboto Mono | Weight, Italic | 
| Noto Sans | Width, Weight, Italic |

#### Fallback protection with variable fonts

Font fallback is when a similar font is used as a replacement when the current font doesn't support the text's characters.

For example, products using the variable font Roboto Flex should apply font fallback in the following order:

- Roboto Flex
- Roboto
- Noto Sans font collectionThis ensures that text will have a consistent visual style regardless of font support. Designers should connect with their product and engineering partners to confirm that font fallback is available.


## Type scale & tokens

#### Type scale

A **type scale** is a selection of type styles used across a product to ensure consistency.

##### M3 type scale

Material 3 has one **type scale** containing two sets of **type styles: 15 baseline** and **15 emphasized**. Both of these style sets follow the same scale from Display Large to Label Small.
The **emphasized** styles were added in the expressive update. They have a higher weight and other minor adjustments compared to the baseline styles, and are best applied to bold, selection, and other areas of emphasis. Baseline and emphasized styles are meant to be used together.

#### Type scale tokens

Each of the 30 styles has a single token that captures all the default properties. Tokens are separated into the **baseline** and **emphasized** sets. Each axis and property, such as font, line height, size, tracking, and weight, also has an individual token for greater customization. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Baseline type style tokens

#### Emphasized type styles

The M3 type scale has 15 emphasized type styles. Use both baseline and emphasized type styles together to achieve expressive experiences. Material recommends using emphasized styles for selection, actions, headlines, and other editorial treatments (/m3/pages/typography/editorial-treatments#19e5796e-9db8-4687-b20c-c6cee77e7df8).

##### Emphasized type style tokens

#### Where emphasized styles can be used

##### Components
When used in components, emphasized type styles can communicate hierarchy or importance, such as an active or selected component, or an unread message. The emphasized styles work well with:

- Badges
- Buttons (for primary actions)
- Extended FAB
- Selected list items
- Selected menu itemsMaterial components don’t use emphasized type styles by default. To use an emphasized type style, swap the baseline token for the emphasized token of the same style. For example:

- Baseline: md.sys.typescale.display-large
- Emphasized: md.sys.typescale.**emphasized**.display-large

##### Weight
Use the emphasized styles on text that already uses weight (such as medium, bold) to communicate hierarchy.

##### Context
Use emphasized styles to draw attention to specifics aspects of components, such as selected states, unread messages, or key interactions.
Emphasized context and weight can be used at the same time.

#### Customize the typeface

The M3 type scale has the option to set different typefaces at different sizes. 

- The **brand** typeface is used for larger type styles, like Headline and Display, to focus on expression. 
- The **plain** typeface is used for smaller type styles, like Body and Label, to focus on readability. 
- Roboto is the default for both typefaces.Consider replacing Roboto with different typefaces to boost brand expression in your product. On emphasized styles, this can help important text stand out even more.

##### Brand and plain typeface tokens

#### Language height support

The type scale can adapt line height automatically based on language height category: small, medium, large, and extra large.
Development considerations:

- It’s recommended to default to **medium language height**, as most languages fall in that category, and switch to other sizes based on detected language.

- Material components that use **vertical padding** should adapt to language height automatically. Components with fixed heights are built for **small** values and may not adapt by default.

- Ignoring language height can lead to overlapping text and broken UI elements, leading to major internationalization issues and failing readability standards.

##### Language script categories

- **Small (base)**: Cyrillic, Greek, Hebrew, Latin-based languages (except Vietnamese)

- **Medium (~7% taller)**: Amharic, Arabic, Armenian, Bangla, Chinese, Gujarati, Hindi, Japanese, Kannada, Khmer, Korean, Lao, Malayalam, Odia, Punjabi, Sinhala, Tamil, Thai, Vietnamese, most other languages.

- **Large (~30% taller)**: Burmese, Telugu

- **Extra large (~100% taller)**: Nastaliq

##### Language height tokens
To view the language height tokens:

- Open the line height folder (Note: Other tokens like fonts and weights are in the same token set)

- Change the language height context at the top of the token module

#### Customizing type styles

To customize existing type styles, follow these steps:

- If using a different typeface, change the **brand** and **plain** typeface tokens. 
- Adjust properties like line height and letter spacing to refine the appearance. Avoid changing the type size; this can affect how components render and reflow.
- Repeat for both baseline and emphasized type styles. Try to keep emphasized styles visually consistent, like all wider than baseline.Heavier fonts may require wider letter spacing, while fonts with long ascenders and descenders will require different line heights. Axes can be further adjusted as necessary.
**Note: **Customizing the M3 type scale or individual styles may prevent you from receiving typography token updates from Material.

Different typefaces can be used for baseline and emphasized type styles.

#### Customizing your type scale

When different sizes from the defaults are needed, such as for different devices, you can customize the **type scale** by adding or removing styles, and even swapping out Roboto for a font of your choice.

Material Design uses the Major Second (https://cieden.com/book/sub-atomic/typography/different-type-scale-types#:~:text=with%2520dense%2520content.-,Major%2520Second%2520(1.125),-The%2520Major%2520Second) type scale with 14 as its key base size. This anchors to the most essential style used most often for typesetting body text.

Sizes on the rendered type scale should aim to provide impactful contrast between sizes by avoiding small differences.

##### Font size units
The following units are used to express font size on Android and the web.

| Platform | Android | Web | 
| Font size unit | sp | rem | 
| Conversion ratio | 1.0 | 0.0625 | Web browsers calculate the REM (the root em size) based on the root element size. The default for modern web browsers is 16px, so the conversion is SP_SIZE/16 = rem.

###### Example conversions

| Android | Web | 
| 10sp | 0.625rem | 
| 12sp | 0.75rem | 
| 24sp | 1.5rem | 
| 60sp | 3.75rem |

##### Letter spacing units
The following units are for spacing letters in a UI.

| Platform
 | Android
 | Web
 | 
| Letter spacing unit
 | em | rem | 
| Conversion ratio
 | (Tracking value in px / font size in sp) = letter spacing | (Tracking value in px / font size in sp) = letter spacing |

###### Letter spacing examples

| Android | Web | 
| (.2 tracking / 16sp font size) = 0.0125 em
 | (.2 tracking / 16px font size) = 0.0125 rem |


## Applying type

#### Applying type

The Material 3 type scale organizes styles into five roles that are named to describe their purposes: display, headline, title, label, body. Each role has three sizes: large, medium, and small. These roles and sizes create clear page hierarchy and work across many devices.

#### Roles

##### Display
There are three display styles in the default type scale: Large, medium, and small. As the largest text on the screen, display styles are reserved for short, important text or numerals. They work best on large screens.
For display type, consider choosing a more expressive font, such as a handwritten or script style.
If available, set the appropriate optical size to your usage.

##### Headline
Headlines are best-suited for short, high-emphasis text on smaller screens. These styles can be good for marking primary passages of text or important regions of content.
Headlines can also make use of expressive typefaces, provided that appropriate line height and letter spacing is also integrated to maintain readability.

##### Title
Titles are smaller than headline styles, and should be used for medium-emphasis text that remains relatively short. For example, consider using title styles to divide secondary passages of text or secondary regions of content.
For titles, use caution when using expressive fonts, including display, handwritten, and script styles.

##### Body
Body styles are used for longer passages of text in your app.
Use typefaces intended for body styles, which are readable at smaller sizes and can be comfortably read in longer passages.
Avoid expressive or decorative fonts for body text because these can be harder to read at small sizes.

##### Label
Label styles are smaller, utilitarian styles, used for things like the text inside components or for very small text in the content body, such as captions.
Buttons, for example, use the label large style.

#### Typesetting

Vertical typesetting relies on padding, bounding boxes, and baselines to ensure text legibility at any size.
Take engineering considerations and the conventions of your platform into account when making decisions for typesetting, text resizing, density, and using text in adaptive layouts.

##### Using padding and bounding boxes
Use this method for web products, and iOS products, where applicable. Note that some design tools also use bounding boxes for typesetting, but their methods vary and will need to be reconciled with the engineering implementation.

In web UIs, the line height and bounding box height are the same. Text is vertically centered within the bounding box, following the “half-leading (https://www.w3.org/TR/css-inline-3/#leading-trim)” behavior established by CSS.
The vertical position of the text isn’t controlled directly, but through the combination of the bounding box and font metrics.

Padding is the space between UI elements, such as between an image and a bounding box, or between the inner edge of the bounding box and the text.

Specify the distance of UI elements from fixed reference points, such as the container edge. For the web, automate this calculation using Sass or CSS.

[DO] Measurements of label text padding.

Vertical alignment using padding and bounding boxes:

- **Line height** 
Measure the height of the bounding box.
- **Centering** 
Ensure equal top and bottom padding around the inner edge of the bounding box by using center align
- **Spacing** 
Use the height of the bounding box, and top and bottom padding to determine spacing

##### Using the baseline
Use this method for Android products or platform-agnostic specs.

The baseline is the invisible line upon which a line of text rests. In Material Design, the baseline is an important specification in measuring the vertical distance between text and an element.

For Android, specifying distances relative to baseline enables accurate implementation.
The baseline can also be used to communicate text position between designers in a way that's agnostic to the platform or design tool.

[DO] Diagram of the distances between overline and container edge, plus subhead, overline, and caption text.

Vertical alignment using the baseline: 

- **Line height **
Measure distance from the text baseline of one line to the text baseline of the next line
- **Centering** 
Specify center alignment as a reference instead of measuring the distance to the text baseline
- **Spacing** 
Use the distance from a reference point to the text baseline

#### Ensuring readability

**Line height**
Line height is the space between each line of text and is directly connected to type size.
Material’s type tokens are optimized for intended size and use.

**Tabular numbers**
Use tabular figures (also known as monospaced numbers) rather than proportional digits in tables or places where values may change often, such as clocks.
Use monospaced tabular numbers to keep values optically aligned for better scanning.

#### Using Material Symbols with typography

Properly aligning typography with Material Symbols can improve cohesion and unity in your product. Learn more about matching icons and text (/m3/pages/icons/applying-icons#f9db4adc-ca78-473f-85eb-a351b73c39ac)

#### Accessibility

##### Color & contrast
Support visual accessibility by choosing the appropriate **color contrast** between your product’s text and background. Contrast is the perceived difference between the lightness or darkness of two colors, and is quantified by a **contrast ratio**.

Text should achieve sufficient contrast between its color and that of its background. 
Material aims for two main text contrast levels:

- 3:1 for large text
- 4.5:1 for small textLearn more about contrast ratios (/m3/pages/designing/color-contrast#b248ecd2-9abd-4877-8f5e-ebfbb87e2048)

The default color for typography is **on surface**, although **on surface variant** is a strong alternative.

For hyperlinked text appearing on top of a surface color, use primary. However, tertiary can be used to make links less prominent.
Hyperlinked text must also be underlined.


## Editorial treatments

#### Editorial treatments

Editorial treatments are standalone, showcase moments driven by type. They involve dynamic, attention-grabbing use of custom sizes, which can involve larger display type or a blockier look and feel. They should depart from purely functional layouts or basic stages in a user flow. 
In the expressive system, editorial treatments can be combined with elements such as motion, shape, or color, to create product-wide hero moments.

#### Examples of editorial treatments

Use editorial treatments in three key ways: to celebrate content, to highlight the voice of the user, or to draw attention to bespoke functionality within the product.

##### Celebrating content
Editorial treatments can dramatically take over the screen to mark a particular user action, memory, or preference.
Try matching the text to the tone of the product or a strong emotion, like a narrow, thin style for serenity, or a bolder, italicized style for liveliness.

##### Voice of the user
Express the voice of the user by letting them personalize the appearance of typography or by adjusting text based on their input.
Use customization selectively to frame a user’s mood and make it stand out.

##### Bespoke functionality
Editorial treatments can also be used to help express moments of unique functionality within the product experience.

#### Editorial treatment best practices

As there is intentionally much room for choice in developing editorial treatments, there are a few guard rails that will prevent inconsistency, illegibility, or distracting design.
These best practices include:

- Ensuring consistency between similar-looking editorial moments, creating tokens for each where needed
- Matching the emotional tone of text to the task at hand
- Not mixing multiple or clashing styles in the same layout
- Not mimicking personalization theming

[DO] A UI showing two instances of editorial treatments with consistent styling.

[CAUTION] A UI featuring a name in which the first is using a different custom type treatment than the last.

#### Use variable axes to make editorial treatments
Adjust variable font axes like weight, grade, width, and optical size to match the font to the feeling. Baseline and emphasized type styles can still be used. Though, editorial treatments shouldn’t be used in labels or just to give information.

##### Weight
Weight is the primary attribute that defines the overall thickness of a typeface’s strokes in any given font. The most common weights are regular and bold, but weights can cover extremes from the very light to the very heavy.
If the typeface is variable, it provides a full, continuous range of stroke thicknesses, making the number of weights effectively unlimited.
Learn more about weight on Google Fonts (https://fonts.google.com/knowledge/choosing_type/exploring_typefaces_with_multiple_weights_or_grades)

[CAUTION] Light text in use as body text.

[CAUTION] Navigation bar using bold typography for label text, making it challenging to read.

##### Grade
Grade is a secondary modifier of a typeface’s optical weight, independent of the weight axis. Both weight and grade axes affect a letter’s thickness, but adjustments with grade are much more granular and don’t change any letter widths or line breaks.
Learn more about grade on Google Fonts (https://fonts.google.com/knowledge/choosing_type/exploring_typefaces_with_multiple_weights_or_grades)

##### Width
Width is the result of how much horizontal space is taken up by a typeface’s characters.
A narrow width allows more characters to fit per line while a wider width may offer more personality.
Learn more about width on Google Fonts (https://fonts.google.com/knowledge/glossary/width)

[DO] A bottom navigation bar with four icons using narrow label text under the icons.

[DON'T] Top app bar with the title best thrift stores in wide type next to three icons.

##### Optical size
Optical sizes are different versions of a typeface optimized for use at different sizes.
Small size designs focus on enhancing readability, while large size designs can show off the intricacies of the letter forms and offer many more weights and widths.
Learn about choosing typefaces that have optical sizes. (https://fonts.google.com/knowledge/choosing_type/choosing_typefaces_that_have_optical_sizes)

[DO] The words “massive” and “tiny” with optical sizes that match their type size.

[DON'T] Two paragraphs of text set with an optical size larger than the type size.
