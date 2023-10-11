# Flexport::OAuthApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**authorization_redirect**](OAuthApi.md#authorization_redirect) | **GET** /logistics/api/unstable/oauth/authorize |  |
| [**token_exchange**](OAuthApi.md#token_exchange) | **POST** /logistics/api/unstable/oauth/token |  |


## authorization_redirect

> authorization_redirect(response_type, client_id, scope, opts)



Initiates OAuth authorization code grant flow per https://www.rfc-editor.org/rfc/rfc6749#section-1.3.1.  The flow involves an interactive login.  On successful login and authorization you receive a call back with a code that can only be used once.  Using the TokenExchange endpoint the code can be exchanged for an access token that does not expire.  Access token can be used to access Logistics API by passing the \"Authorization: Bearer\" header per https://www.rfc-editor.org/rfc/rfc6750#section-2.1

### Examples

```ruby
require 'time'
require 'flexport'

api_instance = Flexport::OAuthApi.new
response_type = 'code' # String | 
client_id = 'client_id_example' # String | Must be set to <i>identity</i> to create an API token tied to your Shopify Logistics Seller Portal user identity.
scope = 'scope_example' # String | The scope of the authorization request.  Multiple scopes may be provided, separated by ' '. Possible scope values are: read_logistics_products write_logistics_products read_logistics_reports write_logistics_reports read_logistics_bundles write_logistics_bundles read_logistics_orders write_logistics_orders read_logistics_webhooks write_logistics_webhooks read_logistics_parcels write_logistics_parcels read_logistics_returns write_logistics_returns read_logistics_freight write_logistics_freight read_logistics_events read_logistics_inbounds write_logistics_inbounds
opts = {
  redirect_uri: 'redirect_uri_example', # String | Optional. OAuth flow redirects to the redirect_uri after successful authentication with the one-time use \"code\" passed as query parameter. If <i>identity</i> client_id is used, redirect is to the Shopify Logistics Seller Portal UI page.
  state: 'state_example', # String | An opaque value used by the client to maintain state between the request and callback.  The authorization server includes this value when redirecting the user-agent back to the client.
  auth_flow: Flexport::AuthFlow::HOSTED_UI # AuthFlow | Reserved for use by partners.
}

begin
  
  api_instance.authorization_redirect(response_type, client_id, scope, opts)
rescue Flexport::ApiError => e
  puts "Error when calling OAuthApi->authorization_redirect: #{e}"
end
```

#### Using the authorization_redirect_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> authorization_redirect_with_http_info(response_type, client_id, scope, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.authorization_redirect_with_http_info(response_type, client_id, scope, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Flexport::ApiError => e
  puts "Error when calling OAuthApi->authorization_redirect_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **response_type** | **String** |  |  |
| **client_id** | **String** | Must be set to &lt;i&gt;identity&lt;/i&gt; to create an API token tied to your Shopify Logistics Seller Portal user identity. |  |
| **scope** | **String** | The scope of the authorization request.  Multiple scopes may be provided, separated by &#39; &#39;. Possible scope values are: read_logistics_products write_logistics_products read_logistics_reports write_logistics_reports read_logistics_bundles write_logistics_bundles read_logistics_orders write_logistics_orders read_logistics_webhooks write_logistics_webhooks read_logistics_parcels write_logistics_parcels read_logistics_returns write_logistics_returns read_logistics_freight write_logistics_freight read_logistics_events read_logistics_inbounds write_logistics_inbounds |  |
| **redirect_uri** | **String** | Optional. OAuth flow redirects to the redirect_uri after successful authentication with the one-time use \&quot;code\&quot; passed as query parameter. If &lt;i&gt;identity&lt;/i&gt; client_id is used, redirect is to the Shopify Logistics Seller Portal UI page. | [optional] |
| **state** | **String** | An opaque value used by the client to maintain state between the request and callback.  The authorization server includes this value when redirecting the user-agent back to the client. | [optional] |
| **auth_flow** | [**AuthFlow**](.md) | Reserved for use by partners. | [optional] |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## token_exchange

> <TokenResponse> token_exchange(grant_type, code, opts)



Exchanges the one-time code your callback received from AuthorizationRedirect endpoint for a permanent access token.

### Examples

```ruby
require 'time'
require 'flexport'

api_instance = Flexport::OAuthApi.new
grant_type = Flexport::GrantTypes::AUTHORIZATION_CODE # GrantTypes | Value MUST be set to \\\"authorization_code\\\".
code = 'code_example' # String | The authorization code received from the authorization server.
opts = {
  redirect_uri: 'redirect_uri_example' # String | Required, if the \\\"redirect_uri\\\" parameter was included in the authorization request as described, and must be identical to the value included in the authorization request.
}

begin
  
  result = api_instance.token_exchange(grant_type, code, opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling OAuthApi->token_exchange: #{e}"
end
```

#### Using the token_exchange_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TokenResponse>, Integer, Hash)> token_exchange_with_http_info(grant_type, code, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.token_exchange_with_http_info(grant_type, code, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TokenResponse>
rescue Flexport::ApiError => e
  puts "Error when calling OAuthApi->token_exchange_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **grant_type** | [**GrantTypes**](GrantTypes.md) | Value MUST be set to \\\&quot;authorization_code\\\&quot;. |  |
| **code** | **String** | The authorization code received from the authorization server. |  |
| **redirect_uri** | **String** | Required, if the \\\&quot;redirect_uri\\\&quot; parameter was included in the authorization request as described, and must be identical to the value included in the authorization request. | [optional] |

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/x-www-form-urlencoded
- **Accept**: application/json

