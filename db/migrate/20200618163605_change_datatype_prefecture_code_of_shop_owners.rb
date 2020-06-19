class ChangeDatatypePrefectureCodeOfShopOwners < ActiveRecord::Migration[5.2]
  def change
    change_column :shop_owners, :prefecture_code, :string
  end
end
