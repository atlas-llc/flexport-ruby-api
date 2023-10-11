# Flexport::FreightPickupResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Float** |  |  |
| **contact_name** | **String** |  |  |
| **contact_phone** | **String** |  |  |
| **contact_email** | **String** |  |  |
| **lift_gate** | **Boolean** |  | [optional] |
| **pickup_date** | **Time** |  |  |
| **customer_reference_number** | **String** |  | [optional] |
| **facility_operating_hours** | [**TimeWindow**](TimeWindow.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::FreightPickupResponse.new(
  id: null,
  contact_name: null,
  contact_phone: null,
  contact_email: null,
  lift_gate: null,
  pickup_date: null,
  customer_reference_number: null,
  facility_operating_hours: null
)
```

