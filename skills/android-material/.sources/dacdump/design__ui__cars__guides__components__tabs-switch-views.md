# Use tabs to switch views
Source: https://developer.android.com/design/ui/cars/guides/components/tabs-switch-views

# Use tabs to switch views

Tabs help drivers quickly switch between views in your app.

You can use them to place common tasks a few taps away, minimizing distraction so drivers can focus on the road. Implement tabs using the[Tab template](https://developer.android.com/design/ui/cars/guides/templates/tab-template).
| **Note:** Remember to[keep task flows short](https://developer.android.com/design/ui/cars/guides/ux-requirements/plan-task-flows), sticking to 5 steps or fewer.

## Sample flow

|                          User action                           |                                                                                                                                                             Where action is performed                                                                                                                                                              | Step count after action |
|----------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| The user taps the**Home devices**tab.                          | Tab template with embedded List template | 1                       |
| The user taps the desk light icon to turn off the desk light.  | Tab template with embedded Grid template | 1                       |
| A toast appears to confirm that the desk light was turned off. | Tab template with embedded Grid template **Note:**Because the content of the navigation template does not change, this is considered a refresh and does not add to the step count. | 1                       |
