class AddSizeToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :size, :string, null: false
  end
end
