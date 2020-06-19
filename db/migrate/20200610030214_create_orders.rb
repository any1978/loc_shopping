class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.references :shop, foreign_key: true
      t.integer :quantity
      t.datetime :order_date
      t.datetime :delivery_date
      t.references :delivery_address, foreign_key: true
      t.bigint :payment_method
      t.integer :subtotal_price
      t.integer :tax
      t.integer :delivery_price, default: 350
      t.integer :tax_included_price

      t.timestamps
    end
  end
end
