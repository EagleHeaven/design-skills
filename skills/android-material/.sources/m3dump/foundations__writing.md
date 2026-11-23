# Writing and text

Source: https://m3.material.io/foundations/writing

Ensure text is helpful, clear, and resilient to change


## Best practices

#### Accessibility text
Accessibility text refers to text that is used by screen reader accessibility software, such as Google’s TalkBack on Android, Apple’s VoiceOver on iOS, and Freedom Scientific’s JAWS on desktop. Screen readers read aloud the on-screen text and elements (such as buttons), including both visible and nonvisible alternative text.

##### Adjacent text
To make an image more accessible, the text in and around images should consider presenting key information about the image.

##### Captions
Captions are the text that appear below an image. They explain contextual information about the image to help the reader understand how it relates to the content. Both sighted and screen reader users rely on captions for descriptions of images.

[DO] Stacked card with image, alt text as caption, and adjacent text identified.

##### Embedded text in images
Screen readers are unable to read text that is embedded in imagery. If there is essential information embedded as text in the image, include the essential information in the alt text (/m3/pages/alt-text).

[CAUTION] Stacked card with image, caption overlayed on image, and adjacent text.

##### Alternative text (Alt text)
Alt text helps translate a visual UI into a text-based UI. Alt text is a short label (up to 125 characters) in the code that describes an image for users who are unable to see them. Since alt text is only for images, there is no need to add “image of” or “picture of” to the alt text. A screen reader will read the alt text aloud in place of the image. 
Alt text is valuable for sighted users, as well, because alt text appears if an image fails to load. Include targeted keywords to help inform the user about the image. Keywords can also improve search engine optimization (SEO).
Learn more about writing alt text (/m3/pages/alt-text)

[DO] A DJ standing in front of music equipment with alt text underneath describing image.

#### Text color

##### Essential and non-essential elements
Informative images have essential and non-essential elements. Essential information should have a 3:1 minimum color contrast for large text and 4.5:1 for small text.


## Text truncation

#### Text truncation

Information should always be available to readers, even if text is truncated or wrapped.

##### Background
Increased size of text, increased spacing between text, and translation into longer languages shouldn’t result in losing content. This requires designing for text truncation and creating designs flexible enough to accommodate any viewport size or increase in zoom. Some common methods of designing for larger text include text wrapping, increased height or width of components, and truncation with ellipses and hover or link.

##### Requirements
Content, understandability, and functionality must not be lost when users modify their type settings. There may be exceptions to these requirements for non-Latin alphabet languages.

##### Text wrapping

- “Wrapped” text extends from one line to another, increasing the height of the text container
- Text should be wrapped when it’s critical, to ensure understandability, or when there’s space in the component

[DO] Body copy  text wrapped  inside a dialogue with an option to expand content.

[DON'T] Body copy  text wrapped  inside a dialogue, cut off at the bottom, without an option to expand.

##### Height and width of components

- Some components can extend vertically or horizontally for more text

[DO] Layout of UI- cards of different sizes organized in a stacked grid.

[DON'T] A stretched UI card  with a small headline and a large photograph. 

##### Ellipses with hover or link

- Truncated text can be replaced with an ellipsis if the text is available through a tooltip or link
- Links can be used when they’re contained in the text that’s truncated, and when the link displays what's been truncated
- If there's an ellipsis, but no way to show the truncated text, it is not accessible
- Note that this option can add difficulty for some people

[DO] A calendar with a cursor hovering  over a day of the week displays a tooltip that reads “Tuesday.”

[DON'T] On a multiple selection list, the marked checkbox’s label is truncated by an ellipsis.


## Text resizing

#### Text resizing

##### Background
People with low vision or those who prefer large text must be able to scale up the size of text in a UI. This adjustment is often performed through a device OS setting or in-app option.
UIs should support a minimum text increase of 200%.

Most components behave the same when text is resized:

- Text and line height scale up proportionally, multiplied by scale value
- Padding remains constant at 1x the default size
- Spacing between elements in a component remain constant at 1x the default size

When text resizing isn't controlled by the device OS, offer multipliers such as 1.5x or 2x to allow users to increase the text size. Using multipliers to scale text can result in values with decimals, but this approach is more feasible for implementation.
To calculate a font's size using multipliers, take the **default ****font size** (density = 0) and **multiply it by the scale value**.

Components that don't include text, like progress indicators, checkboxes, or radio buttons, aren't affected by text resizing.

[DON'T] Icon button with the icon shown at 1x scale and incorrectly at 2x scale.

##### Designing for large type

Large type is used regularly by people with low vision and those with difficulty processing written words. They tend to increase text size:

- To make it easier to read

- To limit interruptions and focus on one task

- To avoid overwhelming their sensesUse these methods to design a product to handle large type properly.

##### Methods
Avoid common text resizing issues by increasing container size, reflowing layout, enabling scrolling, and adding tooltips.

###### **Increase container size**
Resizing containers can prevent text from overlapping, clipping, or truncating.
Consider how text might reflow in a way that allows the eye to follow the end of one line to the beginning of the following line.

###### **Reflow the layout**
Consider reflowing the layout, especially when components grow very long. To accommodate larger text, components can be stacked on top of one another, rather than fixed side-by-side.

###### **Enable content to scroll**
When long strings of enlarged text don’t fit on one screen, consider adding a scrollbar to provide access to more content.
Vertical scrolling is preferable to horizontal. Users should only be asked to scroll in one direction, rather than both vertically and horizontally.

###### **Use touch & hold tooltips to provide enlarged labels**
Some components, such as app bars and navigation bars, position text in spaces with stricter space and character limits. In these situations, you can add a tooltip to display enlarged content in the UI.
In this case, the text size in the component remains displayed at 1x while the scaled up text is displayed in a tooltip on touch & hold.
Tooltips are the best choice for displaying enlarged text in:  

- Top app bar
- Navigation bar
- Navigation rail
- Tabs, when fixed to the top of a screen and don’t move off-screen upon scrolling

[DO] Tooltip on navigation rail displays scaled up label text.
