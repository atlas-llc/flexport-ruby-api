# Flexport::FtlQuoteItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_weight** | **Float** |  | [optional] |
| **weight_unit** | [**FtlQuoteItemResponseWeightUnitEnum**](FtlQuoteItemResponseWeightUnitEnum.md) |  | [optional] |
| **pallet_count** | **Float** |  |  |
| **transit_days** | **Float** |  |  |
| **total_cost** | **Float** |  |  |
| **original_cost** | **Float** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::FtlQuoteItem.new(
  total_weight: null,
  weight_unit: null,
  pallet_count: null,
  transit_days: null,
  total_cost: null,
  original_cost: null
)
```

