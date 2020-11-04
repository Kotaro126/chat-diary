# README

## users テーブル

| Column             | Type     | Options     |
| ------------------ | ---------| ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |


### Association
- has_many :diaries
- has_many :words

## diaries テーブル

| Column            | Type        | Options                        |
| ------------------| ------------| -------------------------------|
| title             | string      | null: false                    |
| content           | text        | null: false                    |
| user              | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :words

## words テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| word        | string      | null: false                    |
| example     | text        | null: false                    |
| user        | references  | null: false, foreign_key: true |
| diary       | references  | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :diary
