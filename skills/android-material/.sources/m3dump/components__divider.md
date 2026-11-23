# Divider

Source: https://m3.material.io/components/divider


## Overview

- Make dividers visible but not bold
- Only use dividers if items can’t be grouped with open space
- Use dividers to group things, not separate individual items

#### Availability & resources

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color
- Configurations: Ability to have vertical dividers


## Specs

#### Tokens and specs
Browse the component elements, attributes, tokens, and their values.

#### Color

Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview/825906c9-6eed-47d1-8812-450910c1356e)

#### Measurements

| Attribute | Value | 
| Divider full-width
 | 100% | 
| Divider inset left margin
 | 16dp | 
| Divider inset right margin
 | 0dp | 
| Divider middle-inset left margin
 | 16dp | 
| Divider middle-inset right margin
 | 16dp | 
| Space between divider & supporting-text
 | 4dp | 
| Divider right margin
 | 8dp | 
| Divider bottom margin | 8dp |


## Guidelines

#### Usage

Dividers are one way to visually group components and create hierarchy. They can also be used to imply nested parent/child relationships.

The divider can be used in two ways: 

- Full width

- Inset

#### Anatomy

A divider is a simple line.

#### Full-width dividers

Use full-width dividers to separate larger sections of unrelated content. They can be used directly on a surface or inside other components like cards or lists.

Full-width dividers can also separate interactive areas from non-interactive areas. 

They are used to group visual elements together, and indicate when elements are related to each other from an interaction perspective.

[DO] Non-interactive information on a card and a clickable read more link separated by a full-width divider. 

[CAUTION] Full-width dividers used after every piece of content on a page.

#### Inset dividers

Use inset dividers to separate related content within a section.

Inset dividers are equally indented from both sides of the screen by default.

##### Using dividers both ways on the same screen
If dividers are used both ways in a UI, they must reinforce the hierarchy of information within different sections.

- To separate a different kind of content, use a full-width divider

- To separate nested content items, use inset dividers

[DO] Dividers used to show content hierarchy: full-width for sections, inset for related items.

List items with repetitive formats may not require an inset divider, in which using only the margin between items is acceptable.

[DO] List with repetitive item formats. Visual separation achieved through margins only.

#### Vertical divider

A vertical divider can be used to arrange content on a larger screen, such as separating paragraph text from video or imagery media.


## Accessibility

Dividers are decorative elements, which have no contrast minimums.
