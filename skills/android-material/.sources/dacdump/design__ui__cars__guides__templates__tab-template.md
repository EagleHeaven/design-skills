# Tab template
Source: https://developer.android.com/design/ui/cars/guides/templates/tab-template

# Tab template

The Tab template acts as a container for other templates and allows switching among views.

This capability is particularly useful for organizing content or views that users will want to frequently switch between, such as available devices, settings, and more.

Tab template includes the following:

- Tab bar with app icon and up to 4 tabs. Each tab must provide both an icon and a title.
- Embedded template, which can be any of the following types:
  - [List](https://developer.android.com/design/ui/cars/guides/templates/list-template)
  - [Grid](https://developer.android.com/design/ui/cars/guides/templates/grid-template)
  - [Search](https://developer.android.com/design/ui/cars/guides/templates/search-template)
  - [Pane](https://developer.android.com/design/ui/cars/guides/templates/pane-template)
  - [Message](https://developer.android.com/design/ui/cars/guides/templates/message-template)
  - [Navigation](https://developer.android.com/design/ui/cars/guides/templates/navigation-template)
  - Sectioned Item

Each tab corresponds to one embedded template. Only one tab can be active at any given time.
| **Note:** Headers from embedded templates are ignored because the space that would normally be used for the header is used for the tab bar.
Example of the Tab template

## Anatomy of the tab template

Tab template with a list embeddedTab template with a grid embedded  
Tab template with a pane embeddedTab template with a message embedded  
Tab template with navigation template embeddedTab template with Search template embedded

## Tab template UX requirements

|------------|---------------------------------------------------------|
| MUST       | Provide icons for each tab.                             |
| MUST       | Include at least 2 and no more than 4 tabs.             |
| SHOULD     | Use short tab labels to avoid truncation.               |
| SHOULD NOT | Rely on a header or action strip in embedded templates. |

## Resources

|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Type          | Link                                                                                                                                                                                                         |
| API reference | ` `[TabTemplate](https://developer.android.com/reference/androidx/car/app/model/TabTemplate)`, `[TabTemplate.Builder](https://developer.android.com/reference/androidx/car/app/model/TabTemplate.Builder)` ` |
