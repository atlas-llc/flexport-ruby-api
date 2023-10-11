# Flexport::FreightTrackingEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **occurred_at** | **Time** |  |  |
| **location** | [**FreightTrackingLocation**](FreightTrackingLocation.md) |  | [optional] |
| **event_type** | [**FreightTrackingEventType**](FreightTrackingEventType.md) |  |  |
| **bol_status** | [**FreightBolStatus**](FreightBolStatus.md) |  |  |
| **address** | [**DeliverrAddress**](DeliverrAddress.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::FreightTrackingEvent.new(
  occurred_at: null,
  location: null,
  event_type: null,
  bol_status: null,
  address: null
)
```

