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

  def respect
    axis_rating("respect_rating")
  end

  def control
    axis_rating("control_rating")
  end

  def share
    axis_rating("share_rating")
  end

  def respect_color
    color(respect)
  end

  def control_color
    color(control)
  end

  def share_color
    color(share)
  end

private
  def axis_rating(rating_class)
    ratings = []
    self.bookings.each do |booking|
      ratings << booking[rating_class] unless booking[rating_class].nil?
    end
    if ratings.count == 0
      rating_average = 0
    else
      rating_average = ratings.sum.to_f / ratings.count
    end
    axis_rating = (rating_average*(Math::PI / 5))
  end

  def color(angle)
    if angle < (Math::PI / 3)
      color = "#FD1015"
    elsif angle > (Math::PI / 3) && angle < ((Math::PI / 3)*2)
      color = "#ECA400"
    else
      color = "#139E10"
    end
  end

end
