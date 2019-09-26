class CreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.bigint :user, null: false, foreign_key: true
      t.bigint :user, null: false, foreign_key: true
      t.bigint :user, null: false, foreign_key: true
    end
  end
end
