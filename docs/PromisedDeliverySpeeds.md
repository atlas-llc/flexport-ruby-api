# Flexport::PromisedDeliverySpeeds

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **one_day** | [**PromisedDeliverySpeedsDelta**](PromisedDeliverySpeedsDelta.md) |  |  |
| **two_day** | [**PromisedDeliverySpeedsDelta**](PromisedDeliverySpeedsDelta.md) |  |  |
| **three_day** | [**PromisedDeliverySpeedsDelta**](PromisedDeliverySpeedsDelta.md) |  |  |
| **four_day_plus** | [**PromisedDeliverySpeedsDelta**](PromisedDeliverySpeedsDelta.md) |  |  |
| **timezone** | **String** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::PromisedDeliverySpeeds.new(
  one_day: null,
  two_day: null,
  three_day: null,
  four_day_plus: null,
  timezone: null
)
```

