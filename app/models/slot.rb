class Slot < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'

  scope :future, -> { where('start > now()')}
  scope :past, -> { where('start < now()')}
end
