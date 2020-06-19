class AddNameToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :name, :string
    add_column :orders, :phone_number, :string
    add_column :orders, :email, :string
    add_column :orders, :address, :integer
    
  end
end
