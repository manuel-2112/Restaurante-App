class CreateAsks < ActiveRecord::Migration[7.0]
  def change
    create_table :asks do |t|
      t.string :car
      t.string :model
      t.integer :age
      t.string :name
      t.string :mail
      t.string :dates
      t.string :reason

      t.timestamps
    end
  end
end
