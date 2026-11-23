# Badges

Source: https://m3.material.io/components/badges


## Overview

- Can contain labels or numbers

- Two variants: small and large

- Anchor badges inside the icon bounding box, at the upper trailing edge of the icon

- Limit content to four characters, including a **+**

- Keep the default color mapping

#### Availability & resources

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color


## Specs

#### Tokens & specs
Browse the component elements, attributes, tokens, and their values.

#### Color

Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Measurements

| Attribute
 | Value
 | 
| Small badge shape
 | 3dp corner radius
 | 
| Small badge size (HxW)
 | 6dp
 | 
| Large badge shape
 | 8dp corner radius
 | 
| Large badge one digit size (HxW)
 | 16dp
 | 
| Large badge max character count size (HxW)
 | 16x34dp
 | 
| Small badge: distance from top trailing icon corner to bottom leading badge corner (HxW)
 | 6x6dp
 | 
| Large badge: distance from top trailing icon corner to bottom leading badge corner (HxW)
 | 14x12dp
 | 
| Large badge padding between badge and text container
 | 4dp
 |

#### Configuration

Different badges are shown on navigation destinations in various states.

- Inactive with label - small badge
- Inactive with label - large badge
- Inactive with label - large badge max character count
- Inactive - small badge
- Inactive - large badge
- Inactive - large badge max character count
- Active with label - small badge
- Active with label - large badge
- Active with label - large badge max character count
- Active nav bar no label - small badge
- Active nav bar no label - large badge
- Active nav bar no label - large badge max character count
- Active nav rail no label - small badge
- Active nav rail no label - large badge
- Active nav rail no label - large badge max character count


## Guidelines

#### Usage

Badges are used to indicate a notification, item count, or other information relating to a navigation destination. They are placed on the ending edge of icons, typically within other components.
There are two variants:

- Small badge

- Large badge

A **small badge** is a simple circle, used to indicate an unread notification.  
A **large badge** contains label text communicating item count information.

##### With other components
Badges are most commonly used within other components, such as navigation bar, navigation rail, app bars, and tabs.

#### Anatomy

#### Container

There are two container options for the badge: 

- Small badge with no text

- Large badge with text

Badge containers are anchored inside the icon bounding box. As the number count increases for large badges, their width expands, but keeps the same placement.
Badges use a color intended to stand out against labels, icons, and navigation elements. Use the default color mapping to avoid color conflict issues.

[DO] Small and large badges on the left side of 2 navigation items in a right-to-left language.

[DON'T] Small and large badges at random positions on 3 icon buttons on a navigation rail.

[DO] Small and large badges in default red color on 3 navigation items.

[DON'T] Small and large badges in custom colors on 3 navigation items.

##### Label text
Label large badges with counts or a status. The maximum number of characters within large badge label text is four, including a + to indicate more.

Use the recommended maximum character count to ensure labels don’t extend beyond the badge container.

[DO] 4-digit numbers condensed to a 3-digit badge with "+" to fit the badge container's width.

[DON'T] 4-digit and 5-digit number badges on navigation items exceed the badge container's width and get cut off at the edge.

#### Placement

[DO] Large badge to the right of a navigation rail item.

[CAUTION] Small badge on an icon button in an app bar.

[DO] Large badge placed at the end of a tab.

[DON'T] Large badge overlapping the icon and text in a tab.


## Accessibility

#### Use cases

People should be able to use assistive technology to:

- Understand the dynamic information conveyed in badges, such as counts or labels
- Address badge announcements by selecting corresponding navigation destinations

#### Interaction & style

Badges are most commonly used within other components, such as navigation bar, navigation rail, app bars, and tabs.
When a badge is used to indicate an unread notification, the badge gets hidden once it's selected.

#### Visual indicators

Badges use a color intended to stand out against labels, icons, and navigation elements. Use the default color mapping to avoid color conflict issues.

[DO] Diagram of large and small badges showing that they need to pass 3 to 1 contrast.

[DON'T] Diagram of large and small badges not passing 3 to 1 contrast.

#### Labeling elements

The accessibility label for a badge item will be read after its navigation destination. Any numerical badges will have their number read, while non-counting badges will simply announce **New notification**.
