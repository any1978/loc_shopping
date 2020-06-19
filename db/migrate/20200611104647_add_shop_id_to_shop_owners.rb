class AddShopIdToShopOwners < ActiveRecord::Migration[6.0]
  def change
    add_reference :shop_owners, :shop, foreign_key: true
  end
end
