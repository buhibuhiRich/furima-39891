# README

## テーブル設計

## users テーブル

| Column             | Type                                       | Options                   |
| ------------------ | ------------------------------------------ | --------------------------|
| user_id            | IntegerInteger, Primary Key, Auto Increment| null: false,unique: true  |
| nickname           | string                                     | null: false               |
| email              | string                                     | null: false,unique: true  |
| password           | string                                     | null: false               |
| first_name         | string                                     | null: false               |
| last_name          | string                                     | null: false               |
| first_name_kana    | string                                     | null: false               |
| last_name_kana     | string                                     | null: false               |
| birth_date         | string                                     | null: false               |


### Association

- has_many :products, dependent: :destroy
- belongs_to :user


## product テーブル

| Column             | Type                                       | Options                                 |
| ------------------ | ------------------------------------------ | ----------------------------------------|
| product_id         | Integer, Primary Key, Auto Increment       | unique: true                            |
| seller user_id     | Integer                                    | null: false,foreign_key: true           |
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


## oder テーブル

| Column             | Type                                       | Options                     |
| ------------------ | ------------------------------------------ | ----------------------------|
| oder_id            | Integer, Primary Key, Auto Increment       | unique: true                |
| user_id            | Integer                                    | null: false,foreign_key:true|
| total_price        | string                                     | null: false                 |
| payment_info       | string                                     | null: false                 |
| shipping_info      | string                                     | null: false                 |  


- has_many :comments
- belongs_to :order

## comment テーブル

| Column             | Type                                       | Options                     |
| ------------------ | ------------------------------------------ | ----------------------------|
| comment_text       | text                                       | unique: true                |
| user_id            | Integer                                    | null: false,foreign_key:true|

 README
