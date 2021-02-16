# README

# テーブル設計


# 更新あり
## users テーブル
| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| email              | string    | null: false |
| password           | string    | null: false |
| encrypted_password | string    | null: false |
| nickname           | string    | null: false |
| last_name          | string    | null: false |
| first_name         | string    | null: false |
| last_name_read     | string    | null: false |
| first_name_read    | string    | null: false |
| birth_day          | int       | null: false |
deviceで実装

### Association
-belong_to :address
-has_many  :items

## adress
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| phone_number  | int       | null: false |
| postal_code   | string    | null: false |
| prefecture_id | int       | null: false |
| city          | string    | null: false |
| house_number  | string    | null: false |
| building_name | string    |             |
| user          | reference | null: false |

### Association
-belong_to :users

## items テーブル
| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| name            | string    | null: false |
| description     | text      | null: false |
| condition       | text      | null: false |
| price           | int       | null: false |
| status          | bool      | null: false |
| delivary_fee    | bool      | null: false |
| user            | reference | null: false |
| categrys        | reference | null: false |

### Association
-has_many :users
-belongs_to :categrys


## item image
active_storageで実装


# 更新なし

## categrys テーブル
| Column       | Type      | Options     |
| ------------ | --------- | ----------- |
| name         | string    | null: false |

### Association
-belongs_to :items