class AddPostIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_reference :shops, :post, foreign_key: true
  end
end
