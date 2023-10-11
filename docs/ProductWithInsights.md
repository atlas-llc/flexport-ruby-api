# Flexport::ProductWithInsights

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  |  |
| **merchant_sku** | **String** |  |  |
| **logistics_sku** | **String** |  |  |
| **barcodes** | **Object** |  |  |
| **dimensions** | [**Dimension**](Dimension.md) |  |  |
| **inventory** | [**Inventory**](Inventory.md) |  |  |
| **shipping_specification** | [**PickShippingSpecificationExcludeKeyofShippingSpecificationDskuOrSourceUser**](PickShippingSpecificationExcludeKeyofShippingSpecificationDskuOrSourceUser.md) | Construct a type with the properties of T except for those in type K. | [optional] |
| **category** | [**ProductCategoryEntry**](ProductCategoryEntry.md) |  | [optional] |
| **insights** | [**ProductWithInsightsInsights**](ProductWithInsightsInsights.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ProductWithInsights.new(
  name: null,
  merchant_sku: null,
  logistics_sku: null,
  barcodes: null,
  dimensions: null,
  inventory: null,
  shipping_specification: null,
  category: null,
  insights: null
)
```

