# Purchase using existing payment methods
Source: https://developer.android.com/design/ui/cars/guides/flows/purchase

# Purchase using existing payment methods

Flows that involve purchases should be as simple and short as possible so you can minimize distraction for drivers.

Be sure to follow the[guidelines for purchase flows](https://developer.android.com/design/ui/cars/guides/ux-requirements/overview#purchase).

## Sample flow

|                                                User action                                                 |                                                                    Where action is performed                                                                     | Step count after action |
|------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| The user is using your app. They decide to make a purchase.                                                | Landing template (not shown)                                                                                                                                     | 1                       |
| The user selects a parking location from a curated list of nearby or recently booked locations.            | List template | 2                       |
| The user views parking location details and reserves the spot; the purchase takes place in the background. | Pane template | 3                       |
| The user sees confirmation and selects**Navigate**.                                                        | Message template | 4                       |
| A separate navigation app opens and routing begins.                                                        | Switch to navigation app | 1 (new task)            |
