class CreatePots < ActiveRecord::Migration[5.0]
  def change
    create_table :pots do |t|
      t.string :name
      t.string :dimensions
      t.string :material
      t.decimal :price

      t.timestamps
    end
  end
end
