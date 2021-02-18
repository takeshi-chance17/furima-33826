# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

### Association
-belongs_to :address
-has_many  :items

## adress
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| phone_number  | int       | null: false |
| postal_code   | string    | null: false |
| prefecture_id | int       | null: false |
| city          | string    | null: false |
| house_number  | string    | null: false |
| building_name | string    |             |
| user          | reference | null: false |
| item          | reference | null: false |

### Association
-belongs_to :users
-belongs_to  :items

* Database initialization

### Association
-has_many   :users
-belongs_to :adress
-belongs_to :categrys

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
