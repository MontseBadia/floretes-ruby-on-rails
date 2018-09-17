class AddImageToPots < ActiveRecord::Migration[5.0]
  def change
    add_column :pots, :image, :string
  end
end
