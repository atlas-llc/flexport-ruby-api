# Flexport::MaybeDutiesInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **incoterm** | [**MaybeIncoterm**](MaybeIncoterm.md) |  | [optional] |
| **merchant_of_record_account_id** | **String** | The merchant GUID associated with Global-E. |  |
| **merchant_of_record_carrier_code** | **String** |  | [optional] |
| **merchant_of_record_order_id** | **String** | The merchant order ID associated with Global-E. |  |
| **merchant_of_record_provider** | [**MerchantOfRecordProvider**](MerchantOfRecordProvider.md) | The merchant of record provider for the order. |  |
| **merchant_of_record_sku_map** | [**Array&lt;MaybeMerchantOfRecordSkuMapInput&gt;**](MaybeMerchantOfRecordSkuMapInput.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::MaybeDutiesInput.new(
  incoterm: null,
  merchant_of_record_account_id: null,
  merchant_of_record_carrier_code: null,
  merchant_of_record_order_id: null,
  merchant_of_record_provider: null,
  merchant_of_record_sku_map: null
)
```

