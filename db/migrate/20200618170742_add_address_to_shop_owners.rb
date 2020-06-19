class AddAddressToShopOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :shop_owners, :address, :string
  end
end
