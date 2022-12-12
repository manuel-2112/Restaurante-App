class CreateJoinTableUserAsk < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :asks do |t|
      t.index [:user_id, :ask_id]
      t.index [:ask_id, :user_id]
    end
  end
end
