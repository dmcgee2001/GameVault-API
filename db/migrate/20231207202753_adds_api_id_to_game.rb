class AddsApiIdToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :api_id, :integer
  end
end
