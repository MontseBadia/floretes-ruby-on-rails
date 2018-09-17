class CreateOrderPots < ActiveRecord::Migration[5.0]
  def change
    create_table :order_pots do |t|
      t.references :order, foreign_key: true
      t.references :pot, foreign_key: true

      t.timestamps
    end
  end
end
