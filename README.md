# テーブル設計

## usersテーブル

| Column              | Type    | Options                            |
| ------------------- | ------- | -----------------------------------|
| nickname            | string  | null: false                        |
| email               | string  | null: false, unique: true          |
| encrypted_password  | string  | null: false                        |
| last_name           | string  | null: false, character: full_width |
| first_name          | string  | null: false  character: full_width |
| last_name_kana      | string  | null: false  character: full_width |
| first_name_kana     | string  | null: false  character: full_width |
| birth_date          | date    | null: false                        |

## Association

has_many :items
has_many :orders

## itemsテーブル

| Column              | Type       | Options                            |
| ------------------- | -------    | ---------------------------------- |
| name                | string     | null: false, max_length: 40        |
| info                | text       | null: false, max_length: 1000      |
| price               | integer    | null: false, character: half-width |
| category            | integer    | null: false                        |
| sales_status        | integer    | null: false                        |
| shipping_fee_status | integer    | null: false                        |
| prefecture          | integer    | null: false                        |
| scheduled_delivery  | integer    | null: false                        |
| user                | references | null: false, foreign_key: true     |

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

## Addressesテーブル

| Column              | Type        | Options                                          |
| ------------------- | -------     | -------------------------------------------------|
| postal_code         | string      | null: false, character: half-width               |
| prefecture          | integer     | null: false                                      |
| city                | string      | null: false                                      |
| addresses           | string      | null: false                                      |
| building_name       | string      |                                                  |
| phone_number        | integer     | null: false, character: half-width, unique: true |

## Association

belongs_to :order