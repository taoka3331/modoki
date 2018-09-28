class AddLikeIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :like_id, :integer
  end
end
