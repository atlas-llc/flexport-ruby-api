# Flexport::LtlOrderRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **delivery_details** | [**OrderDeliveryDetails**](OrderDeliveryDetails.md) |  |  |
| **quote_id** | **Float** |  |  |
| **commodity_description** | **String** |  | [optional] |
| **customer_reference_number** | **String** |  | [optional] |
| **pallets** | [**Array&lt;PackageDetails&gt;**](PackageDetails.md) |  |  |
| **pickup_details** | [**OrderPickupDetails**](OrderPickupDetails.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::LtlOrderRequest.new(
  delivery_details: null,
  quote_id: null,
  commodity_description: null,
  customer_reference_number: null,
  pallets: null,
  pickup_details: null
)
```

