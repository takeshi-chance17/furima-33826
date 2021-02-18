# README

# テーブル設計


# 更新あり
## users テーブル
| Column             | Type      | Options      |
| ------------------ | --------- | ------------ |
| email              | string    | unique: true |
| encrypted_password | string    | null: false  |
| nickname           | string    | null: false  |
| last_name          | string    | null: false  |
| first_name         | string    | null: false  |
| last_name_read     | string    | null: false  |
| first_name_read    | string    | null: false  |
| birth_day          | date      | null: false  |

### Association
- has_many  :items
- has_many  :buy_history

## items テーブル
| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| name            | string    | null: false |  商品名
| description     | text      | null: false |  商品説明
| price           | integer   | null: false |  販売価格
| status          | boolean   | null: false |  販売状況
| condition       | text      | null: false |  商品の状態
| delivary_fee    | integer   | null: false |  配送料の負担
| category        | integer   | null: false |  カテゴリー
| user            | reference | null: false |  出品者名

### Association
- belongs_to   :user
- belongs_to   :buyer
- has_one      :buy_history

## buyer テーブル(購入者情報)
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| phone_number  | int       | null: false |  電話番号
| postal_code   | string    | null: false |  郵便番号
| prefecture_id | int       | null: false |  都道府県
| city          | string    | null: false |  市町村
| house_number  | string    | null: false |  番地
| building_name | string    |             |  建物名
| user          | reference | null: false |
| item          | reference | null: false |

### Association
- belongs_to  :item
- belongs_to  :buy_history


## buy_historyテーブル(購入履歴)
| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| item            | reference | null: false |
| user            | reference | null: false |
| buyer           | reference | null: false |

### Association
- belongs_to :user
- belongs_to :buyer
- belongs_to :item