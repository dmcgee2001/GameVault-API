class AddIdsToCollections < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :user_id, :integer
    add_column :collections, :game_id, :integer
  end
end
