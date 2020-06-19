class AddImageToShopOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :shop_owners, :image, :string
  end
end
