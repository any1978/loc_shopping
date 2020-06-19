class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 1
      t.references :item, null: false, foreign_key: true
      t.belongs_to :cart, null: true, foreign_key: true
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.references :order, null: true, foreign_key: true
      t.timestamps
    end
  end
end
