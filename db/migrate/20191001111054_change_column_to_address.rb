class ChangeColumnToAddress < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :building_name, :string, null: true
    change_column :addresses, :phone_number, :string, null: true
  end
  def down
    change_column :addresses, :building_name, :string, null: false
    change_column :addresses, :phone_number, :string, null: false
  end
end
