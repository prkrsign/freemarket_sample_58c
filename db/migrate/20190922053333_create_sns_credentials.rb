class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string :provider,    null: false
      t.string :uid,         null: false
      t.bigint :user_id,     foreign_key: true

      t.timestamps
    end
  end
end
