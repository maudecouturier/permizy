class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :bookings, class_name: 'Booking', foreign_key: 'student_id'
  has_many :slots, foreign_key: 'teacher_id'
  has_many :lessons, through: :slots, source: :booking

  scope :teachers, -> { where(teacher: true)}

  def name
    first_name
  end
end
