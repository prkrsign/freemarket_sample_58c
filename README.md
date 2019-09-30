# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# Mercari DB設計
## usersテーブル
|Column|Type|Options|
|-----|----|------|
|email|string|null: false, unique: true|
|password|string|null: false|
|username|string|null: false, unique: true|
|user_description|text|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_in_katakana|string|null: false|
|first_name_in_katakana|string|null: false|
|birth_year|integer|null: false|
|brith_month|integer|null: false|
|birth_date|integer|null: false|
|phone_number|integer|null: false, unique: true|
|address|bigint|foreign_key: true|
### Association
- has_one :credit_card
- has_one :address
- has_many :goods

## addressesテーブル
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postalcode|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|user|bigint|null: false, foreign_key: true|
|prefecture|bigint|null: false, foreign_key: true|

### Association
- belongs_to :prefecture
- belongs_to :user
- has_many :goods
- has_many :deals

 
## goodsテーブル
|Column|Type|Options|
|-----|----|------|
|goods_name|string|null: false|
|goods_description|text|null: false|
|price|integer|null: false|
|prefecture|bigint|null: false, foreign_key: true|
|condition|bigint|null: false, foreign_key: true|
|brand|bigint|foreign_key: true|
|user|bigint|null: false, foreign_key: true|
|category|bigint|null: false, foreign_key: true|
|delivery|bigint|null: false, foreign_key: true|
|size|bigint|null: false, foreign_key: true|

### Association
- belongs_to :prefecture
- belongs_to :brand
- belongs_to :category
- belongs_to :user 
- has_many :images


## imagesテーブル
|Column|Type|Options|
|-----|----|------|
|goods_picture|string|null: false|
|good|bigint|null: false, foreign_key: true|

### Association
- belongs_to :good


## dealsテーブル
|Column|Type|Options|
|-----|----|------|
|deal|boolean||
|user|bigint|null: false, foreign_key: true|
|good|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user


## sns_credentialsテーブル
|Column|Type|Options|
|-----|----|------|
|provider|string|null: false|
|uid|string|null: false|
|user|bigint|null: false, foreign_key: true|

### Association
- has_one :user

## cardsテーブル
|Column|Type|Options|
|-----|----|------|
|user|bigint|null: false, foreign_key: true|
|customer|bigint|null: false, foreign_key: true|
|card|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user


## categoriesテーブル
|Column|Type|Options|
|-----|----|------|
|category_name|string|null: false|
|ancestry|string||


### Association
- has_many :goods
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|-----|----|------|
|brand_name|string|

### Association
 - has_many :goods

## deliveries テーブル
|Column|Type|Options|
|-----|----|------|
|delivery_method||null: false|
|ancestry||null: false|






* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...