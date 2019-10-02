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
<!-- unique: true変更 要確認-->
|encrypted_password|string|null: false|
<!-- unique trueかどうか確認 -->
|username|string|null: false|
|user_description|text|null: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_in_katakana|string|null: false|
|first_name_in_katakana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_date|integer|null: false|
|phone_number|integer|null: false, unique: true|

### Association
<!-- adress必要かどうか要確認 -->
- has_one :address
- has_one :card
- has_many :sns_credentials, dependent: :destroy
- has_many :goods

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
<!-- prefectureはactivehashであるから結びつきもう一度確認 -->
|prefecture_id|bigint|null: false, foreign_key: true|
|phone_number|string|null: true|


### Association
- belongs_to_active_hash :prefecture, optional: true
- belongs_to :user, optional: true
<!-- 多分goodsを持たないので削除してもおk -->
- has_many :goods
<!-- dealsテーブルないから要確認 -->
- has_many :deals

 
## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|goods_name|string|null: false|
|goods_description|text|null: false|
|price|integer|null: false|
<!-- アクティブハッシュだから要確認 -->
|prefecture_id|bigint|null: false, foreign_key: true|
<!-- 同上 -->
|condition_id|bigint|null: false, foreign_key: true|
<!-- 同上 -->
|brand_id|bigint|null: true, foreign_key: true|
<!-- 同上 -->
|shipment_id|bigint|null: false, foreign_key: true|

|user_id|bigint|null: false, foreign_key: true|
|category_id|bigint|null: false, foreign_key: true|
|delivery_id|bigint|null: false, foreign_key: true|
<!-- sizeはancestry臭いので要確認 -->
|size_id|bigint|null: false, foreign_key: true|

### Association (要確認: アクティブハッシュ、リレーション)
<!-- 「-」が入っていないところ要確認 -->
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
<!-- goodsテーブルとの関係をはっきりさせる。現在1-多混同している -->
|good_id|bigint|null: false, foreign_key: true|

### Association
<!-- １対多が混同している -->
- belongs_to :good, optional: true


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|
|user_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true 


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true|
<!-- customer_idってそもそもなんだ -->
|customer_id|bigint|null: false, foreign_key: true|
|card_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user
- belogns_to :customer


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
<!-- ancestryのオプション知らない -->
|ancestry|string||


### Association
- has_many :goods
- has_ancestry

<!-- brandsテーブルはアクティブハッシュを代わりに使用、確認用としてREADME記述 -->
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|

## conditionsテーブル
## shipmentテーブル
## 

### Association
 - has_many :goods  

## deliveries テーブル
|Column|Type|Options|
|------|----|-------|
|delivery_method|string|null: false|
<!-- ancestryがあるのでカラムの書き方確認 -->
|ancestry||null: false|

### Associationテーブル
- has_many :goods
- has_ancestry






* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...