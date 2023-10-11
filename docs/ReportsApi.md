# Flexport::ReportsApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**generate_report**](ReportsApi.md#generate_report) | **POST** /logistics/api/unstable/reports |  |
| [**get_report_status**](ReportsApi.md#get_report_status) | **GET** /logistics/api/unstable/reports/{reportReference} |  |


## generate_report

> <ReportGenerationResponse> generate_report(report_generation_request)



Creates a new report that can be downloaded in CSV format

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ReportsApi.new
report_generation_request = Flexport::ReportGenerationRequest.new({report_type: Flexport::SellerReportType::BILLING_INVOICES}) # ReportGenerationRequest | 

begin
  
  result = api_instance.generate_report(report_generation_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ReportsApi->generate_report: #{e}"
end
```

#### Using the generate_report_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReportGenerationResponse>, Integer, Hash)> generate_report_with_http_info(report_generation_request)

```ruby
begin
  
  data, status_code, headers = api_instance.generate_report_with_http_info(report_generation_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReportGenerationResponse>
rescue Flexport::ApiError => e
  puts "Error when calling ReportsApi->generate_report_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **report_generation_request** | [**ReportGenerationRequest**](ReportGenerationRequest.md) |  |  |

### Return type

[**ReportGenerationResponse**](ReportGenerationResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_report_status

> <Report> get_report_status(report_reference)



Returns a report or report status identified by the reportReference id

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ReportsApi.new
report_reference = 'report_reference_example' # String | 

begin
  
  result = api_instance.get_report_status(report_reference)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ReportsApi->get_report_status: #{e}"
end
```

#### Using the get_report_status_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Report>, Integer, Hash)> get_report_status_with_http_info(report_reference)

```ruby
begin
  
  data, status_code, headers = api_instance.get_report_status_with_http_info(report_reference)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Report>
rescue Flexport::ApiError => e
  puts "Error when calling ReportsApi->get_report_status_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **report_reference** | **String** |  |  |

### Return type

[**Report**](Report.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

