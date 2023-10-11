=begin
#Logistics API

## Getting Started  Welcome to the API reference for the Logistics API.  The Logistics API provide access to the logistics network that powers all of our e-commerce operations, such as order fulfillment, order returns, freight, and parcel.  Build using our APIs to create custom applications and integrations, and retrieve data from your account.  The Logistics API is based on the REST standard, and follows the OpenAPI 3 specification.  You can access the Logistics API via one of the following following endpoints:  | Tenant                  | Base URL for REST Endpoints       | |-------------------------|-----------------------------------| | Production              | https://logistics-api.flexport.com | | Sandbox                 | coming soon                       |  To start using the Logistics API, you must have an active [Flexport Portal](https://portal.flexport.com) account. Sign up [here](https://login.deliverr.com/signup).  To inbound physical inventory, ship orders, process returns or buy parcel labels, you'll also need to set up a billing account.  ## Account Type  We believe there are two primary account types that will use the Logistics API.  | Account type             | Meaning within the API reference                                              | |--------------------------|-------------------------------------------------------------------------------| | You are a merchant if... | You will use the API to develop an integration for your own business or shop. | | You are a partner if...  | You will use the API to develop an application to serve your own customers.   |  ## Account Creation  Create a free [Flexport Portal](https://portal.flexport.com) account. Complete the questions to create your account, and don't forget to add your **business name**. When asked to create a catalog, you can select _\"I'm not selling online yet\"_.  - You can access the <a href=\"#tag/Products\">Products</a>, <a href=\"#tag/Webhooks\">Webhooks</a> and <a href=\"#tag/Reports\">Reports</a> API immediately regardless of billing status. - To use the <a href=\"#tag/Parcels\">Parcels</a> or <a href=\"#tag/Returns\">Returns</a> API, your account must meet certain criteria. To inquire, submit a [ticket](https://support.portal.flexport.com/hc/en-us/requests/new). - All other APIs require setting up [billing](https://support.portal.flexport.com/hc/en-us/articles/115003185313-View-Billing-in-the-Seller-Portal) in the Flexport Seller Portal.  ## Authentication and Authorization  To use the API, you will need an access token.  Each access token carries scopes with it.  This allows you to create one access token to access products, and another one to access orders, for example.  ### Creating Access Tokens  There are two ways to request an access token: 1. Using the UI in [Seller Portal -> Settings -> API Tokens](https://sellerportal.deliverr.com/settings/api-tokens).   1. Using the API as described [here](#tag/OAuth/operation/AuthorizationRedirect)  You must be an Administrator of your organization to manage access tokens.  Once issued, access tokens do not expire unless revoked by the Administrator.  ### Partner Access  If you wish to develop an application that could be used by more than one merchant, reach out to us to request a unique client ID.  Your application will receive callbacks with the authorization code whenever a merchant authorizes it using the [OAuth authorization_code flow](#tag/OAuth/operation/AuthorizationRedirect).  Provide the following: - Detailed description of your application - Callback URI where your application will be running to receive authorization codes  ### Migrating from Deliverr API  You must request new access tokens as described above when migrating from Deliverr API.  # Migration Guides  The Logistics API is the future hub of all API development. All future services will be added to the Logistics API family, and use its authentication, common objects, and standards. We have prepared this guide to help our customers when migrating from the [Deliverr API V1](https://api.deliverr.com/documentation/v1/spec) to the [Logistics API](https://logistics-api.deliverr.com/logistics/api/unstable/documentation/spec).  Here are the key differences between the two APIs at a high level:  | Difference                   | Logistics API version 2023-04        |       Deliverr API version 1.0.0     | |------------------------------|--------------------------------------|--------------------------------------| | OAuth 2.0, [RFC6749](https://www.rfc-editor.org/rfc/rfc6749) compliant | Yes | No | | Release schedule             | Every 3 months | Ad-hoc |  A handful of identifiers have been renamed or added in the Logistics API. Refer to the tables, like the one below, in each of the following guides.  | Changes in    | Deliverr API      | Logistics API      | |---------------|-------------------|--------------------| | All resources | productId (DSKU)  | logisticsSku       |  ## Inbounds  | Changes in    | Deliverr API           | Logistics API      | |---------------|------------------------|--------------------| | All resources | productId              | logisticsSku       | | Inbounds      | shippingPlan           | shipment           | | Inbounds      | externalShippingPlanId | N/A                | | Inbounds      | destination            | N/A                | | Inbounds      | caseQuantity           | N/A                |  In the Logistics API, inventory inbounding has been simplified and a number of new endpoints have been added. Refer to the <a href=\"#tag/Inbounds\">Inbounds</a> reference for additional details.  Key differences between the API are highlighted below: 1. Shipments can be read individually by the `id` of the shipment or as a list by specifying a list of ids via the `shipmentIds` query parameter 2. `logisticsSku` replaces `productId` as the identifier for the product being inbounded 3. When creating a shipment, the fields `externalShippingPlanId`, `destination` and `caseQuantity` are no longer supported 4. You cannot retrieve a shipment by an \"external\" `shippingId`. 5. Prep services such as box content labels can be required when creating a shipment 6. The GET labels endpoint in the Deliverr API has been replaced by an endpoint to request an expanded set of documents for the shipment (<a href=\"#tag/Inbounds/operation/GetTransferDocumentV2\">here</a>), which includes box content labels, shipping labels and bill of landing.  ## Products  | Changes in    | Deliverr API      | Logistics API      | |---------------|-------------------|--------------------| | All resources | productId         | logisticsSku       | | Product       | msku              | merchantSku        | | Product       | externalProductId | N/A                | | Inventory     | availableUnits    | available          | | Inventory     | N/A               | onHand             | | Inventory     | N/A               | unavailable        |  A few fundamental changes:  - It is no longer necessary to link an alias to a product before use, as linking functionality is optional - For placing fulfillment orders, use `logisticsSku` instead of `externalProductId` in the list of **lineItems** - In the seller portal, your existing `externalProductId` mapping under the aliases section of a Product Detail page as \"Deliverr API\" will not be used in the Logistics API and will remain unchanged - You cannot update a product's dimensions (`height`, `length`, `width`, `weight`), units (lb/kg, in/cm), or category via the API  The <a href=\"#tag/Products/operation/GetInventory\">retrieve inventory</a> endpoint response contains a few new fields.  The <a href=\"#tag/Products/operation/GetWarehouseDetails\">retrieve warehouse details</a> endpoint is a POST request instead of a GET. Instead of passing a list of `productId` in the `productIds` query parameter, you will now send a body in the following JSON format:  <!-- TODO: update all endpoints to use logisticsSku instead of logisticsSKU and update all fragments named SKU to sku per the codex. --> ```json {   \"logisticsSKUs\": [     \"DSKU1\",     \"DSKU2\",     \"DSKU3\"   ] } ```  ## Bundles  The bundle endpoints remain semantically similar between the Deliverr API and the Logistics API. However, the bundle creation flow has changed between the APIs. The order endpoints in the Logistics API do not support fulfilling orders by `bundleId`. Merchants who wish to fulfill bundle orders in the logistics API have two options: - You manage the mapping of bundles to their definitions in your systems, which is an array of `{ logisticsSku, quantity }`. - You define bundles via the API or the Seller Portal. Use the GetBundle endpoint to retrieve the bundle definition.  In both cases, you must use the `logisticsSku` and its total quantity when <a href=\"#tag/Orders/operation/CreateOrder\">creating an order</a>.  The following operations no longer exist in the Logistics API.  | Deprecated Endpoints            | |---------------------------------| | PATCH [LinkAliasToBundle](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/LinkAliasToBundle) | | PATCH [UnlinkAliasFromBundles](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/UnlinkAliasFromBundles) | | GET [GetBundleByExternalBundleId](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/GetBundleByExternalBundleId) |  ## Orders  | Changes in endpoint           | Deliverr API      | Logistics API          | |-------------------------------|-------------------|------------------------| | Create order                  | externalProductId | logisticsSku           | | Create order                  | orderShipmentTime | promisedShipByTime     | | Create order                  | orderDeliverTime  | promisedDeliveryByTime | | Create order                  | shipToAddress     | address                | | Create order                  | deliverDays       | deliveryDays           | | Create order                  | N/A               | packingSlipUrl         | | Create order                  | N/A               | duties                 | | Create order                  | createdAt         | N/A                    | | Create order                  | updatedAt         | N/A                    | | Create order                  | orderCreationTime | N/A                    |  The response payload for getting an order’s information has now changed. See the <a href=\"#tag/Orders/operation/GetOrder\">retrieve order</a> response.  ## Reports  Beyond changes to the URIs, the report endpoints are a one-to-one mapping between the Deliverr API and the Logistics API.  <!--  ## Parcels & Parcel Integration Placeholder: to be completed by the domain team -->  <!--  ## Returns Placeholder: to be completed by the domain team -->  ## Webhooks  Your webhook subscriptions must be recreated using the <a href=\"#tag/Webhooks/operation/CreateWebhook\">create webhook</a> endpoint.  # Common Resources  Besides following the OpenAPI 3.0 specification, below is a list of common resources and standards shared across the APIs.  ## Headers  The Logistics API makes use of the following custom HTTP headers. <!--  TODO: the generated OpenAPI specs do not contain header info for any of the endpoints, which is a gap in the documentation. https://github.com/Shopify/deliverr-issues/issues/5825 -->  | Header field name                | in request | in response | description | |----------------------------------|------------|-------------|-------------| | `x-correlation-id`               | no         | yes         | UUID v4 tied to a request | | `idempotency-key`                | yes        | no          | Can be any string, use for making POST or PATCH requests fault tolerant | | `idempotent-replayed`            | no         | yes         | If included in the response, indicates a stored value was used to replay the request |   ## Versioning  The Logistics API uses date based versioning for releases. Versions are declared explicitly in the Logistics API URI with a format of `/logistics/api/{api_version}/{endpoint}`. Stable releases follow the format of `yyyy-mm`. Experimental releases have an API version of `unstable`. For example:  ``` /logistics/api/2023-04/orders /logistics/api/unstable/orders ```  # Change Log  ## unstable  The \"unstable\" version contains code experimental changes, developer previews, and new features. However, endpoints can always change and may update with breaking changes without notice.  ## 2023-04  - Initial public beta release of the Logistics API  # Errors When an API error occurs, the HTTP response includes a three-digit HTTP status code with additional information returned as a <a href=\"https://www.rfc-editor.org/rfc/rfc7807\">problem+json</a> object, for example: ``` HTTP/1.1 404 Not Found Content-Type: application/problem+json Content-Language: en  {  \"type\": \"https://logistics-api.flexport.com/logistics/api/2023-04/documentation/spec#section/Errors/404-Not-Found\",  \"title\": \"Not Found\",  \"detail\": \"Cannot find order 49201824029\",  \"instance\": \"92e04577-c56b-47b9-b075-62096165a0ce\", } ``` In addition to the three-digit HTTP status code, some errors carry a six-digit error code   that provides additional detail about the specific error condition.  For example `405004` error code  refers to `Invalid scopes` and is documented [here](#section/Errors/405004-Invalid-scopes).  ## 400 Bad Request Bad Request.  #### Possible Causes - Incorrect HTTP method used. - Non-existent URL path used. - Malformed syntax in the request. - Missing a required parameter. - Input on the request did not pass validation. - The resource to be modified has moved into a state that is no longer valid.  #### Possible Solutions - Retry the request after correcting errors in the request and confirming it's valid.  - Verify if the resource to be modified exists and is in a valid state.  ## 401 Unauthorized The access token is invalid.  #### Possible Causes - No valid access token provided.  #### Possible Solutions - Check to ensure that the access token is valid.  ## 403 Forbidden Access token does not have permission to perform the requested operation.  #### Possible Causes - Access token provided is not authorized to perform the requested operation.  #### Possible Solutions - Check to ensure that the scope of the access token is sufficient to perform the requested operation. - Create and use a new access token that has the required scope.  ## 404 Not Found The requested object cannot be found.  #### Possible Causes - The identifier pointing to the request is incorrect.   - The specified resource is no longer available. - You do not have access to the specified resource.  #### Possible Solutions - Check that the specified resource exists.  ## 409 Conflict The object with the same identifier already exists.  #### Possible Causes - Resource was already created, but the request is attempting to create it again.  #### Possible Solutions - Check that the resource identifier is unique. - Use [idempotency-key](#section/Common-Resources/Headers) when creating resources.   ## 422 Unprocessable Content The request is malformed.    #### Possible Causes - Request contains invalid data or syntax errors.  #### Possible Solutions - Check the payload for inconsistencies or errors.  ## 429 Too Many Requests Too many requests in a given amount of time (\"rate limiting\").  #### Possible Causes - Too many requests were made in a short period of time that exceed the API rate limit allowed.  #### Possible Solutions - Try again later.  We recommend an exponential backoff of your requests. - Refer to the `Retry-After` header for the number of seconds to wait before retrying the request.  ## 423 Locked Access to the Logistics API is locked and denied.  #### Possible Causes - Flexport Portal account may be frozen and/or deactivated.  #### Possible Solutions - Contact <a href=\"https://support.portal.flexport.com/hc/en-us/articles/1500009448562-Contacting-the-Support-team\">Flexport support</a>.  ## 5XX Internal Server Error An internal error has occurred while processing the request (these are uncommon).  #### Possible Causes - The request is incorrect and cannot be processed. - The server is currently unable to handle the request.  #### Possible Solutions - Verify that the request is correct and retry it. - Retry the request at a later time.  ## 405001 Invalid redirect URI The redirect URI specified as a callback for OAuth authorization is invalid.  #### Possible Causes - Redirect URI must be `https://deliverr.com` if `identity` is used as the client ID. - Redirect URI must be exactly the same URI as the one registered with the client ID provided.  #### Possible Solutions - Verify that the redirect URI is correct.  ## 405002 Invalid client_id Invalid client_id.  #### Possible Causes - The client ID provided is invalid.  The client ID must be `identity` or a valid client ID registered with Flexport.  #### Possible Solutions - Submit a valid client ID.  ## 405003 Missing scopes Scopes were not provided.  #### Possible Causes - Scope parameter was not provided in the request.  #### Possible Solutions - Check to ensure the request includes scopes.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).  ## 405004 Invalid scopes Some of the scopes provided are invalid.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).  #### Possible Causes - Scope parameter was provided in the request, but the scope values are invalid. - Incorrect separator was used to separate scopes.   #### Possible Solutions - Check to ensure that scopes requested are known and valid.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).  ## 405005 Invalid code The one-time authorization code provided is invalid, expired, or has already been used.  #### Possible Causes - Authorization code has already been used. - Authorization code has expired because it was requested longer than a few minutes ago. - Authorization code is invalid.  #### Possible Solutions - Restart the [OAuth flow](#tag/OAuth/operation/AuthorizationRedirect) to receive a new authorization code. ## 407001 Invalid order status Operation cannot proceed, because order is in a state that does not allow it.  #### Possible Causes - Order retry was requested, however the original order was successful.  #### Possible Solutions - Ensure that the order is in the correct state, e.g. if order is being retried the order state should be `Canceled`. 

The version of the OpenAPI document: unstable

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.0.1

=end

require 'date'
require 'json'
require 'logger'
require 'tempfile'
require 'time'
require 'faraday'
require 'faraday/multipart' if Gem::Version.new(Faraday::VERSION) >= Gem::Version.new('2.0')

module Flexport
  class ApiClient
    # The Configuration object holding settings to be used in the API client.
    attr_accessor :config

    # Defines the headers to be used in HTTP requests of all API calls by default.
    #
    # @return [Hash]
    attr_accessor :default_headers

    # Initializes the ApiClient
    # @option config [Configuration] Configuration for initializing the object, default to Configuration.default
    def initialize(config = Configuration.default)
      @config = config
      @user_agent = "OpenAPI-Generator/#{VERSION}/ruby"
      @default_headers = {
        'Content-Type' => 'application/json',
        'User-Agent' => @user_agent
      }
    end

    def self.default
      @@default ||= ApiClient.new
    end

    # Call an API with given options.
    #
    # @return [Array<(Object, Integer, Hash)>] an array of 3 elements:
    #   the data deserialized from response body (could be nil), response status code and response headers.
    def call_api(http_method, path, opts = {})
      begin
        response = connection(opts).public_send(http_method.to_sym.downcase) do |req|
          build_request(http_method, path, req, opts)
        end

        if config.debugging
          config.logger.debug "HTTP response body ~BEGIN~\n#{response.body}\n~END~\n"
        end

        unless response.success?
          if response.status == 0 && response.respond_to?(:return_message)
            # Errors from libcurl will be made visible here
            fail ApiError.new(code: 0,
                              message: response.return_message)
          else
            fail ApiError.new(code: response.status,
                              response_headers: response.headers,
                              response_body: response.body),
                 response.reason_phrase
          end
        end
      rescue Faraday::TimeoutError
        fail ApiError.new('Connection timed out')
      rescue Faraday::ConnectionFailed
        fail ApiError.new('Connection failed')
      end

      if opts[:return_type]
        data = deserialize(response, opts[:return_type])
      else
        data = nil
      end
      return data, response.status, response.headers
    end

    # Builds the HTTP request
    #
    # @param [String] http_method HTTP method/verb (e.g. POST)
    # @param [String] path URL path (e.g. /account/new)
    # @option opts [Hash] :header_params Header parameters
    # @option opts [Hash] :query_params Query parameters
    # @option opts [Hash] :form_params Query parameters
    # @option opts [Object] :body HTTP body (JSON/XML)
    # @return [Faraday::Request] A Faraday Request
    def build_request(http_method, path, request, opts = {})
      url = build_request_url(path, opts)
      http_method = http_method.to_sym.downcase

      header_params = @default_headers.merge(opts[:header_params] || {})
      query_params = opts[:query_params] || {}
      form_params = opts[:form_params] || {}

      update_params_for_auth! header_params, query_params, opts[:auth_names]

      if [:post, :patch, :put, :delete].include?(http_method)
        req_body = build_request_body(header_params, form_params, opts[:body])
        if config.debugging
          config.logger.debug "HTTP request body param ~BEGIN~\n#{req_body}\n~END~\n"
        end
      end
      request.headers = header_params
      request.body = req_body

      # Overload default options only if provided
      request.options.params_encoder = config.params_encoder if config.params_encoder
      request.options.timeout        = config.timeout        if config.timeout

      request.url url
      request.params = query_params
      download_file(request) if opts[:return_type] == 'File' || opts[:return_type] == 'Binary'
      request
    end

    # Builds the HTTP request body
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] form_params Query parameters
    # @param [Object] body HTTP body (JSON/XML)
    # @return [String] HTTP body data in the form of string
    def build_request_body(header_params, form_params, body)
      # http form
      if header_params['Content-Type'] == 'application/x-www-form-urlencoded'
        data = URI.encode_www_form(form_params)
      elsif header_params['Content-Type'] == 'multipart/form-data'
        data = {}
        form_params.each do |key, value|
          case value
          when ::File, ::Tempfile
            # TODO hardcode to application/octet-stream, need better way to detect content type
            data[key] = Faraday::FilePart.new(value.path, 'application/octet-stream', value.path)
          when ::Array, nil
            # let Faraday handle Array and nil parameters
            data[key] = value
          else
            data[key] = value.to_s
          end
        end
      elsif body
        data = body.is_a?(String) ? body : body.to_json
      else
        data = nil
      end
      data
    end

    def download_file(request)
      @stream = []

      # handle streaming Responses
      request.options.on_data = Proc.new do |chunk, overall_received_bytes|
        @stream << chunk
      end
    end

    def connection(opts)
      opts[:header_params]['Content-Type'] == 'multipart/form-data' ? connection_multipart : connection_regular
    end

    def connection_multipart
      @connection_multipart ||= build_connection do |conn|
        conn.request :multipart
        conn.request :url_encoded
      end
    end

    def connection_regular
      @connection_regular ||= build_connection
    end

    def build_connection
      Faraday.new(url: config.base_url, ssl: ssl_options, proxy: config.proxy) do |conn|
        basic_auth(conn)
        config.configure_middleware(conn)
        yield(conn) if block_given?
        conn.adapter(Faraday.default_adapter)
        config.configure_connection(conn)
      end
    end

    def ssl_options
      {
        ca_file: config.ssl_ca_file,
        verify: config.ssl_verify,
        verify_mode: config.ssl_verify_mode,
        client_cert: config.ssl_client_cert,
        client_key: config.ssl_client_key
      }
    end

    def basic_auth(conn)
      if config.username && config.password
        if Gem::Version.new(Faraday::VERSION) >= Gem::Version.new('2.0')
          conn.request(:authorization, :basic, config.username, config.password)
        else
          conn.request(:basic_auth, config.username, config.password)
        end
      end
    end

    # Check if the given MIME is a JSON MIME.
    # JSON MIME examples:
    #   application/json
    #   application/json; charset=UTF8
    #   APPLICATION/JSON
    #   */*
    # @param [String] mime MIME
    # @return [Boolean] True if the MIME is application/json
    def json_mime?(mime)
      (mime == '*/*') || !(mime =~ /Application\/.*json(?!p)(;.*)?/i).nil?
    end

    # Deserialize the response to the given return type.
    #
    # @param [Response] response HTTP response
    # @param [String] return_type some examples: "User", "Array<User>", "Hash<String, Integer>"
    def deserialize(response, return_type)
      body = response.body

      # handle file downloading - return the File instance processed in request callbacks
      # note that response body is empty when the file is written in chunks in request on_body callback
      if return_type == 'File'
        if @config.return_binary_data == true
          # return byte stream
          encoding = body.encoding
          return @stream.join.force_encoding(encoding)
        else
          # return file instead of binary data
          content_disposition = response.headers['Content-Disposition']
          if content_disposition && content_disposition =~ /filename=/i
            filename = content_disposition[/filename=['"]?([^'"\s]+)['"]?/, 1]
            prefix = sanitize_filename(filename)
          else
            prefix = 'download-'
          end
          prefix = prefix + '-' unless prefix.end_with?('-')
          encoding = body.encoding
          @tempfile = Tempfile.open(prefix, @config.temp_folder_path, encoding: encoding)
          @tempfile.write(@stream.join.force_encoding(encoding))
          @tempfile.close
          @config.logger.info "Temp file written to #{@tempfile.path}, please copy the file to a proper folder "\
                              "with e.g. `FileUtils.cp(tempfile.path, '/new/file/path')` otherwise the temp file "\
                              "will be deleted automatically with GC. It's also recommended to delete the temp file "\
                              "explicitly with `tempfile.delete`"
          return @tempfile
        end
      end

      return nil if body.nil? || body.empty?

      # return response body directly for String return type
      return body if return_type == 'String'

      # ensuring a default content type
      content_type = response.headers['Content-Type'] || 'application/json'

      fail "Content-Type is not supported: #{content_type}" unless json_mime?(content_type)

      begin
        data = JSON.parse("[#{body}]", :symbolize_names => true)[0]
      rescue JSON::ParserError => e
        if %w(String Date Time).include?(return_type)
          data = body
        else
          raise e
        end
      end

      convert_to_type data, return_type
    end

    # Convert data to the given return type.
    # @param [Object] data Data to be converted
    # @param [String] return_type Return type
    # @return [Mixed] Data in a particular type
    def convert_to_type(data, return_type)
      return nil if data.nil?
      case return_type
      when 'String'
        data.to_s
      when 'Integer'
        data.to_i
      when 'Float'
        data.to_f
      when 'Boolean'
        data == true
      when 'Time'
        # parse date time (expecting ISO 8601 format)
        Time.parse data
      when 'Date'
        # parse date time (expecting ISO 8601 format)
        Date.parse data
      when 'Object'
        # generic object (usually a Hash), return directly
        data
      when /\AArray<(.+)>\z/
        # e.g. Array<Pet>
        sub_type = $1
        data.map { |item| convert_to_type(item, sub_type) }
      when /\AHash\<String, (.+)\>\z/
        # e.g. Hash<String, Integer>
        sub_type = $1
        {}.tap do |hash|
          data.each { |k, v| hash[k] = convert_to_type(v, sub_type) }
        end
      else
        # models (e.g. Pet) or oneOf
        klass = Flexport.const_get(return_type)
        klass.respond_to?(:openapi_one_of) ? klass.build(data) : klass.build_from_hash(data)
      end
    end

    # Sanitize filename by removing path.
    # e.g. ../../sun.gif becomes sun.gif
    #
    # @param [String] filename the filename to be sanitized
    # @return [String] the sanitized filename
    def sanitize_filename(filename)
      filename.gsub(/.*[\/\\]/, '')
    end

    def build_request_url(path, opts = {})
      # Add leading and trailing slashes to path
      path = "/#{path}".gsub(/\/+/, '/')
      @config.base_url(opts[:operation]) + path
    end

    # Update header and query params based on authentication settings.
    #
    # @param [Hash] header_params Header parameters
    # @param [Hash] query_params Query parameters
    # @param [String] auth_names Authentication scheme name
    def update_params_for_auth!(header_params, query_params, auth_names)
      Array(auth_names).each do |auth_name|
        auth_setting = @config.auth_settings[auth_name]
        next unless auth_setting
        case auth_setting[:in]
        when 'header' then header_params[auth_setting[:key]] = auth_setting[:value]
        when 'query'  then query_params[auth_setting[:key]] = auth_setting[:value]
        else fail ArgumentError, 'Authentication token must be in `query` or `header`'
        end
      end
    end

    # Sets user agent in HTTP header
    #
    # @param [String] user_agent User agent (e.g. openapi-generator/ruby/1.0.0)
    def user_agent=(user_agent)
      @user_agent = user_agent
      @default_headers['User-Agent'] = @user_agent
    end

    # Return Accept header based on an array of accepts provided.
    # @param [Array] accepts array for Accept
    # @return [String] the Accept header (e.g. application/json)
    def select_header_accept(accepts)
      return nil if accepts.nil? || accepts.empty?
      # use JSON when present, otherwise use all of the provided
      json_accept = accepts.find { |s| json_mime?(s) }
      json_accept || accepts.join(',')
    end

    # Return Content-Type header based on an array of content types provided.
    # @param [Array] content_types array for Content-Type
    # @return [String] the Content-Type header  (e.g. application/json)
    def select_header_content_type(content_types)
      # return nil by default
      return if content_types.nil? || content_types.empty?
      # use JSON when present, otherwise use the first one
      json_content_type = content_types.find { |s| json_mime?(s) }
      json_content_type || content_types.first
    end

    # Convert object (array, hash, object, etc) to JSON string.
    # @param [Object] model object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_http_body(model)
      return model if model.nil? || model.is_a?(String)
      local_body = nil
      if model.is_a?(Array)
        local_body = model.map { |m| object_to_hash(m) }
      else
        local_body = object_to_hash(model)
      end
      local_body.to_json
    end

    # Convert object(non-array) to hash.
    # @param [Object] obj object to be converted into JSON string
    # @return [String] JSON string representation of the object
    def object_to_hash(obj)
      if obj.respond_to?(:to_hash)
        obj.to_hash
      else
        obj
      end
    end

    # Build parameter value according to the given collection format.
    # @param [String] collection_format one of :csv, :ssv, :tsv, :pipes and :multi
    def build_collection_param(param, collection_format)
      case collection_format
      when :csv
        param.join(',')
      when :ssv
        param.join(' ')
      when :tsv
        param.join("\t")
      when :pipes
        param.join('|')
      when :multi
        # return the array directly as typhoeus will handle it as expected
        param
      else
        fail "unknown collection format: #{collection_format.inspect}"
      end
    end
  end
end
