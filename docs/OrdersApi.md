# Flexport::OrdersApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**cancel_order**](OrdersApi.md#cancel_order) | **POST** /logistics/api/unstable/orders/{orderId}/cancel |  |
| [**create_order202307**](OrdersApi.md#create_order202307) | **POST** /logistics/api/unstable/orders | CreateOrder |
| [**get_order**](OrdersApi.md#get_order) | **GET** /logistics/api/unstable/orders/{orderId} |  |
| [**get_order_by_external_id**](OrdersApi.md#get_order_by_external_id) | **GET** /logistics/api/unstable/orders/external_id/{externalOrderId} |  |
| [**retry_order**](OrdersApi.md#retry_order) | **POST** /logistics/api/unstable/orders/{orderId}/retry |  |


## cancel_order

> <OrderModel> cancel_order(order_id)



Cancel an order that was created via the \"Create Order\" endpoint. If an order has already been processed and shipped, the order cannot be cancelled.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::OrdersApi.new
order_id = 'order_id_example' # String | 

begin
  
  result = api_instance.cancel_order(order_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->cancel_order: #{e}"
end
```

#### Using the cancel_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderModel>, Integer, Hash)> cancel_order_with_http_info(order_id)

```ruby
begin
  
  data, status_code, headers = api_instance.cancel_order_with_http_info(order_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderModel>
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->cancel_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_id** | **String** |  |  |

### Return type

[**OrderModel**](OrderModel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_order202307

> <OrderModel> create_order202307(create_order_input202307)

CreateOrder

Create an order to be fulfilled. <P><B>Shipment and Delivery SLAs</B> All orders are assigned a shipping date based on when they were originally placed. All orders are assigned a shipping SLA for expected shipment time and delivery time after being imported. To meet buyer expectations it's vital that this reflects customer expectations when the order is placed.<P> The logic of evaluating the provided field is:<P> <OL> <LI>If the <B>promisedDeliveryByTime</B> field is present and valid, the value will be set as the SLA time <LI>Otherwise, if the <B>deliveryDays</B> value is set and valid, that number of days will be added onto the calculated shipment date to determine the delivery date.</LI> <LI>Otherwise if the <B>shipMethod</B> is present, it will be mapped to a calculated delivery speed, if unrecognized or invalid, the shipping delivery date will be set to 5 days after the shipment date</LI> </OL>

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::OrdersApi.new
create_order_input202307 = Flexport::CreateOrderInput202307.new({address: Flexport::AddressInput.new({address1: 'address1_example', city: 'city_example', country_code: 'country_code_example'}), external_order_id: 'external_order_id_example', line_items: [Flexport::OrderLineItemInput.new({logistics_sku: 'logistics_sku_example', quantity: 3.56})]}) # CreateOrderInput202307 | 

begin
  # CreateOrder
  result = api_instance.create_order202307(create_order_input202307)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->create_order202307: #{e}"
end
```

#### Using the create_order202307_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderModel>, Integer, Hash)> create_order202307_with_http_info(create_order_input202307)

```ruby
begin
  # CreateOrder
  data, status_code, headers = api_instance.create_order202307_with_http_info(create_order_input202307)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderModel>
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->create_order202307_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_order_input202307** | [**CreateOrderInput202307**](CreateOrderInput202307.md) |  |  |

### Return type

[**OrderModel**](OrderModel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_order

> <OrderModel> get_order(order_id)



Returns a FulfillmentOrder resource by ID.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::OrdersApi.new
order_id = 'order_id_example' # String | 

begin
  
  result = api_instance.get_order(order_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->get_order: #{e}"
end
```

#### Using the get_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderModel>, Integer, Hash)> get_order_with_http_info(order_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_order_with_http_info(order_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderModel>
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->get_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_id** | **String** |  |  |

### Return type

[**OrderModel**](OrderModel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_order_by_external_id

> <OrderModel> get_order_by_external_id(external_order_id)



Get order information for an order created via the \"Create order\" endpoint, using the external order ID given during order creation.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::OrdersApi.new
external_order_id = 'external_order_id_example' # String | 

begin
  
  result = api_instance.get_order_by_external_id(external_order_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->get_order_by_external_id: #{e}"
end
```

#### Using the get_order_by_external_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderModel>, Integer, Hash)> get_order_by_external_id_with_http_info(external_order_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_order_by_external_id_with_http_info(external_order_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderModel>
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->get_order_by_external_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **external_order_id** | **String** |  |  |

### Return type

[**OrderModel**](OrderModel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## retry_order

> <OrderModel> retry_order(order_id)



Retries processing of a fulfillment order.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::OrdersApi.new
order_id = 'order_id_example' # String | 

begin
  
  result = api_instance.retry_order(order_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->retry_order: #{e}"
end
```

#### Using the retry_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderModel>, Integer, Hash)> retry_order_with_http_info(order_id)

```ruby
begin
  
  data, status_code, headers = api_instance.retry_order_with_http_info(order_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderModel>
rescue Flexport::ApiError => e
  puts "Error when calling OrdersApi->retry_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_id** | **String** |  |  |

### Return type

[**OrderModel**](OrderModel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

