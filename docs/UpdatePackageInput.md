# Flexport::UpdatePackageInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **length** | **Float** | Length of the package. | [optional] |
| **width** | **Float** | Width of the package. | [optional] |
| **height** | **Float** | Height of the package. | [optional] |
| **weight** | **Float** | Weight of the package. | [optional] |
| **dimension_unit** | [**LengthUnit**](LengthUnit.md) | Which length measurement standards are being used for the package. | [optional] |
| **weight_unit** | [**WeightUnit**](WeightUnit.md) | Which weight measurement standards are being used for the package. | [optional] |
| **ids** | **Array&lt;String&gt;** |  |  |
| **shipping_provider** | **String** |  | [optional] |
| **tracking_number** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::UpdatePackageInput.new(
  length: 12,
  width: 3,
  height: 5,
  weight: 3,
  dimension_unit: in,
  weight_unit: lb,
  ids: null,
  shipping_provider: null,
  tracking_number: null
)
```

