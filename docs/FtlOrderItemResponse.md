# Flexport::FtlOrderItemResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cost** | **Float** |  |  |
| **customer_bol_id** | **String** |  | [optional] |
| **total_weight** | **Float** |  |  |
| **weight_unit** | [**FtlOrderItemResponseWeightUnitEnum**](FtlOrderItemResponseWeightUnitEnum.md) |  |  |
| **pallet_count** | **Float** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::FtlOrderItemResponse.new(
  cost: null,
  customer_bol_id: null,
  total_weight: null,
  weight_unit: null,
  pallet_count: null
)
```

