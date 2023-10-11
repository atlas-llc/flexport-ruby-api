# Flexport::QuoteLocationDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **lift_gate_required** | **Boolean** |  | [optional] |
| **location_type** | [**LocationType**](LocationType.md) |  | [optional] |
| **zip** | **String** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::QuoteLocationDetails.new(
  lift_gate_required: null,
  location_type: null,
  zip: null
)
```

