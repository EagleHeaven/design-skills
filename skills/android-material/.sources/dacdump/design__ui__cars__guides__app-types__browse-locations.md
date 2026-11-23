# Browse locations and start Navigation
Source: https://developer.android.com/design/ui/cars/guides/app-types/browse-locations

# Browse locations and start Navigation

You can help users quickly find places and start navigation by organizing multiple saved locations under submenus, such as*Recents*.  

In this example, the task flow remains under the maximum of 5 steps --- even with the additional step of selecting a route.

## Sample flow

|         User action          |                                                                                                                                                         Where action is performed                                                                                                                                                         | Step count after action |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| The user selects a submenu.  | Landing template (List template included in the Map + Content template) | 1                       |
| The user selects a location. | List template included in the Map + Content template (not a refresh) **Note:**Because new content is presented, this step is considered a new step, not a refresh. | 2                       |
| The user selects a route.    | List template included in the Map + Content template | 3                       |
| Navigation begins.           | Navigation template | 1 (new task)            |
