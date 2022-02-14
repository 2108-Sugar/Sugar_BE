# README

Sugar
-------------------------------------------
[Tony Hsu](https://github.com/tonydhsu)
[David Tran](https://github.com/isleofyou)
[Billy Frey](https://https://github.com/bfrey08)
[Didi Dodson](https://github.com/dididodson)
[Christian Valesares](https://github.com/cvalesares)

Sugar is an application that allows users within a community to create simple requests for any items they may need. Whether its power tools or some missing ingredients for a recipe you now have the power to request or lend and extra sugar out to your neighbors.  

## Architecture

This app was built using a service-oriented architecture. This backend part of the app is responsible for exposing data for the front-end to consume and display to our end users.
### Link to FrontEnd Repo
[Front End Repo](https://github.com/2108-Sugar/Sugar_FE)

## Schema
[Imgur](https://imgur.com/a/UBgNZ3u)

## Tools Used:

- AWS
- EC2
- S3 Bucket
- CircleCI
- Rails 6.1.4.4
- Ruby 2.7.2
- PostgreSQL

## Setup

* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:{create, migrate, seed}`
* Run test suite with `bundle exec rspec`.
* Run your development server with `rails s -p 5000` to see the endpoints in action!

## Endpoints
- Get all responses within a community
    *  GET `/api/v1/users/:user_id/communities/:community_id/requests`

    Example response:
    ```
    {
    "data": [
        {
            "id": "1",
            "type": "request",
            "attributes": {
                "name": "claw hammer",
                "details": "I need a hammer for nothing nefarious.",
                "item_category": "tools",
                "status": "unassigned",
                "requested_by_id": 1,
                "lender_id": null,
                "community_id": 1,
                "created_at": "02-06-22 19:02",
                "updated_at": "02-06-22 19:02",
                "borrow_date": "02-15-22",
                "return_date": "02-16-22"
            }
        },
        {
            "id": "2",
            "type": "request",
            "attributes": {
                "name": "ski mask",
                "details": "will wash and dry before return",
                "item_category": "sporting goods",
                "status": "unassigned",
                "requested_by_id": 5,
                "lender_id": null,
                "community_id": 1,
                "created_at": "02-06-22 19:02",
                "updated_at": "02-06-22 19:02",
                "borrow_date": "02-21-22",
                "return_date": "02-24-22"
            }
        },
        {
            "id": "3",
            "type": "request",
            "attributes": {
                "name": "knife",
                "details": "butcher knife preferred",
                "item_category": "kitchen",
                "status": "unassigned",
                "requested_by_id": 2,
                "lender_id": null,
                "community_id": 1,
                "created_at": "02-06-22 19:02",
                "updated_at": "02-06-22 19:02",
                "borrow_date": "02-17-22",
                "return_date": "02-17-22"
            }
        },
        {
            "id": "4",
            "type": "request",
            "attributes": {
                "name": "blow dart gun",
                "details": "taking a hunting trip",
                "item_category": "sporting goods",
                "status": "assigned",
                "requested_by_id": 5,
                "lender_id": 1,
                "community_id": 1,
                "created_at": "02-06-22 19:02",
                "updated_at": "02-06-22 19:02",
                "borrow_date": "02-01-22",
                "return_date": "02-19-22"
            }
        },
        {
            "id": "5",
            "type": "request",
            "attributes": {
                "name": "rope",
                "details": "nylon, 10 feet",
                "item_category": "sporting goods",
                "status": "archived",
                "requested_by_id": 3,
                "lender_id": 2,
                "community_id": 1,
                "created_at": "02-06-22 19:02",
                "updated_at": "02-06-22 19:02",
                "borrow_date": "01-15-22",
                "return_date": "01-17-22"
            }
        },
        {
            "id": "6",
            "type": "request",
            "attributes": {
                "name": "chef hat",
                "details": "will use for chocolate making demo",
                "item_category": "clothing",
                "status": "archived",
                "requested_by_id": 7,
                "lender_id": 6,
                "community_id": 2,
                "created_at": "02-06-22 19:02",
                "updated_at": "02-06-22 19:02",
                "borrow_date": "01-19-22",
                "return_date": "01-23-22"
            }
        },
        {
            "id": "7",
            "type": "request",
            "attributes": {
                "name": "blunt object",
                "details": "not for hitting",
                "item_category": "tools",
                "status": "unassigned",
                "requested_by_id": 7,
                "lender_id": 6,
                "community_id": 2,
                "created_at": "02-06-22 19:02",
                "updated_at": "02-06-22 19:02",
                "borrow_date": "01-19-22",
                "return_date": "01-23-22"
            }
        }
    ]
}
    ```
- Gets a specific request by an ID
  * GET `"/api/v1/users/:user_id/communities/:community_id/requests/:request_id"`

  Example response:
  ```
  {
    "data": {
        "id": "1",
        "type": "request",
        "attributes": {
            "name": "claw hammer",
            "details": "I need a hammer for nothing nefarious.",
            "item_category": "tools",
            "status": "unassigned",
            "requested_by_id": 1,
            "lender_id": null,
            "community_id": 1,
            "created_at": "02-06-22 19:02",
            "updated_at": "02-06-22 19:02",
            "borrow_date": "02-15-22",
            "return_date": "02-16-22"
        }
    }
}
  ```
- Creates a new request
  * POST `"/api/v1/users/:user_id/communities/:community_id/requests"`

- Updates an existing request
  * PATCH `"/api/v1/users/:user_id/communities/:community_id/requests/:request_id`

- Deletes an existing request
  * DELETE `"/api/v1/users/:user_id/communities/:community_id/requests/:request_id"`
