# Flexport::OrderLineItemInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customs_unit_value** | [**MaybeMoneyInput**](MaybeMoneyInput.md) |  | [optional] |
| **logistics_sku** | **String** | Unique line item identifier. |  |
| **quantity** | **Float** | The quantity of the product to ship for this order. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::OrderLineItemInput.new(
  customs_unit_value: null,
  logistics_sku: null,
  quantity: null
)
```

