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
|------|----|-------|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false, unique: true|
|username|string|null: false|
|user_description|text||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_in_katakana|string|null: false|
|first_name_in_katakana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_number|integer|null: false, unique: true|
|address|bigint|foreign_key: true|

### Association
- has_one :address
- has_one :cards
- has_many :sns_credentials, dependent: :destroy
- has_many :goods

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|postalcode|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|user|bigint|null: false, foreign_key: true|
|prefecture|bigint|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :prefecture, optional: true
- belongs_to :user, optional: true
- has_many :goods
- has_many :deals

 
## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|goods_name|string|null: false|
|goods_description|text|null: false|
|price|integer|null: false|
|prefecture|bigint|null: false, foreign_key: true|
|condition|bigint|null: false, foreign_key: true|
|brand|bigint|foreign_key: true|
|shipment|bigint|null: false, foreign_key: true|
|user|bigint|null: false, foreign_key: true|
|category|bigint|null: false, foreign_key: true|
|delivery|bigint|null: false, foreign_key: true|
|size|bigint|null: false, foreign_key: true|

### Association (要確認: アクティブハッシュ、リレーション)

- belongs_to_active_hash        :prefecture
- belongs_to_active_hash        :brand
- belongs_to                    :category
    belongs_to                    :delivery
    belongs_to_active_hash        :condition
    belongs_to_active_hash        :shipment
- has_many                      :images
    belongs_to                    :delivery
    accepts_nested_attributes_for :images
- belongs_to                    :user


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|goods_picture|string|null: false|
|good|bigint|null: false, foreign_key: true|

### Association
- belongs_to :good, optional: true


<!-- ## dealsテーブル　(確認できていないため一旦コメントアウト)
|Column|Type|Options|
|------|----|-------|
|deal|boolean||
|user|bigint|null: false, foreign_key: true|
|good|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user -->


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|
|user|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true 


## cardsテーブル(要確認、customerカラムはどうなっているのか)
|Column|Type|Options|
|------|----|-------|
|user|bigint|null: false, foreign_key: true|
|customer|bigint|null: false, foreign_key: true|
|card|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user
- belogns_to :customer


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|ancestry|string||


### Association
- has_many :goods
- has_ancestry

<!-- brandsテーブルはアクティブハッシュを代わりに使用、確認用にテーブルはコメントアウトで残す -->
<!-- ## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string| -->

<!-- ### Association
 - has_many :goods -->

## deliveries テーブル
|Column|Type|Options|
|------|----|-------|
|delivery_method||null: false|
|ancestry||null: false|

### Associationテーブル
- has_many :goods
- has_ancestry






* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...