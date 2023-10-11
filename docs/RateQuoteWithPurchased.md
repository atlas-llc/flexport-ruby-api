# Flexport::RateQuoteWithPurchased

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Float** |  |  |
| **rate_shopping_method** | [**InboundRateShoppingMethod**](InboundRateShoppingMethod.md) |  |  |
| **amount** | **Float** |  |  |
| **full_amount** | **Float** |  | [optional] |
| **currency** | **String** |  |  |
| **shipping_provider** | **String** |  |  |
| **provider_method** | **String** |  |  |
| **purchased** | **Boolean** |  |  |
| **estimated_time_of_arrival** | **Time** |  |  |
| **shipping_option** | [**InboundShippingOption**](InboundShippingOption.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::RateQuoteWithPurchased.new(
  id: null,
  rate_shopping_method: null,
  amount: null,
  full_amount: null,
  currency: null,
  shipping_provider: null,
  provider_method: null,
  purchased: null,
  estimated_time_of_arrival: null,
  shipping_option: null
)
```

