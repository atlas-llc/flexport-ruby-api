# Flexport::CustomLabelFooterFields

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **custom_label_footer1** | **String** | A custom field that can be used to define a string to be placed in the footer of the shipping label. |  |
| **custom_label_footer2** | **String** | A custom field that can be used to define a string to be placed in the footer of the shipping label. | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::CustomLabelFooterFields.new(
  custom_label_footer1: null,
  custom_label_footer2: null
)
```

