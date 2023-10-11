# Flexport::LegacyReturnsSourceAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **Object** | Full name of entity. | [optional] |
| **first_name** | **Object** | FirstName of entity. | [optional] |
| **last_name** | **Object** | LastName of entity. | [optional] |
| **address1** | **Object** | First address line of the address. |  |
| **address2** | **Object** | Second address line of the address. | [optional] |
| **company** | **Object** | Company name for the entity. | [optional] |
| **city** | **Object** | City of the address. |  |
| **province_code** | **Object** | State or region of the address - if a US countryCode, must be the 2-letter state postal abbreviation. |  |
| **zip** | **Object** | Postal code of the address. | [optional] |
| **phone** | **Object** | Contact number of customer. | [optional] |
| **country_code** | **Object** | Country of the address. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::LegacyReturnsSourceAddress.new(
  name: null,
  first_name: null,
  last_name: null,
  address1: null,
  address2: null,
  company: null,
  city: null,
  province_code: null,
  zip: null,
  phone: null,
  country_code: null
)
```

