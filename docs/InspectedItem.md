# Flexport::InspectedItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **received_condition** | **String** | The condition of the item when it was received at the warehouse. |  |
| **final_condition** | **String** | The condition of the item after any rework has been completed. |  |
| **disposition** | **String** | The disposition applied to the item. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::InspectedItem.new(
  received_condition: null,
  final_condition: null,
  disposition: null
)
```

