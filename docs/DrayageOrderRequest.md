# Flexport::DrayageOrderRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **commodity_description** | **String** |  | [optional] |
| **container_id** | **String** |  |  |
| **customer_reference_number** | **String** |  | [optional] |
| **delivery_details** | [**OrderDeliveryDetails**](OrderDeliveryDetails.md) |  |  |
| **delivery_order_document_key** | **String** | The returned S3 object key from using the Uploads API to upload the delivery order document. |  |
| **master_bol_id** | **String** |  |  |
| **package_type** | [**PackageType**](PackageType.md) |  | [optional] |
| **packages** | [**Array&lt;PackageDetails&gt;**](PackageDetails.md) |  | [optional] |
| **packing_list_document_key** | **String** | The returned S3 object key from using the Uploads API to upload the packing list document. |  |
| **port_id** | **String** | The ID of the pickup Port, obtainable via the \&quot;Get all ports\&quot; endpoint. |  |
| **quote_id** | **Float** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::DrayageOrderRequest.new(
  commodity_description: null,
  container_id: null,
  customer_reference_number: null,
  delivery_details: null,
  delivery_order_document_key: null,
  master_bol_id: null,
  package_type: null,
  packages: null,
  packing_list_document_key: null,
  port_id: null,
  quote_id: null
)
```

