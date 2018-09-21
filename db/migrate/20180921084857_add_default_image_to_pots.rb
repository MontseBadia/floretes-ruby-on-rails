class AddDefaultImageToPots < ActiveRecord::Migration[5.0]
  def self.up
    change_column :pots, :image, :string, default: 'pot_base.png'
  end

  def self.down
    change_column :pots, :image, :string, default: nil
  end
end