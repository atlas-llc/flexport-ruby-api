# Flexport::OrderPickupDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cargo_ready_date** | **Time** |  |  |
| **address** | [**FreightAddress**](FreightAddress.md) |  |  |
| **contact** | [**Contact**](Contact.md) |  |  |
| **notes** | **String** |  | [optional] |
| **lift_gate_required** | **Boolean** |  | [optional] |
| **location_type** | [**LocationType**](LocationType.md) |  | [optional] |
| **pickup_reference_number** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::OrderPickupDetails.new(
  cargo_ready_date: null,
  address: null,
  contact: null,
  notes: null,
  lift_gate_required: null,
  location_type: null,
  pickup_reference_number: null
)
```

