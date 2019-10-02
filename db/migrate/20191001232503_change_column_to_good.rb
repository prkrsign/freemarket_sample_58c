class ChangeColumnToGood < ActiveRecord::Migration[5.2]
  def up
    change_column :goods, :brand_id, :integer, null: true
  end

  def down 
    change_column :goods, :brand_id, :integer, null: false
  end
end
