# テーブル設計

## usersテーブル

| Column              | Type    | Options                            |
| ------------------- | ------- | -----------------------------------|
| nickname            | string  | null: false                        |
| email               | string  | null: false, unique: true          |
| encrypted_password  | string  | null: false                        |
| last_name           | string  | null: false,                       |
| first_name          | string  | null: false                        |
| last_name_kana      | string  | null: false                        |
| first_name_kana     | string  | null: false                        |
| birth_date          | date    | null: false                        |

## Association

has_many :items
has_many :orders

## itemsテーブル

| Column              | Type       | Options                            |
| ---------------------- | -------    | ---------------------------------- |
| name                   | string     | null: false                        |
| info                   | text       | null: false                        |
| price                  | integer    | null: false,                       |
| category_id            | integer    | null: false                        |
| sales_status_id        | integer    | null: false                        |
| shipping_fee_status_id | integer    | null: false                        |
| prefecture_id          | integer    | null: false                        |
| scheduled_delivery_id  | integer    | null: false                        |
| user                   | references | null: false, foreign_key: true     |

## Association

belongs_to :user
has_one :order

## ordersテーブル

| Column | Type       | Options                   |
| ------ | --------------------------|
| user   | references | null: false, foreign_key: true
| item   | references | null: false, foreign_key: true

## Association

belongs_to :user
belongs_to :item
has_many   :addresses

## Addressesテーブル

| Column              | Type        | Options                                          |
| ------------------- | -------     | -------------------------------------------------|
| postal_code         | string      | null: false,                                     |
| prefecture          | integer     | null: false                                      |
| city                | string      | null: false                                      |
| addresses           | string      | null: false                                      |
| building_name       | string      |                                                  |
| phone_number        | integer     | null: false,                       unique: true |

## Association

belongs_to :order