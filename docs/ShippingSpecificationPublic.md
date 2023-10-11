# Flexport::ShippingSpecificationPublic

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_sku** | **String** |  |  |
| **minimum_packaging_type** | [**PackagingType**](PackagingType.md) |  |  |
| **source** | [**ShippingSpecificationSourceType**](ShippingSpecificationSourceType.md) |  | [optional] |
| **source_user** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ShippingSpecificationPublic.new(
  logistics_sku: null,
  minimum_packaging_type: null,
  source: null,
  source_user: null
)
```

