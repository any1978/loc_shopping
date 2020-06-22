class RemoveShopFromComments < ActiveRecord::Migration[5.2]
  def down
    add_column :shop, :comment
  end
end
