class AddDefaultValToUsersTeacher < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :teacher, :boolean, default: false
  end
end
