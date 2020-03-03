class Booking < ApplicationRecord
  geocoded_by :address

  has_one :slot, dependent: :destroy
  has_one :teacher, through: :slot, as: :teacher
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  has_many :coordinates, dependent: :destroy

  accepts_nested_attributes_for :slot

  validates  :student, presence: true

  after_validation :geocode, if: :will_save_change_to_address?

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
    self[rating_class].nil? ? axis_rating = 0 : axis_rating = (self[rating_class]*(Math::PI / 5))
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
