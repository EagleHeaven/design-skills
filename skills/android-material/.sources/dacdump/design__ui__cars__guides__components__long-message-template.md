# Long Message template
Source: https://developer.android.com/design/ui/cars/guides/components/long-message-template

With the Long Message template, you can show a long message to be read while the
car is parked, with optional relevant actions.

This template is useful for providing details about a destination or for
presenting legal text, such as terms of service or a privacy policy, during a
sign-in process.

A long message template includes the following:

- [Header](https://developer.android.com/design/ui/cars/guides/components/header) with optional [action strip](https://developer.android.com/design/ui/cars/guides/components/action-strip)
- Unlimited lines of wrapping text (scrollable)
- Up to 2 [buttons](https://developer.android.com/design/ui/cars/guides/components/button) in template body (optional), where one can be designated as [primary](https://developer.android.com/design/ui/cars/guides/components/button#primary-buttons)

> [!NOTE]
> **Note:** This template displays its contents only when parked (see [examples](https://developer.android.com/design/ui/cars/guides/templates/long-message-template#examples)) and does not increase the step count.

## Long Message template examples


When the car is parked, this template can show a detailed message, such as a privacy policy, or terms of service for the user to accept when signing in to the app (Android Auto example). To prevent distraction, the long message is not shown while the user is driving. For these situations, it's helpful to provide a button with an alternative option, such as skipping sign-in and using the app in guest mode.

<br />

## Long message template UX requirements

App developers need to meet the following requirements:

|---|---|
| **MUST** | Include text. |
| **SHOULD** | Designate a [primary action](https://developer.android.com/design/ui/cars/guides/components/button#primary-buttons) when providing 2 actions. |
| **SHOULD** | Place the primary action closest to the driver (on the left for left-hand-drive vehicles) when there are 2 actions. |
| **MAY** | Include up to 2 actions. |
