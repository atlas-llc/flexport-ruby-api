# Flexport::BulkParcelJobParcel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **integration_channel_parcel_id** | **String** |  |  |
| **tracking_number** | **String** |  |  |
| **carrier_code** | **String** |  |  |
| **ship_date** | **Time** |  |  |
| **parcel_status** | **String** |  |  |
| **error_messages** | **String** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::BulkParcelJobParcel.new(
  integration_channel_parcel_id: null,
  tracking_number: null,
  carrier_code: null,
  ship_date: null,
  parcel_status: null,
  error_messages: null
)
```

