# Flexport::ParcelQuoteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **price** | **Float** |  |  |
| **service_level** | **String** |  |  |
| **billed_weight_lbs** | **Float** |  |  |
| **dimensions** | [**ParcelDimensions**](ParcelDimensions.md) |  |  |
| **warnings** | **Array&lt;String&gt;** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ParcelQuoteResponse.new(
  price: null,
  service_level: null,
  billed_weight_lbs: null,
  dimensions: null,
  warnings: null
)
```

