class Item < ApplicationRecord
  # belongs_to :shop, optional: true

  # belongs_to :shop, optional: true
  has_many :itemizes, dependent: :destroy
  has_many :shops, through: :itemizes

  has_many :cart_items
  # has_many :carts ,through: :cart_items

  before_destroy :ensure_not_referenced_by_any_cart_item

  validates :name, :remark, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 1}
  # validates :stock, numericality: {greater_than_or_equal_to: 1}

  validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\z}i,
		message: 'はGIF、JPG、PNG画像のURLでなければなりません。'
	}

  mount_uploader :image, ImagesUploader

  private
	# この商品を参照しているLineItemがないことを確認する
	def ensure_not_referenced_by_any_cart_items

		unless cart_items.empty?
			errors.add(:base, '品目が存在します。')
			throw :abort
		end
	end
end
