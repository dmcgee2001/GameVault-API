class AddUserIdToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :user_id, :integer
  end
end
