class RemoveUniqueIndexFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, name: "fk_rails_0a464a9919"
  end
end
