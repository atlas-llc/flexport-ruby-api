# Flexport::OrderDeliveryDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address** | [**FreightAddress**](FreightAddress.md) |  |  |
| **contact** | [**Contact**](Contact.md) |  |  |
| **notes** | **String** |  | [optional] |
| **lift_gate_required** | **Boolean** |  | [optional] |
| **location_type** | [**LocationType**](LocationType.md) |  | [optional] |
| **appointment_required** | **Boolean** |  | [optional] |
| **dropoff_reference_number** | **String** |  | [optional] |
| **trading_partner_details** | [**TradingPartnerDetails**](TradingPartnerDetails.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::OrderDeliveryDetails.new(
  address: null,
  contact: null,
  notes: null,
  lift_gate_required: null,
  location_type: null,
  appointment_required: null,
  dropoff_reference_number: null,
  trading_partner_details: null
)
```

