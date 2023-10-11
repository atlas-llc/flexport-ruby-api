# Flexport::PackageLabel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **carrier** | **String** |  |  |
| **created_at** | **Time** |  | [optional] |
| **id** | **String** |  |  |
| **label_format** | [**MaybeLabelFormat**](MaybeLabelFormat.md) |  | [optional] |
| **label_url** | **String** |  | [optional] |
| **package_dimensions** | [**Dimensions**](Dimensions.md) |  |  |
| **shipping_method** | **String** |  | [optional] |
| **tracking_code** | **String** |  |  |
| **tracking_url** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::PackageLabel.new(
  carrier: null,
  created_at: null,
  id: null,
  label_format: null,
  label_url: null,
  package_dimensions: null,
  shipping_method: null,
  tracking_code: null,
  tracking_url: null
)
```

