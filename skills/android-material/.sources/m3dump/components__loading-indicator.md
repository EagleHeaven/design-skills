# Loading indicator

Source: https://m3.material.io/components/loading-indicator


## Overview

- Recommended as a replacement for indeterminate circular progress indicators

- Always reflect an ongoing process and are never simply decorative

- Used for pull-to-refresh interactions

- Not used for processes that transition from indeterminate to determinate  

- Capture attention through motion

#### Availability & resources

#### M3 Expressive update

May 2025
The loading indicator is designed to show progress that loads in under five seconds. It should replace most uses of the indeterminate circular progress indicator. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

New component added to catalog.
Loading indicators:

- Are used in pull-to-refresh functionality

- Can be contained or uncontained

- Use shape and motion to capture attention

- Can scale in size


## Specs

#### Variants

| Variant

 | M3

 | M3 Expressive

 | 
| Loading indicator

 | --

 | Available

 |

#### Configurations

| Category

 | Configuration

 | M3

 | M3 Expressive

 | 
| Containment

 | Default

 | --

 | Available

 | 
| Contained

 | --

 | Available

 |

#### Tokens & specs

Loading indicators have a single token set.

#### Anatomy

#### Color

##### Default

Color values are implemented through design tokens. For designers, this means working with color values that correspond with tokens; in implementation, a color value will be a token that references a value.

##### Contained

#### Measurements


## Guidelines

#### Usage

Loading indicators use animation to grab attention, mitigate perceived latency, and indicate that an activity is in progress.

They should be used when progress isn’t detectable, or when it’s not necessary to indicate how long an activity will take.

While similar in function to circular progress indicators, loading indicators are a better alternative for short processes between 200ms and 5s.

Choose a loading or progress indicator that corresponds to the expected wait time and type of process. 

If the wait is very long, consider allowing users to navigate away from the page while the process finishes up.

| Expected wait time
 | Recommendation
 | 
| Instant (under 200ms) | No indicator | 
| Short (between 200ms and 5s) | Loading indicator | 
| Long (Over 5s) | Progress indicator |

When a process can transition from indeterminate (unknown progress) to determinate (known remaining progress), transition between the corresponding progress indicators. 

Don’t transition a loading indicator into a progress indicator.

[DO] A screen transitioning from an indeterminate progress indicator to a determinate progress indicator. 

[DON'T] A screen transitioning from a loading indicator to a determinate progress indicator.

#### Anatomy

##### Active indicator
The active indicator is a looping shape morph sequence composed of seven unique Material 3 shapes.

More about the Material shape library (/m3/pages/shape/overview-principles#579dd4ba-39f3-4e60-bd9b-1d97ed6ef1bf)

##### Container (optional)
When the container is visible, the active indicator should change color from **primary** to **on-primary-container**.

The container should be visible when the loading indicator is placed over other content. This helps it stand out better by giving it a stronger contrast. It’s not needed when the loading indicator is placed directly on a surface.

The container should be used with pull-to-refresh behavior.

#### Placement

While loading a page or container, the loading indicator should be centered on the element.

When loading more items on a page with existing content, place the loading indicator in the empty space where the new content will appear. Avoid overlapping existing content.

Loading indicators can be placed within other components, such as buttons, to indicate that the action is ongoing, such as validating a form or checking for updates.

#### Responsive layout

Loading indicators default to 48dp, but the size is flexible. It should be between 24dp to 240dp, depending on the placement and the breakpoint. Avoid exceeding the minimum and maximum sizes.

The ratio between the container and the active indicator stays the same when resizing the loading indicator. 

Reserve very large progress indicators for large and extra-large windows, like desktop.

##### Larger windows
As the pane or window size grows, consider scaling the loading indicator as well, so it remains proportional in size to the empty space around it. The loading indicator shouldn’t exceed 240dp.

#### Behavior

##### Pull-to-refresh
The loading indicator is used in pull-to-refresh (https://developer.android.com/develop/ui/compose/components/pull-to-refresh) on Jetpack Compose only.

Pull-to-refresh is an Android system feature that manually refreshes screen content with an action or gesture. It’s used at the beginning of lists, grid lists, and card collections where the most recent content appears.

It’s best to use pull-to-refresh with dynamic content that can have frequent updates, where people have a high chance of seeing new content after refreshing.

##### Threshold requirements
To ensure intentional usage of the pull-to-refresh gesture, the loading indicator must pass a threshold before the app will refresh.

The loading indicator remains visible until the refresh activity completes and any new content is visible, or someone navigates away from the refreshing content.

[DO] A loading indicator at the top of a screen, which appears until content loads.

[DON'T] A loading indicator that scrolls off screen.


## Accessibility

#### Use cases

People should be able to do the following with assistive technology:

- Navigate to the loading indicator
- Understand what progress the indicator is communicating
- Initiate a content refresh without relying on a gesture

#### Interaction & style

The active indicator, which displays progress, provides visual contrast of at least 3:1 against most container and surface colors.

The indicator itself must have 3:1 contrast with the background, but the container does not.

When integrated into another component, such as a button, make sure that the active indicator provides a visual contrast of at least 3:1 against the other component.

[DO] Loading indicator with correct color contrast.

[DON'T] Loading indicator with incorrect color contrast.

Pull-to-refresh interactions can’t be accessible by just swiping. Provide an alternate way to refresh the content with a single pointer, such as placing a refresh button in a menu or directly alongside the content.

#### Labeling elements

Since the loading indicator is a visual cue, it needs an accessibility label to assist people who can't rely on visuals.

It should use the **progress bar** accessibility role. Write a label describing the purpose of the loading indicator, such as **loading news article** or **refreshing page**.
