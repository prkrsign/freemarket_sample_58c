class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.integer :prefecture,    null: false, default: "0"

      t.timestamps
    end
  end
end
