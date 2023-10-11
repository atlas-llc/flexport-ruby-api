# Flexport::FulfillmentPackageItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **expiration_date** | **Time** |  | [optional] |
| **logistics_sku** | **String** |  |  |
| **lot_number** | **String** |  | [optional] |
| **quantity** | **Float** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::FulfillmentPackageItem.new(
  expiration_date: null,
  logistics_sku: null,
  lot_number: null,
  quantity: null
)
```

