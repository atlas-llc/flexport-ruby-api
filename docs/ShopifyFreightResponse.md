# Flexport::ShopifyFreightResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pickup** | [**FreightPickupResponse**](FreightPickupResponse.md) |  | [optional] |
| **pallets** | [**Array&lt;FreightPalletResponse&gt;**](FreightPalletResponse.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ShopifyFreightResponse.new(
  pickup: null,
  pallets: null
)
```

