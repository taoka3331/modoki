class RemoveAvatarIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avatar_id, :strin
  end
end
