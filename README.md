# flexport

Flexport - the Ruby gem for the Logistics API

# Getting Started

Welcome to the API reference for the Logistics API.

The Logistics API provide access to the logistics network that powers all of our e-commerce operations, such as order fulfillment, order returns, freight, and parcel.

Build using our APIs to create custom applications and integrations, and retrieve data from your account.

The Logistics API is based on the REST standard, and follows the OpenAPI 3 specification.

You can access the Logistics API via one of the following following endpoints:

| Tenant                  | Base URL for REST Endpoints       |
|-------------------------|-----------------------------------|
| Production              | https://logistics-api.flexport.com |
| Sandbox                 | coming soon                       |

To start using the Logistics API, you must have an active [Flexport Portal](https://portal.flexport.com) account. Sign up [here](https://login.deliverr.com/signup).

To inbound physical inventory, ship orders, process returns or buy parcel labels, you'll also need to set up a billing account.

## Account Type

We believe there are two primary account types that will use the Logistics API.

| Account type             | Meaning within the API reference                                              |
|--------------------------|-------------------------------------------------------------------------------|
| You are a merchant if... | You will use the API to develop an integration for your own business or shop. |
| You are a partner if...  | You will use the API to develop an application to serve your own customers.   |

## Account Creation

Create a free [Flexport Portal](https://portal.flexport.com) account. Complete the questions to create your account, and don't forget to add your **business name**. When asked to create a catalog, you can select _\"I'm not selling online yet\"_.

- You can access the <a href=\"#tag/Products\">Products</a>, <a href=\"#tag/Webhooks\">Webhooks</a> and <a href=\"#tag/Reports\">Reports</a> API immediately regardless of billing status.
- To use the <a href=\"#tag/Parcels\">Parcels</a> or <a href=\"#tag/Returns\">Returns</a> API, your account must meet certain criteria. To inquire, submit a [ticket](https://support.portal.flexport.com/hc/en-us/requests/new).
- All other APIs require setting up [billing](https://support.portal.flexport.com/hc/en-us/articles/115003185313-View-Billing-in-the-Seller-Portal) in the Flexport Seller Portal.

## Authentication and Authorization

To use the API, you will need an access token.  Each access token carries scopes with it.  This allows you to create one access token to access products, and another one to access orders, for example.

### Creating Access Tokens

There are two ways to request an access token:
1. Using the UI in [Seller Portal -> Settings -> API Tokens](https://sellerportal.deliverr.com/settings/api-tokens).  
1. Using the API as described [here](#tag/OAuth/operation/AuthorizationRedirect)

You must be an Administrator of your organization to manage access tokens.

Once issued, access tokens do not expire unless revoked by the Administrator.

### Partner Access

If you wish to develop an application that could be used by more than one merchant, reach out to us to request a unique client ID.  Your application will receive callbacks with the authorization code whenever a merchant authorizes it using the [OAuth authorization_code flow](#tag/OAuth/operation/AuthorizationRedirect).

Provide the following:
- Detailed description of your application
- Callback URI where your application will be running to receive authorization codes

### Migrating from Deliverr API

You must request new access tokens as described above when migrating from Deliverr API.

# Migration Guides

The Logistics API is the future hub of all API development. All future services will be added to the Logistics API family, and use its authentication, common objects, and standards. We have prepared this guide to help our customers when migrating from the [Deliverr API V1](https://api.deliverr.com/documentation/v1/spec) to the [Logistics API](https://logistics-api.deliverr.com/logistics/api/unstable/documentation/spec).

Here are the key differences between the two APIs at a high level:

| Difference                   | Logistics API version 2023-04        |       Deliverr API version 1.0.0     |
|------------------------------|--------------------------------------|--------------------------------------|
| OAuth 2.0, [RFC6749](https://www.rfc-editor.org/rfc/rfc6749) compliant | Yes | No |
| Release schedule             | Every 3 months | Ad-hoc |

A handful of identifiers have been renamed or added in the Logistics API. Refer to the tables, like the one below, in each of the following guides.

| Changes in    | Deliverr API      | Logistics API      |
|---------------|-------------------|--------------------|
| All resources | productId (DSKU)  | logisticsSku       |

## Inbounds

| Changes in    | Deliverr API           | Logistics API      |
|---------------|------------------------|--------------------|
| All resources | productId              | logisticsSku       |
| Inbounds      | shippingPlan           | shipment           |
| Inbounds      | externalShippingPlanId | N/A                |
| Inbounds      | destination            | N/A                |
| Inbounds      | caseQuantity           | N/A                |

In the Logistics API, inventory inbounding has been simplified and a number of new endpoints have been added. Refer to the <a href=\"#tag/Inbounds\">Inbounds</a> reference for additional details.

Key differences between the API are highlighted below:
1. Shipments can be read individually by the `id` of the shipment or as a list by specifying a list of ids via the `shipmentIds` query parameter
2. `logisticsSku` replaces `productId` as the identifier for the product being inbounded
3. When creating a shipment, the fields `externalShippingPlanId`, `destination` and `caseQuantity` are no longer supported
4. You cannot retrieve a shipment by an \"external\" `shippingId`.
5. Prep services such as box content labels can be required when creating a shipment
6. The GET labels endpoint in the Deliverr API has been replaced by an endpoint to request an expanded set of documents for the shipment (<a href=\"#tag/Inbounds/operation/GetTransferDocumentV2\">here</a>), which includes box content labels, shipping labels and bill of landing.

## Products

| Changes in    | Deliverr API      | Logistics API      |
|---------------|-------------------|--------------------|
| All resources | productId         | logisticsSku       |
| Product       | msku              | merchantSku        |
| Product       | externalProductId | N/A                |
| Inventory     | availableUnits    | available          |
| Inventory     | N/A               | onHand             |
| Inventory     | N/A               | unavailable        |

A few fundamental changes:

- It is no longer necessary to link an alias to a product before use, as linking functionality is optional
- For placing fulfillment orders, use `logisticsSku` instead of `externalProductId` in the list of **lineItems**
- In the seller portal, your existing `externalProductId` mapping under the aliases section of a Product Detail page as \"Deliverr API\" will not be used in the Logistics API and will remain unchanged
- You cannot update a product's dimensions (`height`, `length`, `width`, `weight`), units (lb/kg, in/cm), or category via the API

The <a href=\"#tag/Products/operation/GetInventory\">retrieve inventory</a> endpoint response contains a few new fields.

The <a href=\"#tag/Products/operation/GetWarehouseDetails\">retrieve warehouse details</a> endpoint is a POST request instead of a GET. Instead of passing a list of `productId` in the `productIds` query parameter, you will now send a body in the following JSON format:

<!-- TODO: update all endpoints to use logisticsSku instead of logisticsSKU and update all fragments named SKU to sku per the codex. -->
```json
{
  \"logisticsSKUs\": [
    \"DSKU1\",
    \"DSKU2\",
    \"DSKU3\"
  ]
}
```

## Bundles

The bundle endpoints remain semantically similar between the Deliverr API and the Logistics API. However, the bundle creation flow has changed between the APIs. The order endpoints in the Logistics API do not support fulfilling orders by `bundleId`. Merchants who wish to fulfill bundle orders in the logistics API have two options:
- You manage the mapping of bundles to their definitions in your systems, which is an array of `{ logisticsSku, quantity }`.
- You define bundles via the API or the Seller Portal. Use the GetBundle endpoint to retrieve the bundle definition.

In both cases, you must use the `logisticsSku` and its total quantity when <a href=\"#tag/Orders/operation/CreateOrder\">creating an order</a>.

The following operations no longer exist in the Logistics API.

| Deprecated Endpoints            |
|---------------------------------|
| PATCH [LinkAliasToBundle](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/LinkAliasToBundle) |
| PATCH [UnlinkAliasFromBundles](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/UnlinkAliasFromBundles) |
| GET [GetBundleByExternalBundleId](https://api.deliverr.com/documentation/v1/spec#tag/Bundles/operation/GetBundleByExternalBundleId) |

## Orders

| Changes in endpoint           | Deliverr API      | Logistics API          |
|-------------------------------|-------------------|------------------------|
| Create order                  | externalProductId | logisticsSku           |
| Create order                  | orderShipmentTime | promisedShipByTime     |
| Create order                  | orderDeliverTime  | promisedDeliveryByTime |
| Create order                  | shipToAddress     | address                |
| Create order                  | deliverDays       | deliveryDays           |
| Create order                  | N/A               | packingSlipUrl         |
| Create order                  | N/A               | duties                 |
| Create order                  | createdAt         | N/A                    |
| Create order                  | updatedAt         | N/A                    |
| Create order                  | orderCreationTime | N/A                    |

The response payload for getting an order’s information has now changed. See the <a href=\"#tag/Orders/operation/GetOrder\">retrieve order</a> response.

## Reports

Beyond changes to the URIs, the report endpoints are a one-to-one mapping between the Deliverr API and the Logistics API.

<!-- 
## Parcels & Parcel Integration
Placeholder: to be completed by the domain team
-->

<!-- 
## Returns
Placeholder: to be completed by the domain team
-->

## Webhooks

Your webhook subscriptions must be recreated using the <a href=\"#tag/Webhooks/operation/CreateWebhook\">create webhook</a> endpoint.

# Common Resources

Besides following the OpenAPI 3.0 specification, below is a list of common resources and standards shared across the APIs.

## Headers

The Logistics API makes use of the following custom HTTP headers.
<!-- 
TODO: the generated OpenAPI specs do not contain header info for any of the endpoints, which is a gap in the documentation. https://github.com/Shopify/deliverr-issues/issues/5825
-->

| Header field name                | in request | in response | description |
|----------------------------------|------------|-------------|-------------|
| `x-correlation-id`               | no         | yes         | UUID v4 tied to a request |
| `idempotency-key`                | yes        | no          | Can be any string, use for making POST or PATCH requests fault tolerant |
| `idempotent-replayed`            | no         | yes         | If included in the response, indicates a stored value was used to replay the request |


## Versioning

The Logistics API uses date based versioning for releases. Versions are declared explicitly in the Logistics API URI with a format of `/logistics/api/{api_version}/{endpoint}`. Stable releases follow the format of `yyyy-mm`. Experimental releases have an API version of `unstable`. For example:

```
/logistics/api/2023-04/orders
/logistics/api/unstable/orders
```

# Change Log

## unstable

The \"unstable\" version contains code experimental changes, developer previews, and new features. However, endpoints can always change and may update with breaking changes without notice.

## 2023-04

- Initial public beta release of the Logistics API

# Errors
When an API error occurs, the HTTP response includes a three-digit HTTP status code with additional information returned
as a <a href=\"https://www.rfc-editor.org/rfc/rfc7807\">problem+json</a> object, for example:
```
HTTP/1.1 404 Not Found
Content-Type: application/problem+json
Content-Language: en

{
 \"type\": \"https://logistics-api.flexport.com/logistics/api/2023-04/documentation/spec#section/Errors/404-Not-Found\",
 \"title\": \"Not Found\",
 \"detail\": \"Cannot find order 49201824029\",
 \"instance\": \"92e04577-c56b-47b9-b075-62096165a0ce\",
}
```
In addition to the three-digit HTTP status code, some errors carry a six-digit error code  
that provides additional detail about the specific error condition.  For example `405004` error code 
refers to `Invalid scopes` and is documented [here](#section/Errors/405004-Invalid-scopes).

## 400 Bad Request
Bad Request.

#### Possible Causes
- Incorrect HTTP method used.
- Non-existent URL path used.
- Malformed syntax in the request.
- Missing a required parameter.
- Input on the request did not pass validation.
- The resource to be modified has moved into a state that is no longer valid.

#### Possible Solutions
- Retry the request after correcting errors in the request and confirming it's valid. 
- Verify if the resource to be modified exists and is in a valid state.

## 401 Unauthorized
The access token is invalid.

#### Possible Causes
- No valid access token provided.

#### Possible Solutions
- Check to ensure that the access token is valid.

## 403 Forbidden
Access token does not have permission to perform the requested operation.

#### Possible Causes
- Access token provided is not authorized to perform the requested operation.

#### Possible Solutions
- Check to ensure that the scope of the access token is sufficient to perform the requested operation.
- Create and use a new access token that has the required scope.

## 404 Not Found
The requested object cannot be found.

#### Possible Causes
- The identifier pointing to the request is incorrect.  
- The specified resource is no longer available.
- You do not have access to the specified resource.

#### Possible Solutions
- Check that the specified resource exists.

## 409 Conflict
The object with the same identifier already exists.

#### Possible Causes
- Resource was already created, but the request is attempting to create it again.

#### Possible Solutions
- Check that the resource identifier is unique.
- Use [idempotency-key](#section/Common-Resources/Headers) when creating resources. 

## 422 Unprocessable Content
The request is malformed.  

#### Possible Causes
- Request contains invalid data or syntax errors.

#### Possible Solutions
- Check the payload for inconsistencies or errors.

## 429 Too Many Requests
Too many requests in a given amount of time (\"rate limiting\").

#### Possible Causes
- Too many requests were made in a short period of time that exceed the API rate limit allowed.

#### Possible Solutions
- Try again later.  We recommend an exponential backoff of your requests.
- Refer to the `Retry-After` header for the number of seconds to wait before retrying the request.

## 423 Locked
Access to the Logistics API is locked and denied.

#### Possible Causes
- Flexport Portal account may be frozen and/or deactivated.

#### Possible Solutions
- Contact <a href=\"https://support.portal.flexport.com/hc/en-us/articles/1500009448562-Contacting-the-Support-team\">Flexport support</a>.

## 5XX Internal Server Error
An internal error has occurred while processing the request (these are uncommon).

#### Possible Causes
- The request is incorrect and cannot be processed.
- The server is currently unable to handle the request.

#### Possible Solutions
- Verify that the request is correct and retry it.
- Retry the request at a later time.

## 405001 Invalid redirect URI
The redirect URI specified as a callback for OAuth authorization is invalid.

#### Possible Causes
- Redirect URI must be `https://deliverr.com` if `identity` is used as the client ID.
- Redirect URI must be exactly the same URI as the one registered with the client ID provided.

#### Possible Solutions
- Verify that the redirect URI is correct.

## 405002 Invalid client_id
Invalid client_id.

#### Possible Causes
- The client ID provided is invalid.  The client ID must be `identity` or a valid client ID registered with Flexport.

#### Possible Solutions
- Submit a valid client ID.

## 405003 Missing scopes
Scopes were not provided.

#### Possible Causes
- Scope parameter was not provided in the request.

#### Possible Solutions
- Check to ensure the request includes scopes.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).

## 405004 Invalid scopes
Some of the scopes provided are invalid.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).

#### Possible Causes
- Scope parameter was provided in the request, but the scope values are invalid.
- Incorrect separator was used to separate scopes. 

#### Possible Solutions
- Check to ensure that scopes requested are known and valid.  For all available scopes see [OAuth](#tag/OAuth/operation/AuthorizationRedirect).

## 405005 Invalid code
The one-time authorization code provided is invalid, expired, or has already been used.

#### Possible Causes
- Authorization code has already been used.
- Authorization code has expired because it was requested longer than a few minutes ago.
- Authorization code is invalid.

#### Possible Solutions
- Restart the [OAuth flow](#tag/OAuth/operation/AuthorizationRedirect) to receive a new authorization code.
## 407001 Invalid order status
Operation cannot proceed, because order is in a state that does not allow it.

#### Possible Causes
- Order retry was requested, however the original order was successful.

#### Possible Solutions
- Ensure that the order is in the correct state, e.g. if order is being retried the order state should be `Canceled`.


This SDK is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: unstable
- Package version: 1.0.0
- Build package: org.openapitools.codegen.languages.RubyClientCodegen
For more information, please visit [https://support.portal.flexport.com/hc/en-us/articles/1500009448562-Contacting-the-Support-team](https://support.portal.flexport.com/hc/en-us/articles/1500009448562-Contacting-the-Support-team)

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build flexport.gemspec
```

Then either install the gem locally:

```shell
gem install ./flexport-1.0.0.gem
```

(for development, run `gem install --dev ./flexport-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'flexport', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'flexport', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:

```ruby
# Load the gem
require 'flexport'

# Setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
  # Configure a proc to get access tokens in lieu of the static access_token configuration
  config.access_token_getter = -> { 'YOUR TOKEN GETTER PROC' } 
  # Configure faraday connection
  config.configure_faraday_connection { |connection| 'YOUR CONNECTION CONFIG PROC' }
end

api_instance = Flexport::AccountsApi.new

begin
  #Get logistics account standing status
  result = api_instance.get_logistics_account_standing_status
  p result
rescue Flexport::ApiError => e
  puts "Exception when calling AccountsApi->get_logistics_account_standing_status: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://logistics-api.flexport.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*Flexport::AccountsApi* | [**get_logistics_account_standing_status**](docs/AccountsApi.md#get_logistics_account_standing_status) | **GET** /logistics/api/unstable/accounts/status | Get logistics account standing status
*Flexport::BundlesApi* | [**create_bundle**](docs/BundlesApi.md#create_bundle) | **POST** /logistics/api/unstable/bundles | 
*Flexport::BundlesApi* | [**get_bundle**](docs/BundlesApi.md#get_bundle) | **GET** /logistics/api/unstable/bundles/{bundleId} | 
*Flexport::BundlesApi* | [**get_bundle_inventory**](docs/BundlesApi.md#get_bundle_inventory) | **GET** /logistics/api/unstable/bundles/{bundleId}/inventory | 
*Flexport::ChannelsApi* | [**create_channel**](docs/ChannelsApi.md#create_channel) | **POST** /logistics/api/unstable/channels | Create or update a new channel
*Flexport::ChannelsApi* | [**create_product_sync**](docs/ChannelsApi.md#create_product_sync) | **POST** /logistics/api/unstable/channels/{channelType}/shop/{storeName}/sync | Sync products for a channel
*Flexport::ChannelsApi* | [**get_product_sync_status**](docs/ChannelsApi.md#get_product_sync_status) | **GET** /logistics/api/unstable/channels/{channelType}/shop/{storeName}/sync | Get product sync status
*Flexport::EventsApi* | [**get_events**](docs/EventsApi.md#get_events) | **GET** /logistics/api/unstable/events | 
*Flexport::FreightApi* | [**cancel**](docs/FreightApi.md#cancel) | **POST** /logistics/api/unstable/freight/orders/{orderId}/cancel | Cancel an order
*Flexport::FreightApi* | [**create_containers_order**](docs/FreightApi.md#create_containers_order) | **POST** /logistics/api/unstable/freight/orders/containers | Book a drayage shipment
*Flexport::FreightApi* | [**create_containers_quote**](docs/FreightApi.md#create_containers_quote) | **POST** /logistics/api/unstable/freight/quotes/containers | Create a Drayage quote
*Flexport::FreightApi* | [**create_pallets_order**](docs/FreightApi.md#create_pallets_order) | **POST** /logistics/api/unstable/freight/orders/pallets | Book an LTL shipment
*Flexport::FreightApi* | [**create_pallets_quote**](docs/FreightApi.md#create_pallets_quote) | **POST** /logistics/api/unstable/freight/quotes/pallets | Create an LTL quote
*Flexport::FreightApi* | [**create_truck_quote**](docs/FreightApi.md#create_truck_quote) | **POST** /logistics/api/unstable/freight/quotes/trucks | Create an FTL quote
*Flexport::FreightApi* | [**create_trucks_order**](docs/FreightApi.md#create_trucks_order) | **POST** /logistics/api/unstable/freight/orders/trucks | Book an FTL shipment
*Flexport::FreightApi* | [**get_bol_tracking**](docs/FreightApi.md#get_bol_tracking) | **GET** /logistics/api/unstable/freight/tracking_events/{bolId} | Returns freight tracking events
*Flexport::FreightApi* | [**get_freight_order**](docs/FreightApi.md#get_freight_order) | **GET** /logistics/api/unstable/freight/orders/{orderId} | Get order by ID
*Flexport::FreightApi* | [**get_freight_orders**](docs/FreightApi.md#get_freight_orders) | **GET** /logistics/api/unstable/freight/orders | Get all orders
*Flexport::FreightApi* | [**get_freight_ports**](docs/FreightApi.md#get_freight_ports) | **GET** /logistics/api/unstable/freight/ports | Get all ports
*Flexport::FreightApi* | [**get_order_documents**](docs/FreightApi.md#get_order_documents) | **GET** /logistics/api/unstable/freight/orders/{orderId}/documents | Get documents for an order
*Flexport::FreightApi* | [**get_quote**](docs/FreightApi.md#get_quote) | **GET** /logistics/api/unstable/freight/quotes/{quoteId} | Get quote by ID
*Flexport::FreightApi* | [**get_quotes**](docs/FreightApi.md#get_quotes) | **GET** /logistics/api/unstable/freight/quotes | Get all quotes
*Flexport::InboundsApi* | [**create_inbounding_shipment_v4**](docs/InboundsApi.md#create_inbounding_shipment_v4) | **POST** /logistics/api/unstable/inbounds/shipments | Create a shipment
*Flexport::InboundsApi* | [**get_inbounding_shipment_quote_purchase_result**](docs/InboundsApi.md#get_inbounding_shipment_quote_purchase_result) | **GET** /logistics/api/unstable/inbounds/shipments/{shipmentId}/quotes/buy | Get all quotes that have been successfully bought for a shipment
*Flexport::InboundsApi* | [**get_inbounding_shipment_quote_result**](docs/InboundsApi.md#get_inbounding_shipment_quote_result) | **GET** /logistics/api/unstable/inbounds/shipments/{shipmentId}/quotes | Get quotes for a shipment
*Flexport::InboundsApi* | [**get_inbounding_shipment_v4**](docs/InboundsApi.md#get_inbounding_shipment_v4) | **GET** /logistics/api/unstable/inbounds/shipments/{shipmentId} | Get a shipment
*Flexport::InboundsApi* | [**get_inbounding_shipments_v4**](docs/InboundsApi.md#get_inbounding_shipments_v4) | **GET** /logistics/api/unstable/inbounds/shipments | Get a list of shipments
*Flexport::InboundsApi* | [**get_transfer_document_v2**](docs/InboundsApi.md#get_transfer_document_v2) | **GET** /logistics/api/unstable/inbounds/shipments/{shipmentId}/document | Request document for a shipment
*Flexport::InboundsApi* | [**init_quote_process_for_inbounding_shipment_v2**](docs/InboundsApi.md#init_quote_process_for_inbounding_shipment_v2) | **POST** /logistics/api/unstable/inbounds/shipments/{shipmentId}/quotes | Begin asynchronous request quotes for a shipment
*Flexport::InboundsApi* | [**init_quote_purchase_process_for_inbounding_shipment_v2**](docs/InboundsApi.md#init_quote_purchase_process_for_inbounding_shipment_v2) | **POST** /logistics/api/unstable/inbounds/shipments/{shipmentId}/quotes/buy | Begin asynchronous request to buy a quote for a shipment
*Flexport::InboundsApi* | [**update_inbounding_shipment_v3**](docs/InboundsApi.md#update_inbounding_shipment_v3) | **PATCH** /logistics/api/unstable/inbounds/shipments/{shipmentId}/update | Update a shipment
*Flexport::OAuthApi* | [**authorization_redirect**](docs/OAuthApi.md#authorization_redirect) | **GET** /logistics/api/unstable/oauth/authorize | 
*Flexport::OAuthApi* | [**token_exchange**](docs/OAuthApi.md#token_exchange) | **POST** /logistics/api/unstable/oauth/token | 
*Flexport::OrdersApi* | [**cancel_order**](docs/OrdersApi.md#cancel_order) | **POST** /logistics/api/unstable/orders/{orderId}/cancel | 
*Flexport::OrdersApi* | [**create_order202307**](docs/OrdersApi.md#create_order202307) | **POST** /logistics/api/unstable/orders | CreateOrder
*Flexport::OrdersApi* | [**get_order**](docs/OrdersApi.md#get_order) | **GET** /logistics/api/unstable/orders/{orderId} | 
*Flexport::OrdersApi* | [**get_order_by_external_id**](docs/OrdersApi.md#get_order_by_external_id) | **GET** /logistics/api/unstable/orders/external_id/{externalOrderId} | 
*Flexport::OrdersApi* | [**retry_order**](docs/OrdersApi.md#retry_order) | **POST** /logistics/api/unstable/orders/{orderId}/retry | 
*Flexport::ParcelsApi* | [**cancel_parcel**](docs/ParcelsApi.md#cancel_parcel) | **POST** /logistics/api/unstable/parcels/cancel | Cancel a parcel
*Flexport::ParcelsApi* | [**create_bulk_parcel_job**](docs/ParcelsApi.md#create_bulk_parcel_job) | **POST** /logistics/api/unstable/parcels/jobs | Create a bulk parcel job
*Flexport::ParcelsApi* | [**create_parcel_v3**](docs/ParcelsApi.md#create_parcel_v3) | **POST** /logistics/api/unstable/parcels | Create a parcel
*Flexport::ParcelsApi* | [**get_bulk_parcel_job**](docs/ParcelsApi.md#get_bulk_parcel_job) | **GET** /logistics/api/unstable/parcels/jobs/{id} | Get a Bulk Parcel Job by ID
*Flexport::ParcelsApi* | [**get_parcel**](docs/ParcelsApi.md#get_parcel) | **GET** /logistics/api/unstable/parcels/{parcelId} | Get a parcel by ID
*Flexport::ParcelsApi* | [**get_parcel_quote_v2**](docs/ParcelsApi.md#get_parcel_quote_v2) | **POST** /logistics/api/unstable/parcels/quote | Get a parcel quote
*Flexport::ParcelsApi* | [**get_parcel_tracking**](docs/ParcelsApi.md#get_parcel_tracking) | **GET** /logistics/api/unstable/parcels/{parcelId}/tracking | Get a parcel's tracking information by Parcel ID
*Flexport::ParcelsApi* | [**get_parcel_tracking_by_tracking_code**](docs/ParcelsApi.md#get_parcel_tracking_by_tracking_code) | **GET** /logistics/api/unstable/parcels/tracking/{trackingCode} | Get a parcel's tracking information by tracking code
*Flexport::ParcelsApi* | [**get_tracking_url**](docs/ParcelsApi.md#get_tracking_url) | **GET** /logistics/api/unstable/parcels/{parcelId}/tracking_url | Get the tracking URL for a parcel
*Flexport::ProductsApi* | [**create_product**](docs/ProductsApi.md#create_product) | **POST** /logistics/api/unstable/products | 
*Flexport::ProductsApi* | [**get_all_inventory**](docs/ProductsApi.md#get_all_inventory) | **GET** /logistics/api/unstable/products/inventory/all | 
*Flexport::ProductsApi* | [**get_inventory**](docs/ProductsApi.md#get_inventory) | **GET** /logistics/api/unstable/products/{logisticsSku}/inventory | 
*Flexport::ProductsApi* | [**get_product**](docs/ProductsApi.md#get_product) | **GET** /logistics/api/unstable/products/{logisticsSku} | 
*Flexport::ProductsApi* | [**get_products**](docs/ProductsApi.md#get_products) | **GET** /logistics/api/unstable/products | 
*Flexport::ProductsApi* | [**get_warehouse_details**](docs/ProductsApi.md#get_warehouse_details) | **POST** /logistics/api/unstable/products/warehouse | 
*Flexport::ReportsApi* | [**generate_report**](docs/ReportsApi.md#generate_report) | **POST** /logistics/api/unstable/reports | 
*Flexport::ReportsApi* | [**get_report_status**](docs/ReportsApi.md#get_report_status) | **GET** /logistics/api/unstable/reports/{reportReference} | 
*Flexport::ReturnsApi* | [**get_returns**](docs/ReturnsApi.md#get_returns) | **GET** /logistics/api/unstable/returns | 
*Flexport::ReturnsApi* | [**returns_cancel_order**](docs/ReturnsApi.md#returns_cancel_order) | **POST** /logistics/api/unstable/returns/{returnId}/cancel | 
*Flexport::ReturnsApi* | [**returns_create_order**](docs/ReturnsApi.md#returns_create_order) | **POST** /logistics/api/unstable/returns | 
*Flexport::ReturnsApi* | [**returns_get_order**](docs/ReturnsApi.md#returns_get_order) | **GET** /logistics/api/unstable/returns/{returnId} | 
*Flexport::UploadsApi* | [**create_upload_target**](docs/UploadsApi.md#create_upload_target) | **POST** /logistics/api/unstable/uploads | Create an upload target
*Flexport::WebhooksApi* | [**create_webhook**](docs/WebhooksApi.md#create_webhook) | **POST** /logistics/api/unstable/webhooks | 
*Flexport::WebhooksApi* | [**delete_webhook**](docs/WebhooksApi.md#delete_webhook) | **DELETE** /logistics/api/unstable/webhooks/{webhookId} | 
*Flexport::WebhooksApi* | [**get_webhook**](docs/WebhooksApi.md#get_webhook) | **GET** /logistics/api/unstable/webhooks/{webhookId} | 
*Flexport::WebhooksApi* | [**get_webhooks**](docs/WebhooksApi.md#get_webhooks) | **GET** /logistics/api/unstable/webhooks | 


## Documentation for Models

 - [Flexport::AccountStandingStatusOutput](docs/AccountStandingStatusOutput.md)
 - [Flexport::Address](docs/Address.md)
 - [Flexport::AddressInput](docs/AddressInput.md)
 - [Flexport::AddressesOutput](docs/AddressesOutput.md)
 - [Flexport::Adjustment](docs/Adjustment.md)
 - [Flexport::ApiBundle](docs/ApiBundle.md)
 - [Flexport::ApiBundleInventoryResponse](docs/ApiBundleInventoryResponse.md)
 - [Flexport::ApiBundleResponse](docs/ApiBundleResponse.md)
 - [Flexport::ApiInventoryResponse](docs/ApiInventoryResponse.md)
 - [Flexport::ApiProductResponse](docs/ApiProductResponse.md)
 - [Flexport::Application](docs/Application.md)
 - [Flexport::ApplicationStatus](docs/ApplicationStatus.md)
 - [Flexport::ApplicationType](docs/ApplicationType.md)
 - [Flexport::AppointmentWindow](docs/AppointmentWindow.md)
 - [Flexport::AuthFlow](docs/AuthFlow.md)
 - [Flexport::BadRequestError](docs/BadRequestError.md)
 - [Flexport::BarcodeResponseSubcode](docs/BarcodeResponseSubcode.md)
 - [Flexport::BarcodesResponse](docs/BarcodesResponse.md)
 - [Flexport::BulkLtlQuoteResponse](docs/BulkLtlQuoteResponse.md)
 - [Flexport::BulkParcelJobParcel](docs/BulkParcelJobParcel.md)
 - [Flexport::BulkParcelJobRequest](docs/BulkParcelJobRequest.md)
 - [Flexport::BulkParcelJobResponse](docs/BulkParcelJobResponse.md)
 - [Flexport::BulkParcelRequest](docs/BulkParcelRequest.md)
 - [Flexport::BulkProductCreateResponse](docs/BulkProductCreateResponse.md)
 - [Flexport::BulkProductCreateResponseResult](docs/BulkProductCreateResponseResult.md)
 - [Flexport::BulkQuoteRequest](docs/BulkQuoteRequest.md)
 - [Flexport::BundleContent](docs/BundleContent.md)
 - [Flexport::CancelParcelRequest](docs/CancelParcelRequest.md)
 - [Flexport::Change](docs/Change.md)
 - [Flexport::ChargeExportResponse](docs/ChargeExportResponse.md)
 - [Flexport::ChargeItem](docs/ChargeItem.md)
 - [Flexport::ChargeItemOrderBy](docs/ChargeItemOrderBy.md)
 - [Flexport::ChargeItemSubType](docs/ChargeItemSubType.md)
 - [Flexport::ChargeSummaryItem](docs/ChargeSummaryItem.md)
 - [Flexport::ChargeSummaryResponseCharges](docs/ChargeSummaryResponseCharges.md)
 - [Flexport::ChargeSummaryResponseNext](docs/ChargeSummaryResponseNext.md)
 - [Flexport::ChargeSummaryResponseNextCharges](docs/ChargeSummaryResponseNextCharges.md)
 - [Flexport::ChargeTotalResponse](docs/ChargeTotalResponse.md)
 - [Flexport::ChargeType](docs/ChargeType.md)
 - [Flexport::ChargeWorkUnitItem](docs/ChargeWorkUnitItem.md)
 - [Flexport::ConflictError](docs/ConflictError.md)
 - [Flexport::Contact](docs/Contact.md)
 - [Flexport::CountryCode](docs/CountryCode.md)
 - [Flexport::CountsOutput](docs/CountsOutput.md)
 - [Flexport::CreateBarcodesInput](docs/CreateBarcodesInput.md)
 - [Flexport::CreateChannelInput](docs/CreateChannelInput.md)
 - [Flexport::CreateChannelOutput](docs/CreateChannelOutput.md)
 - [Flexport::CreateInboundShipmentRequestV4](docs/CreateInboundShipmentRequestV4.md)
 - [Flexport::CreateInstalledApplication](docs/CreateInstalledApplication.md)
 - [Flexport::CreateOrderInput202307](docs/CreateOrderInput202307.md)
 - [Flexport::CreateParcelRequestUnstable](docs/CreateParcelRequestUnstable.md)
 - [Flexport::CreateProductInput](docs/CreateProductInput.md)
 - [Flexport::CreateProductModel](docs/CreateProductModel.md)
 - [Flexport::CreateQuoteRequest](docs/CreateQuoteRequest.md)
 - [Flexport::CreateReturnRequest](docs/CreateReturnRequest.md)
 - [Flexport::CreateUploadTargetRequest](docs/CreateUploadTargetRequest.md)
 - [Flexport::CreateUploadTargetResponse](docs/CreateUploadTargetResponse.md)
 - [Flexport::CreateUploadTargetResponseEntry](docs/CreateUploadTargetResponseEntry.md)
 - [Flexport::CustomLabelFooterFields](docs/CustomLabelFooterFields.md)
 - [Flexport::CustomsInput](docs/CustomsInput.md)
 - [Flexport::DamageFault](docs/DamageFault.md)
 - [Flexport::DamageType](docs/DamageType.md)
 - [Flexport::DamagedProductIssue](docs/DamagedProductIssue.md)
 - [Flexport::DelayedShippingData](docs/DelayedShippingData.md)
 - [Flexport::DeliverrAddress](docs/DeliverrAddress.md)
 - [Flexport::DeliverySchedule](docs/DeliverySchedule.md)
 - [Flexport::DeliveryScheduleEntry](docs/DeliveryScheduleEntry.md)
 - [Flexport::DeliverySettings](docs/DeliverySettings.md)
 - [Flexport::Dimension](docs/Dimension.md)
 - [Flexport::Dimensions](docs/Dimensions.md)
 - [Flexport::Disposition](docs/Disposition.md)
 - [Flexport::Dispute](docs/Dispute.md)
 - [Flexport::DocumentResponse](docs/DocumentResponse.md)
 - [Flexport::DrayageOrderItemResponse](docs/DrayageOrderItemResponse.md)
 - [Flexport::DrayageOrderRequest](docs/DrayageOrderRequest.md)
 - [Flexport::DrayageOrderResponse](docs/DrayageOrderResponse.md)
 - [Flexport::DrayageQuoteItem](docs/DrayageQuoteItem.md)
 - [Flexport::DrayageQuoteRequest](docs/DrayageQuoteRequest.md)
 - [Flexport::DrayageQuoteResponse](docs/DrayageQuoteResponse.md)
 - [Flexport::DrayageQuoteResponseV2DeliveryDetails](docs/DrayageQuoteResponseV2DeliveryDetails.md)
 - [Flexport::DrayageQuoteResponseV2DeliveryDetailsAllOf](docs/DrayageQuoteResponseV2DeliveryDetailsAllOf.md)
 - [Flexport::DutiesInput](docs/DutiesInput.md)
 - [Flexport::EventLocation](docs/EventLocation.md)
 - [Flexport::EventWebhookResponse](docs/EventWebhookResponse.md)
 - [Flexport::EventsResponseItem](docs/EventsResponseItem.md)
 - [Flexport::ExpiredTrackingData](docs/ExpiredTrackingData.md)
 - [Flexport::ExtendedNonComplianceIssue](docs/ExtendedNonComplianceIssue.md)
 - [Flexport::ExternalLabel](docs/ExternalLabel.md)
 - [Flexport::ExternalOrderStatus](docs/ExternalOrderStatus.md)
 - [Flexport::ForbiddenError](docs/ForbiddenError.md)
 - [Flexport::FreightAddress](docs/FreightAddress.md)
 - [Flexport::FreightBolStatus](docs/FreightBolStatus.md)
 - [Flexport::FreightModeDRAYAGE](docs/FreightModeDRAYAGE.md)
 - [Flexport::FreightModeFTL](docs/FreightModeFTL.md)
 - [Flexport::FreightModeLTL](docs/FreightModeLTL.md)
 - [Flexport::FreightPalletResponse](docs/FreightPalletResponse.md)
 - [Flexport::FreightPickupResponse](docs/FreightPickupResponse.md)
 - [Flexport::FreightShipmentMode](docs/FreightShipmentMode.md)
 - [Flexport::FreightStopDetails](docs/FreightStopDetails.md)
 - [Flexport::FreightTrackingEvent](docs/FreightTrackingEvent.md)
 - [Flexport::FreightTrackingEventType](docs/FreightTrackingEventType.md)
 - [Flexport::FreightTrackingInfo](docs/FreightTrackingInfo.md)
 - [Flexport::FreightTrackingLocation](docs/FreightTrackingLocation.md)
 - [Flexport::FtlOrderItemResponse](docs/FtlOrderItemResponse.md)
 - [Flexport::FtlOrderItemResponseWeightUnitEnum](docs/FtlOrderItemResponseWeightUnitEnum.md)
 - [Flexport::FtlOrderRequest](docs/FtlOrderRequest.md)
 - [Flexport::FtlOrderRequestWeightUnitEnum](docs/FtlOrderRequestWeightUnitEnum.md)
 - [Flexport::FtlOrderResponse](docs/FtlOrderResponse.md)
 - [Flexport::FtlQuoteItem](docs/FtlQuoteItem.md)
 - [Flexport::FtlQuoteItemResponseWeightUnitEnum](docs/FtlQuoteItemResponseWeightUnitEnum.md)
 - [Flexport::FtlQuoteRequestV2WeightUnitEnum](docs/FtlQuoteRequestV2WeightUnitEnum.md)
 - [Flexport::FtlQuoteResponse](docs/FtlQuoteResponse.md)
 - [Flexport::FulfilledOrders](docs/FulfilledOrders.md)
 - [Flexport::FulfillmentMetrics](docs/FulfillmentMetrics.md)
 - [Flexport::FulfillmentMetricsV2](docs/FulfillmentMetricsV2.md)
 - [Flexport::FulfillmentMetricsV3](docs/FulfillmentMetricsV3.md)
 - [Flexport::FulfillmentPackage](docs/FulfillmentPackage.md)
 - [Flexport::FulfillmentPackageItem](docs/FulfillmentPackageItem.md)
 - [Flexport::FulfillmentShipmentItem](docs/FulfillmentShipmentItem.md)
 - [Flexport::FulfillmentShipmentObject](docs/FulfillmentShipmentObject.md)
 - [Flexport::GetOrderDocumentsResponse](docs/GetOrderDocumentsResponse.md)
 - [Flexport::GetOrdersResponse](docs/GetOrdersResponse.md)
 - [Flexport::GetPortsResponse](docs/GetPortsResponse.md)
 - [Flexport::GetQuotesResponse](docs/GetQuotesResponse.md)
 - [Flexport::GrantTypes](docs/GrantTypes.md)
 - [Flexport::Health](docs/Health.md)
 - [Flexport::HealthStatus](docs/HealthStatus.md)
 - [Flexport::InboundAddress](docs/InboundAddress.md)
 - [Flexport::InboundExternalRateError](docs/InboundExternalRateError.md)
 - [Flexport::InboundRateBuyResultV2](docs/InboundRateBuyResultV2.md)
 - [Flexport::InboundRateQuoteFE](docs/InboundRateQuoteFE.md)
 - [Flexport::InboundRateQuoteResult](docs/InboundRateQuoteResult.md)
 - [Flexport::InboundRateShoppingMethod](docs/InboundRateShoppingMethod.md)
 - [Flexport::InboundRateTransactionNetwork](docs/InboundRateTransactionNetwork.md)
 - [Flexport::InboundReceivedEvent](docs/InboundReceivedEvent.md)
 - [Flexport::InboundShipmentResponseV3](docs/InboundShipmentResponseV3.md)
 - [Flexport::InboundShipmentResponseV4](docs/InboundShipmentResponseV4.md)
 - [Flexport::InboundShipmentStatusChangeEvent](docs/InboundShipmentStatusChangeEvent.md)
 - [Flexport::InboundShippingOption](docs/InboundShippingOption.md)
 - [Flexport::Incoterm](docs/Incoterm.md)
 - [Flexport::InductedProduct](docs/InductedProduct.md)
 - [Flexport::InspectedItem](docs/InspectedItem.md)
 - [Flexport::InstalledApplication](docs/InstalledApplication.md)
 - [Flexport::InstalledApplicationStatus](docs/InstalledApplicationStatus.md)
 - [Flexport::InternalOrderStatus](docs/InternalOrderStatus.md)
 - [Flexport::Inventory](docs/Inventory.md)
 - [Flexport::InventoryAdjustedEvent](docs/InventoryAdjustedEvent.md)
 - [Flexport::InventoryPool](docs/InventoryPool.md)
 - [Flexport::ItemDataUnstable](docs/ItemDataUnstable.md)
 - [Flexport::ItemOutputUnstable](docs/ItemOutputUnstable.md)
 - [Flexport::LabelFormat](docs/LabelFormat.md)
 - [Flexport::LateShippingData](docs/LateShippingData.md)
 - [Flexport::LegacyReturnsApiInspectedReturnItem](docs/LegacyReturnsApiInspectedReturnItem.md)
 - [Flexport::LegacyReturnsApiOrder](docs/LegacyReturnsApiOrder.md)
 - [Flexport::LegacyReturnsDestinationAddress](docs/LegacyReturnsDestinationAddress.md)
 - [Flexport::LegacyReturnsSourceAddress](docs/LegacyReturnsSourceAddress.md)
 - [Flexport::LengthUnit](docs/LengthUnit.md)
 - [Flexport::LineItemError](docs/LineItemError.md)
 - [Flexport::ListDirection](docs/ListDirection.md)
 - [Flexport::LocationType](docs/LocationType.md)
 - [Flexport::LogisticsAccount](docs/LogisticsAccount.md)
 - [Flexport::LogisticsAccountCreateInput](docs/LogisticsAccountCreateInput.md)
 - [Flexport::LogisticsInboundShipmentStatus](docs/LogisticsInboundShipmentStatus.md)
 - [Flexport::LogisticsSKUsInput](docs/LogisticsSKUsInput.md)
 - [Flexport::LogisticsSkus](docs/LogisticsSkus.md)
 - [Flexport::LotTrackingDetails](docs/LotTrackingDetails.md)
 - [Flexport::LtlOrderItemResponse](docs/LtlOrderItemResponse.md)
 - [Flexport::LtlOrderRequest](docs/LtlOrderRequest.md)
 - [Flexport::LtlOrderResponse](docs/LtlOrderResponse.md)
 - [Flexport::LtlQuoteItem](docs/LtlQuoteItem.md)
 - [Flexport::LtlQuoteResponse](docs/LtlQuoteResponse.md)
 - [Flexport::MaybeAddressInput](docs/MaybeAddressInput.md)
 - [Flexport::MaybeDutiesInput](docs/MaybeDutiesInput.md)
 - [Flexport::MaybeExpiredTrackingData](docs/MaybeExpiredTrackingData.md)
 - [Flexport::MaybeIncoterm](docs/MaybeIncoterm.md)
 - [Flexport::MaybeLabelFormat](docs/MaybeLabelFormat.md)
 - [Flexport::MaybeMerchantOfRecordSkuMapInput](docs/MaybeMerchantOfRecordSkuMapInput.md)
 - [Flexport::MaybeMoney](docs/MaybeMoney.md)
 - [Flexport::MaybeMoneyInput](docs/MaybeMoneyInput.md)
 - [Flexport::MaybeOrderError](docs/MaybeOrderError.md)
 - [Flexport::MaybePackageLabel](docs/MaybePackageLabel.md)
 - [Flexport::MaybeSourceId](docs/MaybeSourceId.md)
 - [Flexport::MaybeTrackingResultTimestamps](docs/MaybeTrackingResultTimestamps.md)
 - [Flexport::MerchantOfRecordProvider](docs/MerchantOfRecordProvider.md)
 - [Flexport::MerchantOfRecordSkuMapInput](docs/MerchantOfRecordSkuMapInput.md)
 - [Flexport::MissingBarcodeIssue](docs/MissingBarcodeIssue.md)
 - [Flexport::Money](docs/Money.md)
 - [Flexport::MoneyInput](docs/MoneyInput.md)
 - [Flexport::NetworkEventsEventsResponseItem](docs/NetworkEventsEventsResponseItem.md)
 - [Flexport::NetworkInboundShippingOption](docs/NetworkInboundShippingOption.md)
 - [Flexport::NetworkRefType](docs/NetworkRefType.md)
 - [Flexport::NonComplianceIssueResponse](docs/NonComplianceIssueResponse.md)
 - [Flexport::NonComplianceIssueStatus](docs/NonComplianceIssueStatus.md)
 - [Flexport::NonComplianceIssueType](docs/NonComplianceIssueType.md)
 - [Flexport::NotFoundError](docs/NotFoundError.md)
 - [Flexport::OTD](docs/OTD.md)
 - [Flexport::OTS](docs/OTS.md)
 - [Flexport::OnTimeDelivery](docs/OnTimeDelivery.md)
 - [Flexport::OnTimeDeliveryData](docs/OnTimeDeliveryData.md)
 - [Flexport::OnTimeShipping](docs/OnTimeShipping.md)
 - [Flexport::OrderCancelRequest](docs/OrderCancelRequest.md)
 - [Flexport::OrderDeliveryDetails](docs/OrderDeliveryDetails.md)
 - [Flexport::OrderDirection](docs/OrderDirection.md)
 - [Flexport::OrderDocumentResponseEntry](docs/OrderDocumentResponseEntry.md)
 - [Flexport::OrderDocumentType](docs/OrderDocumentType.md)
 - [Flexport::OrderError](docs/OrderError.md)
 - [Flexport::OrderErrorType](docs/OrderErrorType.md)
 - [Flexport::OrderEvent](docs/OrderEvent.md)
 - [Flexport::OrderLineItem](docs/OrderLineItem.md)
 - [Flexport::OrderLineItemInput](docs/OrderLineItemInput.md)
 - [Flexport::OrderModel](docs/OrderModel.md)
 - [Flexport::OrderPickupDetails](docs/OrderPickupDetails.md)
 - [Flexport::OrderResponse](docs/OrderResponse.md)
 - [Flexport::OrderState](docs/OrderState.md)
 - [Flexport::OrderStatus](docs/OrderStatus.md)
 - [Flexport::OrdersByDate](docs/OrdersByDate.md)
 - [Flexport::PackInventory](docs/PackInventory.md)
 - [Flexport::PackageDetails](docs/PackageDetails.md)
 - [Flexport::PackageDetailsDimensionUnitEnum](docs/PackageDetailsDimensionUnitEnum.md)
 - [Flexport::PackageDetailsWeightUnitEnum](docs/PackageDetailsWeightUnitEnum.md)
 - [Flexport::PackageDimensions](docs/PackageDimensions.md)
 - [Flexport::PackageInputUnstable](docs/PackageInputUnstable.md)
 - [Flexport::PackageLabel](docs/PackageLabel.md)
 - [Flexport::PackageOutputUnstable](docs/PackageOutputUnstable.md)
 - [Flexport::PackageType](docs/PackageType.md)
 - [Flexport::PackagingType](docs/PackagingType.md)
 - [Flexport::PaginatedResponseDeliveryScheduleEntry](docs/PaginatedResponseDeliveryScheduleEntry.md)
 - [Flexport::PaginatedResponseProductDeliverySchedule](docs/PaginatedResponseProductDeliverySchedule.md)
 - [Flexport::PalletInput](docs/PalletInput.md)
 - [Flexport::Parcel](docs/Parcel.md)
 - [Flexport::ParcelApiStatus](docs/ParcelApiStatus.md)
 - [Flexport::ParcelCustomsInformation](docs/ParcelCustomsInformation.md)
 - [Flexport::ParcelCustomsInformationItems](docs/ParcelCustomsInformationItems.md)
 - [Flexport::ParcelDimensions](docs/ParcelDimensions.md)
 - [Flexport::ParcelQuoteResponse](docs/ParcelQuoteResponse.md)
 - [Flexport::ParcelTracking](docs/ParcelTracking.md)
 - [Flexport::ParcelTrackingUpdatedEvent](docs/ParcelTrackingUpdatedEvent.md)
 - [Flexport::PartnerApplication](docs/PartnerApplication.md)
 - [Flexport::PickApiInventoryResponseExcludeKeyofApiInventoryResponseBreakdown](docs/PickApiInventoryResponseExcludeKeyofApiInventoryResponseBreakdown.md)
 - [Flexport::PickFreightBolTrackingExcludeKeyofFreightBolTrackingSellerIdOrFreightShipmentId](docs/PickFreightBolTrackingExcludeKeyofFreightBolTrackingSellerIdOrFreightShipmentId.md)
 - [Flexport::PickFulfillmentShipmentExcludeKeyofFulfillmentShipmentWarehouse](docs/PickFulfillmentShipmentExcludeKeyofFulfillmentShipmentWarehouse.md)
 - [Flexport::PickShippingSpecificationExcludeKeyofShippingSpecificationDskuOrSourceUser](docs/PickShippingSpecificationExcludeKeyofShippingSpecificationDskuOrSourceUser.md)
 - [Flexport::PickupInputV3](docs/PickupInputV3.md)
 - [Flexport::Port](docs/Port.md)
 - [Flexport::PrepRequestData](docs/PrepRequestData.md)
 - [Flexport::Product](docs/Product.md)
 - [Flexport::ProductCategoryEntry](docs/ProductCategoryEntry.md)
 - [Flexport::ProductDeliverySchedule](docs/ProductDeliverySchedule.md)
 - [Flexport::ProductSyncStatus](docs/ProductSyncStatus.md)
 - [Flexport::ProductWithInsights](docs/ProductWithInsights.md)
 - [Flexport::ProductWithInsightsInsights](docs/ProductWithInsightsInsights.md)
 - [Flexport::ProductsSortField](docs/ProductsSortField.md)
 - [Flexport::ProductsWithInsightsResponse](docs/ProductsWithInsightsResponse.md)
 - [Flexport::ProductsWithInsightsResponsePageInfo](docs/ProductsWithInsightsResponsePageInfo.md)
 - [Flexport::PromisedDeliverySpeeds](docs/PromisedDeliverySpeeds.md)
 - [Flexport::PromisedDeliverySpeedsDelta](docs/PromisedDeliverySpeedsDelta.md)
 - [Flexport::ProvinceCoverage](docs/ProvinceCoverage.md)
 - [Flexport::PurchaseQuotesRequest](docs/PurchaseQuotesRequest.md)
 - [Flexport::QuoteLocationDetails](docs/QuoteLocationDetails.md)
 - [Flexport::QuoteRequest](docs/QuoteRequest.md)
 - [Flexport::QuoteResponse](docs/QuoteResponse.md)
 - [Flexport::QuoteResultResponse](docs/QuoteResultResponse.md)
 - [Flexport::QuoteStatus](docs/QuoteStatus.md)
 - [Flexport::RateQuoteWithPurchased](docs/RateQuoteWithPurchased.md)
 - [Flexport::RelabeledBoxIssue](docs/RelabeledBoxIssue.md)
 - [Flexport::Report](docs/Report.md)
 - [Flexport::ReportGenerationRequest](docs/ReportGenerationRequest.md)
 - [Flexport::ReportGenerationResponse](docs/ReportGenerationResponse.md)
 - [Flexport::ReportStatus](docs/ReportStatus.md)
 - [Flexport::RequestedReturnItem](docs/RequestedReturnItem.md)
 - [Flexport::RequiredGeneralGs1BolInfo](docs/RequiredGeneralGs1BolInfo.md)
 - [Flexport::RequiredGeneralLtlGs1BolInfo](docs/RequiredGeneralLtlGs1BolInfo.md)
 - [Flexport::RequiredTradingPartnerGeneralBolInfo](docs/RequiredTradingPartnerGeneralBolInfo.md)
 - [Flexport::ResourceType](docs/ResourceType.md)
 - [Flexport::ReturnInspectedEvent](docs/ReturnInspectedEvent.md)
 - [Flexport::ReturnItem](docs/ReturnItem.md)
 - [Flexport::ReturnItemType](docs/ReturnItemType.md)
 - [Flexport::ReturnOrderStatus](docs/ReturnOrderStatus.md)
 - [Flexport::ReturnOrderTrackingStatus](docs/ReturnOrderTrackingStatus.md)
 - [Flexport::ReturnProductDetails](docs/ReturnProductDetails.md)
 - [Flexport::ReturnProductInspectionDetail](docs/ReturnProductInspectionDetail.md)
 - [Flexport::ReturnReceivedEvent](docs/ReturnReceivedEvent.md)
 - [Flexport::ReturnShipmentReceivedEvent](docs/ReturnShipmentReceivedEvent.md)
 - [Flexport::ReturnShippedEvent](docs/ReturnShippedEvent.md)
 - [Flexport::ReturnStatus](docs/ReturnStatus.md)
 - [Flexport::ReturnUpdatedEvent](docs/ReturnUpdatedEvent.md)
 - [Flexport::ReturnsApiMarketplaceOrder](docs/ReturnsApiMarketplaceOrder.md)
 - [Flexport::ReturnsApiOrder](docs/ReturnsApiOrder.md)
 - [Flexport::ReturnsApiShippingLabel](docs/ReturnsApiShippingLabel.md)
 - [Flexport::ReturnsPublicApiCarriers](docs/ReturnsPublicApiCarriers.md)
 - [Flexport::ReturnsPublicApiMarketplace](docs/ReturnsPublicApiMarketplace.md)
 - [Flexport::ReturnsPublicApiShippingMethod](docs/ReturnsPublicApiShippingMethod.md)
 - [Flexport::SalesForecast](docs/SalesForecast.md)
 - [Flexport::SalesForecastData](docs/SalesForecastData.md)
 - [Flexport::SellerReportType](docs/SellerReportType.md)
 - [Flexport::ShipmentEvent](docs/ShipmentEvent.md)
 - [Flexport::ShipmentStatus](docs/ShipmentStatus.md)
 - [Flexport::ShippingLabel](docs/ShippingLabel.md)
 - [Flexport::ShippingLabelFormat](docs/ShippingLabelFormat.md)
 - [Flexport::ShippingLabelFormatParcel](docs/ShippingLabelFormatParcel.md)
 - [Flexport::ShippingSpecificationPublic](docs/ShippingSpecificationPublic.md)
 - [Flexport::ShippingSpecificationSourceType](docs/ShippingSpecificationSourceType.md)
 - [Flexport::ShippingSpeedCoverage](docs/ShippingSpeedCoverage.md)
 - [Flexport::ShopifyFreightResponse](docs/ShopifyFreightResponse.md)
 - [Flexport::ShortShippedBoxIssue](docs/ShortShippedBoxIssue.md)
 - [Flexport::ShortShippedBoxStatus](docs/ShortShippedBoxStatus.md)
 - [Flexport::ShortShippedResolvedBy](docs/ShortShippedResolvedBy.md)
 - [Flexport::SortDir](docs/SortDir.md)
 - [Flexport::SourceId](docs/SourceId.md)
 - [Flexport::StatusCodesBADREQUEST](docs/StatusCodesBADREQUEST.md)
 - [Flexport::StatusCodesCONFLICT](docs/StatusCodesCONFLICT.md)
 - [Flexport::StatusCodesFORBIDDEN](docs/StatusCodesFORBIDDEN.md)
 - [Flexport::StatusCodesNOTFOUND](docs/StatusCodesNOTFOUND.md)
 - [Flexport::StatusCodesUNAUTHORIZED](docs/StatusCodesUNAUTHORIZED.md)
 - [Flexport::StatusCodesUNPROCESSABLEENTITY](docs/StatusCodesUNPROCESSABLEENTITY.md)
 - [Flexport::SupportedTradingPartner](docs/SupportedTradingPartner.md)
 - [Flexport::TimeWindow](docs/TimeWindow.md)
 - [Flexport::TokenResponse](docs/TokenResponse.md)
 - [Flexport::TrackingResultTimestamps](docs/TrackingResultTimestamps.md)
 - [Flexport::TrackingStatus](docs/TrackingStatus.md)
 - [Flexport::TradingPartnerDetails](docs/TradingPartnerDetails.md)
 - [Flexport::TradingPartnerGeneralBolFieldRequiredGeneralGs1BolInfo](docs/TradingPartnerGeneralBolFieldRequiredGeneralGs1BolInfo.md)
 - [Flexport::TradingPartnerGeneralBolFieldRequiredGeneralLtlGs1BolInfo](docs/TradingPartnerGeneralBolFieldRequiredGeneralLtlGs1BolInfo.md)
 - [Flexport::TradingPartnerGeneralBolFieldRequiredTradingPartnerGeneralBolInfo](docs/TradingPartnerGeneralBolFieldRequiredTradingPartnerGeneralBolInfo.md)
 - [Flexport::TransloadOrderItemResponse](docs/TransloadOrderItemResponse.md)
 - [Flexport::TransloadQuoteItem](docs/TransloadQuoteItem.md)
 - [Flexport::UnauthorizedError](docs/UnauthorizedError.md)
 - [Flexport::UnknownBarcodeIssue](docs/UnknownBarcodeIssue.md)
 - [Flexport::UnprocessableEntityError](docs/UnprocessableEntityError.md)
 - [Flexport::UpdateFreightInputV3](docs/UpdateFreightInputV3.md)
 - [Flexport::UpdateInboundShipmentRequestV3](docs/UpdateInboundShipmentRequestV3.md)
 - [Flexport::UpdateOrderInput](docs/UpdateOrderInput.md)
 - [Flexport::UpdatePackageInput](docs/UpdatePackageInput.md)
 - [Flexport::UpdateProductInput](docs/UpdateProductInput.md)
 - [Flexport::VariantIdDskuMapRequest](docs/VariantIdDskuMapRequest.md)
 - [Flexport::VariantIdDskus](docs/VariantIdDskus.md)
 - [Flexport::WarehouseDetails](docs/WarehouseDetails.md)
 - [Flexport::WarehouseDetailsResponse](docs/WarehouseDetailsResponse.md)
 - [Flexport::WebhookAuthType](docs/WebhookAuthType.md)
 - [Flexport::WebhookCreateModel](docs/WebhookCreateModel.md)
 - [Flexport::WebhookModel](docs/WebhookModel.md)
 - [Flexport::WebhookRequestMethod](docs/WebhookRequestMethod.md)
 - [Flexport::WeightUnit](docs/WeightUnit.md)


## Documentation for Authorization


Authentication schemes defined for the API:
### TOKEN


- **Type**: API key
- **API key parameter name**: X-Shopify-Access-Token
- **Location**: HTTP header

### BEARER

- **Type**: Bearer authentication


- openapi-generator generate -i ../flexportapi.json --skip-validate-spec -g ruby -o . --api-name-suffix='' --additional-properties=moduleName=Flexport,library=faraday
