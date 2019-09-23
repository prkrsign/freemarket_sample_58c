class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string     :delivery_method,     null: false

      t.timestamps
    end
  end
end
