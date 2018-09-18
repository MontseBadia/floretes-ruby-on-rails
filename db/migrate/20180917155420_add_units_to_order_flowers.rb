class AddUnitsToOrderFlowers < ActiveRecord::Migration[5.0]
  def change
    add_column :order_flowers, :units, :integer, default: 0
  end
end
