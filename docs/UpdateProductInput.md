# Flexport::UpdateProductInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **merchant_sku** | **String** |  | [optional] |
| **price** | **Float** |  | [optional] |
| **image_url** | **String** |  | [optional] |
| **customs_information** | [**CustomsInput**](CustomsInput.md) |  | [optional] |
| **taxonomy_node_id** | **Float** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::UpdateProductInput.new(
  name: null,
  merchant_sku: null,
  price: null,
  image_url: null,
  customs_information: null,
  taxonomy_node_id: null
)
```

