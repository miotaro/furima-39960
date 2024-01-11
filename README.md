#テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_ruby    | string | null: false               |
| last_name_ruby     | string | null: false               |
| birthday           | date   | null: false               |

has_many :items
has_many :orders

## items テーブル

| Column             | Type       | Option
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type      | Option                         |
| ------- | --------- | ------------------------------ |
| user_id | reference | null: false, foreign_key: true |
| item_id | reference | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type      | Option                         |
| -------------- | --------- | ------------------------------ |
| post_code      | string    | null: false                    |
| prefectures_id | integer   | null: false                    |
| municipalities | string    | null: false                    | 
| street_address | string    | null: false                    |
| building_name  | string    |                                |
| phone_number   | string    | null: false                    |
| order_id       | reference | null: false, foreign_key: true |

- belongs_to :order