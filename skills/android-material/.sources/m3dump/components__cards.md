# Cards

Source: https://m3.material.io/components/cards


## Overview

- Use cards to contain related elements

- Three variants: elevated, filled, outlined

- Contents can include anything from images to headlines, supporting text, buttons, and lists

- Can also contain other components

- Cards have flexible layouts and dimensions based on their contents

#### Availability & resources

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color

- Elevation: Lower elevation and no shadow by default

- Variants: Three official card variants – elevated, filled, and outlined


## Specs

#### Tokens & specs
Select a component variant below to see its elements, attributes, tokens, and their values.

#### Elevated card

##### Elevated card color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/)

##### Elevated card states
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states)

#### Filled card

##### Filled card color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/)

##### Filled card states
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states)

#### Outlined card

##### Outlined card color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/)

##### Outlined card states
States are visual representations used to communicate the status of a component or interactive element. Learn more about interaction states (/m3/pages/interaction-states)

#### Measurements

| Attribute
 | Value
 | 
| Shape
 | 12dp corner radius | 
| Left/right padding
 | 16dp | 
| Padding between cards
 | 8dp max | 
| Label text alignment
 | Start-aligned |


## Guidelines

#### Usage

Use a card to display content and actions on a single topic.
Cards should be easy to scan for relevant and actionable information. 
Elements like text and images should be placed on cards in a way that clearly indicates hierarchy.

Cards can serve as entry points into deeper levels of detail or navigation, such as a music album or details on an upcoming vacation.

Cards can be displayed together in a grid, vertical list, or carousel.

[DO] 4 cards together in a grid layout.

[DON'T] 5 albums in a vertical list of cards.  

There are three card variants:

- Elevated

- Filled

- Outlined
Each provides the same legibility and functionality, so the variant you use depends on style alone.

#### Anatomy

The card container is the only required element in a card. Card layouts can vary to support the kinds of content they contain. Below is a common configuration of elements.

##### Container
Card containers hold all card elements. Their size is determined by the space those elements occupy. Card elevation is expressed by the container.
The card container is the only required element of a card. All other elements are optional.

##### Content blocks
Card contents are grouped into blocks. Content can have different levels of visual emphasis depending on importance.
Card layouts vary to support the kinds of content they contain.

##### Dividers
Dividers (/m3/pages/divider/specs) can separate regions in cards or indicate areas of a card that can expand.

##### Media
**Thumbnail**
Cards can include thumbnails for an avatar or logo.
**Image**
Cards can include photos, illustrations, and other graphics, such as weather icons.
**Video**
Cards can include video.

##### Text
**Headline**
Headline text often communicates the subject of the card, such as the name of a photo album or article.
**Subhead**
Subheads are smaller text elements, such as an article byline or a tagged location.
**Supporting text**
Supporting text includes body content, such as an article summary or a restaurant description.

###### Layering text, icons, and images
It isn’t recommended to place text or icons on images. If it’s necessary, ensure the background image provides sufficient contrast for the text to meet accessibility standards.
Add a translucent scrim or bounding shape beneath the text or icon to help ensure proper contrast.

[CAUTION] Layered text contrasts with the background image.

[CAUTION] Icon within a bounding shape, placed on an image.

##### Actions

###### **Primary action area**
Cards can be one large touch target triggering an expanded detail screen.

**Buttons**
Cards can include buttons for actions such as **Learn more** or **Add to cart**.
**Icon buttons**
Cards can include icon buttons for actions such as **Save**, **Heart**, or **Leave a 4-star review**.
**Selection controls**
Cards can also include chips, sliders, checkboxes, and other selection controls.
**Linked text**
There can be a link in the supporting text on a card.

Overflow menu
Overflow menus contain related actions. They are typically placed in the upper-right or lower-right corner of a card.

#### Cards in a collection

Multiple cards can be grouped together into collections displayed in a grid, list, or carousel. 
By default, cards in a collection are coplanar. They share the same resting elevation unless they're picked up or dragged.

###### Filtering and sorting
Card collections can be filtered in a variety of ways, including by date or alphabetical order. If a collection can be filtered, the filter must apply to each card in the collection. 
Filter or sorting options should be placed outside of the card collection.

Organize card collections so that they'e easy to use. Their layout affects how they are perceived.

##### Grid
Cards can be displayed together in a grid.

The default grid can be customized in code to show cards in staggered or mosaic grids.

##### Vertical list
Cards can be displayed together in a vertical list.

##### Carousel
Cards can be displayed together in a horizontal row or carousel.

#### Adaptive design

As cards scale to adapt to different breakpoints (/m3/pages/breakpoints), their position and alignment can also change.
Cards and their elements can align left, right, or center as the layout scales.

##### Ergonomics
Adjust the layout of cards to meet the ergonomic needs of large screens. 

For example, a horizontally-oriented card in a compact breakpoint may become a larger, vertically-oriented card in an expanded breakpoint, with more space for images and text on the larger screen.

##### Visual presentation
To adjust the presentation of content-focused components, begin with spacing. 
Allow components like lists, cards, and images to optimize space while filling the region of a screen that suits a device breakpoint’s ergonomic needs.

##### Column-based layouts
In mobile layouts, components such as lists or cards are stretched to fit the full width of the screen without compromising visual quality or user experience. When designing for large screens with an expanded breakpoint, use multiple columns to display content.
Avoid extending UI elements across the screen when possible. On larger screens, rearrange groups of related cards into horizontal rows or carousels, to allow for better content organization.

##### Small screens
On smaller screens with the compact breakpoint, consider swapping cards for lists, which can display images and text in a more compact form. 
Make sure that controls, actions, and other component-specific elements are maintained.

#### Behavior

##### Expanding
Cards can use a container transform (/m3/pages/motion-transitions/transition-patterns#b67cba74-6240-4663-a423-d537b6d21187) transition pattern to reveal additional content. Reserve this pattern for hero moments that are meant to be expressive.

[DO] A card expands, showing all content at once.

[DON'T] A card expands, internally scrolling to only show some information.

##### Navigation
Cards can use a forward and backward (/m3/pages/motion-transitions/transition-patterns#df9c7d76-1454-47f3-ad1c-268a31f58bad) transition pattern to navigate between screens at consecutive levels of hierarchy. This pattern has a simpler motion style compared to container transform, which makes it suitable for common navigation transitions.

##### Gestures

###### Swipe
A swipe gesture can be performed on a single card at a time, anywhere on that card.
It can be used to:

- Dismiss a card
- Change the state of a card, such as flagging or archiving it

[DO] A card with 1 assigned swipe: to heart the entire card.

[DON'T] A card with an image carousel and a swipe motion to heart only the bottom text on the card.

###### Pick up & move
The pick-up-and-move gesture allows users to move and reorder cards in a collection.

[DO] A card is elevated above all other cards when moved.

[DON'T] A moved card bumps other cards around, and isn’t elevated above them.

###### Scrolling
Card content that’s taller than the maximum card height is truncated and doesn’t scroll, but can be displayed by expanding the height of a card.  

A card can expand beyond the maximum height of the screen, in which case the card scrolls within the screen.

[DO] Scrolling a page with an expanded card.

[DON'T] Expanded card on mobile with internal scrolling.

###### Scrolling on desktop
On a desktop device, card content can expand and scroll within a card.


## Accessibility

#### Use cases

People should be able to do the following using assistive technology:

- Navigate to a card and the elements within a card 
- Get appropriate feedback based on input type documented under Interaction & style (/m3/pages/cards/accessibility#ce764d54-6b59-42db-807f-b3cb370eecdb)

#### Interaction & style

A card can be a non-actionable container that holds actions like buttons and links, or it can be directly actionable without any buttons or links. This is to avoid stacking actionable elements. An action shouldn’t be placed on an actionable surface.

##### Touch
When a user taps on a directly actionable card, a touch ripple appears across the card, indicating feedback. 
Non-actionable cards don’t ripple.

##### Dragging and dismissing
To meet Material's accessibility standards, any dragging and swiping interactions need a single-pointer alternative, like selecting the same actions from a menu.

For example, tapping a card, or pressing and holding, should open a menu to change its position in a list. That menu could also contain an action to delete the card.

It isn’t recommended to place menus on top of the card on the draggable state. If doing so is necessary, ensure that the interaction can be completed.

[CAUTION] A menu over a card that doesn't totally obscure the card.

##### Cursor
When a directly actionable card is hovered, the hover state provides a visual cue to the person that the element is interactive. Non-actionable cards don’t have a hover state.
When a directly actionable card is clicked, a ripple appears, providing feedback.

##### Keyboard
A focus indicator appears around actionable elements when tabbing through cards. This provides a visual cue to a person that the destination is now focused and an action can be taken.
A person can **Tab** to navigate between actionable elements of the cards. If the cards are non-actionable, **Tab** navigates directly to the actionable buttons or links within the cards.
When engaging with a focused actionable card or element using the **Space** or **Enter** key, an action is performed or a secondary action is available, such as a menu.
Within the menu, a person is able to **Arrow** through the menu items, **Space** or **Enter** to select an item, or **Tab** to exit.

#### Focus

All interactive elements of cards need a tab stop so they can be focused. Directly actionable cards are tab stops.
For non-actionable cards, the card itself is not a tab stop. However, every actionable element in the card is a tab stop so they’re all visited before focus navigates to the next card.

#### Keyboard navigation

| Keys | Actions | 
| **Tab** | Move to the next actionable element

**Directly actionable cards:** Move to next card container
**Non-actionable cards with actionable elements:** Move to next actionable element
 | 
| **Space** or **Enter** | Confirm action |

#### Labeling elements

The informative contents of a card are verbalized when navigating to them using a screen reader. If an image in a card is purely decorative, hide it from screen readers. All actionable elements must receive both screen reader and keyboard focus.
Directly actionable cards can have the **button** or **link** role, depending on how they’re used. 
Non-actionable cards are purely containers, so they don’t need a role.
