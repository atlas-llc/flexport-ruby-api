# Flexport::BulkParcelJobResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **job_id** | **Float** |  |  |
| **status** | **String** |  |  |
| **labels_url** | **String** |  | [optional] |
| **parcels** | [**Array&lt;BulkParcelJobParcel&gt;**](BulkParcelJobParcel.md) |  | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::BulkParcelJobResponse.new(
  job_id: null,
  status: null,
  labels_url: null,
  parcels: null
)
```

