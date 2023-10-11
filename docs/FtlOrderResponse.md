# Flexport::FtlOrderResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**FreightModeFTL**](FreightModeFTL.md) |  |  |
| **delivery_details** | [**OrderDeliveryDetails**](OrderDeliveryDetails.md) |  |  |
| **quote_id** | **Float** |  |  |
| **commodity_description** | **String** |  | [optional] |
| **customer_reference_number** | **String** |  | [optional] |
| **id** | **Float** |  |  |
| **created_at** | **Time** |  |  |
| **status** | [**OrderStatus**](OrderStatus.md) |  |  |
| **pickup_details** | [**OrderPickupDetails**](OrderPickupDetails.md) |  |  |
| **ftl_order_item** | [**FtlOrderItemResponse**](FtlOrderItemResponse.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::FtlOrderResponse.new(
  type: null,
  delivery_details: null,
  quote_id: null,
  commodity_description: null,
  customer_reference_number: null,
  id: null,
  created_at: null,
  status: null,
  pickup_details: null,
  ftl_order_item: null
)
```

