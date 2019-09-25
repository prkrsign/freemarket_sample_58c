class Addresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :first_name, null: false
      t.string :family_name, null: false
      t.string :first_name_kana, null: false
      t.string :family_name_kana, null: false
      t.string :postalcode, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name, null: false
      t.bigint :user_id, null: false, foreign_key: true
    end
  end
end
