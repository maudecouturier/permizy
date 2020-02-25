class Booking < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'
  validates :slot, :teacher, :student, presence: true
  # validate :slot_validation


  # def slot_validation
  #   return if slot.blank?

  #   if slot < DateTime.now() + 86_400
  #     errors.add(:slot, "Chosen time cannot be before tomorrow")
  #   end
  # end
  # geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
