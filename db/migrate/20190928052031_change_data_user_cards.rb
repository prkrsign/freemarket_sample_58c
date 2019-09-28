class ChangeDataUserCards < ActiveRecord::Migration[5.2]
  def down
    change_column :cards, :user, :bigint, null: false
    change_column :cards, :card, :bigint, null: false
    change_column :cards, :customer, :bigint, null: false
  end
  def up
    add_column :cards, :user_id, :integer, null: false
    add_column :cards, :customer_id, :string, null: false
    add_column :cards, :card_id, :string, null: false
  end
end
