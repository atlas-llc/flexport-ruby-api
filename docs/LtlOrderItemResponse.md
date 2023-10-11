# Flexport::LtlOrderItemResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cost** | **Float** |  |  |
| **customer_bol_id** | **String** |  | [optional] |
| **pallets** | [**Array&lt;PackageDetails&gt;**](PackageDetails.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::LtlOrderItemResponse.new(
  cost: null,
  customer_bol_id: null,
  pallets: null
)
```

