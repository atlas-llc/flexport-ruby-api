# Flexport::Parcel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **carrier_code** | **String** | The carrier code for the package. |  |
| **customer_custom_field** | **String** |  | [optional] |
| **customer_reference_id** | **String** |  | [optional] |
| **package_tracking_url** | **String** | URL that can be used to track the package. |  |
| **parcel_id** | **String** | Unique ID used to track the parcel, returned after acquiring a purchase label. |  |
| **price** | **Float** | The price of the parcel. |  |
| **service_level** | **String** | Service Level of the parcel |  |
| **shipping_label_url** | **String** | URL used to download the shipping label data. |  |
| **status** | [**ParcelApiStatus**](ParcelApiStatus.md) | Status of the Parcel Request |  |
| **tracking_code** | **String** | The tracking code for the package. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::Parcel.new(
  carrier_code: null,
  customer_custom_field: null,
  customer_reference_id: null,
  package_tracking_url: null,
  parcel_id: null,
  price: null,
  service_level: null,
  shipping_label_url: null,
  status: null,
  tracking_code: null
)
```

