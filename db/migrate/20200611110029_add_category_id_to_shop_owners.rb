class AddCategoryIdToShopOwners < ActiveRecord::Migration[5.2]
  def change
    add_reference :shop_owners, :category, foreign_key: true
  end
end
