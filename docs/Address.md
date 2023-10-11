# Flexport::Address

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address1** | **String** | First address line of the address. |  |
| **address2** | **String** |  | [optional] |
| **city** | **String** | City of the address. |  |
| **company** | **String** |  | [optional] |
| **country_code** | **String** | Country code for the address. Ex: &#39;US&#39;, &#39;CA&#39;, &#39;MX&#39;. |  |
| **name** | **String** |  | [optional] |
| **phone** | **String** | Phone number of the entity. |  |
| **province_code** | **String** | State or region of the address - if a US countryCode, must be the 2-letter state postal abbreviation. |  |
| **zip** | **String** | Postal code of the address. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::Address.new(
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

