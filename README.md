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
|email|string|null: false, unique: true|
|password|string|null: false|
|username|string|null: false, unique: true|
|user_description|text
|name|string|null: false|
|name_in_katakana|string|null: false|
|birth_date|integer|null: false|
|postalcode|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|phone_number|integer|null: false, unique: true|
|prefecture_id|integer|null: false, foreign_key: true|
|credit_card_id|integer|foreign_key: true|

### Association
- belongs_to :prefecture
- belongs_to :credit_card
- has_many :goods
- has_many :deals

 
## goodsテーブル
|Colum|Type|Options|
|-----|----|------|
|goods_name|string|null: false|
|goods_description|text|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|deal_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user 
- belongs_to :prefecture 
- belongs_to :brand
- belongs_to :category
- has_many :images

## prefecturesテーブル
|Colum|Type|Options|
|-----|----|------|
|prefecture|string|null:false|

### Association
- has_many :users
- has_many :goods

## imagesテーブル
|Colum|Type|Options|
|-----|----|------|
|goods_picture|string|null: false|
|good_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :good


## dealsテーブル
|Colum|Type|Options|
|-----|----|------|
|user_id|integer|null: false, foreign_key: true|
|good_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## sns_credentialsテーブル
|Colum|Type|Options|
|-----|----|------|
|provider|string
|uid|string
|user_id|integer|null: false, foreign_key: true|

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
|category_name|string|null: false|
|ancestry|


### Association
- has_many :goods

## brandsテーブル
|Colum|Type|Options|
|-----|----|------|
|brand_name|string|

### Association
 - has_many :goods






* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...