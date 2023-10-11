# Flexport::PartnerApplication

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **partner_id** | **Float** |  |  |
| **is_test_application** | **Boolean** |  |  |
| **status** | [**ApplicationStatus**](ApplicationStatus.md) |  |  |
| **type** | [**ApplicationType**](ApplicationType.md) |  |  |
| **created_at** | **Object** |  |  |
| **updated_at** | **Object** |  |  |
| **public_status** | **String** |  |  |
| **install_uri** | **String** |  |  |
| **redirect_uri** | **String** |  |  |
| **client_secret** | **String** |  |  |
| **logistics_account_id** | **String** |  |  |
| **seller_id** | **String** |  |  |
| **partner_name** | **String** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::PartnerApplication.new(
  id: null,
  partner_id: null,
  is_test_application: null,
  status: null,
  type: null,
  created_at: null,
  updated_at: null,
  public_status: null,
  install_uri: null,
  redirect_uri: null,
  client_secret: null,
  logistics_account_id: null,
  seller_id: null,
  partner_name: null
)
```

