class RemoveQuantityFromFlowers < ActiveRecord::Migration[5.0]
  def change
    remove_column :flowers, :quantity, :integer
  end
end
