# Flexport::FtlOrderRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_weight** | **Float** |  |  |
| **weight_unit** | [**FtlOrderRequestWeightUnitEnum**](FtlOrderRequestWeightUnitEnum.md) |  | [optional] |
| **pallet_count** | **Float** |  |  |
| **delivery_details** | [**OrderDeliveryDetails**](OrderDeliveryDetails.md) |  |  |
| **quote_id** | **Float** |  |  |
| **commodity_description** | **String** |  | [optional] |
| **customer_reference_number** | **String** |  | [optional] |
| **pickup_details** | [**OrderPickupDetails**](OrderPickupDetails.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::FtlOrderRequest.new(
  total_weight: null,
  weight_unit: null,
  pallet_count: null,
  delivery_details: null,
  quote_id: null,
  commodity_description: null,
  customer_reference_number: null,
  pickup_details: null
)
```

