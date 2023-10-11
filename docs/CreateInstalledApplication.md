# Flexport::CreateInstalledApplication

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **scopes** | **Object** | List of scopes authorized for the application separated by space |  |
| **display_name** | **Object** | A free text name for the application installed | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateInstalledApplication.new(
  scopes: null,
  display_name: null
)
```

