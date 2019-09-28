class ChangeColumnToGoods < ActiveRecord::Migration[5.2]
  def up
    change_column :goods, :size, :string, null: true
  end
end
