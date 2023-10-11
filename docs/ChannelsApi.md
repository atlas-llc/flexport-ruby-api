# Flexport::ChannelsApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_channel**](ChannelsApi.md#create_channel) | **POST** /logistics/api/unstable/channels | Create or update a new channel |
| [**create_product_sync**](ChannelsApi.md#create_product_sync) | **POST** /logistics/api/unstable/channels/{channelType}/shop/{storeName}/sync | Sync products for a channel |
| [**get_product_sync_status**](ChannelsApi.md#get_product_sync_status) | **GET** /logistics/api/unstable/channels/{channelType}/shop/{storeName}/sync | Get product sync status |


## create_channel

> <CreateChannelOutput> create_channel(create_channel_input)

Create or update a new channel

Create or update a new channel integration that will be used to process orders. Reserved for approved partners only.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ChannelsApi.new
create_channel_input = Flexport::CreateChannelInput.new({channel_type: 'channel_type_example', access_token: 'access_token_example', store_name: 'store_name_example', location_id: 'location_id_example'}) # CreateChannelInput | 

begin
  # Create or update a new channel
  result = api_instance.create_channel(create_channel_input)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ChannelsApi->create_channel: #{e}"
end
```

#### Using the create_channel_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateChannelOutput>, Integer, Hash)> create_channel_with_http_info(create_channel_input)

```ruby
begin
  # Create or update a new channel
  data, status_code, headers = api_instance.create_channel_with_http_info(create_channel_input)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateChannelOutput>
rescue Flexport::ApiError => e
  puts "Error when calling ChannelsApi->create_channel_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_channel_input** | [**CreateChannelInput**](CreateChannelInput.md) |  |  |

### Return type

[**CreateChannelOutput**](CreateChannelOutput.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_product_sync

> create_product_sync(channel_type, store_name)

Sync products for a channel

Initiate a product sync.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ChannelsApi.new
channel_type = 'channel_type_example' # String | 
store_name = 'store_name_example' # String | 

begin
  # Sync products for a channel
  api_instance.create_product_sync(channel_type, store_name)
rescue Flexport::ApiError => e
  puts "Error when calling ChannelsApi->create_product_sync: #{e}"
end
```

#### Using the create_product_sync_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_product_sync_with_http_info(channel_type, store_name)

```ruby
begin
  # Sync products for a channel
  data, status_code, headers = api_instance.create_product_sync_with_http_info(channel_type, store_name)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Flexport::ApiError => e
  puts "Error when calling ChannelsApi->create_product_sync_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel_type** | **String** |  |  |
| **store_name** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_product_sync_status

> <ProductSyncStatus> get_product_sync_status(channel_type, store_name)

Get product sync status

Get the product sync job status.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ChannelsApi.new
channel_type = 'channel_type_example' # String | 
store_name = 'store_name_example' # String | 

begin
  # Get product sync status
  result = api_instance.get_product_sync_status(channel_type, store_name)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ChannelsApi->get_product_sync_status: #{e}"
end
```

#### Using the get_product_sync_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ProductSyncStatus>, Integer, Hash)> get_product_sync_status_with_http_info(channel_type, store_name)

```ruby
begin
  # Get product sync status
  data, status_code, headers = api_instance.get_product_sync_status_with_http_info(channel_type, store_name)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ProductSyncStatus>
rescue Flexport::ApiError => e
  puts "Error when calling ChannelsApi->get_product_sync_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **channel_type** | **String** |  |  |
| **store_name** | **String** |  |  |

### Return type

[**ProductSyncStatus**](ProductSyncStatus.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

