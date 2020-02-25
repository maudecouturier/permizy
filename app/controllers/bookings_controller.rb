class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    authorize @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking

  end

  def create
    @booking = Booking.new(booking_params)
    @student = current_user
    @booking.student = @student
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :new
    end
    authorize @booking
  end


  private

  def booking_params
    params.require(:booking).permit(:teacher_id, :slot)
  end

end
