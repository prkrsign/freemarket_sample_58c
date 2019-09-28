class ChangeDataUserCards < ActiveRecord::Migration[5.2]
  def up
    remove_column :cards, :user
    remove_column :cards, :customer
    remove_column :cards, :card
  end
end
