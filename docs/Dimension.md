# Flexport::Dimension

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **weight** | **Float** | Weight of the product by itself. |  |
| **weight_unit** | [**WeightUnit**](WeightUnit.md) |  |  |
| **height** | **Float** | Height of the product by itself. |  |
| **width** | **Float** | Width of the product by itself. |  |
| **length** | **Float** | Length of the product by itself. |  |
| **length_unit** | [**LengthUnit**](LengthUnit.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::Dimension.new(
  weight: null,
  weight_unit: null,
  height: null,
  width: null,
  length: null,
  length_unit: null
)
```

