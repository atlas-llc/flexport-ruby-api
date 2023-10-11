# Flexport::LotTrackingDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **expiration_date** | **Time** | Timestamp for when this quantity will expire. RFC 3339 format, e.g., 2017-07-21T17:32:28Z. | [optional] |
| **available** | **Integer** | The number of units available for sale - not reserved for open orders, belonging to products whose dimsLocked field is true, that are in a pickable and shippable state at connected warehouses. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::LotTrackingDetails.new(
  expiration_date: null,
  available: null
)
```

