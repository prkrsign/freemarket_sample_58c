# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## usersテーブル
|Colum|Type|Options|
|-----|----|------|
|email|integer|
|password|
|username|
|user_description|
|name|
|name_in_katakana|
|birth_date|
|postalcode|
|city|
|house_number|
|building_name|
|phone_number|
|prefecture_id|

### Association
belongs_to :prefecture
 
## goodsテーブル
|Colum|Type|Options|
|-----|----|------|
|goods_name|
|goods_description|
|price|
|user_id|
|prefecture_id|
### Association
- belongs_to :user 
- belongs_to :prefecture 

## prefecturesテーブル
|Colum|Type|Options|
|-----|----|------|
|prefecture|

## imagesテーブル
|Colum|Type|Options|
|-----|----|------|
|goods_picture|
|goods_id|

### Association
belongs_to :good

## on_going_dealsテーブル
|Colum|Type|Options|
|-----|----|------|

## finished_delasテーブル
|Colum|Type|Options|
|-----|----|------|

## dealsテーブルには手をつけてない

## SNSテーブル
|Colum|Type|Options|
|-----|----|------|
|provider|
|uid|
|users_id|

### Association
belongs_to :user

## credit_cardテーブル
|Colum|Type|Options|
|-----|----|------|
|user_id|
|customer_id|
|card_id|

### Association
belogns_to :user
belogns_to :
belogns_to :  ## ここ入れるのか？


## categoriesテーブル
|Colum|Type|Options|
|-----|----|------|
|category_name|
|ancestry|
|goods_id|

### Association
belongs_to :good

## brandsテーブル
|Colum|Type|Options|
|-----|----|------|
|brand_name|
|good_id|

### Association
belongs_to :good






* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...