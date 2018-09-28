class FollowNotification < ApplicationRecord
  belongs_to :notified_by, class_name: 'User'
  belongs_to :user
  # belongs_to :relationship 
end