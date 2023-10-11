# Flexport::CreateChannelOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel_id** | **String** | Unique UUID for this channel |  |
| **store_name** | **String** | Name of the authorized store that will be used to access a Channel&#39;s API E.g. shop1.myshopify.com |  |
| **channel_type** | **String** | Name of the channel E.g. SHOPIFY |  |
| **fulfillment_service_callback_url** | **String** | The URL where fulfillment requests should be sent to |  |
| **webhook_callback_url** | **String** | The URL where webhook notifications should be registered to |  |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateChannelOutput.new(
  channel_id: null,
  store_name: null,
  channel_type: null,
  fulfillment_service_callback_url: null,
  webhook_callback_url: null
)
```

