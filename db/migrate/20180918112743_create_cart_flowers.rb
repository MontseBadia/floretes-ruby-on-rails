class CreateCartFlowers < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_flowers do |t|
      t.references :flower, foreign_key: true
      t.references :cart_pot, foreign_key: true
      t.integer :units, default: 0

      t.timestamps
    end
  end
end
