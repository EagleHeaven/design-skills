# Design for watches

Source: https://m3.material.io/foundations/watches

Watches have special design considerations and interaction patterns


## Overview

#### Resources

| Type
 | Resource
 | 
| Design
 | About M3 Expressive (https://m3.material.io/)
 | 
| M3 Expressive on Wear OS (https://developer.android.com/design/ui/wear/guides/get-started)
 | 
| Figma Design Kits for Wear OS (https://developer.android.com/design/ui/wear/guides/get-started/design-kits)
 | 
| Implementation
 | Android Developers: Wear OS (https://developer.android.com/training/wearables)
 | 
| Jetpack Compose for Wear OS (https://developer.android.com/training/wearables/compose?version=3)
 |

#### New in GM3 Expressive
Design expressive layouts for watches with harmonious shape, animation, color, and typography treatments. All examples shown here are based on Material for Wear OS. More on M3 Expressive on Wear OS (https://developer.android.com/design/ui/wear/guides/get-started)

##### Designed for round screens
A new shape system with edge-hugging containers and buttons creates variety and visual balance on round screens.
More on shape system for Wear OS (https://developer.android.com/design/ui/wear/guides/get-started/apply)

##### Expressive motion & springs
A new physics-based system makes interactions and transitions feel more alive, fluid, and natural.

More on M3 motion physics (/m3/pages/motion-overview/how-it-works)

##### Shape morphing
With shape morphing, controls respond to show interaction. Containers change corner radius.

More on M3 shape morphing (/m3/pages/shape/shape-morph)

##### Rich color
Dynamic color and deep tonal palettes are applied in a system of color roles to create depth and variety.
More on color for Wear OS (https://developer.android.com/design/ui/wear/guides/styles/color)

##### New type roles
Along with an updated and optimized type scale (https://developer.android.com/design/ui/wear/guides/styles/typography/type-scale-tokens), new styles serve specific use cases for watches:

- Arc (https://developer.android.com/design/ui/wear/guides/styles/typography/apply#arc-styles) text for curved titles

- Numeral (https://developer.android.com/design/ui/wear/guides/styles/typography/apply#numeral-styles) text for bigger, stylized text
More on typography for Wear OS (https://developer.android.com/design/ui/wear/guides/styles/typography)


## Foundations

#### Resources

| Type
 | Resource
 | 
| Design
 | Get Started with M3 Expressive (https://m3.material.io/get-started)
 | 
| UI Design for Wear OS (https://developer.android.com/design/ui/wear/guides/get-started/design-for-wearables)
 | 
| Figma Design Kits for Wear OS (https://developer.android.com/design/ui/wear/guides/get-started/design-kits)
 | 
| Implementation
 | Android Developers: Wear OS (https://developer.android.com/training/wearables)
 | 
| Jetpack Compose for Wear OS (https://developer.android.com/training/wearables/compose?version=3)
 |

#### Anatomy

##### The watch face

Watch faces display the time, as well as  other information and can provide access to other functions through apps and tiles.

They can also include complications, self-contained details that can show contextual info like heart rate or progress.

Ongoing activities on the watch face show in-progress actions, like a stopwatch countdown or a workout timer.

##### Physical buttons
Wearable devices can have a variety input surfaces, which include physical buttons and controls.

#### Design principles

- Tailor layouts for different screen sizes with adaptive design (https://developer.android.com/design/ui/wear/guides/foundations/adaptive-design)

- Design for short interactions to conserve battery

- Focus on one or two tasks at a time rather than a full app experience

- Test designs in situations that involve movement to make sure the design is usable at a glance

[DO] Calendar screen with date, time of dentist appointment, and more button.

[DON'T] 3 columns with times, dates, and appointment names cut off.

##### Always relevant
Watches are always with people. Consider how to update app content based on context, such as time, place, and activity.

##### Works offline
Design for slow connections and offline use, such as exercising and commuting.

#### Interaction patterns

##### Cross-device experiences
Watches are often dependent on connected phones for functionality or complex interactions. In some cases, a watch and a phone are used together to accomplish different parts of the same task.
Consider how experiences can be consistent and complement the strengths of each device.
More on multidevice development for Android (https://developer.android.com/multi-device-development)

[DO] A contact entry shown on a phone and a watch, with options to call or message.

##### Always on displays
Watches can have always on displays, which allow ambient content to be shown when the watch isn’t in use.
This are especially helpful for ongoing experiences like a timer or a workout that should remain in view. Because they remain on the screen for long time periods, consider limiting the number of pixels that are illuminated.
More on always-on apps and system ambient mode in Wear OS (https://developer.android.com/training/wearables/always-on)


## Styles

#### Resources

| Type
 | Resource
 | 
| Design
 | M3 Expressive on Wear OS (https://developer.android.com/design/ui/wear/guides/get-started)
 | 
| Typography for Wear OS (https://developer.android.com/design/ui/wear/guides/styles/typography)
 | 
| Color for Wear OS (https://developer.android.com/design/ui/wear/guides/styles/color)
 | 
| Motion for Wear OS (https://developer.android.com/design/ui/wear/guides/get-started/apply#shape-motion)
 | 
| Implementation
 | Android Developers: Wear OS (https://developer.android.com/training/wearables)
 | 
| Jetpack Compose for Wear OS (https://developer.android.com/training/wearables/compose?version=3)
 |

#### Typography
GM3 Expressive adds two type styles specially designed for watches. More on the type scale for Wear OS (https://developer.android.com/design/ui/wear/guides/styles/typography/type-scale-tokens)

##### Numerals
Numeral text styles display numbers, usually only a few digits at a time. This text can take on more expressive properties at larger display sizes without the accommodations usually required by text that must be localized.

##### Arc text
Arc text is specially designed for text following a curved path on a round screen, such as page titles, confirmation overlays, or a call to action. It optimizes character spacing for text displayed along a curve at the top or bottom of a round screen.

#### Color
Material for Wear OS provides a custom color system (https://developer.android.com/design/ui/wear/guides/styles/color/system) to create vibrant experiences and clear visual hierarchy.

##### Build from black
Watches are designed with a black background, instead of the tinted background that phones use.

##### Color roles
Since watches are used throughout the day, color tokens for Wear OS are specifically tailored for dark themes in low-light environments and light themes for daylight environments.
More on color roles for Wear OS (https://developer.android.com/design/ui/wear/guides/styles/color/roles-tokens)

[DO] 3 examples of “Accept” and “Decline” buttons that are legible.

[DON'T] Buttons with (2) primary dim on (1) primary or (4) primary dim on (3) primary container become illegible as contrast levels shift

##### Recommended color combinations for Wear OS
Below are some common color pairings that can help establish priority, function, and elevation.

- Use **primary dim** to highlight important elements and **tertiary** to provide standout feedback, such as tap responses

- When the main action isn't clear, use **tertiary** and **primary** for main actions and **secondary container** for complementary actions

- Use **secondary** and **primary container** to show two equally important options or containers, while maintaining contrast

#### Motion and transitions
Expressive motion makes interactions feel more alive, fluid, and natural. Use transitions give intuitive feedback to show how an app works, such as standard patterns for changes in state or hierarchy.

More on shape and motion for Wear OS (https://developer.android.com/design/ui/wear/guides/get-started/apply#shape-motion)

#### Haptics
Haptics are tactile effects used to grab a person’s attention for something important, or add emphasis to an interaction on the screen. You can use haptics to provide responsive feedback to scrolling and selecting items from a list, or controlling volume.

Use system-defined patterns and tokens (when available) to reinforce interaction expectations. Synchronize haptics with UI motion and sound to provide richer feedback.

- Use stronger haptics for key interactions, such as a payment confirmation

- Use subtler haptics for precision interactions, such as scrolling through a list
More on haptics for Wear OS (https://developer.android.com/develop/ui/views/haptics/haptics-principles)


## Layout

#### Resources

| Type
 | Resource
 | 
| Design
 | Wear OS common design layouts (https://developer.android.com/design/ui/wear/guides/foundations/common-layouts)
 | 
| Adaptive layout for Wear OS (https://developer.android.com/design/ui/wear/guides/foundations/adaptive-design)
 | 
| Figma Design Kit for Wear OS Apps (https://www.figma.com/community/file/1506418396052412186)
 | 
| Figma Design Kit for Wear OS Tiles (https://www.figma.com/community/file/1507852095734722321/m3-wear-os-tiles-design-kit?fuid=1348995927136540612)
 | 
| Implementation
 | Android Developers: Wear OS (https://developer.android.com/training/wearables)
 |

#### Layout principles

#### Standard layouts

For scrolling and non-scrolling apps:

- The time is shown on most app screens

- Edge-hugging buttons are used for round screens

- Show an indicator if more content is available on a scrolling apps
Wear OS offers Figma Design Kits (https://developer.android.com/design/ui/wear/guides/get-started/design-kits) for standard layouts, with components, styles, and variables.

##### Non-scrolling layouts
Non-scrolling layouts are for focused tasks or single-screen interactions where all content fits within the display, such as: 

- Media players

- Pickers and switchers

- Fitness tracking screens

- Confirmation dialogs 
More on non-scrolling layouts for Wear OS (https://developer.android.com/design/ui/wear/guides/surfaces/apps/layouts/scrolling)

##### Scrolling layouts
Scrolling layouts can show content that exceeds the screen height, such as lists or dialogs. These might include:

- Message threads

- Contact lists

- Menu options
More on scrolling layouts for Wear OS (https://developer.android.com/design/ui/wear/guides/surfaces/apps/layouts/scrolling)

##### Tiles
Tiles (or widgets) are designed for glanceability. Use them to show timely updates or to help people perform frequent tasks quickly, such as checking progress towards a goal or viewing the weather.
Tiles are accessible with a swipe from the watch face. They have a fixed screen height and don't scroll.
More on tiles for Wear OS (https://developer.android.com/design/ui/wear/guides/foundations/common-layouts/tiles)

##### Notifications
Notifications can be expanded to offer more interactions, such as replying to a message, opening a location on a map, or playing a song.
Wear OS provides notification templates for instant messaging and calendar events.
More on notifications for Wear OS (https://developer.android.com/training/wearables/notifications)

##### Adaptive layout
Adaptive design allows apps to adapt to different screen sizes and device contexts. On Wear OS, this means apps scale and reorganize to maximize the available space on both small and large round displays. The Material 3 Compose component library (https://developer.android.com/jetpack/androidx/releases/compose-material3?_gl=1*1ntglil*_ga*NzMzMjg1Nzc1LjE3NDg5MTM2NjI.*_ga_QPQ2NRV856*czE3NjQ3MDkwMjUkbzc2JGcxJHQxNzY0NzEwNjAyJGo0MCRsMCRoMA..) has built-in adaptive behavior.

- Design for small screens first: Start by designing for the smallest common screen size

- Use percentages: Define margins and padding using percentages rather than fixed pixel values. This prevents clipping and ensures content remains centered and proportional as the screen size increases.

- Add value on larger screens: Use the extra space on screens larger to show more content, such as additional buttons, text lines, or data visualizations

- Test all font sizes: Font scaling and accessibility settings such as bold text may cause changes in the size of UI elements
More on adaptive layout for Wear OS (https://developer.android.com/design/ui/wear/guides/foundations/adaptive-design)
