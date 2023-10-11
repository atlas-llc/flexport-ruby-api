# Flexport::AddressInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address1** | **String** | First address line of the address. |  |
| **address2** | **String** |  | [optional] |
| **city** | **String** | City of the address. |  |
| **company** | **String** |  | [optional] |
| **country_code** | **String** | Country code for the address. Ex: &#39;US&#39;, &#39;CA&#39;, &#39;MX&#39; |  |
| **name** | **String** |  | [optional] |
| **phone** | **String** |  | [optional] |
| **province_code** | **String** |  | [optional] |
| **zip** | **String** |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::AddressInput.new(
  address1: null,
  address2: null,
  city: null,
  company: null,
  country_code: null,
  name: null,
  phone: null,
  province_code: null,
  zip: null
)
```

