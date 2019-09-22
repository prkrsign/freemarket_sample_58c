class Addresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postalcode, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name, null: false
      t.bigint :user, null: false, foreign_key: true
    end
  end
end
