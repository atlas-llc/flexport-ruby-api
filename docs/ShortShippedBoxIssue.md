# Flexport::ShortShippedBoxIssue

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | [**ShortShippedBoxStatus**](ShortShippedBoxStatus.md) | The current status of the short ship |  |
| **resolved_by** | [**ShortShippedResolvedBy**](ShortShippedResolvedBy.md) | Who resolved the issue | [optional] |
| **reported_boxes** | **Object** | How many boxes are affected by the issue | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ShortShippedBoxIssue.new(
  status: null,
  resolved_by: null,
  reported_boxes: null
)
```

