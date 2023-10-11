# Flexport::AccountStandingStatusOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_account_id** | **String** | Logistics account ID |  |
| **is_fully_setup** | **Boolean** | Whether account can accept fulfillment orders |  |
| **imported_product_catalog** | **Boolean** | Whether product catalog has been imported |  |
| **completed_first_inbound_shipment** | **Boolean** | Whether the first inbound shipment has been completed |  |

## Example

```ruby
require 'flexport'

instance = Flexport::AccountStandingStatusOutput.new(
  logistics_account_id: null,
  is_fully_setup: null,
  imported_product_catalog: null,
  completed_first_inbound_shipment: null
)
```

