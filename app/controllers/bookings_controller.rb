class BookingsController < ApplicationController
  before_action :set_booking, only: %i(show edit update destroy)

  def index
    @bookings = policy_scope(Booking)
    authorize @bookings
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
    @booking.geocode
    @marker = {
        lat: @booking.latitude,
        lng: @booking.longitude
    }
    @booking.address = nil
  end

  def create
    @booking = Booking.new(booking_params)
    @student = current_user
    @booking.student = @student
    @booking.address = '16 villa Gaudelet 75011 Paris' if @booking.address == ""
    # @booking.geocode
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
    authorize @booking
  end

  def edit
    authorize @booking
    @marker = {
      lat: @booking.latitude,
      lng: @booking.longitude
    }
  end

  def update
    @booking.update(booking_params)
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :new
    end
    authorize @booking
  end

  def destroy
    @booking.destroy
    authorize @booking
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:teacher_id, :slot, :address)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
