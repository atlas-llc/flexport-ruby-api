# Flexport::OrderState

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fulfillment_delayed** | **Boolean** |  |  |
| **fulfillment_in_progress** | **Boolean** |  |  |
| **fulfillment_status** | [**ExternalOrderStatus**](ExternalOrderStatus.md) |  |  |
| **internal_status** | [**InternalOrderStatus**](InternalOrderStatus.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::OrderState.new(
  fulfillment_delayed: null,
  fulfillment_in_progress: null,
  fulfillment_status: null,
  internal_status: null
)
```

