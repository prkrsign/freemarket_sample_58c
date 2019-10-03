# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# Mercari DB設計
## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postalcode|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: true|
|user_id|bigint|null: false, foreign_key: true|
|prefecture_id|bigint|null: false, foreign_key: true|
|phone_number|string|null: true|


### Association
- belongs_to_active_hash :prefecture, optional: true
- belongs_to :user, optional: true


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :goods
<!-- has ancestryのassociationにおける記述方法不確かです. 丸山 -->
- has_ancestry

## deliveries テーブル
|Column|Type|Options|
|------|----|-------|
|delivery_method|string|null: false|
|ancestry|string|null: false|

### Associationテーブル
- has_many :goods
<!-- has ancestryのassociationにおける記述方法不確かです. 丸山 -->
- has_ancestry


## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|goods_name|string|null: false|
|goods_description|text|null: false|
|price|integer|null: false|
|prefecture_id|bigint|null: false, foreign_key: true|
|condition_id|bigint|null: false, foreign_key: true|
|brand_id|bigint|null: true, foreign_key: true|
|shipment_id|bigint|null: false, foreign_key: true|
|user_id|bigint|null: false, foreign_key: true|
|category_id|bigint|null: false, foreign_key: true|
|delivery_id|bigint|null: false, foreign_key: true|
|size_id|string|null: true|

### Association 
- belongs_to_active_hash        :prefecture, optional: true
- belongs_to_active_hash        :brand, optional: true
- belongs_to_active_hash        :condition, optional: true
- belongs_to_active_hash        :shipment, optional: true
- belongs_to                    :category, optional: true
- belongs_to                    :delivery, optional: true
- belongs_to                    :user, optional: true
- has_many                      :images


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|goods_picture|string|null: false|
|good_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :good, optional: true

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|
|user_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|username|string|null: false|
|user_description|text|null: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_in_katakana|string|null: false|
|first_name_in_katakana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_date|integer|null: false|
|phone_number|string|null: false, unique: true|

### Association
- has_one :address
- has_one :card
- has_one :sns_credential
- has_many :goods


<!-- 以下はactive_hash-->
## brands
### Association
- has_many :goods, optional: true

## conditions
### Association
- has_many :goods, optional: true

## prefectures
### Association
- has_many :addresses, optional: true
- has_many :goods, optional: true

## shipment
### Association
- has_many :goods, optional: true





* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
