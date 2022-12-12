class RemoveColumnsFromAsk < ActiveRecord::Migration[7.0]
  def change
    remove_column :asks, :car, :string
    remove_column :asks, :model, :string
    remove_column :asks, :age, :integer
  end
end
