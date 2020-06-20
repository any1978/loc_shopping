class ShopOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable


  validates :first_name, presence: true

  has_many :shops

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  # has_many :items
end
