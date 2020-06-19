class ChangeDatatypePrefectureCodeOfShopOwners < ActiveRecord::Migration[6.0]
  def change
    change_column :shop_owners, :prefecture_code, :string
  end
end
