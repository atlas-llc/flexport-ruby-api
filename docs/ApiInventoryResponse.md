# Flexport::ApiInventoryResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_sku** | **String** | The globally unique product identifier created by Deliverr and assigned on product creation. May be referred to in other documentation as the Deliverr SKU or DSKU. | [optional] |
| **on_hand** | **Integer** | The calculation of on-hand quantity, non-Pickable quantity, and in-transfer quantity, belonging to products whose dimsLocked field is true, that are in a pickable and shippable state at connected warehouses. |  |
| **available** | **Integer** | The number of units available for sale - not reserved for open orders, belonging to products whose dimsLocked field is true, that are in a pickable and shippable state at connected warehouses. |  |
| **unavailable** | **Integer** | The number of units not available for sale - not reserved for open orders, belonging to products whose dimsLocked field is true, that are in a pickable and shippable state at connected warehouses. |  |
| **units_per_pack** | **Float** |  | [optional] |
| **lot_tracking_details** | [**Array&lt;LotTrackingDetails&gt;**](LotTrackingDetails.md) |  | [optional] |
| **breakdown** | [**Array&lt;PackInventory&gt;**](PackInventory.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ApiInventoryResponse.new(
  logistics_sku: null,
  on_hand: null,
  available: null,
  unavailable: null,
  units_per_pack: null,
  lot_tracking_details: null,
  breakdown: null
)
```

