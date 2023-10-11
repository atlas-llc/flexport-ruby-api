# Flexport::ReportGenerationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **report_type** | [**SellerReportType**](SellerReportType.md) |  |  |
| **start_date** | **Time** | The start date for the data in the report. | [optional] |
| **end_date** | **Time** | The end date for the data in the report. | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::ReportGenerationRequest.new(
  report_type: null,
  start_date: null,
  end_date: null
)
```

