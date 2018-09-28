class AddLikeIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :like_id, :integer
  end
end
