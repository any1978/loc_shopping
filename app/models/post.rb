class Post < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :shop_owner
  has_many :comments, dependent: :destroy
end
