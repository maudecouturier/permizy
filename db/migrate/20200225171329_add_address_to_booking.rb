class AddAddressToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :address, :string, default: "16 villa Gaudelet 75011 Paris"
  end
end
