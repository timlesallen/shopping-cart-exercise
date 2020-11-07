# marketplacer code exercise - shopping cart

I've chosen to implement this as a rails app for a couple of reasons:

1. to brush up on Ruby on Rails
2. since I figured that editing a shop cart is a little less cumbersome using point and click.

## Running locally

* My Ruby version (in case it matters)

```bash
❯ ruby -v
ruby 2.6.3p62 (2019-04-16 revision 67580) [universal.x86_64-darwin19]
```

To get going:

```bash
yarn # so yarn installs JS stuff
rails db:migrate # init the db structure
rake db:setup # Loads db/products.json into the SQLite database
rails server # start the rails development server
```

You can 'buy' products buy clicking the 'buy' link next to them. If you buy
the same product twice or more it'll just increment the quantity.

If a discount applies, an additional section is added to the output notifying the user.

It just uses your session to link to the cart. I really haven't gone overboard with security or styling.

I've mainly focussed on testing the business logic with the tests.

## Tests

Run the tests like so:

```bash
❯ rake test
...
```
