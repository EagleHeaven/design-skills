# Page indicators
Source: https://developer.android.com/design/ui/wear/guides/m2-5/components/page-indicators

The [HorizontalPageIndicator](https://developer.android.com/reference/kotlin/androidx/wear/compose/material/HorizontalPageIndicator.composable#HorizontalPageIndicator(androidx.wear.compose.material.PageIndicatorState,androidx.compose.ui.Modifier,androidx.wear.compose.material.PageIndicatorStyle,androidx.compose.ui.graphics.Color,androidx.compose.ui.graphics.Color,androidx.compose.ui.unit.Dp,androidx.compose.ui.unit.Dp,androidx.compose.ui.graphics.Shape)) component is used to represent the currently active page and total pages of an overlay.
On round displays, a page indicator is curved. This behavior is implemented in the `HorizontalPageIndicator` class. It is made up of one active indicator and at least one inactive indicator.  

**A. Inactive Indicator
B. Active Indicator**

<br />

<br />

Use indicators to show users where you are in a carousel. Orient content from left to right.

<br />

<br />

## **Usage**

## **Adaptive layouts**

Centre of the dot (indicator) circumference aligns near or on the circular grid for optical balance, this means the curve angle changes slightly as the screen size increases.

The pagination will always show a maximum of 6 dots, no matter the size of the screen.

<br />

<br />
