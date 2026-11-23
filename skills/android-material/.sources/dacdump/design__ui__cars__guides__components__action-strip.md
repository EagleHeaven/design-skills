# Action strip
Source: https://developer.android.com/design/ui/cars/guides/components/action-strip

The action strip lets users perform secondary or tertiary actions with a quick
tap.

## Requirements

- Action strips allow up to two action [buttons](https://developer.android.com/design/ui/cars/guides/components/action-strip) (except for [templates with maps](https://developer.android.com/design/ui/cars/guides/components/action-strip#maps), which allow up to 4).
- Only one label button (with label and optional icon) is allowed per template.
- Button order is specified by the app.

In the top right corner of this example, the action strip includes a volume button and a settings button. In the top right corner of this example, the action strip includes a search button and a close button.

<br />

### Guidance

- Use action strips for secondary or tertiary actions, rather than primary actions -- except on the [Navigation template](https://developer.android.com/design/ui/cars/guides/templates/navigation-template). For primary actions, use a [floating action button](https://developer.android.com/design/ui/cars/guides/components/fab) or a [button](https://developer.android.com/design/ui/cars/guides/components/button).
- For details about when the action strip is displayed on the Navigation template and when it's hidden, refer to [Visibility of action strips](https://developer.android.com/design/ui/cars/guides/components/action-strip#visibility).
- Don't include both an action strip and a floating action button at the same time.

> [!NOTE]
> **Note:** Templates for navigation apps can also have a [map action strip](https://developer.android.com/design/ui/cars/guides/components/map-action-strip) with map interactivity buttons.

### Use the action strip on templates with maps

On templates with maps, the action strip can include up to 4 buttons, as shown
in the following examples.
The top right corner of this example shows an action strip with 2 buttons. The top right corner of this example shows an action strip with 3 buttons.

## Visibility of action strips

The app library generally takes care of showing and hiding the action strip
and map action strip in the map-based templates based on user interactions.
See these examples:
When a map-based template opens, the action strip and map actionstrip are visible. If 10 seconds go by with no user interaction, and if the action strip and map action strip don't have user focus for rotary input, they disappear. When the action strip and map action strip are hidden, any user interaction with the screen will cause them to reappear.

### Exceptions

- Your Apps can flag actions in either action strip as persistent to keep them
  from disappearing.

- To minimize clutter, Car App Library may hide the action strip on small
  screens after 10 seconds even when there is rotary focus.
