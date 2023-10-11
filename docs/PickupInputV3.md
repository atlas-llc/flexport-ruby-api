# Flexport::PickupInputV3

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ready_date** | **Time** |  |  |
| **facility_hours_start** | **String** |  | [optional] |
| **facility_hours_end** | **String** |  | [optional] |
| **contact_name** | **String** |  |  |
| **contact_phone** | **String** |  |  |
| **contact_email** | **String** |  |  |
| **lift_gate** | **Boolean** |  |  |
| **customer_reference_number** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::PickupInputV3.new(
  ready_date: null,
  facility_hours_start: null,
  facility_hours_end: null,
  contact_name: null,
  contact_phone: null,
  contact_email: null,
  lift_gate: null,
  customer_reference_number: null
)
```

