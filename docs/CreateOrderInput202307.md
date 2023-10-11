# Flexport::CreateOrderInput202307

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address** | [**AddressInput**](AddressInput.md) |  |  |
| **delivery_days** | **Float** |  | [optional] |
| **duties** | [**MaybeDutiesInput**](MaybeDutiesInput.md) |  | [optional] |
| **external_order_id** | **String** | A unique order reference meaningful to the external system submitting the order. |  |
| **is_subscription_order** | **Boolean** |  | [optional] |
| **line_items** | [**Array&lt;OrderLineItemInput&gt;**](OrderLineItemInput.md) |  |  |
| **promised_delivery_by_time** | **Time** |  | [optional] |
| **promised_ship_by_time** | **Time** |  | [optional] |
| **ship_method** | **String** |  | [optional] |
| **source** | [**MaybeSourceId**](MaybeSourceId.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateOrderInput202307.new(
  address: null,
  delivery_days: null,
  duties: null,
  external_order_id: null,
  is_subscription_order: null,
  line_items: null,
  promised_delivery_by_time: null,
  promised_ship_by_time: null,
  ship_method: null,
  source: null
)
```

