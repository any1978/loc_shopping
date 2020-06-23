class ShopOwner < ApplicationRecord
  has_many :authentications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable#, :confirmable


  validates :first_name, presence: true

  has_many :shops

  has_many :shop_owner_comments, dependent: :destroy
  mount_uploader :image, ImagesUploader
  
  # has_many :items
end
