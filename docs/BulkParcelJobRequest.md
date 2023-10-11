# Flexport::BulkParcelJobRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **parcels** | [**Array&lt;BulkParcelRequest&gt;**](BulkParcelRequest.md) |  |  |
| **packslip_required** | **Boolean** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::BulkParcelJobRequest.new(
  parcels: null,
  packslip_required: null
)
```

