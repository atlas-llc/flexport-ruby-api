# Flexport::UnknownBarcodeIssue

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **front_picture** | **Object** | URL for image |  |
| **back_picture** | **Object** | URL for image |  |
| **box_content_picture** | **Object** | URL for image |  |
| **barcode_picture** | **Object** | URL for image |  |
| **received_submission_at** | **Object** | When we received a resolution from the merchant | [optional] |
| **completed_at** | **Object** | When the issue was resolved after receiving a resolution | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::UnknownBarcodeIssue.new(
  front_picture: null,
  back_picture: null,
  box_content_picture: null,
  barcode_picture: null,
  received_submission_at: null,
  completed_at: null
)
```

