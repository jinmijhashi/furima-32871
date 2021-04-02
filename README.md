# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false unique:true |
| encrypted_password      | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false | 
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birthday       | date   | null: false |

### Association

- has_many : items
- has_many : buy

## items テーブル

| Column              | Type   | Options     |
| ------              | ------ | ----------- |
| title               | string | null: false |
| text                | text   | null: false |
| category_id            | integer| null: false |
| status_id              | integre | null: false |
| sipping_id     | integer | null: false |
| sipping_area_id        | integer | null: false |
| days_to_ship_id        | inetger | null: false |
| price               | integer | null: false |
### Association

- belongs_to : user
- has_one : buy


## address テーブル

| Column       | Type   | Options     |
| ------       | ------ | -------     |
| postal_code  | string | null: false |
| prefectures  | integer | null: false |
| address      | string | null: false |
| building     | string |             |
| phone        | string | null: false |
| user_id      | string | null: false |
| block        | string | null: false |
### Association

- belongs_to :user_id

## buy テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| user_id       | references  |  null: false, foreign_key: true      |
| item          | references  |  null: false, foreign_key: true      |
| 

### Association

- belongs_to : item
- has_one : address
