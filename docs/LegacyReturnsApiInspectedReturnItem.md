# Flexport::LegacyReturnsApiInspectedReturnItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product** | [**ReturnProductDetails**](ReturnProductDetails.md) |  |  |
| **inspection_details** | **Object** | Inspection details once the product is scan you can get more or less than expectedQuantity in this payload. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::LegacyReturnsApiInspectedReturnItem.new(
  product: null,
  inspection_details: null
)
```

