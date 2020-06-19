class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :shop, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.text :remark, null: false
      t.integer :stock, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end

