class AddBasicInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :phone_number, :string, null: false
    add_column :users, :postcode, :integer, null: false
    add_column :users, :prefecture_code, :integer, null: false
    add_column :users, :address_city, :string, null: false
    add_column :users, :address_street, :string, null: false
    add_column :users, :address_building, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
