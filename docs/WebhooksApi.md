# Flexport::WebhooksApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_webhook**](WebhooksApi.md#create_webhook) | **POST** /logistics/api/unstable/webhooks |  |
| [**delete_webhook**](WebhooksApi.md#delete_webhook) | **DELETE** /logistics/api/unstable/webhooks/{webhookId} |  |
| [**get_webhook**](WebhooksApi.md#get_webhook) | **GET** /logistics/api/unstable/webhooks/{webhookId} |  |
| [**get_webhooks**](WebhooksApi.md#get_webhooks) | **GET** /logistics/api/unstable/webhooks |  |


## create_webhook

> <WebhookModel> create_webhook(webhook_create_model)



Create a webhook to subscribe to a type of Deliverr event.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::WebhooksApi.new
webhook_create_model = Flexport::WebhookCreateModel.new({type: 'type_example', url: 'url_example', method: Flexport::WebhookRequestMethod::POST}) # WebhookCreateModel | 

begin
  
  result = api_instance.create_webhook(webhook_create_model)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling WebhooksApi->create_webhook: #{e}"
end
```

#### Using the create_webhook_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookModel>, Integer, Hash)> create_webhook_with_http_info(webhook_create_model)

```ruby
begin
  
  data, status_code, headers = api_instance.create_webhook_with_http_info(webhook_create_model)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookModel>
rescue Flexport::ApiError => e
  puts "Error when calling WebhooksApi->create_webhook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_create_model** | [**WebhookCreateModel**](WebhookCreateModel.md) |  |  |

### Return type

[**WebhookModel**](WebhookModel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_webhook

> delete_webhook(webhook_id)



Delete a webhook that has been created.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::WebhooksApi.new
webhook_id = 1.2 # Float | 

begin
  
  api_instance.delete_webhook(webhook_id)
rescue Flexport::ApiError => e
  puts "Error when calling WebhooksApi->delete_webhook: #{e}"
end
```

#### Using the delete_webhook_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_webhook_with_http_info(webhook_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_webhook_with_http_info(webhook_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Flexport::ApiError => e
  puts "Error when calling WebhooksApi->delete_webhook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_id** | **Float** |  |  |

### Return type

nil (empty response body)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_webhook

> <WebhookModel> get_webhook(webhook_id)



Get a specific webhook using the webhook identifier.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::WebhooksApi.new
webhook_id = 1.2 # Float | 

begin
  
  result = api_instance.get_webhook(webhook_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling WebhooksApi->get_webhook: #{e}"
end
```

#### Using the get_webhook_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookModel>, Integer, Hash)> get_webhook_with_http_info(webhook_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_webhook_with_http_info(webhook_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookModel>
rescue Flexport::ApiError => e
  puts "Error when calling WebhooksApi->get_webhook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_id** | **Float** |  |  |

### Return type

[**WebhookModel**](WebhookModel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_webhooks

> <Array<WebhookModel>> get_webhooks



Get all webhooks currently registered and active.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::WebhooksApi.new

begin
  
  result = api_instance.get_webhooks
  p result
rescue Flexport::ApiError => e
  puts "Error when calling WebhooksApi->get_webhooks: #{e}"
end
```

#### Using the get_webhooks_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<WebhookModel>>, Integer, Hash)> get_webhooks_with_http_info

```ruby
begin
  
  data, status_code, headers = api_instance.get_webhooks_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<WebhookModel>>
rescue Flexport::ApiError => e
  puts "Error when calling WebhooksApi->get_webhooks_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;WebhookModel&gt;**](WebhookModel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

