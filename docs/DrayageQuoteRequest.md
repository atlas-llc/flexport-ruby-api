# Flexport::DrayageQuoteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **package_type** | [**PackageType**](PackageType.md) |  | [optional] |
| **delivery_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |
| **pickup_details** | [**QuoteLocationDetails**](QuoteLocationDetails.md) |  |  |
| **package_count** | **Float** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::DrayageQuoteRequest.new(
  package_type: null,
  delivery_details: null,
  pickup_details: null,
  package_count: null
)
```

