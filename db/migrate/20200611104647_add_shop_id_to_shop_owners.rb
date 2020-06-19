class AddShopIdToShopOwners < ActiveRecord::Migration[5.2]
  def change
    add_reference :shop_owners, :shop, foreign_key: true
  end
end
