class Addresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :postalcode, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :prefecture_id, null: false, foreign_key: true
      t.string :phone_number, unique: true
      
    end
  end
end
