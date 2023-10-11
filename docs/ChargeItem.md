# Flexport::ChargeItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**ChargeType**](ChargeType.md) |  |  |
| **charge_date** | **Object** |  |  |
| **description** | **String** |  |  |
| **currency** | **String** |  |  |
| **amount** | **Float** |  |  |
| **gross_amount** | **Float** |  |  |
| **sub_type** | [**ChargeItemSubType**](ChargeItemSubType.md) |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ChargeItem.new(
  type: null,
  charge_date: null,
  description: null,
  currency: null,
  amount: null,
  gross_amount: null,
  sub_type: null
)
```

