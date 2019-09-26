class AddDetailsToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :user_id, :bigint, null: false, foreign_key: true
    add_column :goods, :category_id, :bigint, null: false, foreign_key: true
  end
end
