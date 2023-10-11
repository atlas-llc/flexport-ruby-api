# Flexport::TradingPartnerDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **required_trading_partner_general_bol_fields** | [**Array&lt;TradingPartnerGeneralBolFieldRequiredTradingPartnerGeneralBolInfo&gt;**](TradingPartnerGeneralBolFieldRequiredTradingPartnerGeneralBolInfo.md) |  |  |
| **required_general_ltl_gs1_bol_fields** | [**Array&lt;TradingPartnerGeneralBolFieldRequiredGeneralLtlGs1BolInfo&gt;**](TradingPartnerGeneralBolFieldRequiredGeneralLtlGs1BolInfo.md) |  |  |
| **required_general_gs1_bol_fields** | [**Array&lt;TradingPartnerGeneralBolFieldRequiredGeneralGs1BolInfo&gt;**](TradingPartnerGeneralBolFieldRequiredGeneralGs1BolInfo.md) |  |  |
| **trading_partner** | [**SupportedTradingPartner**](SupportedTradingPartner.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::TradingPartnerDetails.new(
  required_trading_partner_general_bol_fields: null,
  required_general_ltl_gs1_bol_fields: null,
  required_general_gs1_bol_fields: null,
  trading_partner: null
)
```

