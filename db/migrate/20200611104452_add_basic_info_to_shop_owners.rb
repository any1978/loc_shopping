class AddBasicInfoToShopOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :shop_owners, :first_name, :string, null: false
    add_column :shop_owners, :last_name, :string, null: false
    add_column :shop_owners, :phone_number, :string, null: false
    add_column :shop_owners, :postcode, :integer, null: false
    add_column :shop_owners, :prefecture_code, :integer, null: false
    add_column :shop_owners, :address_city, :string, null: false
    add_column :shop_owners, :address_street, :string, null: false
    add_column :shop_owners, :address_building, :string
    add_column :shop_owners, :latitude, :float
    add_column :shop_owners, :longitude, :float
    add_column :shop_owners, :number_of_store, :integer, null: false
  end
end
