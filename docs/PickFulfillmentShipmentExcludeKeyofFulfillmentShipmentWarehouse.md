# Flexport::PickFulfillmentShipmentExcludeKeyofFulfillmentShipmentWarehouse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **packages** | [**Array&lt;FulfillmentPackage&gt;**](FulfillmentPackage.md) |  |  |
| **id** | **String** | A globally-unique identifier. |  |
| **created_at** | **Time** |  | [optional] |
| **status** | [**ShipmentStatus**](ShipmentStatus.md) | Status of shipment |  |
| **estimated_delivery_time** | **Time** |  | [optional] |
| **line_items** | [**Array&lt;FulfillmentShipmentItem&gt;**](FulfillmentShipmentItem.md) |  |  |
| **shipped_at** | **Time** |  | [optional] |
| **estimated_ship_time** | **Time** |  | [optional] |
| **label_print_time** | **Time** |  | [optional] |
| **warehouse_id** | **String** | The id of the location (warehouse) that the shipment was processed at. |  |
| **warehouse_order_id** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::PickFulfillmentShipmentExcludeKeyofFulfillmentShipmentWarehouse.new(
  packages: null,
  id: null,
  created_at: null,
  status: null,
  estimated_delivery_time: null,
  line_items: null,
  shipped_at: null,
  estimated_ship_time: null,
  label_print_time: null,
  warehouse_id: null,
  warehouse_order_id: null
)
```

