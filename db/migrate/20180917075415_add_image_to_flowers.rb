class AddImageToFlowers < ActiveRecord::Migration[5.0]
  def change
    add_column :flowers, :image, :string
  end
end
