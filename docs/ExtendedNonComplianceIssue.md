# Flexport::ExtendedNonComplianceIssue

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **missing_barcode** | [**MissingBarcodeIssue**](MissingBarcodeIssue.md) |  | [optional] |
| **unknown_barcode** | [**UnknownBarcodeIssue**](UnknownBarcodeIssue.md) |  | [optional] |
| **unexpected_sku** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **damaged_product** | [**DamagedProductIssue**](DamagedProductIssue.md) |  | [optional] |
| **relabeled_box** | [**RelabeledBoxIssue**](RelabeledBoxIssue.md) |  | [optional] |
| **short_shipped_box** | [**ShortShippedBoxIssue**](ShortShippedBoxIssue.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ExtendedNonComplianceIssue.new(
  missing_barcode: null,
  unknown_barcode: null,
  unexpected_sku: null,
  damaged_product: null,
  relabeled_box: null,
  short_shipped_box: null
)
```

