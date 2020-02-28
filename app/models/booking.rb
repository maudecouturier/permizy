class Booking < ApplicationRecord
  geocoded_by :address

  has_one :slot
  has_one :teacher, through: :slot, as: :teacher
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'

  accepts_nested_attributes_for :slot

  validates  :student, presence: true

  after_validation :geocode, if: :will_save_change_to_address?



end
