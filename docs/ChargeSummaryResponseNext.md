# Flexport::ChargeSummaryResponseNext

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **currency** | **String** |  |  |
| **total** | **Float** |  |  |
| **gross_total** | **Float** |  |  |
| **charges** | [**ChargeSummaryResponseNextCharges**](ChargeSummaryResponseNextCharges.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ChargeSummaryResponseNext.new(
  currency: null,
  total: null,
  gross_total: null,
  charges: null
)
```

