# Flexport::InboundRateQuoteResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **quotes** | [**Array&lt;InboundRateQuoteFE&gt;**](InboundRateQuoteFE.md) |  |  |
| **error** | [**InboundExternalRateError**](InboundExternalRateError.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::InboundRateQuoteResult.new(
  quotes: null,
  error: null
)
```

