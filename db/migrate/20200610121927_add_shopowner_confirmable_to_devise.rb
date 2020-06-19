class AddShopownerConfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    add_column :shop_owners, :confirmation_token, :string
    add_column :shop_owners, :confirmed_at, :datetime
    add_column :shop_owners, :confirmation_sent_at, :datetime
    add_column :shop_owners, :unconfirmed_email, :string
    add_index :shop_owners, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    execute("UPDATE shop_owners SET confirmed_at = NOW()")
  end
  def down
    remove_columns :shop_owners, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :shop_owners, :unconfirmed_email # Only if using reconfirmable
  end
end
