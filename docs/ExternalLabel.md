# Flexport::ExternalLabel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tracking_code** | **String** | The tracking code of the label. |  |
| **carrier** | **String** | The name of the carrier providing the label. |  |
| **tracking_url** | **String** | The tracking URL, if available. | [optional] |
| **label_url** | **String** | The URL of the label, if available. | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ExternalLabel.new(
  tracking_code: null,
  carrier: null,
  tracking_url: null,
  label_url: null
)
```

