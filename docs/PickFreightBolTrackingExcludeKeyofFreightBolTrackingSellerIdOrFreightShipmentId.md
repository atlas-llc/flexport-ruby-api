# Flexport::PickFreightBolTrackingExcludeKeyofFreightBolTrackingSellerIdOrFreightShipmentId

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pickup_details** | [**FreightStopDetails**](FreightStopDetails.md) |  |  |
| **delivery_details** | [**FreightStopDetails**](FreightStopDetails.md) |  |  |
| **bol_id** | **String** |  |  |
| **mode** | [**FreightShipmentMode**](FreightShipmentMode.md) |  |  |
| **bol_status** | [**FreightBolStatus**](FreightBolStatus.md) |  |  |
| **carrier_name** | **String** |  | [optional] |
| **estimated_pickup_time** | **Time** |  | [optional] |
| **estimated_delivery_time** | **Time** |  | [optional] |
| **estimated_port_departure_time** | **Time** |  | [optional] |
| **estimated_port_arrival_time** | **Time** |  | [optional] |
| **total_pallets** | **Float** |  | [optional] |
| **events** | [**Array&lt;FreightTrackingEvent&gt;**](FreightTrackingEvent.md) |  |  |
| **updated_at** | **Time** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::PickFreightBolTrackingExcludeKeyofFreightBolTrackingSellerIdOrFreightShipmentId.new(
  pickup_details: null,
  delivery_details: null,
  bol_id: null,
  mode: null,
  bol_status: null,
  carrier_name: null,
  estimated_pickup_time: null,
  estimated_delivery_time: null,
  estimated_port_departure_time: null,
  estimated_port_arrival_time: null,
  total_pallets: null,
  events: null,
  updated_at: null
)
```

