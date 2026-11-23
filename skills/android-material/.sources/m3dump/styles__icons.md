# Icons

Source: https://m3.material.io/styles/icons

Icons are small symbols to easily identify actions and categories


## Overview

- Get Material Symbols icons at fonts.google.com/icons (https://fonts.google.com/icons). Recolor, resize, and copy and paste icons.

- Use the Material Symbols variable font to enable dynamic styling in product

- You can change the weight, fill, optical size, and grade of variable font icons

#### Resources

| Type
 | Link
 | Status
 | 
| Design
 | Icons catalog (https://fonts.google.com/icons)
 | Available
 | 
| Material Symbols Figma plugin (http://goo.gle/material-symbols-figma)
 | Available
 | 
| Icon keyline template (ZIP) (https://storage.googleapis.com/material-io-design/downloads/gm_icon_template.ai.zip)
 | Available
 |

#### What's new

##### Copy & paste customized Material Symbols
You can now copy and paste icons from Google Fonts (http://fonts.google.com/icons). Once you search for and select the desired icon, options will appear in the right-hand panel to resize, recolor, and copy the customized icon to clipboard.

##### Material Symbols
The new variable icon font set supports three styles: **outlined**, **rounded**, and **sharp**. All Material Symbols are newly drawn to be pixel-crisp and modernized.

##### Adjustable axes
Material Symbols have four adjustable stylistic variable font attributes called **axes**. An axis refers to an attribute of a symbol that can be altered to create visual variations. The attributes are: weight, fill, optical size, **grade**.

##### Material Symbols Figma plugin
Easily incorporate Material Symbols (http://goo.gle/material-symbols-figma) into your latest designs on Figma.


## Designing icons

#### Design principles
Icons are an essential element of any interface, packing an informative punch into a small form factor. They’re designed to be simple, modern, friendly, and sometimes quirky. To ensure consistency and readability, their limited size means that each icon must strictly adhere to guidance while still expressing essential characteristics.

[DO] Front view of boat icon.

[DON'T] Boat image with sails, mast, and flag.

[DO] Use geometric, consistent shapes.

[DON'T] Detailed thumbs-up icon with contoured fingers in outline.

[DO] Four icons with a consistent style.

[DON'T] Four icons with a inconsistent styles.

#### Icon sizes and layout

##### Standard (Baseline) icon size
Standard icons are displayed as 24dp x 24dp. For pixel-perfect accuracy, create icons for viewing at 100% scale.

##### Additional optical icon sizes
Icons support additional sizes: 20dp, 40dp, and 48dp, with 20dp primarily for desktop, dense layouts, and small scale visuals, and 40dp and 48dp optimized for display or headline type, plus larger screen sizes.

##### Standard (Baseline) icon layout
Icon content should remain inside of the **live area**, which is the region of an image that is unlikely to be hidden from view (such as an area where sidebars appear upon scrolling).
If additional visual weight is needed, content may extend into the padding between the live area and the **trim area** (the complete size of a graphic). No parts of the icon should extend outside of the trim area.

[DO] A 24dp-by-24dp icon grid with the inner 2dp padding highlighted.

[CAUTION] Icon using live area and trim area.

[DON'T] Icon exceeding trim area.

#### Grid and keyline shapes

##### Icon design template
If your design requires an icon that isn’t covered by the over 2,000 variations in Google Font’s icon library (https://fonts.google.com/icons), you may want to create your own. Download this 24dp keyline template (https://storage.googleapis.com/material-io-design/downloads/gm_icon_template.ai.zip)* (ZIP file) to design custom icons in Adobe Illustrator.
**This template is available under **Apache 2.0* (https://www.apache.org/licenses/LICENSE-2.0.html)*. By downloading this file, you agree to the **Google Terms of Service* (https://policies.google.com/terms)*. The **Google Privacy Policy* (https://policies.google.com/privacy)* describes how data is handled in this service.*

##### Icon grid and keyline
The icon grid establishes clear rules for the consistent, but flexible, positioning of graphic elements. 
Keyline shapes are the foundation of the grid. By using these core shapes as guidelines, you can maintain consistent visual proportions across system icons.

[DO] Icon grid including a folder icon aligning to the grid. X and Y placement coordinates are shown using integers.

[DON'T] Icon grid including a folder icon misaligned to the grid with X and Y placement coordinates shown using decimals.

#### Icon metrics

##### Anatomy

##### Corners
Corner radii are 2dp by default. For the outlined style symbols, interior corners are square, not rounded. For shapes 2dp wide or less, stroke corners shouldn’t be rounded.
For the rounded style symbols, both exterior and interior corner radii are rounded and for the sharp style symbols, both exterior and interior corners radii reduce from 2dp to 0dp.

[CAUTION] Document icon placed on grid with overly rounded corners highlighted.

[DON'T] ‘Add more’ icon placed on grid with inconsistent rounded corners. 

##### Weight and stroke
The recommended stroke weight for icons is 2dp or the regular weight (400), which includes curves, angles, and both interior and exterior strokes. Material Symbols can provide a range of weights between thin (100) and bold (700).

##### Complex icon shapes
If an icon requires complex details, subtle adjustments can be made to improve its legibility. These adjustments are referred to as optical corrections. Any optical correction should use the geometric forms on which all other icons are based, without skewing or distorting those shapes.

[DO] Building icon using flat shapes.

[DON'T] Building icon in isometric perspective.


## Applying icons

#### Icon & Material Symbol styles

Material Symbols are the new default, and are available in three styles: **outlined, rounded, **and** sharp**. (The legacy Material Icons continue to be available, but don’t have the variable font capabilities of Material Symbols.)

##### Outlined style 
Outlined symbols use stroke and fill attributes for a light, clean style that works well in dense UIs. The stroke weight of outlined icons can be adjusted to complement or contrast the weight of your typography.

##### Rounded and sharp styles
Rounded symbols use a corner radius that pairs well with brands that use heavier typography, curved logos, or circular elements to express their style.
Sharp symbols display corners with straight edges, for a crisp style that remains legible even at smaller scales. These rectangular shapes can support brand styles that aren’t well-reflected by rounded shapes.

#### Customizing Symbols

Material Symbols have four adjustable stylistic variable font attributes called **axes**. An axis is a typographic term referring to the attribute of a symbol that can be altered to create visual variations. 
Each style symbol contains four axes: **weight, fill, grade,** and **optical size**.

##### Weight 
Weight defines the symbol’s stroke weight, with a range of weights between thin (100) and bold (700). Weight can also affect the overall size of the symbol.

[DON'T] Photo gallery using 100 weight icons.

[CAUTION] Three side-by-side 24p standard symbols.

[DO] Navigation rail with consistent symbol weights.

[DON'T] Navigation rail with varying symbol weights.

##### Fill
Fill gives you the ability to transition from a more outlined style to a reversed or more filled style. 
A fill attribute can be used to convey a state of transition, such as unfilled and filled states. Values range from 0 to 1, with 1 being completely filled. Along with weight, fill is a primary attribute that impacts the overall look of a symbol.

##### Grade
Weight and grade affect a symbol’s thickness. Adjustments to grade are more granular than adjustments to weight and have a smaller impact on the size of the symbol.
Grade is also available in some text fonts. Grade levels between text and symbols can be matched for a harmonious visual effect. For example, if the text font has a -25 grade value, the symbols can match it with a suitable value of -25.

Grade can also compensate for** visual bleed**, which is when images can look bigger or smaller depending on the color contrast. To match the apparent icon size, the default grade for a dark icon on a light background is 0, and -25 for a light icon on a dark background.

To make strokes heavier and more emphasized, use positive value grade, such as when representing an active icon state.

##### Optical sizes
Optical sizes range from 20dp to 48dp.
For the image to look the same at different sizes, the stroke weight (thickness) changes as the icon size scales. Optical size offers a way to automatically adjust the stroke weight when you increase or decrease the symbol size.

Traditionally, icons are resized from a 24dp source vector, resulting in a large scaled icon that’s too heavy compared to the original. With the optical size axis, you can maintain the stroke weight (thickness) as the icon size grows.

#### Using Material Symbols with typography

Material Symbols are designed with similar considerations to typefaces, and often appear alongside text. Choosing the right icon set can tie the content of an interface together, enhancing the cohesive branded feel of your product.

[DO] Text and icon that are the same size.

[DON'T] A small icon mismatched with larger text.

[DO] An icon and text that are the same optical weight.

[DON'T] An icon and text that have mismatched optical weight.

[DO] Icon that has had its baseline shifted down 11.5%.

[DON'T] Icon and text that are using the same baseline.

#### Accessibility

Learn more about making your icons more accessible.

##### Icons with a label text
Label text provides short, meaningful descriptions when symbols are more abstract. This can prove helpful in the case of navigation.

##### Small icons
Material Symbols can scale up or down in size without a loss of fidelity. Simple symbols, like stars for ratings, can be used on their own at any size, as long as they remain identifiable.

Other symbols should have an accompanying text label below 20dp to ensure their meaning is clear and to maintain accessibility. These symbols include:

- Complex icons, which are highly detailed or have multiple parts

- Icons with a key action, which are essential to using the product

##### Target size
Adequate space should surround icons to allow legibility and interaction.

Symbols of 24dp should have a target size of 48dp by default.

When a mouse and keyboard are the primary input methods, measurements may be condensed to accommodate denser layouts.
A 20dp size symbol can use a target size of 40dp.

#### Localizing icons

To make sure iconography translates effectively in local markets, test it across age groups, cultures, and languages, and follow these best practices:

- Use labels when icons and symbols are more abstract
- Remember that navigation items must have labels for clarity and accessibility
- Consider tech knowledge: people who use the internet a lot may have different understandings of icons than people who use the internet less

##### Cultural influence of colors and symbols
Color carries cultural significance and can convey different emotions in different cultures. White is commonly associated with purity in western cultures but symbolizes mourning in some eastern cultures.

Consider cultural interpretations of symbols. In many western cultures, owls represent wisdom, while some eastern cultures view them as a negative omen. When using or creating symbols, be mindful that their meanings can vary significantly across cultures.
