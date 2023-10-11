# Flexport::PalletInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **length** | **Float** |  |  |
| **width** | **Float** |  |  |
| **height** | **Float** |  |  |
| **dimension_unit** | **String** |  |  |
| **weight** | **Float** |  |  |
| **weight_unit** | **String** |  |  |
| **number_of_identical_pallets** | **Integer** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::PalletInput.new(
  length: null,
  width: null,
  height: null,
  dimension_unit: null,
  weight: null,
  weight_unit: null,
  number_of_identical_pallets: null
)
```

