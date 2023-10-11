# Flexport::WarehouseDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **available** | **Integer** | The number of units available for sale - not reserved for open orders, belonging to products whose dimsLocked field is true, that are in a pickable and shippable state at connected warehouses. |  |
| **warehouse_id** | **String** | The unique warehouse identifier from which the shipment was sent. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::WarehouseDetails.new(
  available: null,
  warehouse_id: null
)
```

