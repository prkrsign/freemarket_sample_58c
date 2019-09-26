class AddConditionToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :condition, :bigint
  end
end
