# Flexport::PackageDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pallet_count** | **Float** |  |  |
| **length** | **Float** |  |  |
| **width** | **Float** |  |  |
| **height** | **Float** |  |  |
| **weight** | **Float** |  |  |
| **stackable** | **Boolean** |  | [optional] |
| **freight_class** | **Object** |  | [optional] |
| **nmfc_code** | **String** |  | [optional] |
| **sub_nmfc_code** | **String** |  | [optional] |
| **dimension_unit** | [**PackageDetailsDimensionUnitEnum**](PackageDetailsDimensionUnitEnum.md) |  | [optional] |
| **weight_unit** | [**PackageDetailsWeightUnitEnum**](PackageDetailsWeightUnitEnum.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::PackageDetails.new(
  pallet_count: null,
  length: null,
  width: null,
  height: null,
  weight: null,
  stackable: null,
  freight_class: null,
  nmfc_code: null,
  sub_nmfc_code: null,
  dimension_unit: null,
  weight_unit: null
)
```

