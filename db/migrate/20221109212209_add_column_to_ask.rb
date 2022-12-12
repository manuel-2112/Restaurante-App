class AddColumnToAsk < ActiveRecord::Migration[7.0]
  def change
    add_column :asks, :estado, :string, default: 'PENDIENTE'
  end
end
