class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :shop
  belongs_to :shop_owner
  validates :content, presence: true
end
