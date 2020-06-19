class ChangeDatatypePrefectureCodeOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :prefecture_code, :string
  end
end
