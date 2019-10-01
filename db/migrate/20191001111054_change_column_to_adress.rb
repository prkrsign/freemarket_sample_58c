class ChangeColumnToAdress < ActiveRecord::Migration[5.2]
  def up
    change_column :adresses, :building_name, :string, null: true
    change_column :adresses, :phone_number, :string, null: true
  end

  # def down
  #   change_column :adresses, :building_name, :string, null: false
  #   change_column :adresses, :phone_number, :string, null: false
  # end
end
