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
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false | 
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |


### Association

- has_many : items
- has_many : address

## items テーブル

| Column              | Type   | Options     |
| ------              | ------ | ----------- |
| image               | string | null: false |
| title               | string | null: false |
| product despriction | string | null: false |
| category            | string | null: false |
| status              | string | null: false |
| sipping charges     | string | null: false |
| sipping area        | string | null: false |
| days to ship        | string | null: false |
| price               | string | null: false |
### Association

- belongs_to : user
- has_one : byu


## address テーブル

| Column       | Type   | Options     |
| ------       | ------ | -------     |
| postal code  | string | null: false |
| prefectures  | string | null: false |
| address      | string | null: false |
| building     | string | null: false |
| phone        | string | null: false |
| user_id      | string | null: false |

### Association

- belongs_to :
- belongs_to :

## buy テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| what i bougth | string     |  null: false, foreign_key: true                              |
| who           | references |  null: false, foreign_key: true|
| 

### Association

- belongs_to : items
- belongs_to : address
