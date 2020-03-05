class Slot < ApplicationRecord
  belongs_to :booking, optional: true, dependent: :destroy
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'
  validates :start, :teacher_id, presence: true

  scope :future, -> { where('start > now()')}
  scope :past, -> { where('start < now()')}

  attr_accessor :booked
end
