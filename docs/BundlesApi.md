# Flexport::BundlesApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_bundle**](BundlesApi.md#create_bundle) | **POST** /logistics/api/unstable/bundles |  |
| [**get_bundle**](BundlesApi.md#get_bundle) | **GET** /logistics/api/unstable/bundles/{bundleId} |  |
| [**get_bundle_inventory**](BundlesApi.md#get_bundle_inventory) | **GET** /logistics/api/unstable/bundles/{bundleId}/inventory |  |


## create_bundle

> <ApiBundleResponse> create_bundle(api_bundle)



Creates a new bundle.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::BundlesApi.new
api_bundle = Flexport::ApiBundle.new({external_bundle_id: 'external_bundle_id_example', title: 'title_example', sku: 'sku_example', bundle_contents: [Flexport::BundleContent.new({product_id: 'product_id_example', quantity: 3.56})]}) # ApiBundle | 

begin
  
  result = api_instance.create_bundle(api_bundle)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling BundlesApi->create_bundle: #{e}"
end
```

#### Using the create_bundle_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ApiBundleResponse>, Integer, Hash)> create_bundle_with_http_info(api_bundle)

```ruby
begin
  
  data, status_code, headers = api_instance.create_bundle_with_http_info(api_bundle)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiBundleResponse>
rescue Flexport::ApiError => e
  puts "Error when calling BundlesApi->create_bundle_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **api_bundle** | [**ApiBundle**](ApiBundle.md) |  |  |

### Return type

[**ApiBundleResponse**](ApiBundleResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_bundle

> <ApiBundleResponse> get_bundle(bundle_id)



Get bundle information for a bundle.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::BundlesApi.new
bundle_id = 'bundle_id_example' # String | 

begin
  
  result = api_instance.get_bundle(bundle_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling BundlesApi->get_bundle: #{e}"
end
```

#### Using the get_bundle_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ApiBundleResponse>, Integer, Hash)> get_bundle_with_http_info(bundle_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_bundle_with_http_info(bundle_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiBundleResponse>
rescue Flexport::ApiError => e
  puts "Error when calling BundlesApi->get_bundle_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bundle_id** | **String** |  |  |

### Return type

[**ApiBundleResponse**](ApiBundleResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_bundle_inventory

> <ApiBundleInventoryResponse> get_bundle_inventory(bundle_id)



Get available inventory information for the bundle.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::BundlesApi.new
bundle_id = 'bundle_id_example' # String | 

begin
  
  result = api_instance.get_bundle_inventory(bundle_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling BundlesApi->get_bundle_inventory: #{e}"
end
```

#### Using the get_bundle_inventory_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ApiBundleInventoryResponse>, Integer, Hash)> get_bundle_inventory_with_http_info(bundle_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_bundle_inventory_with_http_info(bundle_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiBundleInventoryResponse>
rescue Flexport::ApiError => e
  puts "Error when calling BundlesApi->get_bundle_inventory_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bundle_id** | **String** |  |  |

### Return type

[**ApiBundleInventoryResponse**](ApiBundleInventoryResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

