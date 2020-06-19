class AddCategoryIdToShopOwners < ActiveRecord::Migration[6.0]
  def change
    add_reference :shop_owners, :category, foreign_key: true
  end
end
