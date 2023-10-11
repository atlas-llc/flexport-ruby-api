# Flexport::DrayageQuoteResponseV2DeliveryDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **trading_partner** | [**SupportedTradingPartner**](SupportedTradingPartner.md) |  | [optional] |
| **lift_gate_required** | **Boolean** |  | [optional] |
| **location_type** | [**LocationType**](LocationType.md) |  | [optional] |
| **zip** | **String** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::DrayageQuoteResponseV2DeliveryDetails.new(
  trading_partner: null,
  lift_gate_required: null,
  location_type: null,
  zip: null
)
```

