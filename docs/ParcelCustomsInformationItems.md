# Flexport::ParcelCustomsInformationItems

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** |  |  |
| **description** | **String** |  |  |
| **quantity** | **Float** |  |  |
| **weight** | **Float** |  |  |
| **weight_unit** | [**WeightUnit**](WeightUnit.md) |  |  |
| **value** | **Float** |  |  |
| **hs_tariff_code** | **String** |  |  |
| **origin_country** | [**CountryCode**](CountryCode.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ParcelCustomsInformationItems.new(
  code: null,
  description: null,
  quantity: null,
  weight: null,
  weight_unit: null,
  value: null,
  hs_tariff_code: null,
  origin_country: null
)
```

