class CreateOrderFlowers < ActiveRecord::Migration[5.0]
  def change
    create_table :order_flowers do |t|
      t.references :order_pot, foreign_key: true
      t.references :flower, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
