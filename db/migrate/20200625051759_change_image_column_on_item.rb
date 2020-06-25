class ChangeImageColumnOnItem < ActiveRecord::Migration[5.2]
  def up
    change_column_null :items, :image, true
  end

  def down
    change_column_null :items, :image, false
  end
end
