# Flexport::LtlOrderResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**FreightModeLTL**](FreightModeLTL.md) |  |  |
| **delivery_details** | [**OrderDeliveryDetails**](OrderDeliveryDetails.md) |  |  |
| **quote_id** | **Float** |  |  |
| **commodity_description** | **String** |  | [optional] |
| **customer_reference_number** | **String** |  | [optional] |
| **id** | **Float** |  |  |
| **created_at** | **Time** |  |  |
| **status** | [**OrderStatus**](OrderStatus.md) |  |  |
| **pickup_details** | [**OrderPickupDetails**](OrderPickupDetails.md) |  |  |
| **ltl_order_item** | [**LtlOrderItemResponse**](LtlOrderItemResponse.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::LtlOrderResponse.new(
  type: null,
  delivery_details: null,
  quote_id: null,
  commodity_description: null,
  customer_reference_number: null,
  id: null,
  created_at: null,
  status: null,
  pickup_details: null,
  ltl_order_item: null
)
```

