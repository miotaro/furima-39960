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
| birthday           | string | null: false               |

has_many :items
has_many :orders

## items テーブル

| Column          | Type       | Option
| --------------- | ---------- | ------------------------------ |
| image           | text       | null: false                    |
| product_name    | string     | null: false                    |
| description     | text       | null: false                    |
| category        | text       | null: false                    |
| condition       | text       | null: false                    |
| delivery_charge | text       | null: false                    |
| ship_from       | text       | null: false                    |
| delivery_time   | text       | null: false                    |
| price           | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type      | Option                         |
| ------- | --------- | ------------------------------ |
| user    | reference | null: false, foreign_key: true |
| item    | reference | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type      | Option                         |
| -------------- | --------- | ------------------------------ |
| post_code      | string    | null: false                    |
| prefectures    | text      | null: false                    |
| municipalities | text      | null: false                    | 
| street_address | text      | null: false                    |
| building_name  | text      |                                |
| phone_number   | text      | null: false                    |
| order          | reference | null: false, foreign_key: true |

- belongs_to :order