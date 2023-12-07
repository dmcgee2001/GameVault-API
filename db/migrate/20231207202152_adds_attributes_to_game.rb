class AddsAttributesToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :name, :string
    add_column :games, :released, :date
    add_column :games, :background_image, :string
  end
end
