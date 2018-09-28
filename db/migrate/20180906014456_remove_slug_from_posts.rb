class RemoveSlugFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :slug, :string
  end
end
