class RenameUserColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :user, :user_id
  end
end
