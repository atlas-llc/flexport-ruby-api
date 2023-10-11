# Flexport::LogisticsAccountCreateInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **experiment_code** | **String** |  | [optional] |
| **is_sandbox_account** | **Boolean** |  | [optional] |
| **is_test_account** | **Boolean** |  | [optional] |
| **shopify_billing_account_id** | **Object** | The Shopify Billing account ID. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::LogisticsAccountCreateInput.new(
  experiment_code: null,
  is_sandbox_account: null,
  is_test_account: null,
  shopify_billing_account_id: 1001001
)
```

