# Flexport::InboundRateBuyResultV2

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transactions** | [**Array&lt;InboundRateTransactionNetwork&gt;**](InboundRateTransactionNetwork.md) |  |  |
| **error** | [**InboundExternalRateError**](InboundExternalRateError.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::InboundRateBuyResultV2.new(
  transactions: null,
  error: null
)
```

