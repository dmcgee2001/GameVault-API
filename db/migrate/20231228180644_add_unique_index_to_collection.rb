class AddUniqueIndexToCollection < ActiveRecord::Migration[7.0]
  def change
    add_index :collections, [:user_id, :game_id], unique: true
  end
end
