class Test < ActiveRecord::Migration[5.2]
  def change
  	add_column :shop_owner_comments, :shop_owner_id, :integer
  end
end
