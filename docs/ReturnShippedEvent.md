# Flexport::ReturnShippedEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Object** | Shopify&#39;s return order id. |  |
| **status** | [**ReturnStatus**](ReturnStatus.md) |  |  |
| **source_address** | [**LegacyReturnsSourceAddress**](LegacyReturnsSourceAddress.md) | Return shipment origin address could be customer&#39;s or aggregator facility&#39;s address. | [optional] |
| **destination_address** | [**LegacyReturnsDestinationAddress**](LegacyReturnsDestinationAddress.md) | Shopify&#39;s return processing facility address. | [optional] |
| **shipping_labels** | **Object** | For more than one package send multiple shipping label. |  |
| **marketplace_order** | [**ReturnsApiMarketplaceOrder**](ReturnsApiMarketplaceOrder.md) |  |  |
| **rma** | **Object** | Return merchandise authorization unique id generated for returns make sure it is in the shipping label. |  |
| **external_return_id** | **Object** | Unique identifier for return in RMT. |  |
| **return_items** | **Object** | Items being returned. |  |
| **shipped_at** | **Object** | Buyer shipped at date | [optional] |
| **received_at** | **Object** | Received for inspection date | [optional] |
| **inspected_at** | **Object** | Inspection performed at date | [optional] |
| **inspection_notes** | **Object** | Notes captured by operations to pass any unexpected/unusual item or package details. | [optional] |
| **logistics_account_id** | **Object** | Logistics account ID |  |
| **logistics_event_id** | **Object** | Logistics event ID |  |
| **logistics_event_type** | **Object** | Event type |  |
| **logistics_event_time** | **Object** | Time when the event occurred |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ReturnShippedEvent.new(
  id: null,
  status: null,
  source_address: null,
  destination_address: null,
  shipping_labels: null,
  marketplace_order: null,
  rma: null,
  external_return_id: null,
  return_items: null,
  shipped_at: null,
  received_at: null,
  inspected_at: null,
  inspection_notes: null,
  logistics_account_id: null,
  logistics_event_id: null,
  logistics_event_type: null,
  logistics_event_time: null
)
```

