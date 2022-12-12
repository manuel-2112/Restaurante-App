class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :marca
      t.string :modelo
      t.integer :año
      t.integer :precio
      t.string :dueño

      t.timestamps
    end
  end
end
