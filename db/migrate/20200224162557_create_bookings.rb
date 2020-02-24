class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :slot
      t.text :review_content
      t.text :review_evalution
      t.text :review_to_improve
      t.integer :respect_rating
      t.integer :control_rating
      t.integer :share_rating

      t.timestamps
    end
  end
end
