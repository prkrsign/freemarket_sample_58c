class AddPrefectureIdToGoods < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :prefecture_id, :bigint, null: false, foreign_key: true
  end
end
