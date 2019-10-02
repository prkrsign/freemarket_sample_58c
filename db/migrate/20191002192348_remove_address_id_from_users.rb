class RemoveAddressIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address_id, :bigint
  end
end
