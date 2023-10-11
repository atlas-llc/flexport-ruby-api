# Flexport::CreateProductModel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The product name or short description. Should represent a single line of text suitable to identify the product or for search purposes. |  |
| **merchant_sku** | **String** | The human-readable Stock Keeping Unit (SKU) for reporting. This value may change over time. |  |
| **customs_information** | [**CustomsInput**](CustomsInput.md) | Customs description - should reflect usage and materials. Needed only for international shipping. | [optional] |
| **dimensions** | [**Dimension**](Dimension.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateProductModel.new(
  name: null,
  merchant_sku: null,
  customs_information: null,
  dimensions: null
)
```

