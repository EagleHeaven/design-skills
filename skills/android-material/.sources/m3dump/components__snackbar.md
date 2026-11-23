# Snackbar

Source: https://m3.material.io/components/snackbar


## Overview

- Snackbars shouldn’t interrupt the user’s experience 
- Usually appear at the bottom of the UI
- Can disappear on their own or remain on screen until the user takes action

#### Availability & resources

#### Differences from M2

- Color: New color mappings and compatibility with dynamic color
- Behavior: Clarified that snackbars can either appear temporarily (dismissive) or persist until the user takes an action (non-dismissive)


## Specs

#### Tokens and specs
Browse the component elements, attributes, tokens, and their values. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Color
Color values are implemented through design tokens. For design, this means working with color values that correspond with tokens. For implementation, a color value will be a token that references a value. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Measurements

#### Configurations


## Guidelines

#### Usage

Snackbars inform users of a process that an app has performed or will perform. They appear temporarily, towards the bottom of the screen.
They shouldn't interrupt the user experience. People can browse the page content without being required to interact with the snackbar.
**Frequency**
Only one snackbar may be displayed at a time.
**Actions**
A snackbar can contain a single action. "Dismiss" or "cancel" actions are optional.

##### Similar components
Dialogs are also designed to show important messages.
Choose the right component based on the importance of the message. This component messaging strategy can help avoid overusing snackbars.

**When to use snackbars**
Snackbars communicate messages that are minimally interruptive and don’t require user action.

| Component | Priority | User action | 
| Snackbar | Low priority | Optional: Snackbars disappear automatically | 
| Dialog | High priority | Required: Dialogs block app usage until the user takes a dialog action or exits the dialog (if available) |

##### Accessibility requirements for web
On web, auto-dismissing snackbars are inaccessible for people with low vision or who require additional time to perceive information. This can be solved in 2 ways:

###### 1. Add inline feedback
Information in auto-dismissing snackbars must also be communicated using another accessible method inline or near the action that triggered the snackbar. 
For example, update the label on a "Save" button to “Saved”, and trigger an auto-dismissing snackbar that communicates the same message. 

###### 2. Make the snackbar actionable
Alternatively, add actions to the snackbar so it doesn't dismiss until acted on.

#### Anatomy

##### Text label
Snackbars contain a text label that directly relates to the process being performed. In compact breakpoints, the text label can contain up to two lines of text.

[DO] Snackbar on mobile with one line of content.

[DO] Snackbar on mobile with two lines of content.

[CAUTION] Snackbar on mobile with an icon and one line of content.

[DON'T] Snackbar on mobile with bolded and hyperlinked words.

##### Container
Snackbars are displayed in rectangular containers with a grey background. Containers should be completely opaque, so that text labels remain legible.

[DON'T] A snackbar with button text the same color as supporting text.

[DON'T] A snackbar with the action in elevated style.

[DO] An extended snackbar on tablet with a long text label. 

[CAUTION] Snackbar with a slightly transparent container and a clearly visible text label.

##### Action
Snackbars can display a single text button that lets users take action on a process performed by the app. Snackbars shouldn’t be the only way to access a core use case, to make an app usable.

[DO] Snackbar with a long text button displayed on a third line.

[DO] Snackbar with a single text button labeled undo.

[CAUTION] Snackbar with a single text button labeled dismiss.

#### Placement

##### At the bottom of a UI
Snackbars should be placed at the bottom of a UI, in front of the main content. In some cases, snackbars can be nudged upwards to avoid overlapping with other UI elements near the bottom, such as FABs or docked toolbars.
Avoid placing a snackbar in front of frequently used touch targets or navigation.

[DO] Snackbar appearing in front of photo content. 

[DON'T] Snackbar placed in front of the navigation components.

To ensure accessibility for keyboard users on the web, avoid positioning the snackbar in a way that completely obscures actionable elements. Blocking elements makes it difficult to know what is being focused and selected.

[DO] Thin snackbar in front of a focused element that is still visible.

[DON'T] Larger snackbar that is obscuring a focused element.

Snackbars can span the entire width of the screen only when a UI does not use persistent navigation components like app bars or navigation bars.
Snackbars that span the entire width of a UI can push up FABs when they appear.

[CAUTION] Snackbar spanning the width of a mobile device is placed in front of the navigation components and FAB.

**Snackbars and floating action buttons (FABs)**
Snackbars should appear above FABs.

[DON'T] Snackbar placed in front of a FAB on a mobile device.

[DON'T] Snackbar placed behind a FAB on a mobile device.

#### Responsive layout

##### Compact breakpoint
In compact breakpoints, snackbars should expand vertically from 48dp to 64dp to accommodate one or two lines of text, while maintaining a  fixed distance from the leading, trailing, and bottom edges of the screen.

##### Medium & expanded breakpoints
On medium and expanded breakpoints, like tablet and desktop, snackbars should scale horizontally to accommodate longer text strings, keeping in mind that the ideal line length for text is typically between 40-60 characters.
Snackbars use a flexible distance from the trailing edge of the screen. Whenever possible, snackbars on medium and large displays should aim for a single line of text with an  optional button.

In wider layouts, snackbars can be left-aligned or center-aligned if they are consistently placed on the same spot at the bottom of the screen.

[DON'T] Snackbar displayed at the left edge of the screen, near the bottom, on a medium-sized device.


[DON'T] 2 snackbars placed side-by-side at the bottom of the screen on a medium-size device.

#### Behavior

##### Appearing and disappearing
Snackbars appear without warning, but they don’t block users from interacting with page content.
Snackbars without actions can auto-dismiss after 4–10 seconds, depending on platform. Avoid using auto-dismissing snackbars on web unless there's also inline feedback.

Snackbars with actions should remain on the screen until the user takes an action on the snackbar, or dismisses it.

##### Consecutive snackbars
Consecutive snackbars must appear one at a time. 
Snackbars without actions appear and disappear automatically, while those with actions remain on screen until dismissed. However, a snackbar with updated information can immediately replace an outdated snackbar.

[DON'T] 2 snackbars appear sequentially on a mobile device and are stacked on top of one another. The first includes an action button.

[DON'T] FAB's position is displaced when a snackbar enters the screen of a mobile device.


## Accessibility

##### Use cases
Users should be able to:

- Be alerted, but not disrupted, when a snackbar appears
- Move focus to an actionable snackbar
- Take action on a snackbar using assistive technology

##### Interaction & style
Snackbars with actions shouldn't auto-dismiss. This way, users can read and interact with it at their own pace.
Snackbars without actions can auto-dismiss after a sufficient amount of time, however this can still present difficulties on web without additional feedback. 
Each platform has its own requirements for auto-dismiss durations, however common acceptable durations are 4–10 seconds.

Snackbars use a color intended to stand out against UI elements. Use the default color mapping to avoid color conflict issues.

##### Accessibility requirements on web
On web, auto-dismissing snackbars can be difficult to navigate for people with low vision or who require additional time to perceive information. This information can be made clearer for all users in two ways:

###### 1. Add inline feedback
Information in auto-dismissing snackbars must also be communicated inline or near the action that triggered the snackbar.
For example, update the label on a "Save" button to “Saved”, and trigger an auto-dismissing snackbar that communicates the same message.

###### 2. Make the snackbar actionable
Alternatively, add actions to the snackbar so it doesn't dismiss until acted on. Actionable snackbars shouldn't auto-dismiss.

Note: Material Web doesn't yet include the snackbar component. This guidance still applies to custom-made snackbars.

##### Focus
Snackbars have the following focus requirements:

- When a snackbar appears, announce the message but don't move focus.
- Don't automatically move focus.
- Don't trap focus in the snackbar. Users should be able to freely navigate in and out.
- On web, a shortcut should exist for users to move focus to snackbars with actions (like Alt+G). Ensure that this shortcut is clearly documented, like in a help article.

Focus exits the snackbar differently per platform:

- Ideally, focus should either return to the element that triggered the snackbar, or go to the next most logical element on the page. 
- On Android Compose, focus may move to the nearest visible element, or to the first actionable item on the page.

##### Keyboard navigation

| Keys | Actions | 
| Tab | Moves focus between interactive elements | 
| Esc | Dismisses the snackbar when in focus |

##### Labeling elements
Snackbars should be announced once they appear on the screen, but shouldn’t grab focus or prevent people from completing their current task. 

- On Android and web, use a live region with a polite (queued) announcement instead of an assertive announcement.
- On iOS 17+, snackbars use polite announcements by default.If a snackbar appears when the app is launched, it should be announced after the page’s title, but not receive focus.
