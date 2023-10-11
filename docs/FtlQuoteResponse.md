# Flexport::FtlQuoteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**FreightModeFTL**](FreightModeFTL.md) |  |  |
| **pickup_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |
| **delivery_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |
| **id** | **Float** |  |  |
| **created_at** | **Time** |  |  |
| **status** | [**QuoteStatus**](QuoteStatus.md) |  |  |
| **expires_at** | **Time** |  |  |
| **ftl_quote_item** | [**FtlQuoteItem**](FtlQuoteItem.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::FtlQuoteResponse.new(
  type: null,
  pickup_details: null,
  delivery_details: null,
  id: null,
  created_at: null,
  status: null,
  expires_at: null,
  ftl_quote_item: null
)
```

