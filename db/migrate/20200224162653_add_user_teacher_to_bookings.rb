class AddUserTeacherToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :student, index: true, foreign_key: { to_table: :users}
    add_reference :bookings, :teacher, index: true, foreign_key: { to_table: :users}
  end
end
