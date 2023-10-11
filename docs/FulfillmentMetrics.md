# Flexport::FulfillmentMetrics

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **otd** | [**OTD**](OTD.md) |  |  |
| **ots** | [**OTS**](OTS.md) |  |  |
| **timezone** | **String** |  |  |
| **version** | **Object** |  |  |
| **on_time_delivery** | [**OnTimeDelivery**](OnTimeDelivery.md) |  |  |
| **on_time_shipping** | [**OnTimeShipping**](OnTimeShipping.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::FulfillmentMetrics.new(
  otd: null,
  ots: null,
  timezone: null,
  version: null,
  on_time_delivery: null,
  on_time_shipping: null
)
```

