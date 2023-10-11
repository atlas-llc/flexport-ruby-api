# Flexport::CreateParcelRequestUnstable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customer_parcel_id** | **String** |  | [optional] |
| **service_level** | **String** |  | [optional] |
| **injection_location** | **String** |  | [optional] |
| **ship_to_address** | [**DeliverrAddress**](DeliverrAddress.md) |  |  |
| **return_address** | [**DeliverrAddress**](DeliverrAddress.md) |  | [optional] |
| **skip_address_validation** | **Boolean** |  | [optional] |
| **pickup_date_time** | **Time** |  | [optional] |
| **dimensions** | [**ParcelDimensions**](ParcelDimensions.md) |  |  |
| **customer_custom_field** | **String** |  | [optional] |
| **label_format** | [**ShippingLabelFormatParcel**](ShippingLabelFormatParcel.md) |  | [optional] |
| **is_return** | **Boolean** |  | [optional] |
| **marketplace** | **String** |  | [optional] |
| **custom_label_footer_fields** | [**CustomLabelFooterFields**](CustomLabelFooterFields.md) |  | [optional] |
| **customs_information** | [**ParcelCustomsInformation**](ParcelCustomsInformation.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateParcelRequestUnstable.new(
  customer_parcel_id: null,
  service_level: null,
  injection_location: null,
  ship_to_address: null,
  return_address: null,
  skip_address_validation: null,
  pickup_date_time: null,
  dimensions: null,
  customer_custom_field: null,
  label_format: null,
  is_return: null,
  marketplace: null,
  custom_label_footer_fields: null,
  customs_information: null
)
```

