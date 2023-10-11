# Flexport::UpdateInboundShipmentRequestV3

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | [**InboundAddress**](InboundAddress.md) |  | [optional] |
| **shipping_option** | [**InboundShippingOption**](InboundShippingOption.md) |  | [optional] |
| **packages** | [**Array&lt;UpdatePackageInput&gt;**](UpdatePackageInput.md) |  | [optional] |
| **freight_details** | [**UpdateFreightInputV3**](UpdateFreightInputV3.md) |  | [optional] |
| **package_tracking_number** | **String** |  | [optional] |
| **prep** | [**PrepRequestData**](PrepRequestData.md) |  | [optional] |
| **create_packages** | [**Array&lt;PackageInputUnstable&gt;**](PackageInputUnstable.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::UpdateInboundShipmentRequestV3.new(
  from: null,
  shipping_option: null,
  packages: null,
  freight_details: null,
  package_tracking_number: null,
  prep: null,
  create_packages: null
)
```

