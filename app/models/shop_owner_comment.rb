class ShopOwnerComment < ApplicationRecord
  belongs_to :shop, optional: true
  belongs_to :shop_owner, optional: true
end
