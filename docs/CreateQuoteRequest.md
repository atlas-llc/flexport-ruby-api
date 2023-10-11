# Flexport::CreateQuoteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **service_level** | **String** |  |  |
| **injection_location** | **String** |  | [optional] |
| **ship_to_address** | [**DeliverrAddress**](DeliverrAddress.md) |  |  |
| **dimensions** | [**ParcelDimensions**](ParcelDimensions.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateQuoteRequest.new(
  service_level: null,
  injection_location: null,
  ship_to_address: null,
  dimensions: null
)
```

