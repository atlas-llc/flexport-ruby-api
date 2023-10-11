# Flexport::UnprocessableEntityError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | [**StatusCodesUNPROCESSABLEENTITY**](StatusCodesUNPROCESSABLEENTITY.md) | The HTTP [status code](https://tools.ietf.org/html/rfc7231#section-6) that identifies the category of this problem. |  |
| **type** | **String** | A URI reference that identifies the problem type. When dereferenced, it provides human-readable documentation for one of the problem types documented [here](#section/Errors). |  |
| **title** | **String** | A short, human-readable summary of the problem type. |  |
| **detail** | **String** | A human-readable explanation specific to this occurrence of the problem. | [optional] |
| **instance** | **String** | An internal ID that uniquely identifies this specific occurrence of the problem in our backend system | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::UnprocessableEntityError.new(
  status: null,
  type: null,
  title: null,
  detail: null,
  instance: null
)
```

