# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
has_many : orders
has_many : items

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_description     | text       | null: false                    |
| category_id          | integer    | null: false                    |
| state_id             | integer    | null: false                    |
| shipping_charge_id	 | integer    | null: false                    |
| shipment_region_id	 | integer    | null: false                    |
| days_to_ship_id   	 | integer    | null: false                    |
| price	               | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
has_one :order
belongs_to :user


## addresses テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| shipment_region_id  | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| order               | references | null: false, foreign_key: true |


### Association
belongs_to :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association
belongs_to :user
has_one :address
belongs_to :item

