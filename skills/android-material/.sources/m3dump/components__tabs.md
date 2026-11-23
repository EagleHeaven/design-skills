# Tabs

Source: https://m3.material.io/components/tabs


## Overview

- Use tabs to group content into helpful categories

- Two variants: primary and secondary

- Tabs can horizontally scroll, so a UI can have as many tabs as needed

- Place tabs next to each other as peers

#### Availability & resources

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color
- Layout: Icons and labels are now vertically centered within the container


## Specs

#### Tokens and specs
Select a component variant below to see its elements, attributes, tokens, and their values.

#### Primary tabs

##### Primary tabs color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Primary tabs states

#### Secondary tabs

##### Secondary tabs color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Secondary tabs states

#### Measurements

| Attribute
 | Value
 | 
| Container height (label text only) | 48dp | 
| Container height (icon and label text) | 64dp | 
| Icon size | 24dp | 
| Divider height | 1dp | 
| Primary active indicator height | 3dp | 
| Secondary active indicator height | 2dp | 
| Active indicator shape | 3, 3, 0, 0 | 
| Active indicator minimum length | 24dp | 
| Padding between inline icon and text | 8dp | 
| Padding between inline text and badge | 4dp | 
| Overlap of badge on stacked icon | 6dp |


## Guidelines

#### Usage

Tabs organize groups of related content that are at the same level of hierarchy.

There are two variants of tabs:

- Primary tabs

- Secondary tabs
Primary tabs are placed at the top of the content pane under an app bar. They display the main content destinations.

Secondary tabs are used within a content area to further separate related content and establish hierarchy.

##### Related content

Use tabs to group related content, not *sequential* content.

[DO] Scrolling up and down through content, then swiping left through tabs.

[DON'T] Mobile screen with scrollable tabs of sequential content: Chapter 1, Chapter 2, Chapter 3 and Chapter 4.

#### Anatomy

##### Container
The container holds multiple tabs. Its contents can be fixed or scrollable.

The container should always extend the full width of the window and be divided into equal sections, one for each tab.

The container is defined by a divider on the bottom edge to separate it from the content below. Content may scroll under the container.

##### Icon (optional)
Icons communicate the kind of content within a tab. Icons should be simple and recognizable.

Icons alone aren’t as effective as text labels at communicating complex content.
Use caution when representing tab content with icons alone, as an icon’s meaning may not be clear.

[DO] Mobile screen with tabs represented by icons  for “wishlist” and “location”.

[DON'T] Mobile screen where "purchases” tab has text only and “wishlist” tab has text and icon.

##### Label
Text labels should clearly and succinctly describe the content within the tab.

Tab labels appear in a single row. Labels can use a second line if needed, with truncated text. Alternatively, scrollable tabs can allow room for longer titles.

When using scrollable tabs, the first visible tab should be offset by 52dp from the left side of the device for both web and mobile. The width of each tab is defined by the length of its text label.
Avoid using inconsistent padding on each tab.

[DO] Screen with scrollable tabs offset from the leading edge by 52dp.

[DON'T] Screen with scrollable tabs, 2 of which are truncated to “Australian” showing how truncation can confuse users.

##### Badges (optional) 
Badges can be used on primary or secondary tabs to show notifications or updates related to a specific tab. Limit badge content to four characters, including a "+".
Once the user views the relevant content in the tab, the badge value should update or the badge should disappear entirely.
Small and large badges can both be used with tabs. Read the badge guidance (/m3/pages/badges/overview) for more details.

##### Active indicator
To differentiate an active tab from an inactive tab, apply an underline and color change to the active tab’s text and icon.

#### Choosing the tab variant

Primary tabs should be used when just one set of tabs are needed.
Secondary tabs are necessary when a screen requires more than one level of tabs. These tabs use a simpler style of indicator, but their function is identical to primary tabs.

#### Placement

Tabs are displayed in a single row, with each tab connected to the content it represents. As a set, all tabs are unified by a shared topic.

Secondary tabs should always be placed below primary tabs.

#### Responsive layout

For fixed tabs, the maximum width for each tab should be determined by the width of the widest tab. The group of tabs should use a fluid margin and align to the center or leading edge of the body region.
Avoid using more than four tabs at once. At five or more tabs, the container becomes cramped.

#### Behavior

##### States
By default, tabs inherit enabled states with one active state.The inactive and active states of a tab can inherit a hover, focus, and pressed states.

##### Fixed tabs
Fixed tabs display all tabs in a set simultaneously. They are best for switching between related content quickly, such as between transportation methods in a map. To navigate between fixed tabs, tap an individual tab, or swipe left or right in the content area.

###### Tap a tab
Navigate to a tab by tapping on it.

###### Swipe within the content area
To navigate between tabs, users can swipe left or right within the content area.

Use caution when placing other swipeable content (such as interactive maps or list items) in the content area.

[DO] Scrolling up and down through content, then swiping left through tabs.

[DON'T] Swiping to change tabs accidentally swipes to delete a list item in the UI instead.

##### Scrollable tabs
When a set of tabs cannot fit on screen, use scrollable tabs. Scrollable tabs can use longer text labels and a larger number of tabs. They are best used for browsing on touch interfaces.

##### Scrolling content
When a screen scrolls up and down through content, tabs can either be fixed to the top of the screen, or scroll off the screen. If they scroll off the screen, they will return when the user scrolls upward.

[DO] When scrolling up through content, tabs scroll off screen, then reappear when scrolling back down.

[DON'T] When scrolling up through content, tabs scroll behind the app bar then reappear when scrolling back down.


## Accessibility

#### Use cases

Users should be able to:

- Undertake actions or invoke navigation to a new destination with assistive tech
- Select an action or destination from an off screen tab with assistive tech
- Maintain access of primary actions when the content is in a scrolled state

#### Interaction & style

**Touch**

- When a user taps on an icon button, a touch ripple appears, indicating interaction feedback
- The selected indicator becomes active and shifts into position once the touch has been engaged

**Scrollable**

- When a set of tabs cannot fit on screen, scrollable tabs are used. They are best used for browsing on touch interfaces.
- To navigate between scrollable tabs, users swipe the set left or right. Users can also use arrow/tab to navigate through.
- It's **not recommended** to loop a tab set where it scrolls infinitely. This can trap users who are navigating linearly with a screen reader.
- To select an individual tab, users tap or press space/enter.
- Horizontal scrolling tabs meet accessibility requirements because they need to increase in width to respond to label text without affecting the layout, and horizontal scrolling is necessary to view those labels.

**Cursor**

- When hovered, the hover state appears, providing a visual cue that the icon button is interactive. When clicked (in both active and inactive states), a ripple appears and the indicator shifts into position, showing the user feedback.

**Keyboard/Switch **

- When tabbed, a focus indicator appears, providing a visual cue to the user that the destination is now selected
- When the user engages with the selected tab via Space/Enter in active states, the user is taken to a new destination
- Within the tab menu, the user is able to arrow/tab through the menu items, Space/Enter to select an item, or tab to exit the active state

##### Avoid applying density by default
Don't apply density to tabs by default — this lowers their targets below our best practice of 48x48 CSS pixels. Instead, give people a way to choose a higher density, like selecting a denser layout or changing the theme.
To ensure that this density setting can be easily reverted when it's active, keep all the targets to change it at minimum 48x48 CSS pixels each.

#### Initial focus

On arrow/tab in a tab menu, the active indicator appears on the first interactive element, providing feedback to the user that it is selected. The user is then able to tab to additional interactive elements until all available items are complete within the tab menu.

[DO] Arrow or Tab being used to navigate through a tab menu.

[DON'T] Space or Enter being used to navigate through a tab menu.

#### Keyboard navigation

| Keys | Actions | 
| Arrow | Focus lands on the next available navigation destination | 
| Space / Enter | Activates the focused navigation destination | 
| Arrow | Allows navigation through menu items |

#### Labeling elements

When the visible UI text is ambiguous, or there is no visible UI text, accessibility labels need to be more descriptive. For example, an icon button that visually represents a “video camera” requires additional information in its accessibility label to clarify the icon’s intent.
