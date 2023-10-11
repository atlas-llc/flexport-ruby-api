# Flexport::OTD

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **on_time** | **Float** |  |  |
| **one_day_late** | **Float** |  |  |
| **two_days_late** | **Float** |  |  |
| **three_plus_days_late** | **Float** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::OTD.new(
  on_time: null,
  one_day_late: null,
  two_days_late: null,
  three_plus_days_late: null
)
```

