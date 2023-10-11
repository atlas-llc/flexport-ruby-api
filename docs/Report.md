# Flexport::Report

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | [**ReportStatus**](ReportStatus.md) | &lt;ol&gt;   &lt;li&gt;PENDING: The report is still being generated&lt;/li&gt;   &lt;li&gt;SUCCESS: Report has been generated, use the url field to download the report as a CSV file&lt;/li&gt;   &lt;li&gt;ERROR: There was an issue while creating this report, see errorMessage field for details&lt;/li&gt; &lt;/ol&gt; |  |
| **url_expiration** | **Time** | date-time of download url expiration in GMT. | [optional] |
| **url** | **String** | download report as a csv using this URL. Note that this URL will expire at the urlExpiration time. | [optional] |
| **error_message** | **String** | If status is ERROR, a description of the error. | [optional] |

## Example

```ruby
require 'flexport'

instance = Flexport::Report.new(
  status: null,
  url_expiration: null,
  url: null,
  error_message: null
)
```

