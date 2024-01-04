class ChangesUserToUseridInReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :user, :user_id
  end
end
