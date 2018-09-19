class AddCapacityToPots < ActiveRecord::Migration[5.0]
  def change
    add_column :pots, :capacity, :integer
  end
end
