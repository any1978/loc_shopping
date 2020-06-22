class CreateShopOwnerComments < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_owner_comments do |t|
      t.string :content
      t.references :shop, foreign_key: true
      t.references :shop_owner, foreign_key: true
      t.timestamps
    end
  end
end
