# View a map in the cluster
Source: https://developer.android.com/design/ui/cars/guides/app-types/view-map-in-cluster

# View a map in the cluster

Another helpful way to minimize distraction for drivers is to display a map in
the instrument cluster, behind the steering wheel. The
[cluster display option](https://developer.android.com/design/ui/cars/guides/templates/navigation-template#cluster) for the [navigation template](https://developer.android.com/design/ui/cars/guides/templates/navigation-template)
lets drivers navigate while looking straight ahead.

This map is noninteractive and can feature its own map view, independent of
any map view that might appear in the center screen. It displays in the cluster
only while the user is navigating with the navigation template.  

<br />

## Sample flow

|                                           User action                                           |                                                                                                                                                                                     Where action is performed                                                                                                                                                                                     | Step count after action |
|-------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| The user chooses a destination from the list on the center screen.                              | Place List template [](https://developer.android.com/design/ui/cars/guides/app-types/view-map-in-cluster#cluster_1) | 1                       |
| When the navigation starts, a second map (created by the app developer) appears in the cluster. | Navigation template [](https://developer.android.com/design/ui/cars/guides/app-types/view-map-in-cluster#cluster_2) | 2                       |
