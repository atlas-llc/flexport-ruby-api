# Flexport::DeliveryScheduleEntry

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **country_code** | **String** |  |  |
| **subdivision_code** | **String** |  |  |
| **postal_code** | **String** |  |  |
| **min_delivery_date** | **Object** |  |  |
| **max_delivery_date** | **Object** |  |  |
| **expiration_date** | **Object** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::DeliveryScheduleEntry.new(
  country_code: null,
  subdivision_code: null,
  postal_code: null,
  min_delivery_date: null,
  max_delivery_date: null,
  expiration_date: null
)
```

