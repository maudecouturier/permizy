class UpdateBooking < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :slot
    remove_column :bookings, :teacher_id
  end
end
