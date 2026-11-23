# Report an incident
Source: https://developer.android.com/design/ui/cars/guides/app-types/report-incident

# Report an incident

Make it easy for drivers to report traffic incidents quickly. The Grid template included in the Map + Content template will help you reduce the number of steps required to report incidents so drivers can focus on the road.

## Sample

This sample flow shows how the templates might look in Android Auto.

|                                                User action                                                 |                                                                                                            Where action is performed                                                                                                            | Step count after action |
|------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| While driving, the user notices an incident that they decide to report, so they tap the Report FAB.        | Navigation template | 1                       |
| A grid of possible actions opens, allowing the user to quickly tap the**Incident**icon.                    | Grid template included in the Map + Content template | 2                       |
| The grid is dismissed and a toast appears on the screen notifying the user that the incident was reported. | Navigation template | 1 (new task)            |
