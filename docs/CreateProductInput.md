# Flexport::CreateProductInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  |  |
| **merchant_sku** | **String** |  |  |
| **price** | **Float** |  | [optional] |
| **image_url** | **String** |  | [optional] |
| **customs_information** | [**CustomsInput**](CustomsInput.md) |  | [optional] |
| **dimensions** | [**Dimension**](Dimension.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateProductInput.new(
  name: null,
  merchant_sku: null,
  price: null,
  image_url: null,
  customs_information: null,
  dimensions: null
)
```

