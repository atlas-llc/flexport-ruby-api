# Flexport::InventoryAdjustedEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_account_id** | **Object** | Logistics account ID |  |
| **logistics_event_id** | **Object** | Logistics event ID |  |
| **logistics_event_type** | **Object** | Event type |  |
| **logistics_event_time** | **Object** | Time when the event occurred |  |
| **adjustment_id** | **String** |  |  |
| **reason** | **Object** | | Reason      | Description | |-------------|-------------| | ADJUSTMENT  | These are reflecting adjustments done in warehouse by associates. For example, when they relocate items from place to place etc | | ASN_RECEIVE | Any receive in the destination warehouse, either direct or via crossdock | | DAMAGE      | Damage related negative adjustments | | RETURN      | Positive adjustments for returns | | TRANSFER    | Currently only includes FC to FC and direct RS to FC, not via Hubs or CD | | QUARANTINE  | Product or lot quarantine | | RELOCATE    | Relocated within a warehouse | | COUNT       | This is when associates count inventory in a bin; can reflect inventory lost, found or relocated | | SHIPPED     | Negative adjustment based on order shipment | |  |
| **adjustments** | **Object** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::InventoryAdjustedEvent.new(
  logistics_account_id: null,
  logistics_event_id: null,
  logistics_event_type: null,
  logistics_event_time: null,
  adjustment_id: null,
  reason: null,
  adjustments: null
)
```

