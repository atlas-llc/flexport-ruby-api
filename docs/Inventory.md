# Flexport::Inventory

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **incoming** | **Float** |  |  |
| **on_hand** | **Float** |  |  |
| **available** | **Float** |  |  |
| **unavailable** | **Float** |  |  |

## Example

```ruby
require 'flexport'

instance = Flexport::Inventory.new(
  incoming: null,
  on_hand: null,
  available: null,
  unavailable: null
)
```

