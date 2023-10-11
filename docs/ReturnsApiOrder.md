# Flexport::ReturnsApiOrder

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Float** | Unique identifier of the return. |  |
| **status** | [**ReturnOrderStatus**](ReturnOrderStatus.md) | The current status of the return. |  |
| **source_address** | [**DeliverrAddress**](DeliverrAddress.md) | Source address where the return was shipped from, if known. | [optional] |
| **shipping_label** | [**ShippingLabel**](ShippingLabel.md) | The label used to ship the return. |  |
| **rma** | **String** | RMA of the return. |  |
| **external_return_id** | **String** | A unique reference to the return order in the external system submitting the request. |  |
| **return_items** | [**Array&lt;ReturnItem&gt;**](ReturnItem.md) |  |  |
| **shipped_at** | **Time** | Date when the return was shipped. | [optional] |
| **received_at** | **Time** | Date when the return was received at the warehouse. | [optional] |
| **inspected_at** | **Time** | Date when the return was inspected at the warehouse. | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ReturnsApiOrder.new(
  id: null,
  status: null,
  source_address: null,
  shipping_label: null,
  rma: null,
  external_return_id: null,
  return_items: null,
  shipped_at: null,
  received_at: null,
  inspected_at: null
)
```

