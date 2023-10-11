# Flexport::DrayageQuoteItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **package_count** | **Float** |  | [optional] |
| **package_type** | [**PackageType**](PackageType.md) |  | [optional] |
| **transit_days** | **Float** |  |  |
| **total_cost** | **Float** |  |  |
| **original_cost** | **Float** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::DrayageQuoteItem.new(
  package_count: null,
  package_type: null,
  transit_days: null,
  total_cost: null,
  original_cost: null
)
```

