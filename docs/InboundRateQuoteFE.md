# Flexport::InboundRateQuoteFE

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **shipping_option** | [**NetworkInboundShippingOption**](NetworkInboundShippingOption.md) |  |  |
| **rate_shopping_method** | [**InboundRateShoppingMethod**](InboundRateShoppingMethod.md) |  |  |
| **amount** | **Float** |  |  |
| **full_amount** | **Float** |  | [optional] |
| **currency** | **String** |  |  |
| **shipping_provider** | **String** |  |  |
| **provider_method** | **String** |  |  |
| **external_estimate_days** | **Float** |  |  |
| **external_eta** | **Time** |  |  |
| **id** | **Float** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::InboundRateQuoteFE.new(
  shipping_option: null,
  rate_shopping_method: null,
  amount: null,
  full_amount: null,
  currency: null,
  shipping_provider: null,
  provider_method: null,
  external_estimate_days: null,
  external_eta: null,
  id: null
)
```

