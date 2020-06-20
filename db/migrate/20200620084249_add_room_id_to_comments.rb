class AddRoomIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :room, foreign_key: true
    add_column :comments, :is_user, :boolean
  end
end
