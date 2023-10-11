# Flexport::ApiBundleInventoryResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bundle_id** | **String** | The globally unique bundle identifier created by Deliverr and assigned on bundle creation. May be referred to in other documentation as the Deliverr SKU or BSKU. |  |
| **available_units** | **Float** | The number of units available for sale - not reserved for open orders, belonging to bundles that are in a pickable and shippable state at connected warehouses. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ApiBundleInventoryResponse.new(
  bundle_id: null,
  available_units: null
)
```

