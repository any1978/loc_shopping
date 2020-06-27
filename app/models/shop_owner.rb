class ShopOwner < ApplicationRecord
  has_many :authentications

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  before_validation { email.downcase! }
  validates :password, presence: true, length: { minimum: 6 }, on: :new
  validates :postcode, presence: true, format: { with: /\A\d{7}\z/ }
  validates :prefecture_code, presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :address_city, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :address_street, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :number_of_store, presence: true, format: { with: /\A[0-9]+\z/ }

  has_many :shops

  has_many :shop_owner_comments, dependent: :destroy
  mount_uploader :image, ImagesUploader

end
