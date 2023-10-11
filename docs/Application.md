# Flexport::Application

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

## Example

```ruby
require 'flexport'

instance = Flexport::Application.new(
  id: null,
  partner_id: null,
  is_test_application: null,
  status: null,
  type: null,
  created_at: null,
  updated_at: null
)
```

