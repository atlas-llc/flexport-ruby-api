# Flexport::Adjustment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_sku** | **String** | The globally unique product identifier created by Deliverr and assigned on product creation. May be referred to in other documentation as the Deliverr SKU or DSKU. |  |
| **changes** | **Object** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::Adjustment.new(
  logistics_sku: null,
  changes: null
)
```

