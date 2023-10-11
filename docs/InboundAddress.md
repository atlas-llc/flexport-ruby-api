# Flexport::InboundAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address1** | **String** | The first line of the address. Typically the street address or PO Box number. |  |
| **address2** | **String** | The second line of the address. Typically the number of the apartment, suite, or unit. | [optional] |
| **city** | **String** | The name of the city, district, village, or town. |  |
| **company** | **String** | The name of the customer&#39;s company or organization. | [optional] |
| **country_code** | [**CountryCode**](CountryCode.md) | The two-letter code for the country of the address. |  |
| **name** | **String** | The full name of the customer. | [optional] |
| **first_name** | **String** | The first name of the customer. | [optional] |
| **last_name** | **String** | The last name of the customer. | [optional] |
| **phone** | **String** | A unique phone number for the customer. Formatted using E.164 standard. For example, +16135551111. | [optional] |
| **province_code** | **String** | The code for the region of the address, such as the province, state, or district. For example QC for Quebec, Canada. |  |
| **zip** | **String** | The zip or postal code of the address. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::InboundAddress.new(
  address1: null,
  address2: null,
  city: null,
  company: null,
  country_code: null,
  name: null,
  first_name: null,
  last_name: null,
  phone: null,
  province_code: null,
  zip: null
)
```

