# Flexport::InboundsApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_inbounding_shipment_v4**](InboundsApi.md#create_inbounding_shipment_v4) | **POST** /logistics/api/unstable/inbounds/shipments | Create a shipment |
| [**get_inbounding_shipment_quote_purchase_result**](InboundsApi.md#get_inbounding_shipment_quote_purchase_result) | **GET** /logistics/api/unstable/inbounds/shipments/{shipmentId}/quotes/buy | Get all quotes that have been successfully bought for a shipment |
| [**get_inbounding_shipment_quote_result**](InboundsApi.md#get_inbounding_shipment_quote_result) | **GET** /logistics/api/unstable/inbounds/shipments/{shipmentId}/quotes | Get quotes for a shipment |
| [**get_inbounding_shipment_v4**](InboundsApi.md#get_inbounding_shipment_v4) | **GET** /logistics/api/unstable/inbounds/shipments/{shipmentId} | Get a shipment |
| [**get_inbounding_shipments_v4**](InboundsApi.md#get_inbounding_shipments_v4) | **GET** /logistics/api/unstable/inbounds/shipments | Get a list of shipments |
| [**get_transfer_document_v2**](InboundsApi.md#get_transfer_document_v2) | **GET** /logistics/api/unstable/inbounds/shipments/{shipmentId}/document | Request document for a shipment |
| [**init_quote_process_for_inbounding_shipment_v2**](InboundsApi.md#init_quote_process_for_inbounding_shipment_v2) | **POST** /logistics/api/unstable/inbounds/shipments/{shipmentId}/quotes | Begin asynchronous request quotes for a shipment |
| [**init_quote_purchase_process_for_inbounding_shipment_v2**](InboundsApi.md#init_quote_purchase_process_for_inbounding_shipment_v2) | **POST** /logistics/api/unstable/inbounds/shipments/{shipmentId}/quotes/buy | Begin asynchronous request to buy a quote for a shipment |
| [**update_inbounding_shipment_v3**](InboundsApi.md#update_inbounding_shipment_v3) | **PATCH** /logistics/api/unstable/inbounds/shipments/{shipmentId}/update | Update a shipment |


## create_inbounding_shipment_v4

> <InboundShipmentResponseV4> create_inbounding_shipment_v4(create_inbound_shipment_request_v4)

Create a shipment

Create an inbounding shipment.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::InboundsApi.new
create_inbound_shipment_request_v4 = Flexport::CreateInboundShipmentRequestV4.new({from: Flexport::InboundAddress.new({address1: 'address1_example', city: 'city_example', country_code: Flexport::CountryCode::AF, province_code: 'province_code_example', zip: 'zip_example'}), prep: Flexport::PrepRequestData.new({box_content_labels: false})}) # CreateInboundShipmentRequestV4 | 

begin
  # Create a shipment
  result = api_instance.create_inbounding_shipment_v4(create_inbound_shipment_request_v4)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->create_inbounding_shipment_v4: #{e}"
end
```

#### Using the create_inbounding_shipment_v4_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<InboundShipmentResponseV4>, Integer, Hash)> create_inbounding_shipment_v4_with_http_info(create_inbound_shipment_request_v4)

```ruby
begin
  # Create a shipment
  data, status_code, headers = api_instance.create_inbounding_shipment_v4_with_http_info(create_inbound_shipment_request_v4)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <InboundShipmentResponseV4>
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->create_inbounding_shipment_v4_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_inbound_shipment_request_v4** | [**CreateInboundShipmentRequestV4**](CreateInboundShipmentRequestV4.md) |  |  |

### Return type

[**InboundShipmentResponseV4**](InboundShipmentResponseV4.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_inbounding_shipment_quote_purchase_result

> <QuoteResultResponse> get_inbounding_shipment_quote_purchase_result(shipment_id, opts)

Get all quotes that have been successfully bought for a shipment

Get result of asynchronous request to buy quotes. Returns quotes once asynchronous request is complete.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::InboundsApi.new
shipment_id = 56 # Integer | 
opts = {
  shipping_option: Flexport::InboundShippingOption::SPD_EXTERNAL # InboundShippingOption | 
}

begin
  # Get all quotes that have been successfully bought for a shipment
  result = api_instance.get_inbounding_shipment_quote_purchase_result(shipment_id, opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_inbounding_shipment_quote_purchase_result: #{e}"
end
```

#### Using the get_inbounding_shipment_quote_purchase_result_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<QuoteResultResponse>, Integer, Hash)> get_inbounding_shipment_quote_purchase_result_with_http_info(shipment_id, opts)

```ruby
begin
  # Get all quotes that have been successfully bought for a shipment
  data, status_code, headers = api_instance.get_inbounding_shipment_quote_purchase_result_with_http_info(shipment_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <QuoteResultResponse>
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_inbounding_shipment_quote_purchase_result_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **shipment_id** | **Integer** |  |  |
| **shipping_option** | [**InboundShippingOption**](.md) |  | [optional] |

### Return type

[**QuoteResultResponse**](QuoteResultResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_inbounding_shipment_quote_result

> <QuoteResultResponse> get_inbounding_shipment_quote_result(shipment_id, opts)

Get quotes for a shipment

Get result of asynchronous request for quotes. Returns quotes once asynchronous request is complete.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::InboundsApi.new
shipment_id = 56 # Integer | 
opts = {
  shipping_option: Flexport::InboundShippingOption::SPD_EXTERNAL # InboundShippingOption | 
}

begin
  # Get quotes for a shipment
  result = api_instance.get_inbounding_shipment_quote_result(shipment_id, opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_inbounding_shipment_quote_result: #{e}"
end
```

#### Using the get_inbounding_shipment_quote_result_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<QuoteResultResponse>, Integer, Hash)> get_inbounding_shipment_quote_result_with_http_info(shipment_id, opts)

```ruby
begin
  # Get quotes for a shipment
  data, status_code, headers = api_instance.get_inbounding_shipment_quote_result_with_http_info(shipment_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <QuoteResultResponse>
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_inbounding_shipment_quote_result_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **shipment_id** | **Integer** |  |  |
| **shipping_option** | [**InboundShippingOption**](.md) |  | [optional] |

### Return type

[**QuoteResultResponse**](QuoteResultResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_inbounding_shipment_v4

> <InboundShipmentResponseV4> get_inbounding_shipment_v4(shipment_id)

Get a shipment

Get an inbounding shipment.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::InboundsApi.new
shipment_id = 56 # Integer | 

begin
  # Get a shipment
  result = api_instance.get_inbounding_shipment_v4(shipment_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_inbounding_shipment_v4: #{e}"
end
```

#### Using the get_inbounding_shipment_v4_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<InboundShipmentResponseV4>, Integer, Hash)> get_inbounding_shipment_v4_with_http_info(shipment_id)

```ruby
begin
  # Get a shipment
  data, status_code, headers = api_instance.get_inbounding_shipment_v4_with_http_info(shipment_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <InboundShipmentResponseV4>
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_inbounding_shipment_v4_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **shipment_id** | **Integer** |  |  |

### Return type

[**InboundShipmentResponseV4**](InboundShipmentResponseV4.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_inbounding_shipments_v4

> <Array<InboundShipmentResponseV4>> get_inbounding_shipments_v4(shipment_ids)

Get a list of shipments

Get inbounding shipments based on the provided shipmentIds.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::InboundsApi.new
shipment_ids = [37] # Array<Integer> | 

begin
  # Get a list of shipments
  result = api_instance.get_inbounding_shipments_v4(shipment_ids)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_inbounding_shipments_v4: #{e}"
end
```

#### Using the get_inbounding_shipments_v4_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<InboundShipmentResponseV4>>, Integer, Hash)> get_inbounding_shipments_v4_with_http_info(shipment_ids)

```ruby
begin
  # Get a list of shipments
  data, status_code, headers = api_instance.get_inbounding_shipments_v4_with_http_info(shipment_ids)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<InboundShipmentResponseV4>>
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_inbounding_shipments_v4_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **shipment_ids** | [**Array&lt;Integer&gt;**](Integer.md) |  |  |

### Return type

[**Array&lt;InboundShipmentResponseV4&gt;**](InboundShipmentResponseV4.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_transfer_document_v2

> <DocumentResponse> get_transfer_document_v2(shipment_id, document_option, document_format)

Request document for a shipment

Request document for an inbounding shipment.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::InboundsApi.new
shipment_id = 56 # Integer | 
document_option = 'document_option_example' # String | 
document_format = 'document_format_example' # String | 

begin
  # Request document for a shipment
  result = api_instance.get_transfer_document_v2(shipment_id, document_option, document_format)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_transfer_document_v2: #{e}"
end
```

#### Using the get_transfer_document_v2_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DocumentResponse>, Integer, Hash)> get_transfer_document_v2_with_http_info(shipment_id, document_option, document_format)

```ruby
begin
  # Request document for a shipment
  data, status_code, headers = api_instance.get_transfer_document_v2_with_http_info(shipment_id, document_option, document_format)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DocumentResponse>
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->get_transfer_document_v2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **shipment_id** | **Integer** |  |  |
| **document_option** | **String** |  |  |
| **document_format** | **String** |  |  |

### Return type

[**DocumentResponse**](DocumentResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## init_quote_process_for_inbounding_shipment_v2

> <InboundRateQuoteResult> init_quote_process_for_inbounding_shipment_v2(shipment_id, opts)

Begin asynchronous request quotes for a shipment

Asynchronous endpoint for starting a request for quotes on an inbounding shipment. Returns success if request was accepted.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::InboundsApi.new
shipment_id = 56 # Integer | 
opts = {
  shipping_option: Flexport::InboundShippingOption::SPD_EXTERNAL # InboundShippingOption | 
}

begin
  # Begin asynchronous request quotes for a shipment
  result = api_instance.init_quote_process_for_inbounding_shipment_v2(shipment_id, opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->init_quote_process_for_inbounding_shipment_v2: #{e}"
end
```

#### Using the init_quote_process_for_inbounding_shipment_v2_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<InboundRateQuoteResult>, Integer, Hash)> init_quote_process_for_inbounding_shipment_v2_with_http_info(shipment_id, opts)

```ruby
begin
  # Begin asynchronous request quotes for a shipment
  data, status_code, headers = api_instance.init_quote_process_for_inbounding_shipment_v2_with_http_info(shipment_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <InboundRateQuoteResult>
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->init_quote_process_for_inbounding_shipment_v2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **shipment_id** | **Integer** |  |  |
| **shipping_option** | [**InboundShippingOption**](.md) |  | [optional] |

### Return type

[**InboundRateQuoteResult**](InboundRateQuoteResult.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## init_quote_purchase_process_for_inbounding_shipment_v2

> <InboundRateBuyResultV2> init_quote_purchase_process_for_inbounding_shipment_v2(shipment_id, purchase_quotes_request)

Begin asynchronous request to buy a quote for a shipment

Asynchronous endpoint for starting a request to buy quotes on an inbounding shipment. Returns success if request was accepted.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::InboundsApi.new
shipment_id = 56 # Integer | 
purchase_quotes_request = Flexport::PurchaseQuotesRequest.new({quote_ids: [37]}) # PurchaseQuotesRequest | 

begin
  # Begin asynchronous request to buy a quote for a shipment
  result = api_instance.init_quote_purchase_process_for_inbounding_shipment_v2(shipment_id, purchase_quotes_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->init_quote_purchase_process_for_inbounding_shipment_v2: #{e}"
end
```

#### Using the init_quote_purchase_process_for_inbounding_shipment_v2_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<InboundRateBuyResultV2>, Integer, Hash)> init_quote_purchase_process_for_inbounding_shipment_v2_with_http_info(shipment_id, purchase_quotes_request)

```ruby
begin
  # Begin asynchronous request to buy a quote for a shipment
  data, status_code, headers = api_instance.init_quote_purchase_process_for_inbounding_shipment_v2_with_http_info(shipment_id, purchase_quotes_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <InboundRateBuyResultV2>
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->init_quote_purchase_process_for_inbounding_shipment_v2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **shipment_id** | **Integer** |  |  |
| **purchase_quotes_request** | [**PurchaseQuotesRequest**](PurchaseQuotesRequest.md) |  |  |

### Return type

[**InboundRateBuyResultV2**](InboundRateBuyResultV2.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_inbounding_shipment_v3

> <InboundShipmentResponseV3> update_inbounding_shipment_v3(shipment_id, update_inbound_shipment_request_v3)

Update a shipment

Update an inbounding shipment.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::InboundsApi.new
shipment_id = 56 # Integer | 
update_inbound_shipment_request_v3 = Flexport::UpdateInboundShipmentRequestV3.new # UpdateInboundShipmentRequestV3 | 

begin
  # Update a shipment
  result = api_instance.update_inbounding_shipment_v3(shipment_id, update_inbound_shipment_request_v3)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->update_inbounding_shipment_v3: #{e}"
end
```

#### Using the update_inbounding_shipment_v3_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<InboundShipmentResponseV3>, Integer, Hash)> update_inbounding_shipment_v3_with_http_info(shipment_id, update_inbound_shipment_request_v3)

```ruby
begin
  # Update a shipment
  data, status_code, headers = api_instance.update_inbounding_shipment_v3_with_http_info(shipment_id, update_inbound_shipment_request_v3)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <InboundShipmentResponseV3>
rescue Flexport::ApiError => e
  puts "Error when calling InboundsApi->update_inbounding_shipment_v3_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **shipment_id** | **Integer** |  |  |
| **update_inbound_shipment_request_v3** | [**UpdateInboundShipmentRequestV3**](UpdateInboundShipmentRequestV3.md) |  |  |

### Return type

[**InboundShipmentResponseV3**](InboundShipmentResponseV3.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

