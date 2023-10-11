# Flexport::DrayageQuoteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**FreightModeDRAYAGE**](FreightModeDRAYAGE.md) |  |  |
| **pickup_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |
| **delivery_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |
| **id** | **Float** |  |  |
| **created_at** | **Time** |  |  |
| **status** | [**QuoteStatus**](QuoteStatus.md) |  |  |
| **expires_at** | **Time** |  |  |
| **drayage_quote_item** | [**DrayageQuoteItem**](DrayageQuoteItem.md) |  |  |
| **transload_quote_item** | [**TransloadQuoteItem**](TransloadQuoteItem.md) |  | [optional] |
| **ftl_quote_item** | [**FtlQuoteItem**](FtlQuoteItem.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::DrayageQuoteResponse.new(
  type: null,
  pickup_details: null,
  delivery_details: null,
  id: null,
  created_at: null,
  status: null,
  expires_at: null,
  drayage_quote_item: null,
  transload_quote_item: null,
  ftl_quote_item: null
)
```

