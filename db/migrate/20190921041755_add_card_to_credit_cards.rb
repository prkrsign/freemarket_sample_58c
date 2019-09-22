class AddCardToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :card, :bigint, null: false, unique: true
    add_column :credit_cards, :customer, :bigint, null: false, unique: true
  end
end
