# Add a stop while driving
Source: https://developer.android.com/design/ui/cars/guides/app-types/add-stop

# Add a stop while driving

You can let users add a stop while driving without losing the view of their current route. Transition from the[Navigation template](https://developer.android.com/design/ui/cars/guides/templates/navigation-template)to the[Map + Content template](https://developer.android.com/design/ui/cars/guides/templates/map-content-template)to show a compact list of places while keeping the turn-by-turn information visible.

The turn-by-turn information on the routing card will be condensed and moved to the side of the screen.

## Sample flow

The user is using the app. They decide to add a stop to their journey.

|                                                                                   User action                                                                                   |                                                                                                                                                    Where action is performed                                                                                                                                                     | Step count after action |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| The user taps an action to add a stop during an active route.                                                                                                                   | Navigation template | 1                       |
| A compact list appears, showing the available options to add a stop, while the turn information shrinks into a floating navigation bar and moves to the side.                   | List template included in the Map + Content template | 2                       |
| The user taps the chosen stop.                                                                                                                                                  | List template included in the Map + Content template **Note:**Because the content of the map template does not change, this is considered a refresh and does not add to the step count. | 2                       |
| The user clicks the**Navigate**button to start navigation.                                                                                                                      | Pane template included in the Map + Content template | 3                       |
| The stop is added to the route and the app informs the user with a[navigation alert](https://developer.android.com/design/ui/cars/guides/templates/navigation-template#alerts). | Navigation template | 1                       |
