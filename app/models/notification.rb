class Notification < ApplicationRecord
 belongs_to :notified_by, class_name: 'User'
 belongs_to :user
 belongs_to :post
 # belongs_to :relationship
 # belongs_to :like
end
