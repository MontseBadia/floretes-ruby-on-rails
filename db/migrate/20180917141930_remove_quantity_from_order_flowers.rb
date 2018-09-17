class RemoveQuantityFromOrderFlowers < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_flowers, :quantity, :integer
  end
end
