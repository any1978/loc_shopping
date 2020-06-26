class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true, length: {maximum: 50}
  validates :introduction, presence: true
  validates :postcode, presence: true, format: { with: /\A\d{7}\z/ }
  validates :prefecture_code, presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :address_city, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :address_street, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  
  # has_one_attached :profile_image
  mount_uploader :image, ImagesUploader
  mount_uploader :profile_image, ImagesUploader
  
  belongs_to :shop_owner
  has_many :itemizes, dependent: :destroy
  has_many :items, through: :itemizes
  # belongs_to :shop_owner, optional: true
  has_many :comments, dependent: :destroy
  # has_many :replies, class_name: Comment, foreign_key: :reply_comment, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :shop_owner_comments, dependent: :destroy
end