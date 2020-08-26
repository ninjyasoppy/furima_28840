# テーブル設計

## user テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| name_kana| string | null: false |
| birthday | string | null: false |

### Association

- has_many :items

## itemテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text   | text   | null: false |
| price    | string | null: false |
| sold_out | boolean | null: false |
| category_id     | string | null: false |
| sale_status_id | string | null: false |
| shipping_fee_status_id | string | null: false |
| sold_out | string | null: false |
| prefecture_id     | string | null: false |
| scheduled_delivery_id | string | null: false |
| user   | string | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one_attached :image

## order テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| address  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :addresses

## address テーブル

| Column  | Type       | Options             |
| ------- | ---------- | ------------------- |
| card_number | string | null: false |
| cord_exp_month    | string | null: false |
| card_exp_year | string | null: false |
| card_cvc     | string | null: false |
| postal_cord| string | null: false |
| prefecture | string | null: false |
| city    | string | null: false |
| addresses| string | null: false |
| building | string |           |
| phone_number | string | null: false |
### Association
