# Flexport::CreateInboundShipmentRequestV4

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | [**InboundAddress**](InboundAddress.md) |  |  |
| **items** | [**Array&lt;ItemDataUnstable&gt;**](ItemDataUnstable.md) |  | [optional] |
| **packages** | [**Array&lt;PackageInputUnstable&gt;**](PackageInputUnstable.md) |  | [optional] |
| **prep** | [**PrepRequestData**](PrepRequestData.md) |  |  |
| **shipping_plan_external_id** | **String** |  | [optional] |
| **shipping_plan_name** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateInboundShipmentRequestV4.new(
  from: null,
  items: null,
  packages: null,
  prep: null,
  shipping_plan_external_id: null,
  shipping_plan_name: null
)
```

