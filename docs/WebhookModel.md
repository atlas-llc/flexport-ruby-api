# Flexport::WebhookModel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Types of webhooks available. &lt;div&gt;&lt;span&gt; &lt;b&gt;Examples:&lt;/b&gt;&lt;/span&gt; &lt;span&gt;Freight.TrackingUpdated - &lt;/span&gt; &lt;span&gt;Inbound.Received - &lt;/span&gt; &lt;span&gt;Inbound.ShipmentStatusChanged - &lt;/span&gt; &lt;span&gt;Inventory.Adjusted - &lt;/span&gt; &lt;span&gt;Order.Cancelled - &lt;/span&gt; &lt;span&gt;Order.Shipped - &lt;/span&gt; &lt;span&gt;Return.Updated - &lt;/span&gt; &lt;span&gt;Shipment.Cancelled - &lt;/span&gt; &lt;span&gt;Shipment.Created - &lt;/span&gt; &lt;span&gt;Shipment.Shipped&lt;/span&gt;&lt;/div&gt; |  |
| **url** | **String** | Webhook URL for where Deliverr events should be sent to. Must begin with &#39;https://&#39;. |  |
| **method** | [**WebhookRequestMethod**](WebhookRequestMethod.md) |  |  |
| **auth_method** | [**WebhookAuthType**](WebhookAuthType.md) | &lt;ul&gt; &lt;li&gt;NONE: No authentication needed when Deliverr sends webhook events to specified URL&lt;/li&gt; &lt;li&gt;BASIC_AUTH: Basic authentication (username and password) are needed when Deliverr sends webhook events to specified URL&lt;/li&gt; &lt;li&gt;TOKEN: A token is sent as the tokenHeader header value when Deliverr sends webhook events to specified URL&lt;/li&gt; &lt;/ul&gt; | [optional] |
| **username** | **String** | Required if auth_method is BASIC_AUTH. | [optional] |
| **password** | **String** | Required if auth_method is BASIC_AUTH. | [optional] |
| **token** | **String** | Required if auth_method is TOKEN. | [optional] |
| **token_header** | **String** | Required if auth_method is TOKEN. | [optional] |
| **id** | **Float** | A unique identifier for a webhook. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::WebhookModel.new(
  type: null,
  url: null,
  method: null,
  auth_method: null,
  username: null,
  password: null,
  token: null,
  token_header: null,
  id: null
)
```

