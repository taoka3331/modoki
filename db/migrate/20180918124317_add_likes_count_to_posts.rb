class AddLikesCountToPosts < ActiveRecord::Migration[5.2]
   has_many :likes, dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
