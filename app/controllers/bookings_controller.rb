class BookingsController < ApplicationController
  def index
    if current_user.teacher
      # raise
      @bookings = current_user.teacher_bookings
    else
      @bookings = current_user.student_bookings
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
