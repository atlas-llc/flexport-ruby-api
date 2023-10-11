# Flexport::CreateUploadTargetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **filename** | **String** | The original name of the file. |  |
| **file_size** | **Float** | The size of the file in bytes. |  |
| **mime_type** | **String** | The MIME type of the file being uploaded. |  |
| **resource_type** | [**ResourceType**](ResourceType.md) | The type of document or resource being uploaded. |  |

## Example

```ruby
require 'flexport'

instance = Flexport::CreateUploadTargetRequest.new(
  filename: null,
  file_size: null,
  mime_type: null,
  resource_type: null
)
```

