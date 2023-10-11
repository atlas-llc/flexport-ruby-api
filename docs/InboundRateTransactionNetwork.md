# Flexport::InboundRateTransactionNetwork

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **quote_id** | **Float** |  |  |
| **shipping_option** | [**NetworkInboundShippingOption**](NetworkInboundShippingOption.md) |  |  |
| **rate_shopping_method** | [**InboundRateShoppingMethod**](InboundRateShoppingMethod.md) |  |  |
| **amount** | **Float** |  |  |
| **currency** | **String** |  |  |
| **shipping_provider** | **String** |  |  |
| **provider_method** | **String** |  |  |
| **external_estimate_days** | **Float** |  |  |
| **external_eta** | **Time** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::InboundRateTransactionNetwork.new(
  quote_id: null,
  shipping_option: null,
  rate_shopping_method: null,
  amount: null,
  currency: null,
  shipping_provider: null,
  provider_method: null,
  external_estimate_days: null,
  external_eta: null
)
```

