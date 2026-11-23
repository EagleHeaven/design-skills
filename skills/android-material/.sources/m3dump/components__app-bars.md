# App bars

Source: https://m3.material.io/components/app-bars


## Overview

- Focus on describing the current page and provide 1–2 essential actions

- Displays labels and page navigation controls at the top of the page. (Use a toolbar to display page actions)

- Four variants: Search app bar, small, medium flexible, large flexible

- On scroll, apply a fill color to separate from body content

- Can animate on and off screen with another bar of controls, like a row of chips

#### Availability & resources

#### M3 Expressive update
**May 2025**
The new **search app bar** supports icons inside and outside the search bar, and centered text. It opens the search view (/m3/pages/search/overview) component when selected. 

The new **medium flexible** and **large flexible** app bars come with significant improvements, and should replace **medium** and **large** app bars, which are no longer recommended. The **small** app bar is updated with the same flexible improvements. 

More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

Variants and naming:

- Renamed component from **top app bar** to **app bar**

- Added **search app bar**

- **Medium** and **large** app bars are no longer recommended

- Added **medium flexible** and **large flexible **app bars with:

- Reduced overall height

- Larger title text

- Subtitle

- Left- and center-aligned text options

- Text wrapping

- More flexible elements for imagery and filled buttons

- Added features to **small **app bar:

- Subtitle

- Center-aligned text option

- More flexible elements for imagery and filled buttons

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color
- On scroll: No drop shadow, instead a color fill creates separation from content
- Typography: Larger default text
- Layout: Smaller default height


## Specs

#### Variants

##### Baseline variants
The baseline M3 **medium** and **large** app bars are no longer recommended in M3 Expressive, and should be replaced with **medium flexible** and **large flexible** app bars, which are similar visually, but have multi-line support, a shorter height, and can contain a wide variety of elements, like images. Jump to baseline app bar specs (/m3/pages/app-bars/specs#faec9baf-140f-41dc-8b88-2792e90d9d5d)

| Variant
 | M3
 | M3 Expressive
 | 
| Search app bar
 | --
 | Available
 | 
| Small
 | Available
 | Available
 | 
| Center-aligned
 | Available
 | Merged into **small**. 
Use centered-text configuration.

 | 
| Medium (baseline)
 | Available
 | Not recommended.
Use **medium flexible**
 | 
| Medium flexible
 | --
 | Available
 | 
| Large (baseline)
 | Available
 | Not recommended.
Use **large flexible**
 | 
| Large flexible
 | --
 | Available
 |

#### Configurations

##### Text alignment

| Category
 | Configuration
 | M3
 | M3 Expressive
 | 
| Text alignment
 | Leading edge (default)
 | Available
 | Available
 | 
| Centered
 | --
 | Available
 |

#### Tokens & specs
Select a token set to view in the table's menu. App bar token sets are organized into a common token set, and size-specific tokens. Learn about design tokens (/m3/pages/design-tokens/overview)

##### Search component tokens & specs
The default search component tokens are used in the search app bar.

#### Anatomy

App bars can be customized to include:

- An image or logo
- A subtitle
- A filled icon buttonAvoid customizing the size of the heading and subtitle, or adding too many actions.

##### Search

The search app bar can include trailing actions inside and outside the search bar. When the search bar is selected, it should open the search view component.

##### Image 
An image can be placed in the app bar. In small app bars, this can replace the label text.

##### Filled trailing icon button
The app bar's trailing icon buttons can be replaced with a single, primary, or tonal filled icon button in default or wide sizes.

##### Subtitle

#### Color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)
All app bars share the same color roles. On scroll, the container changes color to **surface container**.

##### Scroll states

#### Measurements

##### Search app bar

##### Small app bar

##### Medium flexible app bar

##### Large flexible app bar

#### Baseline app bars

The **medium** and **large** app bars are no longer recommended in M3 Expressive. Use the **medium flexible** and **large flexible** app bars in their place.

##### Tokens & specs

Select a token set to view in the table's menu. Baseline app bar token sets are organized into medium, large, and older baseline token sets. Learn about design tokens (/m3/pages/design-tokens/overview)

##### Color

Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens. In implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Measurements

###### Medium app bar

###### Large app bar


## Guidelines

#### Usage

Use an app bar to provide content and actions related to the current page, such as page navigation actions, headlines, images, and 1–2 essential actions.
The information and actions in the app bar should be contextual and specific to a page, but can also include global product controls, such as search or notifications.

App bars should only have one action, two if necessary. 
The primary action should alter or exit the entire page, like **Send**, **Save**, or **Edit**.
If the product has many actions, place those in a toolbar. Avoid placing an overflow menu in the app bar when possible.

To boost visibility of a primary action, change the style of the icon button to filled or tonal, and consider using a wide icon button.  
Avoid using multiple filled or tonal buttons.

[DO] App bar with 1 filled button.

[DON'T] App bar with 2 filled buttons, side by side.

The four variants of app bars are:

- **Search app bar**
Use on home pages when search is key to the product. 

- **Small**
Use in dense layouts or when a page is scrolled.

- **Medium flexible**
Use to display a larger headline. It can collapse into a small app bar on scroll.

- **Large flexible**
Use to emphasize the headline of the page.

##### Baseline app bars
There are two baseline app bars that are no longer recommended:

- **Medium**
Replace with medium flexible.

- **Large**
Replace with large flexible.

#### Search app bar

Use a search app bar to provide an emphasized entry-point to open the search view.

Search bars should always include the word **Search**. They can use various capitalization styles depending on the product.

- **Search**

- Searching a specific area
Example: **Search inbox**

- Search [Product] 
Example: **Search Photos**

##### Buttons in search app bar
In addition to a trailing avatar, search app bars can have up to two trailing icons on mobile. 
Trailing icons can be placed inside or outside the search bar.

The leading element of a search app bar can be used for a product’s logo to brand the app’s overall experience. 

This logo can be purely cosmetic, or can trigger an action like returning to the home screen or refreshing it. 
Avoid using a logo to open an expanded navigation rail.

Don’t use more than two trailing icon buttons with an avatar. 

If more actions are needed, place them in a toolbar instead.

[DON'T] 3 icons placed in a search app bar.

##### Large screens
The search app bar dynamically adapts to available width. There should be up to four trailing icons on larger screens.

##### Alternate color options
By default, search containers in app bars use the **surface container** color to distinguish it from the app background. If the background is darker, use a lighter container color on the search bar, like **surface bright**.
When choosing alternate colors, make sure the search text and container have at least 3:1 contrast for readability.

#### Anatomy

##### Container
The app bar container holds all information and actions at the top of a screen, including navigation icons, headlines, and buttons. 
Avoid changing the position or shape of the container.

[DO] App bar with square corners.

[DON'T] App bar with curved corners.

Always use the default height of the app bar, and make it span the full width of the window.

[DO] App bar at default height.

[DON'T] App bar with reduced height.

##### Adding logos
Image logos can be used in app bars to bolster brand identity or visual appeal. 
The image should be high quality and pertinent, and shouldn’t disrupt the app bar's functionality.

##### Leading button
The leading button should be used for navigating the product. 
It typically is one of the following:

- A menu icon, which opens a modal expanded navigation rail

- A back arrow, which returns to the previous screen

##### Headline
The headline can describe:

- The current page
- The current section
- The productHeadline text should be brief enough to easily fit in the app bar. 
In medium flexible and large flexible app bars, the headline can wrap to a second line. 
Don’t truncate the headline text.

[DO] App bar headline text set in 2 lines.

[DON'T] Small app bar headline text wrapped on 2 lines.

Headlines can be aligned to the leading edge or centered.
The headline’s typography size and style change depending on the app bar variant.

##### Subtitle
Subtitles can add additional context to a page. 
These can be leading-aligned or center-aligned with the headline text.

##### Trailing icon buttons
Up to two icon buttons can be placed after the headline, aligned to the trailing edge of the app bar. Place most-used actions closest to the leading edge.
Avoid using these buttons to open a menu with more actions. If more actions are needed, place them in a toolbar instead.
If changing the icon button color style to filled or tonal, only use one icon button.

Use filled icons when possible for the best visibility. Outlined icons can also be used, particularly for unselected toggle buttons.

[DO] App bar with 2 filled icons, “save” and “download.”

[CAUTION] App bar with 2 outlined icons, “save” and “download.”

#### Adaptive design

Adaptive design allows an interface to respond or change based on context, such as the user, device, and usage. More on adaptive design (/m3/pages/layout-overview/adaptive-design)

##### Resizing
The width of the app bar container responds to the view or device width. 
It should always span 100% of the window width.

Resizing may cause actions at the trailing edge of the app bar to collapse into an overflow menu at smaller breakpoints. 
These actions become visible again at larger sizes.

The search container of the search app bar should fill 100% of the space between leading and trailing app bar elements until it reaches 312dp. Then, it should only grow further to fill 50% of that space.

##### Presentation
The app bar automatically supports right-to-left (RTL) languages by aligning the layout of elements to the leading and trailing edges of the container. 
This means that in RTL languages, the layout of the app bar is mirrored.

#### Behavior

##### Scrolling
App bars should initially be the same color as the background, then fill with a contrasting color on scroll to provide visual separation from the background.
The app bar can remain on a page at all times, or can hide and reappear when scrolling.

To focus more on body content, consider setting the app bar container to be transparent on scroll. This allows the buttons to float above the content. 
Make sure icon buttons have a container fill. 
Consider using narrow-width icon buttons for actions, like **Back**, to reduce the amount of space they take up.

Selecting the search bar should open the search view component.

When scrolled, **medium flexible** and **large flexible** app bars can transform into **small** app bars. They should remain small until the page is scrolled back to the top. Don’t transform app bars into a **search app bar**.


## Accessibility

#### Use cases
People should be able to do the following using assistive technology:

- Understand what page they’re currently visiting
- Take actions or navigate to a new page destination
- Maintain access to app bar actions when the content is scrolled

#### Interaction & style

##### Touch
When tapping on an icon button, a touch ripple appears, indicating interaction feedback.

##### Cursor
When hovered, the hover state provides a visual cue to the user that the element is interactive.
When clicked (in both active and inactive states), a ripple appears to indicate feedback.

##### Keyboard or switch
When navigating to an interactive element, a focus indicator appears to show that action can be taken.
When the element is selected, an action is then performed.

##### Initial focus
Focus should initially land on the leading button, since it’s the first interactive element of the app bar.

#### Color

On search app bars, use the default color roles when possible.

- Search container: **surface container**
- Search label: **on surface variant**On darker backgrounds, search bar containers can use the **surface bright** role to maintain strong visual contrast. 
If mapping to other color roles, make sure the text and container have 3:1 contrast to ensure readability.

[DO] A search app bar with default dark text on a light container background.

[DON'T] A search app bar with custom light text on a light container background.

#### Keyboard navigation

| Keys | Actions | 
| Tab | Move focus to the next interactive element | 
| Space or Enter | Activate the focused element |

#### Labeling elements

The accessibility label for a title should be the same as the content within the title. If needed, add additional context to the accessibility label to ensure users understand what page they’re on or what content is being shown.
Screen readers will read the UI text followed by the component’s role.

Label icon buttons according to their accessibility guidelines (/m3/pages/icon-buttons/accessibility).
