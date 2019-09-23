class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.integer       :prefecture,        null: false, default: "0"
      t.string        :goods_name,        null: false
      t.text          :goods_description, null: false
      t.integer       :price,             null: false
      t.timestamps
    end
  end
end
