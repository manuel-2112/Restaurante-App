class CreateJoinTableUserCar < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :cars do |t|
      t.index [:user_id, :car_id]
      t.index [:car_id, :user_id]
    end
  end
end
