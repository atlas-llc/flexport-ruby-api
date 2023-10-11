# Flexport::ReturnProductInspectionDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **quantity** | **Object** | Quantity of the inspected item. |  |
| **initial_condition** | **Object** | Initial condition of the inspected item. | [optional] |
| **final_condition** | **Object** | Final condition of the inspected item. | [optional] |
| **disposition** | [**Disposition**](Disposition.md) | Final disposition/outcome of the inspected item. | [optional] |
| **sop_id** | **Object** | SopId of the inspected item denotes which SOP was executed. | [optional] |
| **lot_number** | **Object** | Lot number of the inspected item. | [optional] |
| **vas_applied** | **Object** | Value-Added services applied on the inspected item. | [optional] |
| **item_tag** | **Object** | Return tag of the inspected item i.e license-plate or item-tag. | [optional] |
| **images** | **Object** | Image urls of the inspected item. | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ReturnProductInspectionDetail.new(
  quantity: null,
  initial_condition: null,
  final_condition: null,
  disposition: null,
  sop_id: null,
  lot_number: null,
  vas_applied: null,
  item_tag: null,
  images: null
)
```

