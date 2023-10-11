# Flexport::ApiProductResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The product name or short description. Should represent a single line of text suitable to identify the product or for search purposes. |  |
| **logistics_sku** | **String** | The globally unique product identifier created by Deliverr and assigned on product creation. May be referred to in other documentation as the Deliverr SKU or DSKU. |  |
| **merchant_sku** | **String** | The human-readable Stock Keeping Unit (SKU) for reporting. This value may change over time. |  |
| **barcodes** | **Array&lt;String&gt;** |  |  |
| **dimensions** | [**Dimension**](Dimension.md) |  | [optional] |
| **international** | [**CustomsInput**](CustomsInput.md) | Customs description - should reflect usage and materials. Needed only for international shipping. | [optional] |
| **dims_locked** | **Boolean** | **true** if the dimensions and weight of the item are verified and trusted. Must be true for non-zero inventory levels to be reported. If true, item dimensions and weight can no longer be updated via the API. |  |
| **created_at** | **Time** | The timestamp of creation in RFC 3339 format. e.g. 2017-07-21T17:32:28Z | [optional] |
| **updated_at** | **Time** | The timestamp when last updated in RFC 3339 format. e.g. 2017-07-21T17:32:28Z | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ApiProductResponse.new(
  name: null,
  logistics_sku: null,
  merchant_sku: null,
  barcodes: null,
  dimensions: null,
  international: null,
  dims_locked: null,
  created_at: null,
  updated_at: null
)
```

