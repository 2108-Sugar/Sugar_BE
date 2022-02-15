# README

Sugar
![CircleCI](https://img.shields.io/circleci/build/github/2108-Sugar/Sugar_BE)
-------------------------------------------
Sugar is an application that allows users within a community to create simple requests for any items they may need. Whether its power tools or some missing ingredients for a recipe you now have the power to request or lend and extra sugar out to your neighbors.  

## Contributors
- David Tran  
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/david-tran7/) [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/isleofyou)  
- Tony Hsu  
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/tonydhsu/) [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/tonydhsu)  
- Didi Dodson  
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/didi-dodson) [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/DidiDodson)  
- Billy Frey   
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/william-frey/) [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/bfrey08)  
- Christian Valesares  
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/christian-valesares/) [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/cvalesares)

## Architecture

This app was built using a service-oriented architecture. This backend part of the app is responsible for exposing data for the front-end to consume and display to our end users.

[Front End Repo](https://github.com/2108-Sugar/Sugar_FE)

## Schema
[Schema Image](https://imgur.com/a/UBgNZ3u)

## Tools Used:

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![EC2](https://img.shields.io/badge/EC2-orange)
![S3 Bucket](https://img.shields.io/badge/S3_Bucket-orange)
![CircleCI](https://img.shields.io/badge/Circle_CI-lightgrey)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

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
