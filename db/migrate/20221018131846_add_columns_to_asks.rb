class AddColumnsToAsks < ActiveRecord::Migration[7.0]
  def change
    add_column :asks, :user_id, :integer
    add_column :asks, :car_id, :integer
  end
end
