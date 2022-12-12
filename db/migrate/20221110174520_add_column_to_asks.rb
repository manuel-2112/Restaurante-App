class AddColumnToAsks < ActiveRecord::Migration[7.0]
  def change
    add_column :asks, :id_dueño, :integer
  end
end
