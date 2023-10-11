# Flexport::UploadsApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_upload_target**](UploadsApi.md#create_upload_target) | **POST** /logistics/api/unstable/uploads | Create an upload target |


## create_upload_target

> <CreateUploadTargetResponse> create_upload_target(create_upload_target_request)

Create an upload target

Generate presigned form POST data to upload a file for use in other calls

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::UploadsApi.new
create_upload_target_request = Flexport::CreateUploadTargetRequest.new({filename: 'filename_example', file_size: 3.56, mime_type: 'mime_type_example', resource_type: Flexport::ResourceType::CLAIM_PROOF}) # CreateUploadTargetRequest | 

begin
  # Create an upload target
  result = api_instance.create_upload_target(create_upload_target_request)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling UploadsApi->create_upload_target: #{e}"
end
```

#### Using the create_upload_target_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateUploadTargetResponse>, Integer, Hash)> create_upload_target_with_http_info(create_upload_target_request)

```ruby
begin
  # Create an upload target
  data, status_code, headers = api_instance.create_upload_target_with_http_info(create_upload_target_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateUploadTargetResponse>
rescue Flexport::ApiError => e
  puts "Error when calling UploadsApi->create_upload_target_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_upload_target_request** | [**CreateUploadTargetRequest**](CreateUploadTargetRequest.md) |  |  |

### Return type

[**CreateUploadTargetResponse**](CreateUploadTargetResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

