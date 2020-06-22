class AddShopOwnerIdToShopOwnerComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :shop_owner_comments, :shop_owner, foreign_key: true
  end
end
