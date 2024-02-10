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
| date         　　　 | string                                     | null: false               |


### Association

- has_many :products
- belongs_to :product


## product テーブル

| Column             | Type                                       | Options                                 |
| ------------------ | ------------------------------------------ | ----------------------------------------|
| product_id         | Integer, Primary Key, Auto Increment       | unique: true                            |
| seller_user_id     | Integer                                    | null: false,foreign_key: true           |
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
- belongs_to :category


## order テーブル

| Column             | Type                                       | Options                     |
| ------------------ | ------------------------------------------ | ----------------------------|
| user_id            | Integer                                    | null: false,foreign_key:true|
| product_id         | Integer                                    | null: false,foreign_key:true|


### Association
 
- belongs_to :user
- has_one :shipping_address
- has_many :order_details
- has_many :products, through: :order_details
- belongs_to :order


##  ShippingAddress テーブル

| Column             | Type                                       | Options                     |
| ------------------ | ------------------------------------------ | ----------------------------|
| postal_code        | string                                     | null: false,presence: true  |
| prefecture         | string                                     | null: false,presence: true  |
| city               | string                                     | null: false,presence: true  |
| street_address     | string                                     | presence: true              |
| phone_number       | string                                     | null: false,presence: true  |

