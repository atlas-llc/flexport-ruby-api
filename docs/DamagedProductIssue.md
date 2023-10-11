# Flexport::DamagedProductIssue

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **damage_type** | [**DamageType**](DamageType.md) | Describes the type of damage to the products |  |
| **damage_fault** | [**DamageFault**](DamageFault.md) | Who is responsible for the damage |  |
| **damaged_exterior_photo** | **Object** | URL for image | [optional] |
| **damaged_product_photo** | **Object** | URL for image | [optional] |
| **additional_photo1** | **Object** | URL for image | [optional] |
| **additional_photo2** | **Object** | URL for image | [optional] |
| **disposal_status** | **Object** | Whether the product has been disposed |  |

## Example

```ruby
require 'flexport'

instance = Flexport::DamagedProductIssue.new(
  damage_type: null,
  damage_fault: null,
  damaged_exterior_photo: null,
  damaged_product_photo: null,
  additional_photo1: null,
  additional_photo2: null,
  disposal_status: null
)
```

