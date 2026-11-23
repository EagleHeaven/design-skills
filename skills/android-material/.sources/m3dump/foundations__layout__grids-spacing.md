# Grids &amp; spacing

Source: https://m3.material.io/foundations/layout/grids-spacing

Grids and spacing organize content and actions for any layout


## Overview

- Grids create a consistent foundation and adapt across breakpoints (previously window size classes)

- Use spacing to group related information and direct people’s attention to key actions

- Density helps people see and compare more information in data-heavy views

#### Availability & resources

| Type
 | Resource
 | Status
 | 
| Design
 | M3 Design Kit (Figma) (https://www.figma.com/community/file/1035203688168086460)
 | Available
 | 
| Spacing system & tokens (/m3/pages/spacing/overview)
 | Available
 | 
| Implementation
 | Jetpack Compose: Rulers (https://developer.android.com/reference/kotlin/androidx/compose/ui/layout/Ruler)
 | Available
 |

#### What’s new

####### **May 2026**

- How to use grids and rulers to adapt layouts across devices

- Expressive spacing guidelines


## Grids

- Layouts in Material are based on a grid that adapts across all breakpoints (previously window size classes)

- Parts of the layout scaffold like rails and panes are positioned on this grid to create consistent adaptive layouts

- The structure and spacing values used in a grid can add personality to a product’s layout

#### How to use grids

##### Start with placing grid columns
Grids adapt across breakpoints. As the size increases, column count, width, and spacing change as well.

When moving between sizes, column count may increase to show more content or controls.

##### Place bars & rails
Populate regions of the layout scaffold that are closest to the edges of the screen’s usable space first. This may include:

- Bars like the navigation bar and rail

- Components like toolbars and app bars

##### Place panes
Next, populate the main region of the screen with panes with content and components, based on available space and structure.
See the canonical layout examples (/m3/pages/canonical-examples) for ideas on which panes are appropriate for a product.

#### Rulers & alignment

Rulers are a set of recommended global alignment lines that help create consistent focal points in a product, while keeping content and components consistently aligned.
How to implement rulers in Compose (https://developer.android.com/reference/kotlin/androidx/compose/ui/layout/Ruler)

##### Bar & safety rulers
Bar and safety rulers reserve space for system UI (https://developer.android.com/training/system-ui) elements like the status bar and gesture navigation.
They ensure actionable content like app bars aren’t covered by system UI.

##### Title rulers
The title ruler creates consistency for the screen’s title, aligning the text, icons, and other components in an app bar.

##### Content rulers
Use content rulers to align and anchor key content, such as headlines and carousels.

- First content ruler: Emphasizes major blocks like hero images, headlines, or primary components

- Secondary rulers: Determine where supplementary text or actions begin

##### Ruler options
Margin rulers come with some wiggle room to determine how tight or loose a product’s content feels on-screen. The standard ruler can be adjusted to the left or right.
Choosing a narrower or wider margin can create or remove negative space, or create expressive moments in a content-forward product.

Rulers can also be used to create more immersive experiences. For example, a photo grid can take the full width of the screen, while components like search use wider margins.


## Spacing

- Spacing helps group content, direct attention, and shape the personality of a product

- A denser layout can feel more serious and focused, while a more spacious layout can feel calm and open

- Material’s spacing system can adapt to breakpoints and density settings. More on the spacing system (/m3/pages/spacing/overview)

#### Spacing to group content

Grouping connects related elements that share context, such as an image and its caption. Use spacing to visually tie elements together and establish boundaries between unrelated items.

**Explicit grouping** uses visual boundaries like outlines, dividers, and shadows to group related elements in an enclosed area. 
It can also indicate that an item is interactive, such as:

- List items between dividers

- A card displaying an image and its caption

**Implicit grouping** uses close proximity and open space (rather than lines and shadows) to group related items. 
For example, the items in a carousel are placed close together, with space around the composition to separate them from other content.

#### Spacing to direct attention

Use rhythm, similarity, and other grouping principles to distinguish and highlight important elements.

##### Rhythm
Consistent spacing between related elements or groups makes them easier to navigate with the eye.

##### Similarity
Similar elements should have the same spacing and sizing in a layout to show they’re related.
Leading elements like thumbnails, avatars, or icons should always be aligned.

##### Proximity
Place components near each other to create cohesive groups. This helps people understand the relationships between information and actions.
For example, buttons should be close to the content they’re affecting.

##### Continuity
Place related elements in a container, row, or column to establish a clear group or relationship.

#### Spacing as expression

Give the most important content, tasks, or actions visual prominence with generous spacing and the brightest surfaces.

##### Focal points
Consistent placement of key actions and information helps build recognizable focal points across a product.

##### Negative space
Allow negative space to give form and meaning to elements on screen. Framing important actions or content with generous spacing creates emphasis.


## Density

- Information density is the consideration of the amount of information visible on the screen

- The default target size should be at least 48x48 CSS pixels

- People can change density as long as the density controls are accessible

- Apply density thoughtfully; not every layout needs it

- Layout and component scaling (component adaptation or component density) can allow people to scan, view, or compare more information at once

**Information density**

- Information density can be achieved through layout and design decisions without using component scaling

- Some people may not benefit from increased density

**Component scaling**

- Components can adapt and change dimensions to help people scan, view, or compare different amounts of information

- Don't apply component scaling by default if it would result in a target below 48x48 CSS pixels

#### Information density

Information density refers to the amount of content (such as text, images, or videos) in a given space.
A layout’s spacing dimensions, including margins, spacers, and padding, can change to increase or decrease its information density. High density layouts are useful when people need to scan, view, or compare a lot of information, such as in a data table. Increasing the layout density of lists, tables, and long forms makes more content available on-screen.
Consider density settings in the context of a device. Although a person may prefer a denser layout for desktop, they may not for mobile. Density shouldn’t automatically change across breakpoints or orientation unless a person changes it.

[DO] 2 layouts: 1 with low density and 1 with high density.

#### Component scaling

The component density scale controls the internal spacing of individual components.
The density scale is numbered, starting at 0 for a component’s default density. The scale moves to negative numbers (-1, -2, -3) as space decreases, creating higher density.
Higher density is typically applied by decreasing the top and bottom padding or overall height by 4dp.

Center the grouped element within the component container.
Text size shouldn’t change as the container size scales.

[DON'T] Dropdown menu with high density items and selectable space height of 38dp.

[DON'T] Single-line snackbar with high density.

##### Avoid applying component scaling by default

People should be able to **opt in** to dense layouts and components.
To ensure density settings can be easily reverted, settings interactions must use default target sizes (48x48 CSS pixels).  
Don't scale layouts below 48x48dp by default.

#### Targets

Dense components can be less accessible because interactive elements are smaller, so use caution when increasing information density.

[CAUTION] Selectable target of only 40dp.

Use caution when applying density to interaction targets. Accessible targets should retain a minimum of 48x48dp, even if the visual element, such as an icon, is smaller.

#### Pixel density

Pixel density is the number of pixels per inch. High-density screens have more pixels per inch than low-density ones. Elements with the same pixel dimensions appear larger on low-density screens and smaller on high-density screens.
To calculate pixel density:
Pixel density = Screen width (or height) in pixels / Screen width (or height) in inches

##### Density-independent pixels
Density-independent pixels, written as dp, are flexible units that scale to have uniform dimensions on any screen. They provide a flexible way to accommodate a design across devices. The Material design system uses density-independent pixels to display elements consistently on screens with different densities.
A dp is equal to one physical pixel on a screen with a density of 160.
To calculate dp: 
dp = (width in pixels * 160) / screen density

| Screen physical width
 | Screen density
 | Screen width in pixels
 | Screen width in dps
 | 
| 1.5 in
 | 120
 | 180 px
 | 240dp
 | 
| 1.5 in
 | 160
 | 240 px
 | 
| 1.5 in
 | 240
 | 360 px
 |
