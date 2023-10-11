# Flexport::EventsApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_events**](EventsApi.md#get_events) | **GET** /logistics/api/unstable/events |  |


## get_events

> <Array<NetworkEventsEventsResponseItem>> get_events(opts)



Get all events matching certain criteria.  Additional query fields can be passed as filters, e.g. orderId=123&shipmentId=456

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::EventsApi.new
opts = {
  limit: 1.2, # Float | 
  ids: ['inner_example'], # Array<String> | 
  type: 'type_example', # String | 
  order_id: 'order_id_example', # String | 
  shipment_id: 'shipment_id_example', # String | 
  after: Time.parse('2013-10-20T19:20:30+01:00'), # Time | 
  page_info: 'page_info_example' # String | 
}

begin
  
  result = api_instance.get_events(opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling EventsApi->get_events: #{e}"
end
```

#### Using the get_events_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<NetworkEventsEventsResponseItem>>, Integer, Hash)> get_events_with_http_info(opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_events_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<NetworkEventsEventsResponseItem>>
rescue Flexport::ApiError => e
  puts "Error when calling EventsApi->get_events_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Float** |  | [optional][default to 100] |
| **ids** | [**Array&lt;String&gt;**](String.md) |  | [optional] |
| **type** | **String** |  | [optional] |
| **order_id** | **String** |  | [optional] |
| **shipment_id** | **String** |  | [optional] |
| **after** | **Time** |  | [optional] |
| **page_info** | **String** |  | [optional] |

### Return type

[**Array&lt;NetworkEventsEventsResponseItem&gt;**](NetworkEventsEventsResponseItem.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

