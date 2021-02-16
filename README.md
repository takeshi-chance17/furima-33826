# README

# テーブル設計


# 更新あり
## users テーブル
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| email         | string    | null: false |
| password      | string    | null: false |
| nickname      | string    | null: false |
| last_name     | string    | null: false |
| first_name    | string    | null: false |
| name_read     | string    | null: false |
| birth_day     | int       | null: false |
| phone_number  | int       | null: false |
| address       | reference | null: false |
deviceで実装

## adress
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| postal_code   | string    | null: false |
| prefecture    | string    | null: false |
| city          | string    | null: false |
| house_number  | string    | null: false |
| building_name | string    |             |
| user_id       | reference | null: false |

## items テーブル
| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| name            | string    | null: false |
| description     | text      | null: false |
| condition       | text      | null: false |
| price           | decimal   | null: false |
| status          | bool      | null: false |
| delivary_fee    | bool      | null: false |
| user_id         | reference | null: false |
| categrys_id     | reference | null: false |

## user_items テーブル
| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| user_id         | reference | null: false |
| item_id         | reference | null: false |


## item image
active_storageで実装


# 更新なし

## categrys テーブル
| Column       | Type      | Options     |
| ------------ | --------- | ----------- |
| name         | string    | null: false |
