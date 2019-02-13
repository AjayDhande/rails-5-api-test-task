# Rails API
* Ruby version : 2.5.1
* Rails version: 5.2.2
* Database: MySql

## Setup Instructions
```bash
$ bundle install
```
```bash
$ rails db:create
```
```bash
$ rails db:migrate
```
```bash
$ rails db:seed  # Create dummy data
```
# API Endpoints
Pass token in header for every API call.

## 1. Get all customers with their addresses
http://localhost:3000/api/v1/customers

## 2. Filter customers with name and street
http://localhost:3000/api/v1/customer_filter

```json
{
  "filter" :{
    "name": "customer1",
    "street": "street3"
  }
}
```

## 3. Create Customer
http://localhost:3000/api/v1/customers

```json
{
	"customer" :{
		"name": "ABC",
	"address": {
 			"street": "street12",
 			"city": "city23",
 			"zip_code": 1234
		}
  }
}
```

## 4. Destroy Customer
http://localhost:3000/api/v1/customers/:id