# Flexport::CustomsInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **origin_country** | [**CountryCode**](CountryCode.md) | The 2-letter IANA code for the product&#39;s country of origin. Needed only for international shipping. |  |
| **tariff_code** | **Object** | Harmonized tariff code. Needed only for international shipping. |  |
| **customs_value** | **Object** | The value of one unit of this product in USD for the purpose of customs declaration. Needed only for international shipping. |  |
| **description** | **Object** | Customs description - should reflect usage and materials. Needed only for international shipping. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::CustomsInput.new(
  origin_country: null,
  tariff_code: null,
  customs_value: null,
  description: null
)
```

