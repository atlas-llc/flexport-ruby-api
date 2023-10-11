# Flexport::ReturnReceivedEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_account_id** | **Object** | Logistics account ID |  |
| **logistics_event_id** | **Object** | Logistics event ID |  |
| **logistics_event_type** | **Object** | Event type |  |
| **logistics_event_time** | **Object** | Time when the event occurred |  |
| **type** | **String** |  |  |
| **amount** | **Integer** |  |  |
| **logistics_sku** | **String** | The globally unique product identifier created by Deliverr and assigned on product creation. May be referred to in other documentation as the Deliverr SKU or DSKU. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ReturnReceivedEvent.new(
  logistics_account_id: null,
  logistics_event_id: null,
  logistics_event_type: null,
  logistics_event_time: null,
  type: null,
  amount: null,
  logistics_sku: null
)
```

