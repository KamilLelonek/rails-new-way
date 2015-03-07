# rails-new-way

To see the domain desciprtion check [DOMAIN.md](DOMAIN.md)

## Setup

To start development, setup local database first:

    rake db:setup

## Run

To run server locally:

    rails s

And visit:

    http://localhost:3000/

## Test

To execute test:

    bundle exec rspec

### Testing manually

Example payload when testing from browser:

    # Method:   POST
    # Endpoint: http://localhost:3000/offer_requests
    # Headers:  Content-Type: application/json
    # Body:
        {
          "customer_name":"Wade Hudson",
          "customer_email":"rylee_ryan@torphyboehm.info",
          "delivery_id":"da262b93-61a6-45c8-9de7-f93a47e4d875",
          "company_name":"Hane, Macejkovic and Jacobson",
          "company_phone":"748-449-2666",
          "company_address":"Trinidad and Tobago",
          "products":[
            {
              "quantity":8,
              "category_id":"6205bf12-f2ea-46ce-978e-e10d54aa1260"
            }
          ]
        }



Remeber to change `category_id` and `delivery_id` according to your current db seeds.
