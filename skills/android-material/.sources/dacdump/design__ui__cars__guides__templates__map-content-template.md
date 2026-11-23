# Map + Content template
Source: https://developer.android.com/design/ui/cars/guides/templates/map-content-template

# Map + Content template

Most content templates support the display of a map in the background. To help users complete tasks without leaving the map, use the Map + Content template.

Like the[Tab template](https://developer.android.com/design/ui/cars/guides/templates/tab-template), the Map + Content template acts as a container for other supported templates. The Map + Content template can improve the functionality of your app and reduce the number of templates required to complete tasks.

Map + Content template includes the following:

- Map
- Included content template, which can be one of the following types:
  - [List](https://developer.android.com/design/ui/cars/guides/templates/list-template)
  - [Grid](https://developer.android.com/design/ui/cars/guides/templates/grid-template)
  - [Pane](https://developer.android.com/design/ui/cars/guides/templates/pane-template)
  - [Message](https://developer.android.com/design/ui/cars/guides/templates/message-template)

## Map + Content template examples

List template included in the Map + Content template  
Grid template included in the Map + Content template

<br />

Message template included in the Map + Content template  
Pane template included in the Map + Content template

<br />

## Map + Content template UX requirements

App developers:

|--------|----------------------------------------------------------------------------------------|
| MUST   | Include content from List, Message, Grid, or Pane template.                            |
| SHOULD | Designate a primary action for rows within content templates when providing 2 actions. |
| SHOULD | Provide icons in addition to text labels for actions within the content templates.     |
| SHOULD | Limit locations to those that are closest or most relevant.                            |
| SHOULD | Consider supporting content refresh for the list when supporting map interactions.     |
| SHOULD | Use a font size of at least 24dp Roboto or equivalent for map markers.                 |
| SHOULD | Show a corresponding marker on the map for each location in a list.                    |
| SHOULD | Highlight the relevant route on the map when a user makes a selection.                 |

## Resources

|-------------------|-------------------------------------------------------------------------|
| Type              | Link                                                                    |
| API reference     | `MapWithContentTemplate`                                                |
| Developer's Guide | [Draw maps](https://developer.android.com/training/cars/apps#draw-maps) |
