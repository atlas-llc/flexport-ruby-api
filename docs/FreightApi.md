# Flexport::FreightApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**cancel**](FreightApi.md#cancel) | **POST** /logistics/api/unstable/freight/orders/{orderId}/cancel | Cancel an order |
| [**create_containers_order**](FreightApi.md#create_containers_order) | **POST** /logistics/api/unstable/freight/orders/containers | Book a drayage shipment |
| [**create_containers_quote**](FreightApi.md#create_containers_quote) | **POST** /logistics/api/unstable/freight/quotes/containers | Create a Drayage quote |
| [**create_pallets_order**](FreightApi.md#create_pallets_order) | **POST** /logistics/api/unstable/freight/orders/pallets | Book an LTL shipment |
| [**create_pallets_quote**](FreightApi.md#create_pallets_quote) | **POST** /logistics/api/unstable/freight/quotes/pallets | Create an LTL quote |
| [**create_truck_quote**](FreightApi.md#create_truck_quote) | **POST** /logistics/api/unstable/freight/quotes/trucks | Create an FTL quote |
| [**create_trucks_order**](FreightApi.md#create_trucks_order) | **POST** /logistics/api/unstable/freight/orders/trucks | Book an FTL shipment |
| [**get_bol_tracking**](FreightApi.md#get_bol_tracking) | **GET** /logistics/api/unstable/freight/tracking_events/{bolId} | Returns freight tracking events |
| [**get_freight_order**](FreightApi.md#get_freight_order) | **GET** /logistics/api/unstable/freight/orders/{orderId} | Get order by ID |
| [**get_freight_orders**](FreightApi.md#get_freight_orders) | **GET** /logistics/api/unstable/freight/orders | Get all orders |
| [**get_freight_ports**](FreightApi.md#get_freight_ports) | **GET** /logistics/api/unstable/freight/ports | Get all ports |
| [**get_order_documents**](FreightApi.md#get_order_documents) | **GET** /logistics/api/unstable/freight/orders/{orderId}/documents | Get documents for an order |
| [**get_quote**](FreightApi.md#get_quote) | **GET** /logistics/api/unstable/freight/quotes/{quoteId} | Get quote by ID |
| [**get_quotes**](FreightApi.md#get_quotes) | **GET** /logistics/api/unstable/freight/quotes | Get all quotes |


## cancel

> cancel(order_id, order_cancel_request)

Cancel an order

Cancel an order, optionally provide a cancellation reason

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
order_id = 1.2 # Float | 
order_cancel_request = Flexport::OrderCancelRequest.new # OrderCancelRequest | 

begin
  # Cancel an order
  api_instance.cancel(order_id, order_cancel_request)
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->cancel: #{e}"
end
```

#### Using the cancel_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> cancel_with_http_info(order_id, order_cancel_request)

```ruby
begin
  # Cancel an order
  data, status_code, headers = api_instance.cancel_with_http_info(order_id, order_cancel_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->cancel_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_id** | **Float** |  |  |
| **order_cancel_request** | [**OrderCancelRequest**](OrderCancelRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_containers_order

> <DrayageOrderResponse> create_containers_order(drayage_order_request)

Book a drayage shipment

Book a shipment using an existing drayage Quote to create a drayage Order. Make use of the Uploads API before calling this endpoint to upload and obtain S3 keys for the delivery order and packing list documents. Valid `portId` values can be obtained and selected from the \"Get all ports\" Freight API.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
drayage_order_request = Flexport::DrayageOrderRequest.new({container_id: 'container_id_example', delivery_details: Flexport::OrderDeliveryDetails.new({address: Flexport::FreightAddress.new({street1: 'street1_example', city: 'city_example', zip: 'zip_example', state: 'state_example', country: 'country_example'}), contact: Flexport::Contact.new({first_name: 'first_name_example', last_name: 'last_name_example', phone: 'phone_example', email: 'email_example'})}), delivery_order_document_key: 'delivery_order_document_key_example', master_bol_id: 'master_bol_id_example', packing_list_document_key: 'packing_list_document_key_example', port_id: 'port_id_example', quote_id: 3.56}) # DrayageOrderRequest | 

begin
  # Book a drayage shipment
  result = api_instance.create_containers_order(drayage_order_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_containers_order: #{e}"
end
```

#### Using the create_containers_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DrayageOrderResponse>, Integer, Hash)> create_containers_order_with_http_info(drayage_order_request)

```ruby
begin
  # Book a drayage shipment
  data, status_code, headers = api_instance.create_containers_order_with_http_info(drayage_order_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DrayageOrderResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_containers_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **drayage_order_request** | [**DrayageOrderRequest**](DrayageOrderRequest.md) |  |  |

### Return type

[**DrayageOrderResponse**](DrayageOrderResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_containers_quote

> <DrayageQuoteResponse> create_containers_quote(drayage_quote_request)

Create a Drayage quote

Request a quote for a shipment where the goods being transported begin inside a shipping container at a port. If the total distance is over a certain threshold, transload and FTL items will be added to complete the journey.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
drayage_quote_request = Flexport::DrayageQuoteRequest.new({delivery_details: Flexport::QuoteLocationDetails.new({zip: 'zip_example'}), pickup_details: Flexport::QuoteLocationDetails.new({zip: 'zip_example'})}) # DrayageQuoteRequest | 

begin
  # Create a Drayage quote
  result = api_instance.create_containers_quote(drayage_quote_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_containers_quote: #{e}"
end
```

#### Using the create_containers_quote_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DrayageQuoteResponse>, Integer, Hash)> create_containers_quote_with_http_info(drayage_quote_request)

```ruby
begin
  # Create a Drayage quote
  data, status_code, headers = api_instance.create_containers_quote_with_http_info(drayage_quote_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DrayageQuoteResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_containers_quote_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **drayage_quote_request** | [**DrayageQuoteRequest**](DrayageQuoteRequest.md) |  |  |

### Return type

[**DrayageQuoteResponse**](DrayageQuoteResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_pallets_order

> <LtlOrderResponse> create_pallets_order(ltl_order_request)

Book an LTL shipment

Book a shipment using an existing LTL Quote to create an LTL Order

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
ltl_order_request = Flexport::LtlOrderRequest.new({delivery_details: Flexport::OrderDeliveryDetails.new({address: Flexport::FreightAddress.new({street1: 'street1_example', city: 'city_example', zip: 'zip_example', state: 'state_example', country: 'country_example'}), contact: Flexport::Contact.new({first_name: 'first_name_example', last_name: 'last_name_example', phone: 'phone_example', email: 'email_example'})}), quote_id: 3.56, pallets: [Flexport::PackageDetails.new({pallet_count: 3.56, length: 3.56, width: 3.56, height: 3.56, weight: 3.56})], pickup_details: Flexport::OrderPickupDetails.new({cargo_ready_date: Time.now, address: Flexport::FreightAddress.new({street1: 'street1_example', city: 'city_example', zip: 'zip_example', state: 'state_example', country: 'country_example'}), contact: Flexport::Contact.new({first_name: 'first_name_example', last_name: 'last_name_example', phone: 'phone_example', email: 'email_example'})})}) # LtlOrderRequest | 

begin
  # Book an LTL shipment
  result = api_instance.create_pallets_order(ltl_order_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_pallets_order: #{e}"
end
```

#### Using the create_pallets_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<LtlOrderResponse>, Integer, Hash)> create_pallets_order_with_http_info(ltl_order_request)

```ruby
begin
  # Book an LTL shipment
  data, status_code, headers = api_instance.create_pallets_order_with_http_info(ltl_order_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <LtlOrderResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_pallets_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ltl_order_request** | [**LtlOrderRequest**](LtlOrderRequest.md) |  |  |

### Return type

[**LtlOrderResponse**](LtlOrderResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_pallets_quote

> <LtlQuoteResponse> create_pallets_quote(quote_request)

Create an LTL quote

Request a quote for a shipment where the goods don't require to occupy the entire truck space.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
quote_request = Flexport::QuoteRequest.new({pallet_count: 3.56, pickup_details: Flexport::QuoteLocationDetails.new({zip: 'zip_example'}), delivery_details: Flexport::QuoteLocationDetails.new({zip: 'zip_example'})}) # QuoteRequest | 

begin
  # Create an LTL quote
  result = api_instance.create_pallets_quote(quote_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_pallets_quote: #{e}"
end
```

#### Using the create_pallets_quote_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<LtlQuoteResponse>, Integer, Hash)> create_pallets_quote_with_http_info(quote_request)

```ruby
begin
  # Create an LTL quote
  data, status_code, headers = api_instance.create_pallets_quote_with_http_info(quote_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <LtlQuoteResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_pallets_quote_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **quote_request** | [**QuoteRequest**](QuoteRequest.md) |  |  |

### Return type

[**LtlQuoteResponse**](LtlQuoteResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_truck_quote

> <FtlQuoteResponse> create_truck_quote(quote_request)

Create an FTL quote

Request a quote of a truck regardless if the goods occupy the entire space or not.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
quote_request = Flexport::QuoteRequest.new({pallet_count: 3.56, pickup_details: Flexport::QuoteLocationDetails.new({zip: 'zip_example'}), delivery_details: Flexport::QuoteLocationDetails.new({zip: 'zip_example'})}) # QuoteRequest | 

begin
  # Create an FTL quote
  result = api_instance.create_truck_quote(quote_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_truck_quote: #{e}"
end
```

#### Using the create_truck_quote_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FtlQuoteResponse>, Integer, Hash)> create_truck_quote_with_http_info(quote_request)

```ruby
begin
  # Create an FTL quote
  data, status_code, headers = api_instance.create_truck_quote_with_http_info(quote_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FtlQuoteResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_truck_quote_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **quote_request** | [**QuoteRequest**](QuoteRequest.md) |  |  |

### Return type

[**FtlQuoteResponse**](FtlQuoteResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_trucks_order

> <FtlOrderResponse> create_trucks_order(ftl_order_request)

Book an FTL shipment

Book a shipment using an existing FTL Quote to create an FTL Order

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
ftl_order_request = Flexport::FtlOrderRequest.new({total_weight: 3.56, pallet_count: 3.56, delivery_details: Flexport::OrderDeliveryDetails.new({address: Flexport::FreightAddress.new({street1: 'street1_example', city: 'city_example', zip: 'zip_example', state: 'state_example', country: 'country_example'}), contact: Flexport::Contact.new({first_name: 'first_name_example', last_name: 'last_name_example', phone: 'phone_example', email: 'email_example'})}), quote_id: 3.56, pickup_details: Flexport::OrderPickupDetails.new({cargo_ready_date: Time.now, address: Flexport::FreightAddress.new({street1: 'street1_example', city: 'city_example', zip: 'zip_example', state: 'state_example', country: 'country_example'}), contact: Flexport::Contact.new({first_name: 'first_name_example', last_name: 'last_name_example', phone: 'phone_example', email: 'email_example'})})}) # FtlOrderRequest | 

begin
  # Book an FTL shipment
  result = api_instance.create_trucks_order(ftl_order_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_trucks_order: #{e}"
end
```

#### Using the create_trucks_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FtlOrderResponse>, Integer, Hash)> create_trucks_order_with_http_info(ftl_order_request)

```ruby
begin
  # Book an FTL shipment
  data, status_code, headers = api_instance.create_trucks_order_with_http_info(ftl_order_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FtlOrderResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->create_trucks_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ftl_order_request** | [**FtlOrderRequest**](FtlOrderRequest.md) |  |  |

### Return type

[**FtlOrderResponse**](FtlOrderResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_bol_tracking

> <FreightTrackingInfo> get_bol_tracking(bol_id)

Returns freight tracking events

Returns tracking events associated to a bol id.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'

  # Configure API key authorization: TOKEN
  config.api_key['TOKEN'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['TOKEN'] = 'Bearer'
end

api_instance = Flexport::FreightApi.new
bol_id = 'bol_id_example' # String | 

begin
  # Returns freight tracking events
  result = api_instance.get_bol_tracking(bol_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_bol_tracking: #{e}"
end
```

#### Using the get_bol_tracking_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<FreightTrackingInfo>, Integer, Hash)> get_bol_tracking_with_http_info(bol_id)

```ruby
begin
  # Returns freight tracking events
  data, status_code, headers = api_instance.get_bol_tracking_with_http_info(bol_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <FreightTrackingInfo>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_bol_tracking_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bol_id** | **String** |  |  |

### Return type

[**FreightTrackingInfo**](FreightTrackingInfo.md)

### Authorization

[BEARER](../README.md#BEARER), [TOKEN](../README.md#TOKEN)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_freight_order

> <OrderResponse> get_freight_order(order_id)

Get order by ID

Retrieve the order specified by the orderId.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
order_id = 1.2 # Float | 

begin
  # Get order by ID
  result = api_instance.get_freight_order(order_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_freight_order: #{e}"
end
```

#### Using the get_freight_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderResponse>, Integer, Hash)> get_freight_order_with_http_info(order_id)

```ruby
begin
  # Get order by ID
  data, status_code, headers = api_instance.get_freight_order_with_http_info(order_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_freight_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_id** | **Float** |  |  |

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_freight_orders

> <GetOrdersResponse> get_freight_orders(opts)

Get all orders

Retrieve all orders for the account.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
opts = {
  limit: 1.2, # Float | 
  cursor: 1.2, # Float | 
  direction: Flexport::ListDirection::FORWARD # ListDirection | 
}

begin
  # Get all orders
  result = api_instance.get_freight_orders(opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_freight_orders: #{e}"
end
```

#### Using the get_freight_orders_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetOrdersResponse>, Integer, Hash)> get_freight_orders_with_http_info(opts)

```ruby
begin
  # Get all orders
  data, status_code, headers = api_instance.get_freight_orders_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetOrdersResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_freight_orders_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Float** |  | [optional] |
| **cursor** | **Float** |  | [optional] |
| **direction** | [**ListDirection**](.md) |  | [optional] |

### Return type

[**GetOrdersResponse**](GetOrdersResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_freight_ports

> <GetPortsResponse> get_freight_ports

Get all ports

Retrieve all available drayage ports. The ID of the Port objects here should be passed in when using our API to book a drayage shipment.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new

begin
  # Get all ports
  result = api_instance.get_freight_ports
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_freight_ports: #{e}"
end
```

#### Using the get_freight_ports_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetPortsResponse>, Integer, Hash)> get_freight_ports_with_http_info

```ruby
begin
  # Get all ports
  data, status_code, headers = api_instance.get_freight_ports_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetPortsResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_freight_ports_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetPortsResponse**](GetPortsResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_order_documents

> <GetOrderDocumentsResponse> get_order_documents(order_id)

Get documents for an order

Retrieve the documents associated with an Order using orderId.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
order_id = 1.2 # Float | 

begin
  # Get documents for an order
  result = api_instance.get_order_documents(order_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_order_documents: #{e}"
end
```

#### Using the get_order_documents_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetOrderDocumentsResponse>, Integer, Hash)> get_order_documents_with_http_info(order_id)

```ruby
begin
  # Get documents for an order
  data, status_code, headers = api_instance.get_order_documents_with_http_info(order_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetOrderDocumentsResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_order_documents_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_id** | **Float** |  |  |

### Return type

[**GetOrderDocumentsResponse**](GetOrderDocumentsResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_quote

> <QuoteResponse> get_quote(quote_id)

Get quote by ID

Retrieve the quote specified by the quoteId.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
quote_id = 1.2 # Float | 

begin
  # Get quote by ID
  result = api_instance.get_quote(quote_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_quote: #{e}"
end
```

#### Using the get_quote_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<QuoteResponse>, Integer, Hash)> get_quote_with_http_info(quote_id)

```ruby
begin
  # Get quote by ID
  data, status_code, headers = api_instance.get_quote_with_http_info(quote_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <QuoteResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_quote_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **quote_id** | **Float** |  |  |

### Return type

[**QuoteResponse**](QuoteResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_quotes

> <GetQuotesResponse> get_quotes(opts)

Get all quotes

Retrieve all quotes for the account.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::FreightApi.new
opts = {
  limit: 1.2, # Float | 
  cursor: 1.2, # Float | 
  direction: Flexport::ListDirection::FORWARD # ListDirection | 
}

begin
  # Get all quotes
  result = api_instance.get_quotes(opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_quotes: #{e}"
end
```

#### Using the get_quotes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetQuotesResponse>, Integer, Hash)> get_quotes_with_http_info(opts)

```ruby
begin
  # Get all quotes
  data, status_code, headers = api_instance.get_quotes_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetQuotesResponse>
rescue Flexport::ApiError => e
  puts "Error when calling FreightApi->get_quotes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Float** |  | [optional] |
| **cursor** | **Float** |  | [optional] |
| **direction** | [**ListDirection**](.md) |  | [optional] |

### Return type

[**GetQuotesResponse**](GetQuotesResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

