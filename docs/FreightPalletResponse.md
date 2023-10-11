# Flexport::FreightPalletResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Float** |  |  |
| **pallet_config_id** | **String** |  | [optional] |
| **length** | **Float** |  |  |
| **width** | **Float** |  |  |
| **height** | **Float** |  |  |
| **dimension_unit** | **String** |  |  |
| **weight** | **Float** |  |  |
| **weight_unit** | **String** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::FreightPalletResponse.new(
  id: null,
  pallet_config_id: null,
  length: null,
  width: null,
  height: null,
  dimension_unit: null,
  weight: null,
  weight_unit: null
)
```

