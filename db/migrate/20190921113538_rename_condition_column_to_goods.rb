class RenameConditionColumnToGoods < ActiveRecord::Migration[5.2]
  def change
    rename_column :goods, :condition, :condition_id
  end
end
