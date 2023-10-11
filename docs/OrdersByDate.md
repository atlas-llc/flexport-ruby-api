# Flexport::OrdersByDate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Object** |  |  |
| **order_count** | **Float** |  |  |
| **one_to_three_day_orders** | **Float** |  |  |
| **four_plus_day_orders** | **Float** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::OrdersByDate.new(
  date: null,
  order_count: null,
  one_to_three_day_orders: null,
  four_plus_day_orders: null
)
```

