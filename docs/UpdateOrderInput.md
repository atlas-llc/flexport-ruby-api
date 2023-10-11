# Flexport::UpdateOrderInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address** | [**MaybeAddressInput**](MaybeAddressInput.md) |  | [optional] |
| **line_items** | [**Array&lt;OrderLineItemInput&gt;**](OrderLineItemInput.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::UpdateOrderInput.new(
  address: null,
  line_items: null
)
```

