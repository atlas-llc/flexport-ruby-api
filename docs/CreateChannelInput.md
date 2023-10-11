# Flexport::CreateChannelInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel_type** | **String** | Name of the channel E.g. SHOPIFY |  |
| **access_token** | **String** | Access token that can be used to connect to a Channel&#39;s API |  |
| **store_name** | **String** | Name of the authorized store that will be used to access a Channel&#39;s API E.g. shop1.myshopify.com |  |
| **location_id** | **String** | The Location Id where orders will be fetched from and inventory updates will occur at E.g. 1203908129 |  |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateChannelInput.new(
  channel_type: null,
  access_token: null,
  store_name: null,
  location_id: null
)
```

