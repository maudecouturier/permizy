class AddReferencesToChatRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :teacher, class_name: 'User', foreign_key: { to_table: :users }
    add_reference :chatrooms, :student, class_name: 'User', foreign_key: { to_table: :users }
  end
end
