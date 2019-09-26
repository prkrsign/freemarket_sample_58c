class RenameCreditCardsToCards < ActiveRecord::Migration[5.2]
  def change
    rename_table :credit_cards, :cards
  end
end
