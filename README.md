# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product
**Main product index page**
!["Screenshot of Main Products Page"](https://github.com/ife2015/jungle-project/blob/master/docs/main-page.png)

**Cart page with products**
!["Screenshot of Cart Page"](https://github.com/ife2015/jungle-project/blob/master/docs/cart-page.png)

**Order Details**
!["Screenshot of ordered details"](https://github.com/ife2015/jungle-project/blob/master/docs/orderdetails-page.png)

**Admin Access - Add Category**
!["Screenshot of Admin View - Category List"](https://github.com/ife2015/jungle-project/blob/master/docs/admin-category-page.png) 

**Admin Access - Add/Delete Product**
!["Screenshot of Admin View - Product List"](https://github.com/ife2015/jungle-project/blob/master/docs/admin-product-page.png) 

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
