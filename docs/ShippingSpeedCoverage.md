# Flexport::ShippingSpeedCoverage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **one_day** | [**ProvinceCoverage**](ProvinceCoverage.md) |  |  |
| **two_day** | [**ProvinceCoverage**](ProvinceCoverage.md) |  |  |
| **three_day** | [**ProvinceCoverage**](ProvinceCoverage.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ShippingSpeedCoverage.new(
  one_day: null,
  two_day: null,
  three_day: null
)
```

