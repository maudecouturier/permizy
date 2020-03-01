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
    @booking.build_slot
    authorize @booking
    @booking.geocode
    @marker = {
        lat: @booking.latitude,
        lng: @booking.longitude
    }
    @booking.address = nil

    # for planning display
    @teacher = User.teacher.first
    generate_slots(DateTime.now().beginning_of_day)
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @student = current_user
    @booking.student = @student
    @booking.address = '16 villa Gaudelet 75011 Paris' if @booking.address == ""
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    authorize @booking
    @marker = {
      lat: @booking.latitude,
      lng: @booking.longitude
    }
  end

  def update
    # @booking.update(booking_params)
    # @booking.save
    authorize @booking
    if @booking.update(booking_params)
        # @booking.slot.end.update(@booking.slot.start + 2.hours)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def refresh_calendar
    @teacher = User.find(params[:teacher_id])
    if params[:refresh] == "next"
      generate_slots(params[:date].to_datetime + 4)
    else
      generate_slots(params[:date].to_datetime - 4)
    end
    render partial: "slot_calendar"
    skip_authorization
  end

  def destroy
    @booking.destroy
    authorize @booking
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:slot, :address, :student_id, slot_attributes: [:id, :start, :teacher_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def generate_slots(start_date)
    @booked_slots = @teacher.slots.order(:start).where('start >= ?', start_date)

    @final_slots = []
    starting_date = start_date
    day = DateTime.new(starting_date.year, starting_date.month, starting_date.day)
    4.times do
        time = 8
        6.times do
          start_time = DateTime.new(day.year, day.month, day.day, time)
          end_time = start_time + 2.hours
          @final_slots << Slot.new(teacher: @teacher, start: start_time, end: end_time)
          time = time + 2
        end
      day += 1
    end

    @booked_slots.each do |slot|
      final = @final_slots.find { |f| f.start == slot.start}
      final.booked = true if final
    end

    @hash = @final_slots.group_by { |slot| slot.start.day }
  end

end
