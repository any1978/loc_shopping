class AddAddressToShopOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_owners, :address, :string
  end
end
