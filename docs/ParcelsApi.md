# Flexport::ParcelsApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**cancel_parcel**](ParcelsApi.md#cancel_parcel) | **POST** /logistics/api/unstable/parcels/cancel | Cancel a parcel |
| [**create_bulk_parcel_job**](ParcelsApi.md#create_bulk_parcel_job) | **POST** /logistics/api/unstable/parcels/jobs | Create a bulk parcel job |
| [**create_parcel_v3**](ParcelsApi.md#create_parcel_v3) | **POST** /logistics/api/unstable/parcels | Create a parcel |
| [**get_bulk_parcel_job**](ParcelsApi.md#get_bulk_parcel_job) | **GET** /logistics/api/unstable/parcels/jobs/{id} | Get a Bulk Parcel Job by ID |
| [**get_parcel**](ParcelsApi.md#get_parcel) | **GET** /logistics/api/unstable/parcels/{parcelId} | Get a parcel by ID |
| [**get_parcel_quote_v2**](ParcelsApi.md#get_parcel_quote_v2) | **POST** /logistics/api/unstable/parcels/quote | Get a parcel quote |
| [**get_parcel_tracking**](ParcelsApi.md#get_parcel_tracking) | **GET** /logistics/api/unstable/parcels/{parcelId}/tracking | Get a parcel&#39;s tracking information by Parcel ID |
| [**get_parcel_tracking_by_tracking_code**](ParcelsApi.md#get_parcel_tracking_by_tracking_code) | **GET** /logistics/api/unstable/parcels/tracking/{trackingCode} | Get a parcel&#39;s tracking information by tracking code |
| [**get_tracking_url**](ParcelsApi.md#get_tracking_url) | **GET** /logistics/api/unstable/parcels/{parcelId}/tracking_url | Get the tracking URL for a parcel |


## cancel_parcel

> cancel_parcel(cancel_parcel_request)

Cancel a parcel

Cancels a parcel that was previously created.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ParcelsApi.new
cancel_parcel_request = Flexport::CancelParcelRequest.new({parcel_id: 'parcel_id_example'}) # CancelParcelRequest | 

begin
  # Cancel a parcel
  api_instance.cancel_parcel(cancel_parcel_request)
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->cancel_parcel: #{e}"
end
```

#### Using the cancel_parcel_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> cancel_parcel_with_http_info(cancel_parcel_request)

```ruby
begin
  # Cancel a parcel
  data, status_code, headers = api_instance.cancel_parcel_with_http_info(cancel_parcel_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->cancel_parcel_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cancel_parcel_request** | [**CancelParcelRequest**](CancelParcelRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_bulk_parcel_job

> <BulkParcelJobResponse> create_bulk_parcel_job(body)

Create a bulk parcel job

Create a Bulk Parcel Job.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ParcelsApi.new
body = 3.56 # BulkParcelJobRequest | The bulk parcel job request

begin
  # Create a bulk parcel job
  result = api_instance.create_bulk_parcel_job(body)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->create_bulk_parcel_job: #{e}"
end
```

#### Using the create_bulk_parcel_job_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BulkParcelJobResponse>, Integer, Hash)> create_bulk_parcel_job_with_http_info(body)

```ruby
begin
  # Create a bulk parcel job
  data, status_code, headers = api_instance.create_bulk_parcel_job_with_http_info(body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkParcelJobResponse>
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->create_bulk_parcel_job_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | **BulkParcelJobRequest** | The bulk parcel job request |  |

### Return type

[**BulkParcelJobResponse**](BulkParcelJobResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_parcel_v3

> <Parcel> create_parcel_v3(body)

Create a parcel

Create a parcel and purchase a label for that parcel.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ParcelsApi.new
body = 3.56 # CreateParcelRequestUnstable | 

begin
  # Create a parcel
  result = api_instance.create_parcel_v3(body)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->create_parcel_v3: #{e}"
end
```

#### Using the create_parcel_v3_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Parcel>, Integer, Hash)> create_parcel_v3_with_http_info(body)

```ruby
begin
  # Create a parcel
  data, status_code, headers = api_instance.create_parcel_v3_with_http_info(body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Parcel>
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->create_parcel_v3_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | **CreateParcelRequestUnstable** |  |  |

### Return type

[**Parcel**](Parcel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_bulk_parcel_job

> <BulkParcelJobResponse> get_bulk_parcel_job(id)

Get a Bulk Parcel Job by ID

Fetch the Bulk Parcel Job for the specified ID.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ParcelsApi.new
id = 1.2 # Float | The Bulk Parcel Job ID

begin
  # Get a Bulk Parcel Job by ID
  result = api_instance.get_bulk_parcel_job(id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_bulk_parcel_job: #{e}"
end
```

#### Using the get_bulk_parcel_job_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BulkParcelJobResponse>, Integer, Hash)> get_bulk_parcel_job_with_http_info(id)

```ruby
begin
  # Get a Bulk Parcel Job by ID
  data, status_code, headers = api_instance.get_bulk_parcel_job_with_http_info(id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkParcelJobResponse>
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_bulk_parcel_job_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Float** | The Bulk Parcel Job ID |  |

### Return type

[**BulkParcelJobResponse**](BulkParcelJobResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_parcel

> <Parcel> get_parcel(parcel_id)

Get a parcel by ID

Fetch the parcel with a specified Parcel ID.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ParcelsApi.new
parcel_id = 'parcel_id_example' # String | Unique ID used to track the parcel, returned after acquiring a purchase label.

begin
  # Get a parcel by ID
  result = api_instance.get_parcel(parcel_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_parcel: #{e}"
end
```

#### Using the get_parcel_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Parcel>, Integer, Hash)> get_parcel_with_http_info(parcel_id)

```ruby
begin
  # Get a parcel by ID
  data, status_code, headers = api_instance.get_parcel_with_http_info(parcel_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Parcel>
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_parcel_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **parcel_id** | **String** | Unique ID used to track the parcel, returned after acquiring a purchase label. |  |

### Return type

[**Parcel**](Parcel.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_parcel_quote_v2

> <ParcelQuoteResponse> get_parcel_quote_v2(body)

Get a parcel quote

Fetch a quote for a label purchase without purchasing a label.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ParcelsApi.new
body = 3.56 # CreateQuoteRequest | 

begin
  # Get a parcel quote
  result = api_instance.get_parcel_quote_v2(body)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_parcel_quote_v2: #{e}"
end
```

#### Using the get_parcel_quote_v2_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ParcelQuoteResponse>, Integer, Hash)> get_parcel_quote_v2_with_http_info(body)

```ruby
begin
  # Get a parcel quote
  data, status_code, headers = api_instance.get_parcel_quote_v2_with_http_info(body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ParcelQuoteResponse>
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_parcel_quote_v2_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body** | **CreateQuoteRequest** |  |  |

### Return type

[**ParcelQuoteResponse**](ParcelQuoteResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_parcel_tracking

> <ParcelTracking> get_parcel_tracking(parcel_id)

Get a parcel's tracking information by Parcel ID

Fetch the tracking information for the parcel with the specified Parcel ID.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ParcelsApi.new
parcel_id = 'parcel_id_example' # String | Unique ID used to track the parcel, returned after acquiring a purchase label.

begin
  # Get a parcel's tracking information by Parcel ID
  result = api_instance.get_parcel_tracking(parcel_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_parcel_tracking: #{e}"
end
```

#### Using the get_parcel_tracking_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ParcelTracking>, Integer, Hash)> get_parcel_tracking_with_http_info(parcel_id)

```ruby
begin
  # Get a parcel's tracking information by Parcel ID
  data, status_code, headers = api_instance.get_parcel_tracking_with_http_info(parcel_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ParcelTracking>
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_parcel_tracking_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **parcel_id** | **String** | Unique ID used to track the parcel, returned after acquiring a purchase label. |  |

### Return type

[**ParcelTracking**](ParcelTracking.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_parcel_tracking_by_tracking_code

> <ParcelTracking> get_parcel_tracking_by_tracking_code(tracking_code)

Get a parcel's tracking information by tracking code

Fetch the tracking information for the parcel with a specified tracking code. Only valid for Parcel users.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ParcelsApi.new
tracking_code = 'tracking_code_example' # String | tracking code used to track the parcel

begin
  # Get a parcel's tracking information by tracking code
  result = api_instance.get_parcel_tracking_by_tracking_code(tracking_code)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_parcel_tracking_by_tracking_code: #{e}"
end
```

#### Using the get_parcel_tracking_by_tracking_code_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ParcelTracking>, Integer, Hash)> get_parcel_tracking_by_tracking_code_with_http_info(tracking_code)

```ruby
begin
  # Get a parcel's tracking information by tracking code
  data, status_code, headers = api_instance.get_parcel_tracking_by_tracking_code_with_http_info(tracking_code)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ParcelTracking>
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_parcel_tracking_by_tracking_code_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tracking_code** | **String** | tracking code used to track the parcel |  |

### Return type

[**ParcelTracking**](ParcelTracking.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_tracking_url

> String get_tracking_url(parcel_id)

Get the tracking URL for a parcel

Fetch the tracking URL for a parcel given a Parcel ID.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ParcelsApi.new
parcel_id = 'parcel_id_example' # String | Unique ID used to track the parcel, returned after acquiring a purchase label.

begin
  # Get the tracking URL for a parcel
  result = api_instance.get_tracking_url(parcel_id)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_tracking_url: #{e}"
end
```

#### Using the get_tracking_url_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(String, Integer, Hash)> get_tracking_url_with_http_info(parcel_id)

```ruby
begin
  # Get the tracking URL for a parcel
  data, status_code, headers = api_instance.get_tracking_url_with_http_info(parcel_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => String
rescue Flexport::ApiError => e
  puts "Error when calling ParcelsApi->get_tracking_url_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **parcel_id** | **String** | Unique ID used to track the parcel, returned after acquiring a purchase label. |  |

### Return type

**String**

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

