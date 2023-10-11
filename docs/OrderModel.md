# Flexport::OrderModel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address** | [**Address**](Address.md) |  |  |
| **cost** | **Float** |  | [optional] |
| **id** | **String** | A globally-unique identifier. |  |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **error** | [**MaybeOrderError**](MaybeOrderError.md) |  | [optional] |
| **delivered_at** | **Time** |  | [optional] |
| **external_order_id** | **String** |  | [optional] |
| **line_items** | [**Array&lt;OrderLineItem&gt;**](OrderLineItem.md) |  |  |
| **promised_delivery_by_time** | **Time** |  | [optional] |
| **promised_ship_by_time** | **Time** |  | [optional] |
| **shipped_at** | **Time** |  | [optional] |
| **source** | [**MaybeSourceId**](MaybeSourceId.md) | The name of the system originating the order such as SHOPIFY, AMAZON, WEBSITE, WALMART or similar. This is a vital field if the source marketplace restricts which carriers are allowed to be used. | [optional] |
| **state** | [**OrderState**](OrderState.md) |  |  |
| **shipments** | [**Array&lt;PickFulfillmentShipmentExcludeKeyofFulfillmentShipmentWarehouse&gt;**](PickFulfillmentShipmentExcludeKeyofFulfillmentShipmentWarehouse.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::OrderModel.new(
  address: null,
  cost: null,
  id: null,
  created_at: null,
  updated_at: null,
  error: null,
  delivered_at: null,
  external_order_id: null,
  line_items: null,
  promised_delivery_by_time: null,
  promised_ship_by_time: null,
  shipped_at: null,
  source: null,
  state: null,
  shipments: null
)
```

