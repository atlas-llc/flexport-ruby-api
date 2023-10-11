# Flexport::DeliverrAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  |  |
| **company** | **String** |  | [optional] |
| **street1** | **String** |  |  |
| **street2** | **String** |  | [optional] |
| **city** | **String** |  |  |
| **zip** | **String** |  |  |
| **state** | **String** |  |  |
| **country** | **String** |  |  |
| **phone** | **String** |  | [optional] |
| **email** | **String** |  | [optional] |
| **is_residential** | **Boolean** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::DeliverrAddress.new(
  name: null,
  company: null,
  street1: null,
  street2: null,
  city: null,
  zip: null,
  state: null,
  country: null,
  phone: null,
  email: null,
  is_residential: null
)
```

