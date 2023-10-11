# Flexport::ChargeSummaryResponseCharges

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **storage** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **inbound** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **returns** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **fulfillment** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ChargeSummaryResponseCharges.new(
  storage: null,
  inbound: null,
  returns: null,
  fulfillment: null
)
```

