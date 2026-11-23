# Search using past data while driving
Source: https://developer.android.com/design/ui/cars/guides/app-types/search-using-past-results

# Search using past data while driving

Users might be restricted from using the keyboard while driving. Presenting past search results (places) or keywords (such as*coffee*) using the Search template can help them find the right destination without typing. Users can then select a result and begin navigation.  

<br />

## Sample flow

This sample flow shows how the templates might look in Android Auto.

|                               User action                                |                                                                                                                              Where action is performed                                                                                                                               | Step count after action |
|--------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| The user taps the**Search**button from the action strip.                 | List template included in the Map + Content template (landing template) | 1                       |
| The user selects the option to show the map with a list of past results. | Search template (disabled state) | 2                       |
| The user selects an item from the list.                                  | List template included in the Map + Content template | 3                       |
| The user selects an action from the pane that opens.                     | Pane template included in the Map + Content template | 4                       |
| Navigation begins.                                                       | Navigation template| 1 (new task)            |
