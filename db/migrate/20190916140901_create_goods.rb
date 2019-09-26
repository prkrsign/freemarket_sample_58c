class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string        :goods_name,        null: false
      t.text          :goods_description, null: false
      t.integer       :price,             null: false

      t.timestamps
    end
  end
end
