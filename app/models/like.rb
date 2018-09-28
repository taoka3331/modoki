class Like < ApplicationRecord
	has_many :notifications, dependent: :destroy
	belongs_to :user
 	belongs_to :post, counter_cache: :likes_count
end

