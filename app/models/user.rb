class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :authentications

  include JpPrefecture
  jp_prefecture :prefecture_code#, method_name: :pref

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




  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end   

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end 

  has_one :cart
end
