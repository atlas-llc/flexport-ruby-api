# Flexport::FulfillmentPackage

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **attempted_delivery_time** | **Time** |  | [optional] |
| **carrier_delivery_time** | **Time** |  | [optional] |
| **carrier_pick_up_time** | **Time** |  | [optional] |
| **carrier_ship_time** | **Time** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **id** | **String** |  |  |
| **label** | [**MaybePackageLabel**](MaybePackageLabel.md) |  | [optional] |
| **label_create_time** | **Time** |  | [optional] |
| **line_items** | [**Array&lt;FulfillmentPackageItem&gt;**](FulfillmentPackageItem.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::FulfillmentPackage.new(
  attempted_delivery_time: null,
  carrier_delivery_time: null,
  carrier_pick_up_time: null,
  carrier_ship_time: null,
  created_at: null,
  id: null,
  label: null,
  label_create_time: null,
  line_items: null
)
```

