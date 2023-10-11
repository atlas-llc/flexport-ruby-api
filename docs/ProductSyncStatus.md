# Flexport::ProductSyncStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel_id** | **String** | Unique UUID for this channel |  |
| **product_sync_status** | **String** | Product import job status |  |
| **updated_at** | **Time** | Date when products were last imported |  |

## Example

```ruby
require 'flexport'

instance = Flexport::ProductSyncStatus.new(
  channel_id: null,
  product_sync_status: null,
  updated_at: null
)
```

