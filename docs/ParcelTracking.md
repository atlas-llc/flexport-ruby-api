# Flexport::ParcelTracking

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **carrier_code** | **String** |  | [optional] |
| **customer_custom_field** | **String** |  | [optional] |
| **customer_reference_id** | **String** |  | [optional] |
| **error_message** | **String** |  | [optional] |
| **errors** | **String** |  | [optional] |
| **event_timestamps** | [**MaybeTrackingResultTimestamps**](MaybeTrackingResultTimestamps.md) |  | [optional] |
| **expired_tracking_data** | [**Array&lt;MaybeExpiredTrackingData&gt;**](MaybeExpiredTrackingData.md) |  | [optional] |
| **package_tracking_url** | **String** |  | [optional] |
| **parcel_id** | **String** |  | [optional] |
| **shipping_label_url** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **tracking_code** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ParcelTracking.new(
  carrier_code: null,
  customer_custom_field: null,
  customer_reference_id: null,
  error_message: null,
  errors: null,
  event_timestamps: null,
  expired_tracking_data: null,
  package_tracking_url: null,
  parcel_id: null,
  shipping_label_url: null,
  status: null,
  tracking_code: null
)
```

