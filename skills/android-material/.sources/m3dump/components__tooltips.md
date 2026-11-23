# Tooltips

Source: https://m3.material.io/components/tooltips


## Overview

- Use tooltips to add additional context to a button or other UI element

- Two variants: plain and rich

- Use plain tooltips to describe elements or actions of icon buttons

- Use rich tooltips to provide more details, like describing the value of a feature

- Rich tooltips can include an optional title, link, and buttons

#### Availability & resources

#### Differences from M2

- **Color**: New color mappings and compatibility with dynamic color

- **Shape**: Rich tooltips have more rounded corners


## Specs

#### Tokens & specs

Select a component variant below to see its attributes, tokens, and values.

#### Plain tooltip

##### Plain tooltip colors
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Plain tooltip measurements

| Attribute
 | Value
 | 
| Container height
 | 24dp
 | 
| Padding
 | 8dp
 |

#### Rich tooltip

##### Rich tooltip colors
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

##### Rich tooltip measurements

| Attribute | Value | 
| Top padding | 12dp | 
| Bottom padding | 8dp | 
| Left and right padding | 16dp |

##### Rich tooltip configurations
Rich tooltips can have a headline, body, and up to two buttons. The headline and number of buttons can be configured.


## Guidelines

#### Usage

A tooltip provides additional context for a UI element. 
**Plain tooltips**
Plain tooltips briefly describe a UI element. They're best used for labelling UI elements with no text, like icon-only buttons and fields.
**Rich tooltips**
Rich tooltips provide additional context about a UI element. They can optionally contain a subhead, buttons, and hyperlinks.
Rich tooltips are best used for longer text like definitions or explanations.

[DO] Plain tooltip labeling an icon-only button in Google Meet as "Present now".

[DON'T] Button with an icon and label text saying "Edit". It has a plain tooltip on hover that also says "Edit".

[DO] Rich tooltip describing a new button for adding people. It has a subhead, description, and a button to learn more.

[DON'T] Rich tooltip explaining that an action is destructive and permanently deletes files.

#### Anatomy

##### Plain tooltip

##### Supporting text

[DO] Plain tooltip for an icon-only button shaped like a gear. The tooltip text is "Settings".

[CAUTION] Plain tooltip for the account switcher. The supporting text includes the user's name and email address on new lines.

##### Rich tooltip

##### Subhead (optional)
Keep subheads brief, ideally to one line. They should summarize or describe the message of the rich tooltip.
Subheads are important to include when the rich tooltip appears automatically, like when the page loads.

[DO] Rich tooltip with a brief subhead, supporting text, and a text button.

[DON'T] Rich tooltip with a subhead wrapping to multiple lines.

##### Text buttons (optional)
Rich tooltips can have up to two text buttons. These should be brief and relevant to the message in the supporting text.
Keep buttons short so they can be side by side. Avoid stacking them when possible.

[CAUTION] Rich tooltip with 2 buttons stacked on each other.

#### Placement

##### Plain tooltips
By default, plain tooltips are positioned directly above the parent element. 

- If there's a visual boundary, like a button, the distance is 4dp
- If there's no visual boundary, like with text baselines, the distance is 8dpIf the element is in an app bar, the plain tooltip appears below the element at the same distance.

##### Rich tooltips
By default, rich tooltips are positioned to the bottom right of the parent element. They adjust position to avoid going off screen.  Tooltips shouldn't cover the parent element. 
**Dynamic positioning**
The position of the tooltip adjusts in increments of 8dp to avoid going off-screen.
**Desktop placement**
On desktop, tooltips may appear centered below the parent element and remain visible while moving within the target region.

#### Behavior

To show a tooltip, hover on the parent element on desktop, or tap and hold the element on mobile. Persistent rich tooltips only appear when clicked or tapped.

##### Transient by default
Both plain and rich tooltips disappear 1.5 seconds after navigating away from the target region.
Triggering a new tooltip immediately closes any other open tooltip.

[DON'T] 2 buttons both showing plain tooltips at once.

##### Persistent rich tooltips
Persistent rich tooltips appear when either:

- The parent element is clicked
- The page loads and a new feature is being explainedPersistent rich tooltips remain active even when leaving the target region. They only disappear once a person interacts with another UI element. Hovering doesn't trigger the tooltip.
When appearing on page load, the tooltip can introduce and explain new features on various parent elements.
Avoid using persistent rich tooltips on icon buttons.

[DON'T] Persistent rich tooltip about a new sharing feature in the Photos app. The button says  "Learn more.”


## Accessibility

#### Use cases

People should be able to do the following using assistive technology:

- Receive a tooltip message
- Activate a tooltip with a keyboard or switch input

#### Interaction & style

Plain and rich tooltips without required actions should remain on screen long enough for people to receive the information without disrupting their existing flow or task.

[DO] A cursor hovers over an icon that identifies it as a star, which remains after moving away.

Tooltips can appear when an actionable element, like a button or navigation rail, is hovered or focused. However, this tooltip shouldn’t hide crucial information.
Rich tooltips can also appear by selecting an element instead of hovering or focusing on it.

#### Focus order

Tooltip containers should not block important information or prevent a person from completing an action. 
Focus order within the rich tooltip moves top to bottom between interactive elements. 
Avoid trapping screen reader and keyboard focus on rich tooltips.
People should be able to move linearly through the rest of the page.

#### Keyboard navigation

| **Keys**
 | **Actions**
 | 
| **Tab**
 | Focus lands on button, if available
 | 
| **Space** or **Enter**
 | Activates the focused element
 |

#### Labeling elements

Tooltips should have the **Tooltip** role, or similar. 
Label all elements in the tooltip according to their own accessibility guidance.
