# Flexport::DrayageOrderItemResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cost** | **Float** |  |  |
| **customer_bol_id** | **String** |  | [optional] |
| **package_type** | [**PackageType**](PackageType.md) |  | [optional] |
| **packages** | [**Array&lt;PackageDetails&gt;**](PackageDetails.md) |  | [optional] |
| **master_bol_id** | **String** |  |  |
| **container_id** | **String** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::DrayageOrderItemResponse.new(
  cost: null,
  customer_bol_id: null,
  package_type: null,
  packages: null,
  master_bol_id: null,
  container_id: null
)
```

