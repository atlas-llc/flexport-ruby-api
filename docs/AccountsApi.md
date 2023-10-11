# Flexport::AccountsApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_logistics_account_standing_status**](AccountsApi.md#get_logistics_account_standing_status) | **GET** /logistics/api/unstable/accounts/status | Get logistics account standing status |


## get_logistics_account_standing_status

> <AccountStandingStatusOutput> get_logistics_account_standing_status

Get logistics account standing status

Get Logistics Account Standing Status

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::AccountsApi.new

begin
  # Get logistics account standing status
  result = api_instance.get_logistics_account_standing_status
  p result
rescue Flexport::ApiError => e
  puts "Error when calling AccountsApi->get_logistics_account_standing_status: #{e}"
end
```

#### Using the get_logistics_account_standing_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AccountStandingStatusOutput>, Integer, Hash)> get_logistics_account_standing_status_with_http_info

```ruby
begin
  # Get logistics account standing status
  data, status_code, headers = api_instance.get_logistics_account_standing_status_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AccountStandingStatusOutput>
rescue Flexport::ApiError => e
  puts "Error when calling AccountsApi->get_logistics_account_standing_status_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AccountStandingStatusOutput**](AccountStandingStatusOutput.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

