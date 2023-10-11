# Flexport::OrderError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **Float** |  |  |
| **line_item_errors** | [**Array&lt;LineItemError&gt;**](LineItemError.md) |  | [optional] |
| **message** | **String** |  |  |
| **retriable** | **Boolean** | Signals when an order error can be considered transient and can be retried manually by the caller. Attempting to create the order again will return a DUPLICATE_ORDER error, to retry please use the retry API. |  |
| **type** | [**OrderErrorType**](OrderErrorType.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::OrderError.new(
  code: null,
  line_item_errors: null,
  message: null,
  retriable: null,
  type: null
)
```

