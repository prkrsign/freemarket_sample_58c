class AddShipmentIdToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :shipment_id, :bigint, null: false, foreign_key: true
  end
end
