class BookingsController < ApplicationController
  def index
    # if current_user.teacher
    #   @bookings = current_user.teacher_bookings
    # else
    #   @bookings = current_user.student_bookings
    # end
    @bookings = policy_scope(Booking)
    authorize @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
