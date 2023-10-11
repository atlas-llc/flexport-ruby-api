# Flexport::QuoteResultResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error** | [**InboundExternalRateError**](InboundExternalRateError.md) |  | [optional] |
| **quotes** | [**Array&lt;RateQuoteWithPurchased&gt;**](RateQuoteWithPurchased.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::QuoteResultResponse.new(
  error: null,
  quotes: null
)
```

