class Order < ApplicationRecord
	has_many :cart_items, dependent: :destroy

	# belongs_to :users
	# belongs_to :shops
	enum payment_method: {
		"代金引換" => 0,
		"クレジットカード" => 1
	}

	validates :name, :address, :email, :phone_number, presence: true
	validates :payment_method, inclusion: payment_methods.keys

	def add_cart_items_from_cart(cart)
		cart.cart_items.each do |item|
			item.cart_id = nil
			cart_items << item
		end
	end
end
