# Flexport::ChargeSummaryResponseNextCharges

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **storage** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **inbound** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **returns** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **fulfillment** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **preparation** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **freight** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **parcel** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **special_projects** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |
| **reserve_storage** | [**ChargeSummaryItem**](ChargeSummaryItem.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ChargeSummaryResponseNextCharges.new(
  storage: null,
  inbound: null,
  returns: null,
  fulfillment: null,
  preparation: null,
  freight: null,
  parcel: null,
  special_projects: null,
  reserve_storage: null
)
```

