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
| date_of_birth      | date                                       | null: false               |


### Association

- has_many :products
- belongs_to :orders



## products テーブル

| Column             | Type                                       | Options                                 |
| ------------------ | ------------------------------------------ | ----------------------------------------|
| user_id            | Integer                                    | null: false,foreign_key:true            |
| name               | string                                     | unique: true                            |
| description        | text                                       | null: false                             |
| category_id        | Integer                                    | null: false,foreign_key:true            |
| shipping_info      | string                                     | null: false                             |
| price              | string                                     | null: false                             |


### Association

- has_many :products
- belongs_to :category


## categories テーブル

| Column             | Type                                       | Options                   |
| ------------------ | ------------------------------------------ | --------------------------|
| category_id        | Integer, Primary Key, Auto Increment       | unique: true              |
| name               | string                                     | unique: true              |   


### Association

- has_many :products


## orders テーブル

| Column             | Type                                       | Options                     |
| ------------------ | ------------------------------------------ | ----------------------------|
| user_id            | Integer                                    | null: false,foreign_key:true|
| product_id         | Integer                                    | null: false,foreign_key:true|


### Association
 
- has_one :shipping_address
- has_many :products
- belongs_to :user
- belongs_to :product


##  ShippingAddresses テーブル

| Column             | Type                                       | Options                     |
| ------------------ | ------------------------------------------ | ----------------------------|
| order_id           | Integer                                    | null: false,foreign_key:true|
| postal_code        | string                                     | null: false                 |
| prefecture         | string                                     | null: false                 |
| city               | string                                     | null: false                 |
| street_address     | string                                     | presence: true              |
| building_name      |string                                      | presence: true              |
| phone_number       | string                                     | null: false                 |

### Association

- belongs_to :order