class AddActiveToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :active, :boolean
  end
end
