class RemoveShopOwnerFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :shop_owner_id, :bigint
  end
end
