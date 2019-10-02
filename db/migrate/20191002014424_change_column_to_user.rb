class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :user_description, :text, null: true
  end
  def down 
    change_column :users, :user_description, :text, null: false 
  end
end
