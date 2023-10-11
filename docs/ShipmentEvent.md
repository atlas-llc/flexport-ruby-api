# Flexport::ShipmentEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_account_id** | **Object** | Logistics account ID |  |
| **logistics_event_id** | **Object** | Logistics event ID |  |
| **logistics_event_type** | **Object** | Event type |  |
| **logistics_event_time** | **Object** | Time when the event occurred |  |
| **id** | **String** |  |  |
| **order_id** | **String** | A unique identifier for this order. |  |
| **external_order_id** | **String** | A unique order reference meaningful to the external system submitting the order. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ShipmentEvent.new(
  logistics_account_id: null,
  logistics_event_id: null,
  logistics_event_type: null,
  logistics_event_time: null,
  id: null,
  order_id: null,
  external_order_id: null
)
```

