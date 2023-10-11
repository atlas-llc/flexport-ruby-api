# Flexport::LtlQuoteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**FreightModeLTL**](FreightModeLTL.md) |  |  |
| **pickup_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |
| **delivery_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |
| **id** | **Float** |  |  |
| **created_at** | **Time** |  |  |
| **status** | [**QuoteStatus**](QuoteStatus.md) |  |  |
| **expires_at** | **Time** |  |  |
| **ltl_quote_item** | [**LtlQuoteItem**](LtlQuoteItem.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::LtlQuoteResponse.new(
  type: null,
  pickup_details: null,
  delivery_details: null,
  id: null,
  created_at: null,
  status: null,
  expires_at: null,
  ltl_quote_item: null
)
```

