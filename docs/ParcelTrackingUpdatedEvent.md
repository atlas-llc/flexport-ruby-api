# Flexport::ParcelTrackingUpdatedEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_account_id** | **Object** | Logistics account ID |  |
| **logistics_event_id** | **Object** | Logistics event ID |  |
| **logistics_event_type** | **Object** | Event type |  |
| **logistics_event_time** | **Object** | Time when the event occurred |  |
| **tracking_code** | **String** |  |  |
| **status** | **String** |  |  |
| **message** | **String** |  |  |
| **event_time** | **String** |  |  |
| **location** | [**EventLocation**](EventLocation.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ParcelTrackingUpdatedEvent.new(
  logistics_account_id: null,
  logistics_event_id: null,
  logistics_event_type: null,
  logistics_event_time: null,
  tracking_code: null,
  status: null,
  message: null,
  event_time: null,
  location: null
)
```

