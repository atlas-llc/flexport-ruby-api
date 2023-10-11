# Flexport::MaybeTrackingResultTimestamps

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **arrival_scan_time** | **Time** |  | [optional] |
| **attempted_delivery_time** | **Time** |  | [optional] |
| **delivery_time** | **Time** |  | [optional] |
| **estimated_delivery_time** | **Time** |  | [optional] |
| **facility_time** | **Time** |  | [optional] |
| **label_time** | **Time** |  | [optional] |
| **last_tracking_event_time** | **Time** |  | [optional] |
| **last_tracking_ingestion_time** | **Time** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::MaybeTrackingResultTimestamps.new(
  arrival_scan_time: null,
  attempted_delivery_time: null,
  delivery_time: null,
  estimated_delivery_time: null,
  facility_time: null,
  label_time: null,
  last_tracking_event_time: null,
  last_tracking_ingestion_time: null
)
```

