# Flexport::OrderResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **commodity_description** | **String** |  | [optional] |
| **created_at** | **Time** |  |  |
| **customer_reference_number** | **String** |  | [optional] |
| **delivery_details** | [**OrderDeliveryDetails**](OrderDeliveryDetails.md) |  |  |
| **drayage_order_item** | [**DrayageOrderItemResponse**](DrayageOrderItemResponse.md) |  |  |
| **ftl_order_item** | [**FtlOrderItemResponse**](FtlOrderItemResponse.md) |  |  |
| **id** | **Float** |  |  |
| **port_id** | **String** |  | [optional] |
| **quote_id** | **Float** |  |  |
| **status** | [**OrderStatus**](OrderStatus.md) |  |  |
| **transload_order_item** | [**TransloadOrderItemResponse**](TransloadOrderItemResponse.md) |  | [optional] |
| **type** | [**FreightModeLTL**](FreightModeLTL.md) |  |  |
| **pickup_details** | [**OrderPickupDetails**](OrderPickupDetails.md) |  |  |
| **ltl_order_item** | [**LtlOrderItemResponse**](LtlOrderItemResponse.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::OrderResponse.new(
  commodity_description: null,
  created_at: null,
  customer_reference_number: null,
  delivery_details: null,
  drayage_order_item: null,
  ftl_order_item: null,
  id: null,
  port_id: null,
  quote_id: null,
  status: null,
  transload_order_item: null,
  type: null,
  pickup_details: null,
  ltl_order_item: null
)
```

