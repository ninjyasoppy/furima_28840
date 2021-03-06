# テーブル設計

## user テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| family_name | string | null: false |
| first_name | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items
- has_many :orders

## itemテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text   | text   | null: false |
| price    | integer | null: false |
| category_id     | integer | null: false |
| sale_status_id | integer | null: false |
| shipping_fee_status_id | integer | null: false |
| prefecture_id     | integer | null: false |
| scheduled_delivery_id | integer | null: false |
| user   | reference | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one_attached :image
- has_one :order

## order テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column  | Type       | Options             |
| ------- | ---------- | ------------------- |
| postal_cord| string | null: false |
| prefecture_id | integer | null: false |
| city    | string | null: false |
| addresses| string | null: false |
| building | string |           |
| phone_number | string | null: false |
| order | references | null: false, foreign_key: true |
### Association
belongs_to : order