# README

## テーブル設計

## users テーブル

| Column             | Type                                       | Options                   |
| ------------------ | ------------------------------------------ | --------------------------|
| nickname           | string                                     | null: false               |
| email              | string                                     | null: false,unique: true  |
| encrypted_password | string                                     | null: false               |
| first_name         | string                                     | null: false               |
| last_name          | string                                     | null: false               |
| first_name_kana    | string                                     | null: false               |
| last_name_kana     | string                                     | null: false               |
| birth_date         | date                                       | null: false               |


### Association

- has_many :orders
- has_many :products



## products テーブル

| Column                         | Type                                       | Options                                 |
| -------------------------------| ------------------------------------------ | ----------------------------------------|
| user                           | references                                 | null: false,foreign_key:true            |
| name                           | string                                     | null: false                             |
| description                    | text                                       | null: false                             |
| price                          | integer                                    | null: false                             |
| category_id                    | integer                                    | null: false                             |
| condition_id                   | integer                                    | null: false                             |
| shipping_cost_responsibility_id| integer                                    | null: false                             |
| shipping_from_region_id        | integer                                    | null: false                             |
| days_until_shipment_id         | integer                                    | null: false                             |


### Association
- has_one :order
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :shipping_cost_responsibility
- belongs_to :shipping_from_region
- belongs_to :days_until_shipment



## orders テーブル

| Column             | Type                                       | Options                     |
| ------------------ | ------------------------------------------ | ----------------------------|
| user               | references                                 | null: false,foreign_key:true|
| product            | references                                 | null: false,foreign_key:true|


### Association
 
- has_one :shipping_address
- belongs_to :user
- belongs_to :product


##  Shipping_Addresses テーブル

| Column                  | Type                                       | Options                     |
| ------------------------| ------------------------------------------ | ----------------------------|
| order                   | references                                 | null: false,foreign_key:true|
| postal_code             | string                                     | null: false                 |
| shipping_from_region_id | integer                                    | null: false                 |
| city                    | string                                     | null: false                 |
| street_address          | string                                     | null: false                 |
| building_name           | string                                     | null: false                 |
| phone_number            | string                                     | null: false                 |

### Association

- belongs_to :order
