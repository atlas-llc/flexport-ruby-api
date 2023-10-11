# Flexport::Dispute

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **has_active_dispute** | **Object** | The issue has an open dispute | [optional] |
| **dispute_url** | **Object** | URL for the dispute ticket | [optional] |
| **dispute_closed_at** | **Object** | When the dispute was closed | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::Dispute.new(
  has_active_dispute: null,
  dispute_url: null,
  dispute_closed_at: null
)
```

