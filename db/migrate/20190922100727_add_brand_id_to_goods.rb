class AddBrandIdToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :brand_id, :bigint, null: false, foreign_key: true
  end
end
