class AddImageToShopOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_owners, :image, :string
  end
end
