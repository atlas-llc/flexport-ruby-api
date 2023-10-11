# Flexport::FulfillmentMetricsV3

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **on_time_delivery** | [**OnTimeDelivery**](OnTimeDelivery.md) |  |  |
| **on_time_shipping** | [**OnTimeShipping**](OnTimeShipping.md) |  |  |
| **version** | **Object** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::FulfillmentMetricsV3.new(
  on_time_delivery: null,
  on_time_shipping: null,
  version: null
)
```

