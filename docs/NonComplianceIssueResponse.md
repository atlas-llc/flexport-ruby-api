# Flexport::NonComplianceIssueResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Object** | Id of issue |  |
| **type** | [**NonComplianceIssueType**](NonComplianceIssueType.md) | The issue type |  |
| **logistics_sku** | **Object** | Merchant&#39;s logistics product ID | [optional] |
| **barcode** | **Object** | The shipment&#39;s barcode | [optional] |
| **shipment_id** | **Object** | The shipment id | [optional] |
| **shipping_plan_id** | **Object** | The shipping plan id | [optional] |
| **reported_units** | **Object** | The total number of reported units | [optional] |
| **received_units** | **Object** | The total number of received units | [optional] |
| **status** | [**NonComplianceIssueStatus**](NonComplianceIssueStatus.md) | The issue&#39;s current status. |  |
| **created_at** | **Object** | When the issue was created |  |
| **updated_at** | **Object** | When the issue was updated |  |
| **dispute** | [**Dispute**](Dispute.md) | Dispute related fields |  |
| **extended** | [**ExtendedNonComplianceIssue**](ExtendedNonComplianceIssue.md) | Wrapper for issue specific data |  |

## Example

```ruby
require 'flexport'

instance = Flexport::NonComplianceIssueResponse.new(
  id: null,
  type: null,
  logistics_sku: null,
  barcode: null,
  shipment_id: null,
  shipping_plan_id: null,
  reported_units: null,
  received_units: null,
  status: null,
  created_at: null,
  updated_at: null,
  dispute: null,
  extended: null
)
```

