class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string      :goods_picture,    null: false
      t.bigint      :good_id,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
