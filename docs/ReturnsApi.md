# Flexport::ReturnsApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_returns**](ReturnsApi.md#get_returns) | **GET** /logistics/api/unstable/returns |  |
| [**returns_cancel_order**](ReturnsApi.md#returns_cancel_order) | **POST** /logistics/api/unstable/returns/{returnId}/cancel |  |
| [**returns_create_order**](ReturnsApi.md#returns_create_order) | **POST** /logistics/api/unstable/returns |  |
| [**returns_get_order**](ReturnsApi.md#returns_get_order) | **GET** /logistics/api/unstable/returns/{returnId} |  |


## get_returns

> <Array<ReturnsApiOrder>> get_returns(opts)



### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ReturnsApi.new
opts = {
  external_return_id: 'external_return_id_example', # String | 
  rma: 'rma_example', # String | 
  tracking_code: 'tracking_code_example', # String | 
  status: [Flexport::ReturnOrderStatus::CREATED], # Array<ReturnOrderStatus> | 
  limit: 56, # Integer | 
  page_info: 'page_info_example' # String | 
}

begin
  
  result = api_instance.get_returns(opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ReturnsApi->get_returns: #{e}"
end
```

#### Using the get_returns_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ReturnsApiOrder>>, Integer, Hash)> get_returns_with_http_info(opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_returns_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ReturnsApiOrder>>
rescue Flexport::ApiError => e
  puts "Error when calling ReturnsApi->get_returns_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **external_return_id** | **String** |  | [optional] |
| **rma** | **String** |  | [optional] |
| **tracking_code** | **String** |  | [optional] |
| **status** | [**Array&lt;ReturnOrderStatus&gt;**](ReturnOrderStatus.md) |  | [optional] |
| **limit** | **Integer** |  | [optional] |
| **page_info** | **String** |  | [optional] |

### Return type

[**Array&lt;ReturnsApiOrder&gt;**](ReturnsApiOrder.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## returns_cancel_order

> returns_cancel_order(return_id)



Cancel a return that was created. Return will not be cancelled if it is received.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ReturnsApi.new
return_id = 'return_id_example' # String | Unique ID used to track the return.

begin
  
  api_instance.returns_cancel_order(return_id)
rescue Flexport::ApiError => e
  puts "Error when calling ReturnsApi->returns_cancel_order: #{e}"
end
```

#### Using the returns_cancel_order_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> returns_cancel_order_with_http_info(return_id)

```ruby
begin
  
  data, status_code, headers = api_instance.returns_cancel_order_with_http_info(return_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Flexport::ApiError => e
  puts "Error when calling ReturnsApi->returns_cancel_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_id** | **String** | Unique ID used to track the return. |  |

### Return type

nil (empty response body)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## returns_create_order

> <ReturnsApiOrder> returns_create_order(create_return_request)



Creates return order for inspection.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ReturnsApi.new
create_return_request = Flexport::CreateReturnRequest.new({rma: 'rma_example', external_return_id: 'external_return_id_example', return_items: [Flexport::RequestedReturnItem.new({identifier: 'identifier_example', type: Flexport::ReturnItemType::LOGISTICS_SKU, quantity: 3.56})]}) # CreateReturnRequest | 

begin
  
  result = api_instance.returns_create_order(create_return_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ReturnsApi->returns_create_order: #{e}"
end
```

#### Using the returns_create_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReturnsApiOrder>, Integer, Hash)> returns_create_order_with_http_info(create_return_request)

```ruby
begin
  
  data, status_code, headers = api_instance.returns_create_order_with_http_info(create_return_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReturnsApiOrder>
rescue Flexport::ApiError => e
  puts "Error when calling ReturnsApi->returns_create_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_return_request** | [**CreateReturnRequest**](CreateReturnRequest.md) |  |  |

### Return type

[**ReturnsApiOrder**](ReturnsApiOrder.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## returns_get_order

> <ReturnsApiOrder> returns_get_order(return_id)



Get return by returnId. This will include ReturnOrder, ReturnItems with inspection status and ShippingLabel.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ReturnsApi.new
return_id = 1.2 # Float | Unique ID used to track the return.

begin
  
  result = api_instance.returns_get_order(return_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ReturnsApi->returns_get_order: #{e}"
end
```

#### Using the returns_get_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReturnsApiOrder>, Integer, Hash)> returns_get_order_with_http_info(return_id)

```ruby
begin
  
  data, status_code, headers = api_instance.returns_get_order_with_http_info(return_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReturnsApiOrder>
rescue Flexport::ApiError => e
  puts "Error when calling ReturnsApi->returns_get_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_id** | **Float** | Unique ID used to track the return. |  |

### Return type

[**ReturnsApiOrder**](ReturnsApiOrder.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

