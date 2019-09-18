class CreateTestGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :test_goods do |t|
      t.string        :goods_name,        null: true
      t.text          :goods_description, null: true
      t.integer       :price,             null: true
      t.timestamps
    end
  end
end
