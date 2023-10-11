# Flexport::QuoteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_weight** | **Float** |  | [optional] |
| **weight_unit** | [**FtlQuoteRequestV2WeightUnitEnum**](FtlQuoteRequestV2WeightUnitEnum.md) |  | [optional] |
| **pallet_count** | **Float** |  |  |
| **pickup_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |
| **delivery_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::QuoteRequest.new(
  total_weight: null,
  weight_unit: null,
  pallet_count: null,
  pickup_details: null,
  delivery_details: null
)
```

