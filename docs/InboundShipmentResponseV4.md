# Flexport::InboundShipmentResponseV4

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **receiving_id** | **String** |  |  |
| **status** | [**LogisticsInboundShipmentStatus**](LogisticsInboundShipmentStatus.md) |  |  |
| **addresses** | [**AddressesOutput**](AddressesOutput.md) |  |  |
| **items** | [**Array&lt;ItemOutputUnstable&gt;**](ItemOutputUnstable.md) |  | [optional] |
| **packages** | [**Array&lt;PackageOutputUnstable&gt;**](PackageOutputUnstable.md) |  | [optional] |
| **arrived_at** | **Time** |  | [optional] |
| **completed_at** | **Time** |  | [optional] |
| **freight** | [**ShopifyFreightResponse**](ShopifyFreightResponse.md) |  | [optional] |
| **prep** | [**PrepRequestData**](PrepRequestData.md) |  |  |
| **shipping_plan_id** | **String** |  |  |
| **shipping_plan_external_id** | **String** |  | [optional] |
| **shipping_plan_name** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::InboundShipmentResponseV4.new(
  id: null,
  receiving_id: null,
  status: null,
  addresses: null,
  items: null,
  packages: null,
  arrived_at: null,
  completed_at: null,
  freight: null,
  prep: null,
  shipping_plan_id: null,
  shipping_plan_external_id: null,
  shipping_plan_name: null
)
```

