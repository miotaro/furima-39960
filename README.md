#テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

has_many :items
has_many :orders
has_one :address

## items テーブル

| Column       | Type       | Option
| ------------ | ---------- | ------------------------------ |
| product_name | string     | null: false                    |
| category     | text       | null: false                    |
| price        | text       | null: false                    |
| user         | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type      | Option                         |
| ------- | --------- | ------------------------------ |
| user    | reference | null: false, foreign_key: true |
| item    | reference | null: false, foreign_key: true |
| address | reference | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column         | Type      | Option                         |
| -------------- | --------- | ------------------------------ |
| post_code      | string    | null: false                    |
| prefectures    | text      | null: false                    |
| municipalities | text      | null: false                    | 
| street_address | text      | null: false                    |
| user           | reference | null: false, foreign_key: true |
| order          | reference | null: false, foreign_key: true |

- has_one :order
- belongs_to :user