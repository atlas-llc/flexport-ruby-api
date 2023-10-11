=begin
#Logistics API

## Getting Started  Welcome to the API reference for the Logistics API.  The Logistics API provide access to the logistics network that powers all of our e-commerce operations, such as order fulfillment, order returns, freight, and parcel.  Build using our APIs to create custom applications and integrations, and retrieve data from your account.  The Logistics API is based on the REST standard, and follows the OpenAPI 3 specification.  You can access the Logistics API via one of the following following endpoints:  | Tenant                  | Base URL for REST Endpoints       | |-------------------------|-----------------------------------| | Production              | https://logistics-api.flexport.com | | Sandbox                 | coming soon                       |  To start using the Logistics API, you must have an active [Flexport Portal](https://portal.flexport.com) account. Sign up [here](https://login.deliverr.com/signup).  To inbound physical inventory, ship orders, process returns or buy parcel labels, you'll also need to set up a billing account.  ## Account Type  We believe there are two primary account types that will use the Logistics API.  | Account type             | Meaning within the API reference                                              | |--------------------------|-------------------------------------------------------------------------------| | You are a merchant if... | You will use the API to develop an integration for your own business or shop. | | You are a partner if...  | You will use the API to develop an application to serve your own customers.   |  ## Account Creation  Create a free [Flexport Portal](https://portal.flexport.com) account. Complete the questions to create your account, and don't forget to add your **business name**. When asked to create a catalog, you can select _\"I'm not selling online yet\"_.  - You can access the <a href=\"#tag/Products\">Products</a>, <a href=\"#tag/Webhooks\">Webhooks</a> and <a href=\"#tag/Reports\">Reports</a> API immediately regardless of billing status. - To use the <a href=\"#tag/Parcels\">Parcels</a> or <a href=\"#tag/Returns\">Returns</a> API, your account must meet certain criteria. To inquire, submit a [ticket](https://support.portal.flexport.com/hc/en-us/requests/new). - All other APIs require setting up [billing](https://support.portal.flexport.com/hc/en-us/articles/115003185313-View-Billing-in-the-Seller-Portal) in the Flexport Seller Portal.  ## Authentication and Authorization  To use the API, you will need an access token.  Each access token carries scopes with it.  This allows you to create one access token to access products, and another one to access orders, for example.  ### Creating Access Tokens  There are two ways to request an access token: 1. Using the UI in [Seller Portal -> Settings -> API Tokens](https://sellerportal.deliverr.com/settings/api-tokens).   1. Using the API as described [here](#tag/OAuth/operation/AuthorizationRedirect)  You must be an Administrator of your organization to manage access tokens.  Once issued, access tokens do not expire unless revoked by the Administrator.  ### Partner Access  If you wish to develop an application that could be used by more than one merchant, reach out to us to request a unique client ID.  Your application will receive callbacks with the authorization code whenever a merchant authorizes it using the [OAuth authorization_code flow](#tag/OAuth/operation/AuthorizationRedirect).  Provide the following: - Detailed description of your application - Callback URI where your application will be running to receive authorization codes  ### Migrating from Deliverr API  You must request new access tokens as described above when migrating from Deliverr API.  # Migration Guides  The Logistics API is the future hub of all API development. All future services will be added to the Logistics API family, and use its authentication, common objects, and standards. We have prepared this guide to help our customers when migrating from the [Deliverr API V1](https://api.deliverr.com/documentation/v1/spec) to the [Logistics API](https://logistics-api.deliverr.com/logistics/api/unstable/documentation/spec).  Here are the key differences between the two APIs at a high level:  | Difference                   | Logistics API version 2023-04        |       Deliverr API version 1.0.0     | |------------------------------|--------------------------------------|--------------------------------------| | OAuth 2.0, [RFC6749](https://www.rfc-editor.org/rfc/rfc6749) compliant | Yes | No | | Release schedule             | Every 3 months | Ad-hoc |  A handful of identifiers have been renamed or added in the Logistics API. Refer to the tables, like the one below, in each of the following guides.  | Changes in    | Deliverr API      | Logistics API      | |---------------|-------------------|--------------------| | All resources | productId (DSKU)  | logisticsSku       |  ## Inbounds  | Changes in    | Deliverr API           | Logistics API      | |---------------|------------------------|--------------------| | All resources | productId              | logisticsSku       | | Inbounds      | shippingPlan           | shipment           | | Inbounds      | externalShippingPlanId | N/A                | | Inbounds      | destination            | N/A                | | Inbounds      | caseQuantity           | N/A                |  In the Logistics API, inventory inbounding has been simplified and a number of new endpoints have been added. Refer to the <a href=\"#tag/Inbounds\">Inbounds</a> reference for additional details.  Key differences between the API are highlighted below: 1. Shipments can be read individually by the `id` of the shipment or as a list by specifying a list of ids via the `shipmentIds` query parameter 2. `logisticsSku` replaces `productId` as the identifier for the product being inbounded 3. When creating a shipment, the fields `externalShippingPlanId`, `destination` and `caseQuantity` are no longer supported 4. You cannot retrieve a shipment by an \"external\" `shippingId`. 5. Prep services such as box content labels can be required when creating a shipment 6. The GET labels endpoint in the Deliverr API has been replaced by an endpoint to request an expanded set of documents for the shipment (<a href=\"#tag/Inbounds/operation/GetTransferDocumentV2\">here</a>), which includes box content labels, shipping labels and bill of landing.  ## Products  | Changes in    | Deliverr API      | Logistics API      | |---------------|-------------------|--------------------| | All resources | productId         | logisticsSku       | | Product       | msku              | merchantSku        | | Product       | externalProductId | N/A                | | Inventory     | availableUnits    | available          | | Inventory     | N/A               | onHand             | | Inventory     | N/A               | unavailable        |  A few fundamental changes:  - It is no longer necessary to link an alias to a product before use, as linking functionality is optional - For placing fulfillment orders, use `logisticsSku` instead of `externalProductId` in the list of **lineItems** - In the seller portal, your existing `externalProductId` mapping under the aliases section of a Product Detail page as \"Deliverr API\" will not be used in the Logistics API and will remain unchanged - You cannot update a product's dimensions (`height`, `length`, `width`, `weight`), units (lb/kg, in/cm), or category via the API  The <a href=\"#tag/Products/operation/GetInventory\">retrieve inventory</a> endpoint response contains a few new fields.  The <a href=\"#tag/Products/operation/GetWarehouseDetails\">retrieve warehouse details</a> endpoint is a POST request instead of a GET. Instead of passing a list of `productId` in the `productIds` query parameter, you will now send a body in the following JSON format:  <!-- TODO: update all endpoints to use logisticsSku instead of logisticsSKU and update all fragments named SKU to sku per the codex. --> ```json {   \"logisticsSKUs\": [     \"DSKU1\",     \"DSKU2\",     \"DSKU3\"   ] } ```  ## Bundles  The bundle endpoints remain semantically similar between the Deliverr API and the Logistics API. However, the bundle creation flow has changed between the APIs. The order endpoints in the Logistics API do not support fulfilling orders by `bundleId`. Merchants who wish to fulfill bundle orders in the logistics API have two options: - You manage the mapping of bundles to their definitions in your systems, which is an array of `{ logisticsSku, quantity }`. - You define bundles via the API or the Seller Portal. Use the GetBundle endpoint to retrieve the bundle definition.  In both cases, you must use the `logisticsSku` and its total quantity when <a href=\"#tag/Orders/operation/CreateOrder\">creating an order</a>.  The following operations no longer exist in the Logistics API.  | Deprecated Endpoints            | |---------------------------------| | PATCH [LinkAliasToBundle](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/LinkAliasToBundle) | | PATCH [UnlinkAliasFromBundles](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/UnlinkAliasFromBundles) | | GET [GetBundleByExternalBundleId](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/GetBundleByExternalBundleId) |  ## Orders  | Changes in endpoint           | Deliverr API      | Logistics API          | |-------------------------------|-------------------|------------------------| | Create order                  | externalProductId | logisticsSku           | | Create order                  | orderShipmentTime | promisedShipByTime     | | Create order                  | orderDeliverTime  | promisedDeliveryByTime | | Create order                  | shipToAddress     | address                | | Create order                  | deliverDays       | deliveryDays           | | Create order                  | N/A               | packingSlipUrl         | | Create order                  | N/A               | duties                 | | Create order                  | createdAt         | N/A                    | | Create order                  | updatedAt         | N/A                    | | Create order                  | orderCreationTime | N/A                    |  The response payload for getting an order’s information has now changed. See the <a href=\"#tag/Orders/operation/GetOrder\">retrieve order</a> response.  ## Reports  Beyond changes to the URIs, the report endpoints are a one-to-one mapping between the Deliverr API and the Logistics API.  <!--  ## Parcels & Parcel Integration Placeholder: to be completed by the domain team -->  <!--  ## Returns Placeholder: to be completed by the domain team -->  ## Webhooks  Your webhook subscriptions must be recreated using the <a href=\"#tag/Webhooks/operation/CreateWebhook\">create webhook</a> endpoint.  # Common Resources  Besides following the OpenAPI 3.0 specification, below is a list of common resources and standards shared across the APIs.  ## Headers  The Logistics API makes use of the following custom HTTP headers. <!--  TODO: the generated OpenAPI specs do not contain header info for any of the endpoints, which is a gap in the documentation. https://github.com/Shopify/deliverr-issues/issues/5825 -->  | Header field name                | in request | in response | description | |----------------------------------|------------|-------------|-------------| | `x-correlation-id`               | no         | yes         | UUID v4 tied to a request | | `idempotency-key`                | yes        | no          | Can be any string, use for making POST or PATCH requests fault tolerant | | `idempotent-replayed`            | no         | yes         | If included in the response, indicates a stored value was used to replay the request |   ## Versioning  The Logistics API uses date based versioning for releases. Versions are declared explicitly in the Logistics API URI with a format of `/logistics/api/{api_version}/{endpoint}`. Stable releases follow the format of `yyyy-mm`. Experimental releases have an API version of `unstable`. For example:  ``` /logistics/api/2023-04/orders /logistics/api/unstable/orders ```  # Change Log  ## unstable  The \"unstable\" version contains code experimental changes, developer previews, and new features. However, endpoints can always change and may update with breaking changes without notice.  ## 2023-04  - Initial public beta release of the Logistics API  # Errors When an API error occurs, the HTTP response includes a three-digit HTTP status code with additional information returned as a <a href=\"https://www.rfc-editor.org/rfc/rfc7807\">problem+json</a> object, for example: ``` HTTP/1.1 404 Not Found Content-Type: application/problem+json Content-Language: en  {  \"type\": \"https://logistics-api.flexport.com/logistics/api/2023-04/documentation/spec#section/Errors/404-Not-Found\",  \"title\": \"Not Found\",  \"detail\": \"Cannot find order 49201824029\",  \"instance\": \"92e04577-c56b-47b9-b075-62096165a0ce\", } ``` In addition to the three-digit HTTP status code, some errors carry a six-digit error code   that provides additional detail about the specific error condition.  For example `405004` error code  refers to `Invalid scopes` and is documented [here](#section/Errors/405004-Invalid-scopes).  ## 400 Bad Request Bad Request.  #### Possible Causes - Incorrect HTTP method used. - Non-existent URL path used. - Malformed syntax in the request. - Missing a required parameter. - Input on the request did not pass validation. - The resource to be modified has moved into a state that is no longer valid.  #### Possible Solutions - Retry the request after correcting errors in the request and confirming it's valid.  - Verify if the resource to be modified exists and is in a valid state.  ## 401 Unauthorized The access token is invalid.  #### Possible Causes - No valid access token provided.  #### Possible Solutions - Check to ensure that the access token is valid.  ## 403 Forbidden Access token does not have permission to perform the requested operation.  #### Possible Causes - Access token provided is not authorized to perform the requested operation.  #### Possible Solutions - Check to ensure that the scope of the access token is sufficient to perform the requested operation. - Create and use a new access token that has the required scope.  ## 404 Not Found The requested object cannot be found.  #### Possible Causes - The identifier pointing to the request is incorrect.   - The specified resource is no longer available. - You do not have access to the specified resource.  #### Possible Solutions - Check that the specified resource exists.  ## 409 Conflict The object with the same identifier already exists.  #### Possible Causes - Resource was already created, but the request is attempting to create it again.  #### Possible Solutions - Check that the resource identifier is unique. - Use [idempotency-key](#section/Common-Resources/Headers) when creating resources.   ## 422 Unprocessable Content The request is malformed.    #### Possible Causes - Request contains invalid data or syntax errors.  #### Possible Solutions - Check the payload for inconsistencies or errors.  ## 429 Too Many Requests Too many requests in a given amount of time (\"rate limiting\").  #### Possible Causes - Too many requests were made in a short period of time that exceed the API rate limit allowed.  #### Possible Solutions - Try again later.  We recommend an exponential backoff of your requests. - Refer to the `Retry-After` header for the number of seconds to wait before retrying the request.  ## 423 Locked Access to the Logistics API is locked and denied.  #### Possible Causes - Flexport Portal account may be frozen and/or deactivated.  #### Possible Solutions - Contact <a href=\"https://support.portal.flexport.com/hc/en-us/articles/1500009448562-Contacting-the-Support-team\">Flexport support</a>.  ## 5XX Internal Server Error An internal error has occurred while processing the request (these are uncommon).  #### Possible Causes - The request is incorrect and cannot be processed. - The server is currently unable to handle the request.  #### Possible Solutions - Verify that the request is correct and retry it. - Retry the request at a later time.  ## 405001 Invalid redirect URI The redirect URI specified as a callback for OAuth authorization is invalid.  #### Possible Causes - Redirect URI must be `https://deliverr.com` if `identity` is used as the client ID. - Redirect URI must be exactly the same URI as the one registered with the client ID provided.  #### Possible Solutions - Verify that the redirect URI is correct.  ## 405002 Invalid client_id Invalid client_id.  #### Possible Causes - The client ID provided is invalid.  The client ID must be `identity` or a valid client ID registered with Flexport.  #### Possible Solutions - Submit a valid client ID.  ## 405003 Missing scopes Scopes were not provided.  #### Possible Causes - Scope parameter was not provided in the request.  #### Possible Solutions - Check to ensure the request includes scopes.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).  ## 405004 Invalid scopes Some of the scopes provided are invalid.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).  #### Possible Causes - Scope parameter was provided in the request, but the scope values are invalid. - Incorrect separator was used to separate scopes.   #### Possible Solutions - Check to ensure that scopes requested are known and valid.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).  ## 405005 Invalid code The one-time authorization code provided is invalid, expired, or has already been used.  #### Possible Causes - Authorization code has already been used. - Authorization code has expired because it was requested longer than a few minutes ago. - Authorization code is invalid.  #### Possible Solutions - Restart the [OAuth flow](#tag/OAuth/operation/AuthorizationRedirect) to receive a new authorization code. ## 407001 Invalid order status Operation cannot proceed, because order is in a state that does not allow it.  #### Possible Causes - Order retry was requested, however the original order was successful.  #### Possible Solutions - Ensure that the order is in the correct state, e.g. if order is being retried the order state should be `Canceled`. 

The version of the OpenAPI document: unstable

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 7.0.1

=end

require 'date'
require 'time'

module Flexport
  class PackInventory
    attr_accessor :logistics_sku

    # The calculation of on-hand quantity, non-Pickable quantity, and in-transfer quantity, belonging to products whose dimsLocked field is true, that are in a pickable and shippable state at connected warehouses.
    attr_accessor :on_hand

    # The number of units available for sale - not reserved for open orders, belonging to products whose dimsLocked field is true, that are in a pickable and shippable state at connected warehouses.
    attr_accessor :available

    # The number of units not available for sale - not reserved for open orders, belonging to products whose dimsLocked field is true, that are in a pickable and shippable state at connected warehouses.
    attr_accessor :unavailable

    attr_accessor :units_per_pack

    attr_accessor :lot_tracking_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'logistics_sku' => :'logisticsSku',
        :'on_hand' => :'onHand',
        :'available' => :'available',
        :'unavailable' => :'unavailable',
        :'units_per_pack' => :'unitsPerPack',
        :'lot_tracking_details' => :'lotTrackingDetails'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'logistics_sku' => :'String',
        :'on_hand' => :'Integer',
        :'available' => :'Integer',
        :'unavailable' => :'Integer',
        :'units_per_pack' => :'Float',
        :'lot_tracking_details' => :'Array<LotTrackingDetails>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'PickApiInventoryResponseExcludeKeyofApiInventoryResponseBreakdown'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Flexport::PackInventory` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Flexport::PackInventory`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'logistics_sku')
        self.logistics_sku = attributes[:'logistics_sku']
      else
        self.logistics_sku = nil
      end

      if attributes.key?(:'on_hand')
        self.on_hand = attributes[:'on_hand']
      else
        self.on_hand = nil
      end

      if attributes.key?(:'available')
        self.available = attributes[:'available']
      else
        self.available = nil
      end

      if attributes.key?(:'unavailable')
        self.unavailable = attributes[:'unavailable']
      else
        self.unavailable = nil
      end

      if attributes.key?(:'units_per_pack')
        self.units_per_pack = attributes[:'units_per_pack']
      end

      if attributes.key?(:'lot_tracking_details')
        if (value = attributes[:'lot_tracking_details']).is_a?(Array)
          self.lot_tracking_details = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @logistics_sku.nil?
        invalid_properties.push('invalid value for "logistics_sku", logistics_sku cannot be nil.')
      end

      if @on_hand.nil?
        invalid_properties.push('invalid value for "on_hand", on_hand cannot be nil.')
      end

      if @available.nil?
        invalid_properties.push('invalid value for "available", available cannot be nil.')
      end

      if @unavailable.nil?
        invalid_properties.push('invalid value for "unavailable", unavailable cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @logistics_sku.nil?
      return false if @on_hand.nil?
      return false if @available.nil?
      return false if @unavailable.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] on_hand Value to be assigned
    def on_hand=(on_hand)
      if on_hand.nil?
        fail ArgumentError, 'on_hand cannot be nil'
      end

      @on_hand = on_hand
    end

    # Custom attribute writer method with validation
    # @param [Object] available Value to be assigned
    def available=(available)
      if available.nil?
        fail ArgumentError, 'available cannot be nil'
      end

      @available = available
    end

    # Custom attribute writer method with validation
    # @param [Object] unavailable Value to be assigned
    def unavailable=(unavailable)
      if unavailable.nil?
        fail ArgumentError, 'unavailable cannot be nil'
      end

      @unavailable = unavailable
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          logistics_sku == o.logistics_sku &&
          on_hand == o.on_hand &&
          available == o.available &&
          unavailable == o.unavailable &&
          units_per_pack == o.units_per_pack &&
          lot_tracking_details == o.lot_tracking_details
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [logistics_sku, on_hand, available, unavailable, units_per_pack, lot_tracking_details].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def self._deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = Flexport.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
