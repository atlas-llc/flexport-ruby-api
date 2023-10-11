# Flexport::MaybeExpiredTrackingData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **label_id** | **String** |  | [optional] |
| **package_tracking_url** | **String** |  | [optional] |
| **shipping_label_url** | **String** |  | [optional] |
| **shipping_method** | **String** |  | [optional] |
| **tracking_code** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::MaybeExpiredTrackingData.new(
  label_id: null,
  package_tracking_url: null,
  shipping_label_url: null,
  shipping_method: null,
  tracking_code: null
)
```

