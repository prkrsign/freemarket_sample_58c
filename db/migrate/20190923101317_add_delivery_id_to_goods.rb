class AddDeliveryIdToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :delivery_id, :bigint, null: false, foreign_key: true
  end
end
