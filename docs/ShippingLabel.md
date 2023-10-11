# Flexport::ShippingLabel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **carrier** | **String** | The name of the carrier providing the label. |  |
| **tracking_code** | **String** | The tracking code of the label. |  |
| **tracking_url** | **String** | The tracking URL, if available. | [optional] |
| **label_url** | **String** | The URL of the label, if available. | [optional] |
| **tracking_status** | [**ReturnOrderTrackingStatus**](ReturnOrderTrackingStatus.md) | The current tracking status of the return. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ShippingLabel.new(
  carrier: null,
  tracking_code: null,
  tracking_url: null,
  label_url: null,
  tracking_status: null
)
```

