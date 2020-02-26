class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :student_bookings, class_name: 'Booking', foreign_key: 'student_id'
  has_many :teacher_bookings, class_name: 'Booking', foreign_key: 'teacher_id'
  
  scope :teacher, -> { where(teacher: true)}

  def name
    first_name
  end
end
