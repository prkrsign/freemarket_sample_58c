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
|Colum|Type|Options|
|-----|----|------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
|user_description|text
|name|string|null: false|
|name_in_katakana|string|null: false|
|birth_date|integer|null: false|
|postalcode|integer|null: false|
|city|string|null: false|
|house_number|ionteger|null: false|
|building_name|string|null: false|
|phone_number|integer|null: false|
|prefecture_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :prefecture
- belongs_to :credit_card
- has_many :goods
- has_many :deals
- has_many :Snss

 
## goodsテーブル
|Colum|Type|Options|
|-----|----|------|
|goods_name|string|null: false|
|goods_description|text|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user 
- belongs_to :prefecture 
- belongs_to :brands
- belongs_to :categories
- belongs_to :deals
- has_many :images
- 

## prefecturesテーブル
|Colum|Type|Options|
|-----|----|------|
|prefecture||null:false|

## imagesテーブル
|Colum|Type|Options|
|-----|----|------|
|goods_picture|string|null: false|
|goods_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :good
- has_many :goods
- has_many :users

## dealsテーブル
|Colum|Type|Options|
|-----|----|------|
|deal|
|user_id|integer|null: false, foreign_key: true|
|good_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :goods


## Snssテーブル
|Colum|Type|Options|
|-----|----|------|
|provider|
|uid|
|users_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user

## credit_cardsテーブル
|Colum|Type|Options|
|-----|----|------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|integer|null: false, foreign_key: true|
|card_id|integer|null: false, foreign_key: true|

### Association
- has_many :users


## categoriesテーブル
|Colum|Type|Options|
|-----|----|------|
|category_name||null: false|
|ancestry|
|goods_id|integer|null: false, foreign_key: true|

### Association
- has_many :goods

## brandsテーブル
|Colum|Type|Options|
|-----|----|------|
|brand_name|
|good_id|integer|null: false, foreign_key: true|

### Association
 - has_many :goods






* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...