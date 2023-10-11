# Flexport::FreightAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **company** | **String** |  | [optional] |
| **working_hours** | [**TimeWindow**](TimeWindow.md) |  | [optional] |
| **street1** | **String** |  |  |
| **street2** | **String** |  | [optional] |
| **city** | **String** |  |  |
| **zip** | **String** |  |  |
| **state** | **String** |  |  |
| **country** | **String** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::FreightAddress.new(
  company: null,
  working_hours: null,
  street1: null,
  street2: null,
  city: null,
  zip: null,
  state: null,
  country: null
)
```

