# Flexport::ReturnsApiShippingLabel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **carrier** | [**ReturnsPublicApiCarriers**](ReturnsPublicApiCarriers.md) | Carrier delivering the package. |  |
| **tracking_code** | **Object** | Carrier tracking code. |  |
| **tracking_url** | **Object** | Tracking url for shipping label. | [optional] |
| **tracking_status** | [**TrackingStatus**](TrackingStatus.md) | Tracking status for shipping label. | [optional] |
| **label_format** | **Object** | Carrier label format. | [optional] |
| **label_url** | **Object** | Carrier label download url label format is required when passing label url. | [optional] |
| **shipping_method** | [**ReturnsPublicApiShippingMethod**](ReturnsPublicApiShippingMethod.md) | Carrier shipping service selected for the shipment. | [optional] |
| **package_dimensions** | [**PackageDimensions**](PackageDimensions.md) | Shipping package dimensions. | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ReturnsApiShippingLabel.new(
  carrier: null,
  tracking_code: null,
  tracking_url: null,
  tracking_status: null,
  label_format: null,
  label_url: null,
  shipping_method: null,
  package_dimensions: null
)
```

