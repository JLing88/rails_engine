# README

Rails Engine is a Rails API which serves up data from an online shopping platform. The data includes sales information about Merchants, Customers, Items, Invoices, and Transactions. There is a plethora of one-to-many and many-to-many relationships. The controller setup follows a RESTful design and all controllers only allow for `show` and `index` methods.

## Getting the application set up on your machine

* Clone the Github respository - `git clone git@github.com:JLing88/rails_engine.git`

* Ruby version - `2.4.1p111`

* System dependencies - `bundle`

* Database creation - `rails db:create`

* Database initialization - `rails db:migrate`

* Database seeding - `rake import:data`

* How to run the test suite - `rspec`

## The available endpoints include:

### Record Endpoints

#### Merchants
* `GET /api/v1/merchants.json` returns all merchants
* `GET /api/v1/merchants/1.json` returns merchant 1

#### Invoices
* `GET /api/v1/invoices.json` returns all invoices
* `GET /api/v1/invoices/1.json` returns invoice 1

#### Invoice Items
* `GET /api/v1/invoice_items.json` returns all invoice_items
* `GET /api/v1/invoice_items/1.json` returns invoice_item 1

#### Items
* `GET /api/v1/items.json` returns all items
* `GET /api/v1/items/1.json` returns item 1

#### Transactions
* `GET /api/v1/transactions.json` returns all transactions
* `GET /api/v1/transactions/1.json` returns transaction 1

#### Customers
* `GET /api/v1/customers.json` returns all customers
* `GET /api/v1/customers/1.json` returns customer 1


### Relationship Endpoints

#### Merchants
* `GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders
* `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions

#### Invoices
* `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/invoices/:id/items` returns a collection of associated items
* `GET /api/v1/invoices/:id/customer` returns the associated customer
* `GET /api/v1/invoices/:id/merchant` returns the associated merchant

#### Invoice Items
* `GET /api/v1/invoice_items/:id/invoice` returns the associated invoice
* `GET /api/v1/invoice_items/:id/item` returns the associated item

#### Items
* `GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/items/:id/merchant` returns the associated merchant

#### Transactions
* `GET /api/v1/transactions/:id/invoice` returns the associated invoice

#### Customers
* `GET /api/v1/customers/:id/invoices` returns a collection of associated invoices

### Business Intelligence Endpoints

#### All Merchants

* `GET /api/v1/merchants/most_revenue?quantity=x` returns the top x merchants ranked by total revenue
* `GET /api/v1/merchants/most_items?quantity=x` returns the top x merchants ranked by total number of items sold
* `GET /api/v1/merchants/revenue?date=x` returns the total revenue for date x across all merchants

#### Single Merchant

* `GET /api/v1/merchants/:id/revenue` returns the total revenue for that merchant across successful transactions
* `GET /api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date x
* `GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.
* `GET /api/v1/merchants/:id/customers_with_pending_invoices` returns a collection of customers which have pending (unpaid) invoices. 

#### Items

* `GET /api/v1/items/most_revenue?quantity=x` returns the top x items ranked by total revenue generated
* `GET /api/v1/items/most_items?quantity=x` returns the top x item instances ranked by total number sold
* `GET /api/v1/items/:id/best_day` returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

#### Customers

* `GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions

