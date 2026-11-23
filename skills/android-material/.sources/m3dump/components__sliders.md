# Sliders

Source: https://m3.material.io/components/sliders


## Overview

- Three variants: Standard, centered, range

- Has five sizes, vertical and horizontal orientation, and an optional inset icon

- Sliders should present the full range of available values

- The slider value should take effect immediately

#### Availability & resources

#### M3 Expressive update

**May 2025**
The slider includes expressive configurations for orientation, shape sizes, and an inset icon. More on M3 Expressive (https://m3.material.io/blog/building-with-m3-expressive)

Updated on Android Views (MDC-Android) and Jetpack Compose.
Variants and naming: 

- Changed **continuous** slider to **standard** slider

- The **discrete** slider is now the **stops** configuration
New configurations: 

- Orientation: Horizontal, vertical

- Optional inset icon (standard slider only)

- Sizes: XS (existing default), S, M, L, XL

#### Previous updates

##### Visual refresh to improve non-text contrast
**Dec 2023:** Updated on Android Views (MDC-Android) and Jetpack Compose.

- **Configuration:** Added centered configuration and range selection

- **Shape: **New shape for slider tracks and handles. Slider elements change shape when selected.

- **Motion:** Slider handle adjusts width upon selection. Slider tracks adjust in shape when sliding to the edge.

- **Color: **Refreshed color mappings

#### Differences from M2

- **Color**: New color mappings and compatibility with dynamic color


## Specs

#### Variants

| Variant
 | M3
 | M3 Expressive
 | 
| Standard
 | Available as “continuous” slider
 | Available
 | 
| Centered
 | Available (web only)
 | Available
 | 
| Range
 | Available
 | Available
 | 
| Discrete
 | Available
 | Available as “stops” configuration
 |

#### Configurations

| Category
 | Configuration
 | M3
 | M3 Expressive
 | 
| Inset icon
 | No (default)
 | Available
 | Available
 | 
| Yes
 | --
 | Available
 | 
| Orientation
 | Horizontal (default)
 | Available
 | Available
 | 
| Vertical
 | --
 | Available
 | 
| Size
 | XS (default)
 | Available
 | Available
 | 
| S, M, L, XL
 | --
 | Available on Android Views (MDC-Android).
Available as tokens on other platforms.*

 | 
| Stop indicators
 | No (default), Yes
 | Available as “discrete” slider
 | Available
 | 
| Value Indicator
 | No (default), Yes
 | Available
 | Available
 |

*Configurations only available using tokens don’t have implemented presets in code. To change the size, swap the default size tokens md.comp.slider.**xsmall**.[...] with those of the desired size.

#### Tokens & specs
Slider tokens are organized into a common token set, and token sets for each size. Switch token sets from the table’s menu. Learn more about design tokens (/m3/pages/design-tokens/overview)

#### Anatomy

#### Color

#### States

#### Measurements

| Attribute | XS | S | M
 | L | XL | 
| Track height | 16dp | 24dp | 40dp | 56dp | 96dp | 
| Label container height
 | 44dp | 
| Label container width | 48dp | 
| Handle height
 | 44dp | 44dp | 52dp | 68dp | 108dp | 
| Handle width
 | 4dp | 
| Track shape | 8dp | 8dp | 12dp | 16dp | 28dp | 
| Inset icon size | -- | -- | 24dp | 24dp | 32dp |


## Guidelines

#### Usage

Sliders are used to select values along a track. They’re ideal for adjusting settings such as volume and brightness, or changing the intensity of image filters.

Sliders can use icons or labels to represent a numeric or relative scale.

Changes made with sliders must take effect immediately, so people can understand the effects of their selection as they're moving the slider.

There are three different variants of sliders: **standard**, **centered**, and **range:**

Standard sliders select one value from a range of values. Use this when the slider should start from zero or the beginning of a sequence.

Centered sliders select a value from a positive and negative value range. Use this when zero, or the default value, is in the middle of the range.

Range sliders select two values on one slider to create a range. Use this when defining a minimum and maximum value.

Avoid using range sliders vertically, as this can add too much cognitive load. People are used to most sliders being horizontal.

[DO] Horizontal range selection slider with 2 values selected, and a stop indicator at each end.

[DON'T] Vertical range slider with 2 values selected, and a stop indicator at each end.

#### Anatomy

##### Track
The track shows the full range of values that can be selected on the slider. It has two sections: active and inactive.

- The **active **section of the track is from the minimum value to the handle. For range sliders, the active track is between the two handles.
- The **inactive** section of the track is from the handle to the maximum value, or outside the two handles of a range slider.For left-to-right (LTR) languages, the values increase from left to right. For right-to-left (RTL) languages, this is reversed.

##### Handle
The handle can be moved along the track to choose a value.

When sliders have two handles, the handles choose the minimum and maximum values in a range.

The handle changes shape to indicate when it’s pressed.

#### Configurations

##### Value
The value displays the specific value that corresponds with the handle’s placement. 

A value appears when interacting with the corresponding handle. For range sliders, only one value should be shown at a time.

If the value is shown elsewhere, the indicator is not required.

Instead of showing the built-in value label, a separate text input field can be added outside of the slider. If this is added, the slider and value in this text field should automatically update to match each other.
Make sure people can tab to the text field directly after the slider.

##### Stop indicators
Stop indicators show which predetermined values can be chosen on the slider. The slider handle snaps to the closest stop. 

Avoid having too many stop indicators on a slider, because it can become visually crowded and difficult to adjust the value.

All sliders have stops at the end of the inactive track to ensure at least a 3:1 contrast with the background. If the inactive track has this level of contrast already, the end stops can be removed.

Icons or text can be added outside the slider to indicate the range of values and make the slider more accessible. This can be used instead of a stop indicator.

##### Orientation
Sliders can be oriented either horizontally or vertically, depending on what is best for your use case.

##### Inset icon
Standard sliders that are M, L, or XL can include an icon within the track. This icon should illustrate what the slider controls. Avoid adding inset icons to XS or S sliders.

When there’s not enough space for the icon on the active track, like at a low value, the icon moves to the inactive track.

Consider swapping which icon is displayed at zero, like a volume icon becoming a mute icon.

[DO] Inset icon on the active track when the handle is at 50%, and on the inactive track when the handle is at 0.

[DON'T] An inset icon on an XS slider. The icon bounds are cut off by the slider container.

Don’t use inset icons on centered or range sliders. It makes it unclear where the start of the slider is.

[DON'T] Centered slider with an inset icon on one end, and a stop indicator on the other.


[DON'T] Range slider with an inset icon on one end, and a stop indicator on the other.


##### Size
Sliders come in different sizes: XS, S, M, L, and XL. Use larger sizes to increase the targets and provide a larger visual emphasis.

The active and inactive tracks should always be the same size.

XL sliders should be reserved for hero moments, where the slider itself is the most important element on the page.

#### Behaviors

##### Select & drag
Select a value by dragging the handle.

##### Select jump
Select a value by selecting part of the track.

##### Select & arrow
Select a value using the keyboard.

**Tab:** Focus lands on handle 

**Arrows: **Selected value increases or decreases by one value or stop indicator

**Space & arrows:** Selected value increases or decreases by a larger interval or stop indicator


## Accessibility

#### Use cases

People should be able to do the following using assistive technology:

- Navigate to a slider 
- Select a range by controlling a handle along a track
- Get appropriate feedback based on input type

#### Interaction & style

The slider handle shrinks in width and the value appears to provide a visual cue to the user that the handle is being pressed.
**Touch**
When tapped or dragged, the handle width shrinks to provide interaction feedback, and the value appears.
**Cursor**
When hovered, the cursor changes. When clicked and dragged, the handle width shrinks, and the value appears.

##### Focus and navigation
Initial focus lands directly on the handle, since it’s the primary interactive element of the slider.
The slider value can then be adjusted using the arrow keys or other keyboard navigation options.

#### Color contrast

Use visual anchors so the end of the slider’s inactive track has at least 3:1 contrast with the background. The stop indicator makes the end easily visible on most backgrounds.

Alternatively, icons or other elements that have a 3:1 contrast with the background can be used to indicate the ends of the slider’s inactive track.

#### Keyboard navigation

| Keys
 | Actions
 | 
| Tab
 | Moves focus to the slider handle | 
| Arrows
 | Increase and decrease the value by one value or one stop indicator | 
| Space & Arrows
 | Increase and decrease the value by one interval or one stop indicator | 
| Home or End
 | Set the slider to the first and last values on the slider |

#### Labeling elements

The accessibility label for a slider is typically the same as the slider's adjacent text label. It should have the **slider** role.

If the UI text is correctly linked to the slider, assistive tech (such as a screenreader) will read the UI text followed by the component’s role.
