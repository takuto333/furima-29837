#テーブル設計

## usersテーブル

| Column                | Type    | Options     |
| --------------------- | ------- |------------ |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| last_name_kanji       | string  | null: false |
| first_name_kanji      | string  | null: false |
| last_name_katakana    | string  | null: false |
| first_name_katakana   | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| category         | integer    | null: false                    |
| condition        | integer    | null: false                    |
| shipping_charges | integer    | null: false                    |
| shipping_area    | integer    | null: false                    |
| days_to_ship     | integer    | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :order