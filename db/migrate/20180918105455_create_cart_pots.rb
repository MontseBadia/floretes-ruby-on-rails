class CreateCartPots < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_pots do |t|
      t.references :cart, foreign_key: true
      t.references :pot, foreign_key: true

      t.timestamps
    end
  end
end
