# Flexport::UpdateFreightInputV3

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pallets** | [**Array&lt;PalletInput&gt;**](PalletInput.md) |  | [optional] |
| **pickup** | [**PickupInputV3**](PickupInputV3.md) |  | [optional] |
| **bol_id** | **String** |  | [optional] |
| **shipping_provider** | **String** |  | [optional] |
| **pro_id** | **String** |  | [optional] |
| **estimated_ship_date** | **Time** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::UpdateFreightInputV3.new(
  pallets: null,
  pickup: null,
  bol_id: null,
  shipping_provider: null,
  pro_id: null,
  estimated_ship_date: null
)
```

