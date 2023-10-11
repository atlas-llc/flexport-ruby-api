# Flexport::BundleContent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **product_id** | **String** | The globally unique product identifier created by Deliverr and assigned on product creation. May be referred to in other documentation as the Deliverr SKU or DSKU. |  |
| **quantity** | **Float** | Provide the quantity of that product that will be part of the bundle being created. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::BundleContent.new(
  product_id: null,
  quantity: null
)
```

