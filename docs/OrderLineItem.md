# Flexport::OrderLineItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customs_unit_value** | [**MaybeMoney**](MaybeMoney.md) |  | [optional] |
| **logistics_sku** | **String** |  |  |
| **quantity** | **Float** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::OrderLineItem.new(
  customs_unit_value: null,
  logistics_sku: null,
  quantity: null
)
```

