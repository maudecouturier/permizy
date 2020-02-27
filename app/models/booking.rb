class Booking < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  has_one :slot
  validates  :student, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
