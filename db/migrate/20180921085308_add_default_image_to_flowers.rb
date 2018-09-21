class AddDefaultImageToFlowers < ActiveRecord::Migration[5.0]
  def self.up
    change_column :flowers, :image, :string, default: 'flower_base.png'
  end

  def self.down
    change_column :flowers, :image, :string, default: nil
  end
end