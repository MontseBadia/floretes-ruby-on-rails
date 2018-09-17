class AddQuantityToFlowers < ActiveRecord::Migration[5.0]
  def change
    add_column :flowers, :quantity, :integer
  end
end
