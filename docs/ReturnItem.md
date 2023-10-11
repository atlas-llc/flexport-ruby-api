# Flexport::ReturnItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **identifier** | **String** | The identifier provided when creating the return item. |  |
| **expected_quantity** | **Float** | The quantity provided when creating the return item. |  |
| **inspected_items** | [**Array&lt;InspectedItem&gt;**](InspectedItem.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ReturnItem.new(
  identifier: null,
  expected_quantity: null,
  inspected_items: null
)
```

