# Flexport::ProductsApi

All URIs are relative to *https://logistics-api.flexport.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_product**](ProductsApi.md#create_product) | **POST** /logistics/api/unstable/products |  |
| [**get_all_inventory**](ProductsApi.md#get_all_inventory) | **GET** /logistics/api/unstable/products/inventory/all |  |
| [**get_inventory**](ProductsApi.md#get_inventory) | **GET** /logistics/api/unstable/products/{logisticsSku}/inventory |  |
| [**get_product**](ProductsApi.md#get_product) | **GET** /logistics/api/unstable/products/{logisticsSku} |  |
| [**get_products**](ProductsApi.md#get_products) | **GET** /logistics/api/unstable/products |  |
| [**get_warehouse_details**](ProductsApi.md#get_warehouse_details) | **POST** /logistics/api/unstable/products/warehouse |  |


## create_product

> <ApiProductResponse> create_product(create_product_model)



Create a product

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ProductsApi.new
create_product_model = Flexport::CreateProductModel.new({name: 'name_example', merchant_sku: 'merchant_sku_example'}) # CreateProductModel | 

begin
  
  result = api_instance.create_product(create_product_model)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->create_product: #{e}"
end
```

#### Using the create_product_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ApiProductResponse>, Integer, Hash)> create_product_with_http_info(create_product_model)

```ruby
begin
  
  data, status_code, headers = api_instance.create_product_with_http_info(create_product_model)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiProductResponse>
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->create_product_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_product_model** | [**CreateProductModel**](CreateProductModel.md) |  |  |

### Return type

[**ApiProductResponse**](ApiProductResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_all_inventory

> <Array<ApiInventoryResponse>> get_all_inventory(opts)



Get a list of available inventory information for products. There are no more results if an empty page is returned. To obtain reserve storage quantities, the poolName parameter can be set to 'STORAGE'

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ProductsApi.new
opts = {
  limit: 1.2, # Float | number of records to return, defaults to 20, capped at 100
  offset: 1.2, # Float | number of records to skip before returning, defaults to 0
  pool_name: Flexport::InventoryPool::DEFAULT # InventoryPool | 
}

begin
  
  result = api_instance.get_all_inventory(opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_all_inventory: #{e}"
end
```

#### Using the get_all_inventory_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ApiInventoryResponse>>, Integer, Hash)> get_all_inventory_with_http_info(opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_all_inventory_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ApiInventoryResponse>>
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_all_inventory_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Float** | number of records to return, defaults to 20, capped at 100 | [optional][default to 20] |
| **offset** | **Float** | number of records to skip before returning, defaults to 0 | [optional][default to 0] |
| **pool_name** | [**InventoryPool**](.md) |  | [optional] |

### Return type

[**Array&lt;ApiInventoryResponse&gt;**](ApiInventoryResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_inventory

> <ApiInventoryResponse> get_inventory(logistics_sku, opts)



Get available inventory information for product by logisticsSku.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ProductsApi.new
logistics_sku = 'logistics_sku_example' # String | The globally unique product identifier created by Deliverr and assigned on product creation.
opts = {
  pool_name: Flexport::InventoryPool::DEFAULT, # InventoryPool | 
  aggregate_packs: true # Boolean | 
}

begin
  
  result = api_instance.get_inventory(logistics_sku, opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_inventory: #{e}"
end
```

#### Using the get_inventory_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ApiInventoryResponse>, Integer, Hash)> get_inventory_with_http_info(logistics_sku, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_inventory_with_http_info(logistics_sku, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiInventoryResponse>
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_inventory_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_sku** | **String** | The globally unique product identifier created by Deliverr and assigned on product creation. |  |
| **pool_name** | [**InventoryPool**](.md) |  | [optional] |
| **aggregate_packs** | **Boolean** |  | [optional] |

### Return type

[**ApiInventoryResponse**](ApiInventoryResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_product

> <ApiProductResponse> get_product(logistics_sku)



Get product information for a product by logisticsSku.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ProductsApi.new
logistics_sku = 'logistics_sku_example' # String | The globally unique product identifier created by Deliverr and assigned on product creation.

begin
  
  result = api_instance.get_product(logistics_sku)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_product: #{e}"
end
```

#### Using the get_product_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ApiProductResponse>, Integer, Hash)> get_product_with_http_info(logistics_sku)

```ruby
begin
  
  data, status_code, headers = api_instance.get_product_with_http_info(logistics_sku)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ApiProductResponse>
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_product_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_sku** | **String** | The globally unique product identifier created by Deliverr and assigned on product creation. |  |

### Return type

[**ApiProductResponse**](ApiProductResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_products

> <Array<ApiProductResponse>> get_products(opts)



Get paginated list of products

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ProductsApi.new
opts = {
  limit: 1.2, # Float | number of records to return, defaults to 20, capped at 100
  offset: 1.2 # Float | number of records to skip before returning, defaults to 0
}

begin
  
  result = api_instance.get_products(opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_products: #{e}"
end
```

#### Using the get_products_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ApiProductResponse>>, Integer, Hash)> get_products_with_http_info(opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_products_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ApiProductResponse>>
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_products_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Float** | number of records to return, defaults to 20, capped at 100 | [optional][default to 20] |
| **offset** | **Float** | number of records to skip before returning, defaults to 0 | [optional][default to 0] |

### Return type

[**Array&lt;ApiProductResponse&gt;**](ApiProductResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_warehouse_details

> <Array<WarehouseDetailsResponse>> get_warehouse_details(logistics_skus, opts)



Get warehouse information for a given list of logisticsSkus.

### Examples

```ruby
require 'time'
require 'flexport'
# setup authorization
Flexport.configure do |config|
  # Configure Bearer authorization: BEARER
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = Flexport::ProductsApi.new
logistics_skus = Flexport::LogisticsSkus.new({logistics_skus: ['logistics_skus_example']}) # LogisticsSkus | 
opts = {
  pool_name: Flexport::InventoryPool::DEFAULT # InventoryPool | 
}

begin
  
  result = api_instance.get_warehouse_details(logistics_skus, opts)
  p result
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_warehouse_details: #{e}"
end
```

#### Using the get_warehouse_details_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<WarehouseDetailsResponse>>, Integer, Hash)> get_warehouse_details_with_http_info(logistics_skus, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_warehouse_details_with_http_info(logistics_skus, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<WarehouseDetailsResponse>>
rescue Flexport::ApiError => e
  puts "Error when calling ProductsApi->get_warehouse_details_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **logistics_skus** | [**LogisticsSkus**](LogisticsSkus.md) |  |  |
| **pool_name** | [**InventoryPool**](.md) |  | [optional] |

### Return type

[**Array&lt;WarehouseDetailsResponse&gt;**](WarehouseDetailsResponse.md)

### Authorization

[BEARER](../README.md#BEARER)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

