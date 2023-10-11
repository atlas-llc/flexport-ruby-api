# Flexport::EventWebhookResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_account_id** | **Object** | Logistics account ID |  |
| **logistics_event_id** | **Object** | Logistics event ID |  |
| **logistics_event_type** | **Object** | Event type |  |
| **logistics_event_time** | **Object** | Time when the event occurred |  |

## Example

```ruby
require 'flexport'

instance = Flexport::EventWebhookResponse.new(
  logistics_account_id: null,
  logistics_event_id: null,
  logistics_event_type: null,
  logistics_event_time: null
)
```

