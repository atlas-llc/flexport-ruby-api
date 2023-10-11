=begin
#Logistics API

## Getting Started  Welcome to the API reference for the Logistics API.  The Logistics API provide access to the logistics network that powers all of our e-commerce operations, such as order fulfillment, order returns, freight, and parcel.  Build using our APIs to create custom applications and integrations, and retrieve data from your account.  The Logistics API is based on the REST standard, and follows the OpenAPI 3 specification.  You can access the Logistics API via one of the following following endpoints:  | Tenant                  | Base URL for REST Endpoints       | |-------------------------|-----------------------------------| | Production              | https://logistics-api.flexport.com | | Sandbox                 | coming soon                       |  To start using the Logistics API, you must have an active [Flexport Portal](https://portal.flexport.com) account. Sign up [here](https://login.deliverr.com/signup).  To inbound physical inventory, ship orders, process returns or buy parcel labels, you'll also need to set up a billing account.  ## Account Type  We believe there are two primary account types that will use the Logistics API.  | Account type             | Meaning within the API reference                                              | |--------------------------|-------------------------------------------------------------------------------| | You are a merchant if... | You will use the API to develop an integration for your own business or shop. | | You are a partner if...  | You will use the API to develop an application to serve your own customers.   |  ## Account Creation  Create a free [Flexport Portal](https://portal.flexport.com) account. Complete the questions to create your account, and don't forget to add your **business name**. When asked to create a catalog, you can select _\"I'm not selling online yet\"_.  - You can access the <a href=\"#tag/Products\">Products</a>, <a href=\"#tag/Webhooks\">Webhooks</a> and <a href=\"#tag/Reports\">Reports</a> API immediately regardless of billing status. - To use the <a href=\"#tag/Parcels\">Parcels</a> or <a href=\"#tag/Returns\">Returns</a> API, your account must meet certain criteria. To inquire, submit a [ticket](https://support.portal.flexport.com/hc/en-us/requests/new). - All other APIs require setting up [billing](https://support.portal.flexport.com/hc/en-us/articles/115003185313-View-Billing-in-the-Seller-Portal) in the Flexport Seller Portal.  ## Authentication and Authorization  To use the API, you will need an access token.  Each access token carries scopes with it.  This allows you to create one access token to access products, and another one to access orders, for example.  ### Creating Access Tokens  There are two ways to request an access token: 1. Using the UI in [Seller Portal -> Settings -> API Tokens](https://sellerportal.deliverr.com/settings/api-tokens).   1. Using the API as described [here](#tag/OAuth/operation/AuthorizationRedirect)  You must be an Administrator of your organization to manage access tokens.  Once issued, access tokens do not expire unless revoked by the Administrator.  ### Partner Access  If you wish to develop an application that could be used by more than one merchant, reach out to us to request a unique client ID.  Your application will receive callbacks with the authorization code whenever a merchant authorizes it using the [OAuth authorization_code flow](#tag/OAuth/operation/AuthorizationRedirect).  Provide the following: - Detailed description of your application - Callback URI where your application will be running to receive authorization codes  ### Migrating from Deliverr API  You must request new access tokens as described above when migrating from Deliverr API.  # Migration Guides  The Logistics API is the future hub of all API development. All future services will be added to the Logistics API family, and use its authentication, common objects, and standards. We have prepared this guide to help our customers when migrating from the [Deliverr API V1](https://api.deliverr.com/documentation/v1/spec) to the [Logistics API](https://logistics-api.deliverr.com/logistics/api/unstable/documentation/spec).  Here are the key differences between the two APIs at a high level:  | Difference                   | Logistics API version 2023-04        |       Deliverr API version 1.0.0     | |------------------------------|--------------------------------------|--------------------------------------| | OAuth 2.0, [RFC6749](https://www.rfc-editor.org/rfc/rfc6749) compliant | Yes | No | | Release schedule             | Every 3 months | Ad-hoc |  A handful of identifiers have been renamed or added in the Logistics API. Refer to the tables, like the one below, in each of the following guides.  | Changes in    | Deliverr API      | Logistics API      | |---------------|-------------------|--------------------| | All resources | productId (DSKU)  | logisticsSku       |  ## Inbounds  | Changes in    | Deliverr API           | Logistics API      | |---------------|------------------------|--------------------| | All resources | productId              | logisticsSku       | | Inbounds      | shippingPlan           | shipment           | | Inbounds      | externalShippingPlanId | N/A                | | Inbounds      | destination            | N/A                | | Inbounds      | caseQuantity           | N/A                |  In the Logistics API, inventory inbounding has been simplified and a number of new endpoints have been added. Refer to the <a href=\"#tag/Inbounds\">Inbounds</a> reference for additional details.  Key differences between the API are highlighted below: 1. Shipments can be read individually by the `id` of the shipment or as a list by specifying a list of ids via the `shipmentIds` query parameter 2. `logisticsSku` replaces `productId` as the identifier for the product being inbounded 3. When creating a shipment, the fields `externalShippingPlanId`, `destination` and `caseQuantity` are no longer supported 4. You cannot retrieve a shipment by an \"external\" `shippingId`. 5. Prep services such as box content labels can be required when creating a shipment 6. The GET labels endpoint in the Deliverr API has been replaced by an endpoint to request an expanded set of documents for the shipment (<a href=\"#tag/Inbounds/operation/GetTransferDocumentV2\">here</a>), which includes box content labels, shipping labels and bill of landing.  ## Products  | Changes in    | Deliverr API      | Logistics API      | |---------------|-------------------|--------------------| | All resources | productId         | logisticsSku       | | Product       | msku              | merchantSku        | | Product       | externalProductId | N/A                | | Inventory     | availableUnits    | available          | | Inventory     | N/A               | onHand             | | Inventory     | N/A               | unavailable        |  A few fundamental changes:  - It is no longer necessary to link an alias to a product before use, as linking functionality is optional - For placing fulfillment orders, use `logisticsSku` instead of `externalProductId` in the list of **lineItems** - In the seller portal, your existing `externalProductId` mapping under the aliases section of a Product Detail page as \"Deliverr API\" will not be used in the Logistics API and will remain unchanged - You cannot update a product's dimensions (`height`, `length`, `width`, `weight`), units (lb/kg, in/cm), or category via the API  The <a href=\"#tag/Products/operation/GetInventory\">retrieve inventory</a> endpoint response contains a few new fields.  The <a href=\"#tag/Products/operation/GetWarehouseDetails\">retrieve warehouse details</a> endpoint is a POST request instead of a GET. Instead of passing a list of `productId` in the `productIds` query parameter, you will now send a body in the following JSON format:  <!-- TODO: update all endpoints to use logisticsSku instead of logisticsSKU and update all fragments named SKU to sku per the codex. --> ```json {   \"logisticsSKUs\": [     \"DSKU1\",     \"DSKU2\",     \"DSKU3\"   ] } ```  ## Bundles  The bundle endpoints remain semantically similar between the Deliverr API and the Logistics API. However, the bundle creation flow has changed between the APIs. The order endpoints in the Logistics API do not support fulfilling orders by `bundleId`. Merchants who wish to fulfill bundle orders in the logistics API have two options: - You manage the mapping of bundles to their definitions in your systems, which is an array of `{ logisticsSku, quantity }`. - You define bundles via the API or the Seller Portal. Use the GetBundle endpoint to retrieve the bundle definition.  In both cases, you must use the `logisticsSku` and its total quantity when <a href=\"#tag/Orders/operation/CreateOrder\">creating an order</a>.  The following operations no longer exist in the Logistics API.  | Deprecated Endpoints            | |---------------------------------| | PATCH [LinkAliasToBundle](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/LinkAliasToBundle) | | PATCH [UnlinkAliasFromBundles](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/UnlinkAliasFromBundles) | | GET [GetBundleByExternalBundleId](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/GetBundleByExternalBundleId) |  ## Orders  | Changes in endpoint           | Deliverr API      | Logistics API          | |-------------------------------|-------------------|------------------------| | Create order                  | externalProductId | logisticsSku           | | Create order                  | orderShipmentTime | promisedShipByTime     | | Create order                  | orderDeliverTime  | promisedDeliveryByTime | | Create order                  | shipToAddress     | address                | | Create order                  | deliverDays       | deliveryDays           | | Create order                  | N/A               | packingSlipUrl         | | Create order                  | N/A               | duties                 | | Create order                  | createdAt         | N/A                    | | Create order                  | updatedAt         | N/A                    | | Create order                  | orderCreationTime | N/A                    |  The response payload for getting an order’s information has now changed. See the <a href=\"#tag/Orders/operation/GetOrder\">retrieve order</a> response.  ## Reports  Beyond changes to the URIs, the report endpoints are a one-to-one mapping between the Deliverr API and the Logistics API.  <!--  ## Parcels & Parcel Integration Placeholder: to be completed by the domain team -->  <!--  ## Returns Placeholder: to be completed by the domain team -->  ## Webhooks  Your webhook subscriptions must be recreated using the <a href=\"#tag/Webhooks/operation/CreateWebhook\">create webhook</a> endpoint.  # Common Resources  Besides following the OpenAPI 3.0 specification, below is a list of common resources and standards shared across the APIs.  ## Headers  The Logistics API makes use of the following custom HTTP headers. <!--  TODO: the generated OpenAPI specs do not contain header info for any of the endpoints, which is a gap in the documentation. https://github.com/Shopify/deliverr-issues/issues/5825 -->  | Header field name                | in request | in response | description | |----------------------------------|------------|-------------|-------------| | `x-correlation-id`               | no         | yes         | UUID v4 tied to a request | | `idempotency-key`                | yes        | no          | Can be any string, use for making POST or PATCH requests fault tolerant | | `idempotent-replayed`            | no         | yes         | If included in the response, indicates a stored value was used to replay the request |   ## Versioning  The Logistics API uses date based versioning for releases. Versions are declared explicitly in the Logistics API URI with a format of `/logistics/api/{api_version}/{endpoint}`. Stable releases follow the format of `yyyy-mm`. Experimental releases have an API version of `unstable`. For example:  ``` /logistics/api/2023-04/orders /logistics/api/unstable/orders ```  # Change Log  ## unstable  The \"unstable\" version contains code experimental changes, developer previews, and new features. However, endpoints can always change and may update with breaking changes without notice.  ## 2023-04  - Initial public beta release of the Logistics API  # Errors When an API error occurs, the HTTP response includes a three-digit HTTP status code with additional information returned as a <a href=\"https://www.rfc-editor.org/rfc/rfc7807\">problem+json</a> object, for example: ``` HTTP/1.1 404 Not Found Content-Type: application/problem+json Content-Language: en  {  \"type\": \"https://logistics-api.flexport.com/logistics/api/2023-04/documentation/spec#section/Errors/404-Not-Found\",  \"title\": \"Not Found\",  \"detail\": \"Cannot find order 49201824029\",  \"instance\": \"92e04577-c56b-47b9-b075-62096165a0ce\", } ``` In addition to the three-digit HTTP status code, some errors carry a six-digit error code   that provides additional detail about the specific error condition.  For example `405004` error code  refers to `Invalid scopes` and is documented [here](#section/Errors/405004-Invalid-scopes).  ## 400 Bad Request Bad Request.  #### Possible Causes - Incorrect HTTP method used. - Non-existent URL path used. - Malformed syntax in the request. - Missing a required parameter. - Input on the request did not pass validation. - The resource to be modified has moved into a state that is no longer valid.  #### Possible Solutions - Retry the request after correcting errors in the request and confirming it's valid.  - Verify if the resource to be modified exists and is in a valid state.  ## 401 Unauthorized The access token is invalid.  #### Possible Causes - No valid access token provided.  #### Possible Solutions - Check to ensure that the access token is valid.  ## 403 Forbidden Access token does not have permission to perform the requested operation.  #### Possible Causes - Access token provided is not authorized to perform the requested operation.  #### Possible Solutions - Check to ensure that the scope of the access token is sufficient to perform the requested operation. - Create and use a new access token that has the required scope.  ## 404 Not Found The requested object cannot be found.  #### Possible Causes - The identifier pointing to the request is incorrect.   - The specified resource is no longer available. - You do not have access to the specified resource.  #### Possible Solutions - Check that the specified resource exists.  ## 409 Conflict The object with the same identifier already exists.  #### Possible Causes - Resource was already created, but the request is attempting to create it again.  #### Possible Solutions - Check that the resource identifier is unique. - Use [idempotency-key](#section/Common-Resources/Headers) when creating resources.   ## 422 Unprocessable Content The request is malformed.    #### Possible Causes - Request contains invalid data or syntax errors.  #### Possible Solutions - Check the payload for inconsistencies or errors.  ## 429 Too Many Requests Too many requests in a given amount of time (\"rate limiting\").  #### Possible Causes - Too many requests were made in a short period of time that exceed the API rate limit allowed.  #### Possible Solutions - Try again later.  We recommend an exponential backoff of your requests. - Refer to the `Retry-After` header for the number of seconds to wait before retrying the request.  ## 423 Locked Access to the Logistics API is locked and denied.  #### Possible Causes - Flexport Portal account may be frozen and/or deactivated.  #### Possible Solutions - Contact <a href=\"https://support.portal.flexport.com/hc/en-us/articles/1500009448562-Contacting-the-Support-team\">Flexport support</a>.  ## 5XX Internal Server Error An internal error has occurred while processing the request (these are uncommon).  #### Possible Causes - The request is incorrect and cannot be processed. - The server is currently unable to handle the request.  #### Possible Solutions - Verify that the request is correct and retry it. - Retry the request at a later time.  ## 405001 Invalid redirect URI The redirect URI specified as a callback for OAuth authorization is invalid.  #### Possible Causes - Redirect URI must be `https://deliverr.com` if `identity` is used as the client ID. - Redirect URI must be exactly the same URI as the one registered with the client ID provided.  #### Possible Solutions - Verify that the redirect URI is correct.  ## 405002 Invalid client_id Invalid client_id.  #### Possible Causes - The client ID provided is invalid.  The client ID must be `identity` or a valid client ID registered with Flexport.  #### Possible Solutions - Submit a valid client ID.  ## 405003 Missing scopes Scopes were not provided.  #### Possible Causes - Scope parameter was not provided in the request.  #### Possible Solutions - Check to ensure the request includes scopes.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).  ## 405004 Invalid scopes Some of the scopes provided are invalid.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).  #### Possible Causes - Scope parameter was provided in the request, but the scope values are invalid. - Incorrect separator was used to separate scopes.   #### Possible Solutions - Check to ensure that scopes requested are known and valid.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).  ## 405005 Invalid code The one-time authorization code provided is invalid, expired, or has already been used.  #### Possible Causes - Authorization code has already been used. - Authorization code has expired because it was requested longer than a few minutes ago. - Authorization code is invalid.  #### Possible Solutions - Restart the [OAuth flow](#tag/OAuth/operation/AuthorizationRedirect) to receive a new authorization code. ## 407001 Invalid order status Operation cannot proceed, because order is in a state that does not allow it.  #### Possible Causes - Order retry was requested, however the original order was successful.  #### Possible Solutions - Ensure that the order is in the correct state, e.g. if order is being retried the order state should be `Canceled`. 

The version of the OpenAPI document: unstable

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.0.1

=end

require 'cgi'

module Flexport
  class FreightApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Cancel an order
    # Cancel an order, optionally provide a cancellation reason
    # @param order_id [Float] 
    # @param order_cancel_request [OrderCancelRequest] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def cancel(order_id, order_cancel_request, opts = {})
      cancel_with_http_info(order_id, order_cancel_request, opts)
      nil
    end

    # Cancel an order
    # Cancel an order, optionally provide a cancellation reason
    # @param order_id [Float] 
    # @param order_cancel_request [OrderCancelRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def cancel_with_http_info(order_id, order_cancel_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.cancel ...'
      end
      # verify the required parameter 'order_id' is set
      if @api_client.config.client_side_validation && order_id.nil?
        fail ArgumentError, "Missing the required parameter 'order_id' when calling FreightApi.cancel"
      end
      # verify the required parameter 'order_cancel_request' is set
      if @api_client.config.client_side_validation && order_cancel_request.nil?
        fail ArgumentError, "Missing the required parameter 'order_cancel_request' when calling FreightApi.cancel"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/orders/{orderId}/cancel'.sub('{' + 'orderId' + '}', CGI.escape(order_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(order_cancel_request)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.cancel",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#cancel\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Book a drayage shipment
    # Book a shipment using an existing drayage Quote to create a drayage Order. Make use of the Uploads API before calling this endpoint to upload and obtain S3 keys for the delivery order and packing list documents. Valid `portId` values can be obtained and selected from the \"Get all ports\" Freight API.
    # @param drayage_order_request [DrayageOrderRequest] 
    # @param [Hash] opts the optional parameters
    # @return [DrayageOrderResponse]
    def create_containers_order(drayage_order_request, opts = {})
      data, _status_code, _headers = create_containers_order_with_http_info(drayage_order_request, opts)
      data
    end

    # Book a drayage shipment
    # Book a shipment using an existing drayage Quote to create a drayage Order. Make use of the Uploads API before calling this endpoint to upload and obtain S3 keys for the delivery order and packing list documents. Valid &#x60;portId&#x60; values can be obtained and selected from the \&quot;Get all ports\&quot; Freight API.
    # @param drayage_order_request [DrayageOrderRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(DrayageOrderResponse, Integer, Hash)>] DrayageOrderResponse data, response status code and response headers
    def create_containers_order_with_http_info(drayage_order_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.create_containers_order ...'
      end
      # verify the required parameter 'drayage_order_request' is set
      if @api_client.config.client_side_validation && drayage_order_request.nil?
        fail ArgumentError, "Missing the required parameter 'drayage_order_request' when calling FreightApi.create_containers_order"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/orders/containers'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(drayage_order_request)

      # return_type
      return_type = opts[:debug_return_type] || 'DrayageOrderResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.create_containers_order",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#create_containers_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create a Drayage quote
    # Request a quote for a shipment where the goods being transported begin inside a shipping container at a port. If the total distance is over a certain threshold, transload and FTL items will be added to complete the journey.
    # @param drayage_quote_request [DrayageQuoteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [DrayageQuoteResponse]
    def create_containers_quote(drayage_quote_request, opts = {})
      data, _status_code, _headers = create_containers_quote_with_http_info(drayage_quote_request, opts)
      data
    end

    # Create a Drayage quote
    # Request a quote for a shipment where the goods being transported begin inside a shipping container at a port. If the total distance is over a certain threshold, transload and FTL items will be added to complete the journey.
    # @param drayage_quote_request [DrayageQuoteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(DrayageQuoteResponse, Integer, Hash)>] DrayageQuoteResponse data, response status code and response headers
    def create_containers_quote_with_http_info(drayage_quote_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.create_containers_quote ...'
      end
      # verify the required parameter 'drayage_quote_request' is set
      if @api_client.config.client_side_validation && drayage_quote_request.nil?
        fail ArgumentError, "Missing the required parameter 'drayage_quote_request' when calling FreightApi.create_containers_quote"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/quotes/containers'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(drayage_quote_request)

      # return_type
      return_type = opts[:debug_return_type] || 'DrayageQuoteResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.create_containers_quote",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#create_containers_quote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Book an LTL shipment
    # Book a shipment using an existing LTL Quote to create an LTL Order
    # @param ltl_order_request [LtlOrderRequest] 
    # @param [Hash] opts the optional parameters
    # @return [LtlOrderResponse]
    def create_pallets_order(ltl_order_request, opts = {})
      data, _status_code, _headers = create_pallets_order_with_http_info(ltl_order_request, opts)
      data
    end

    # Book an LTL shipment
    # Book a shipment using an existing LTL Quote to create an LTL Order
    # @param ltl_order_request [LtlOrderRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(LtlOrderResponse, Integer, Hash)>] LtlOrderResponse data, response status code and response headers
    def create_pallets_order_with_http_info(ltl_order_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.create_pallets_order ...'
      end
      # verify the required parameter 'ltl_order_request' is set
      if @api_client.config.client_side_validation && ltl_order_request.nil?
        fail ArgumentError, "Missing the required parameter 'ltl_order_request' when calling FreightApi.create_pallets_order"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/orders/pallets'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(ltl_order_request)

      # return_type
      return_type = opts[:debug_return_type] || 'LtlOrderResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.create_pallets_order",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#create_pallets_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create an LTL quote
    # Request a quote for a shipment where the goods don't require to occupy the entire truck space.
    # @param quote_request [QuoteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [LtlQuoteResponse]
    def create_pallets_quote(quote_request, opts = {})
      data, _status_code, _headers = create_pallets_quote_with_http_info(quote_request, opts)
      data
    end

    # Create an LTL quote
    # Request a quote for a shipment where the goods don&#39;t require to occupy the entire truck space.
    # @param quote_request [QuoteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(LtlQuoteResponse, Integer, Hash)>] LtlQuoteResponse data, response status code and response headers
    def create_pallets_quote_with_http_info(quote_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.create_pallets_quote ...'
      end
      # verify the required parameter 'quote_request' is set
      if @api_client.config.client_side_validation && quote_request.nil?
        fail ArgumentError, "Missing the required parameter 'quote_request' when calling FreightApi.create_pallets_quote"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/quotes/pallets'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(quote_request)

      # return_type
      return_type = opts[:debug_return_type] || 'LtlQuoteResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.create_pallets_quote",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#create_pallets_quote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create an FTL quote
    # Request a quote of a truck regardless if the goods occupy the entire space or not.
    # @param quote_request [QuoteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [FtlQuoteResponse]
    def create_truck_quote(quote_request, opts = {})
      data, _status_code, _headers = create_truck_quote_with_http_info(quote_request, opts)
      data
    end

    # Create an FTL quote
    # Request a quote of a truck regardless if the goods occupy the entire space or not.
    # @param quote_request [QuoteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(FtlQuoteResponse, Integer, Hash)>] FtlQuoteResponse data, response status code and response headers
    def create_truck_quote_with_http_info(quote_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.create_truck_quote ...'
      end
      # verify the required parameter 'quote_request' is set
      if @api_client.config.client_side_validation && quote_request.nil?
        fail ArgumentError, "Missing the required parameter 'quote_request' when calling FreightApi.create_truck_quote"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/quotes/trucks'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(quote_request)

      # return_type
      return_type = opts[:debug_return_type] || 'FtlQuoteResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.create_truck_quote",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#create_truck_quote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Book an FTL shipment
    # Book a shipment using an existing FTL Quote to create an FTL Order
    # @param ftl_order_request [FtlOrderRequest] 
    # @param [Hash] opts the optional parameters
    # @return [FtlOrderResponse]
    def create_trucks_order(ftl_order_request, opts = {})
      data, _status_code, _headers = create_trucks_order_with_http_info(ftl_order_request, opts)
      data
    end

    # Book an FTL shipment
    # Book a shipment using an existing FTL Quote to create an FTL Order
    # @param ftl_order_request [FtlOrderRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(FtlOrderResponse, Integer, Hash)>] FtlOrderResponse data, response status code and response headers
    def create_trucks_order_with_http_info(ftl_order_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.create_trucks_order ...'
      end
      # verify the required parameter 'ftl_order_request' is set
      if @api_client.config.client_side_validation && ftl_order_request.nil?
        fail ArgumentError, "Missing the required parameter 'ftl_order_request' when calling FreightApi.create_trucks_order"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/orders/trucks'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(ftl_order_request)

      # return_type
      return_type = opts[:debug_return_type] || 'FtlOrderResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.create_trucks_order",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#create_trucks_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Returns freight tracking events
    # Returns tracking events associated to a bol id.
    # @param bol_id [String] 
    # @param [Hash] opts the optional parameters
    # @return [FreightTrackingInfo]
    def get_bol_tracking(bol_id, opts = {})
      data, _status_code, _headers = get_bol_tracking_with_http_info(bol_id, opts)
      data
    end

    # Returns freight tracking events
    # Returns tracking events associated to a bol id.
    # @param bol_id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(FreightTrackingInfo, Integer, Hash)>] FreightTrackingInfo data, response status code and response headers
    def get_bol_tracking_with_http_info(bol_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.get_bol_tracking ...'
      end
      # verify the required parameter 'bol_id' is set
      if @api_client.config.client_side_validation && bol_id.nil?
        fail ArgumentError, "Missing the required parameter 'bol_id' when calling FreightApi.get_bol_tracking"
      end
      if @api_client.config.client_side_validation && bol_id.to_s.length < 9
        fail ArgumentError, 'invalid value for "bol_id" when calling FreightApi.get_bol_tracking, the character length must be great than or equal to 9.'
      end

      pattern = Regexp.new(/^SL\d{7}$/)
      if @api_client.config.client_side_validation && bol_id !~ pattern
        fail ArgumentError, "invalid value for 'bol_id' when calling FreightApi.get_bol_tracking, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/logistics/api/unstable/freight/tracking_events/{bolId}'.sub('{' + 'bolId' + '}', CGI.escape(bol_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'FreightTrackingInfo'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER', 'TOKEN']

      new_options = opts.merge(
        :operation => :"FreightApi.get_bol_tracking",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#get_bol_tracking\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get order by ID
    # Retrieve the order specified by the orderId.
    # @param order_id [Float] 
    # @param [Hash] opts the optional parameters
    # @return [OrderResponse]
    def get_freight_order(order_id, opts = {})
      data, _status_code, _headers = get_freight_order_with_http_info(order_id, opts)
      data
    end

    # Get order by ID
    # Retrieve the order specified by the orderId.
    # @param order_id [Float] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(OrderResponse, Integer, Hash)>] OrderResponse data, response status code and response headers
    def get_freight_order_with_http_info(order_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.get_freight_order ...'
      end
      # verify the required parameter 'order_id' is set
      if @api_client.config.client_side_validation && order_id.nil?
        fail ArgumentError, "Missing the required parameter 'order_id' when calling FreightApi.get_freight_order"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/orders/{orderId}'.sub('{' + 'orderId' + '}', CGI.escape(order_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'OrderResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.get_freight_order",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#get_freight_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all orders
    # Retrieve all orders for the account.
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :limit 
    # @option opts [Float] :cursor 
    # @option opts [ListDirection] :direction 
    # @return [GetOrdersResponse]
    def get_freight_orders(opts = {})
      data, _status_code, _headers = get_freight_orders_with_http_info(opts)
      data
    end

    # Get all orders
    # Retrieve all orders for the account.
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :limit 
    # @option opts [Float] :cursor 
    # @option opts [ListDirection] :direction 
    # @return [Array<(GetOrdersResponse, Integer, Hash)>] GetOrdersResponse data, response status code and response headers
    def get_freight_orders_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.get_freight_orders ...'
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/orders'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?
      query_params[:'direction'] = opts[:'direction'] if !opts[:'direction'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetOrdersResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.get_freight_orders",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#get_freight_orders\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all ports
    # Retrieve all available drayage ports. The ID of the Port objects here should be passed in when using our API to book a drayage shipment.
    # @param [Hash] opts the optional parameters
    # @return [GetPortsResponse]
    def get_freight_ports(opts = {})
      data, _status_code, _headers = get_freight_ports_with_http_info(opts)
      data
    end

    # Get all ports
    # Retrieve all available drayage ports. The ID of the Port objects here should be passed in when using our API to book a drayage shipment.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetPortsResponse, Integer, Hash)>] GetPortsResponse data, response status code and response headers
    def get_freight_ports_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.get_freight_ports ...'
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/ports'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetPortsResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.get_freight_ports",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#get_freight_ports\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get documents for an order
    # Retrieve the documents associated with an Order using orderId.
    # @param order_id [Float] 
    # @param [Hash] opts the optional parameters
    # @return [GetOrderDocumentsResponse]
    def get_order_documents(order_id, opts = {})
      data, _status_code, _headers = get_order_documents_with_http_info(order_id, opts)
      data
    end

    # Get documents for an order
    # Retrieve the documents associated with an Order using orderId.
    # @param order_id [Float] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetOrderDocumentsResponse, Integer, Hash)>] GetOrderDocumentsResponse data, response status code and response headers
    def get_order_documents_with_http_info(order_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.get_order_documents ...'
      end
      # verify the required parameter 'order_id' is set
      if @api_client.config.client_side_validation && order_id.nil?
        fail ArgumentError, "Missing the required parameter 'order_id' when calling FreightApi.get_order_documents"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/orders/{orderId}/documents'.sub('{' + 'orderId' + '}', CGI.escape(order_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetOrderDocumentsResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.get_order_documents",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#get_order_documents\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get quote by ID
    # Retrieve the quote specified by the quoteId.
    # @param quote_id [Float] 
    # @param [Hash] opts the optional parameters
    # @return [QuoteResponse]
    def get_quote(quote_id, opts = {})
      data, _status_code, _headers = get_quote_with_http_info(quote_id, opts)
      data
    end

    # Get quote by ID
    # Retrieve the quote specified by the quoteId.
    # @param quote_id [Float] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(QuoteResponse, Integer, Hash)>] QuoteResponse data, response status code and response headers
    def get_quote_with_http_info(quote_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.get_quote ...'
      end
      # verify the required parameter 'quote_id' is set
      if @api_client.config.client_side_validation && quote_id.nil?
        fail ArgumentError, "Missing the required parameter 'quote_id' when calling FreightApi.get_quote"
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/quotes/{quoteId}'.sub('{' + 'quoteId' + '}', CGI.escape(quote_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'QuoteResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.get_quote",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#get_quote\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all quotes
    # Retrieve all quotes for the account.
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :limit 
    # @option opts [Float] :cursor 
    # @option opts [ListDirection] :direction 
    # @return [GetQuotesResponse]
    def get_quotes(opts = {})
      data, _status_code, _headers = get_quotes_with_http_info(opts)
      data
    end

    # Get all quotes
    # Retrieve all quotes for the account.
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :limit 
    # @option opts [Float] :cursor 
    # @option opts [ListDirection] :direction 
    # @return [Array<(GetQuotesResponse, Integer, Hash)>] GetQuotesResponse data, response status code and response headers
    def get_quotes_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FreightApi.get_quotes ...'
      end
      # resource path
      local_var_path = '/logistics/api/unstable/freight/quotes'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?
      query_params[:'direction'] = opts[:'direction'] if !opts[:'direction'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'GetQuotesResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['BEARER']

      new_options = opts.merge(
        :operation => :"FreightApi.get_quotes",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FreightApi#get_quotes\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
