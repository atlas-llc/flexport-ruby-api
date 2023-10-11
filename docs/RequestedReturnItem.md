# Flexport::RequestedReturnItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **identifier** | **String** | The unique identifier for the item that must already be known to the system.  Ideally this is the LOGISTICS_SKU but we also support the merchant SKU if it has been associated with the product via the Products API.  Returns containing items that are not known to the system will be rejected. |  |
| **type** | [**ReturnItemType**](ReturnItemType.md) | The type of identifier provided.  Must be one of LOGISTICS_SKU, SKU. |  |
| **quantity** | **Float** | The number of items with the given identifier in the return. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::RequestedReturnItem.new(
  identifier: null,
  type: null,
  quantity: null
)
```

