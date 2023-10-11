# Flexport::PackageDimensions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **length** | **Object** | Length of the package. | [optional] |
| **width** | **Object** | Width of the package. | [optional] |
| **height** | **Object** | Height of the package. | [optional] |
| **weight** | **Object** | Weight of the package. | [optional] |
| **dimension_unit** | [**LengthUnit**](LengthUnit.md) | Which length measurement standards are being used for the package. | [optional] |
| **weight_unit** | [**WeightUnit**](WeightUnit.md) | Which weight measurement standards are being used for the package. | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::PackageDimensions.new(
  length: 12,
  width: 3,
  height: 5,
  weight: 3,
  dimension_unit: in,
  weight_unit: lb
)
```

