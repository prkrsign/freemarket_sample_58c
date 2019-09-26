class ChangeColumnToGoods < ActiveRecord::Migration[5.2]
  def change
    change_column :goods, :size, :string, null: true
  end
end
