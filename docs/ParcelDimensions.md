# Flexport::ParcelDimensions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **height** | **Float** |  |  |
| **length** | **Float** |  |  |
| **length_unit** | [**LengthUnit**](LengthUnit.md) |  |  |
| **weight** | **Float** |  |  |
| **weight_unit** | [**WeightUnit**](WeightUnit.md) |  |  |
| **width** | **Float** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ParcelDimensions.new(
  height: 5,
  length: 2,
  length_unit: in,
  weight: 1,
  weight_unit: lb,
  width: 8
)
```

