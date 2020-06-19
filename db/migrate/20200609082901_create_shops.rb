class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.references :shop_owner, foreign_key: true
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :profile_image
      t.string :image
      t.string :phone_number, null: false
      t.integer :postcode, null: false
      t.integer :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
