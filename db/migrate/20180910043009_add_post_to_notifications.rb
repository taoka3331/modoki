class AddPostToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :post, index:true, foreign_key: true
  end
end
