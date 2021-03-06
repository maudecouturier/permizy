class BookingsController < ApplicationController
  before_action :set_booking, only: %i(show edit update destroy)

  def index
    @bookings = policy_scope(Booking)
    authorize @bookings
  end

  def show
    authorize @booking
    @coordinates = @booking.coordinates
    booking_coordinates = @booking.coordinates.sort_by { |coordinate| coordinate.order}
    @coordinate_array = []
    booking_coordinates.each do |coordinate|
      @coordinate_array << [coordinate.longitude, coordinate.latitude]
    end

    @markers = []
    booking_coordinates.each do |coordinate|
      if coordinate.incident_category != 'no_display'
        @markers <<
        {
          coordinate_id: coordinate.id,
          incident_category: coordinate.incident_category,
          lng: coordinate.longitude,
          lat: coordinate.latitude
        }

      end
    end

    # @booking.geocode
    # @marker = {
    #     lat: @booking.latitude,
    #     lng: @booking.longitude
    # }
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

    @booking_id = nil
    # @booking.address = nil

    # for planning display
    @teachers = User.teachers.sort_by { |teacher| teacher.id }
    @teacher = @teachers.first
    generate_slots(DateTime.now().beginning_of_day)
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @student = current_user
    @booking.student = @student
    @booking.address = '16 villa Gaudelet 75011 Paris' if @booking.address == ""
    if @booking.save
      sleep 1
      redirect_to dashboard_path
    else
      redirect_to new_booking_path
      # @teachers = User.teachers.sort_by { |teacher| teacher.id }
      # @teacher = @teachers.first
      # generate_slots(DateTime.now().beginning_of_day)
      # render :new
    end
  end

  def edit
    authorize @booking
    @marker = {
      lat: @booking.latitude,
      lng: @booking.longitude
    }
    @teachers = User.teachers.sort_by { |teacher| teacher.id }
    @teacher = @booking.slot.teacher
    @slot = @booking.slot
    @booking_id = @booking.id
    generate_slots(@slot.start.beginning_of_day)
  end

  def update
    @booking.update(booking_params)
    @booking.slot.end = @booking.slot.start + 2.hours
    authorize @booking
    if @booking.save
      sleep 1
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def refresh_calendar
    @teacher = User.find(params[:teacher_id])
    if params[:refresh] == "next"
      generate_slots(params[:date].to_datetime + 4)
    elsif params[:refresh] == "previous"
      if (params[:date].to_datetime - 4) < DateTime.now().beginning_of_day
        generate_slots(DateTime.now().beginning_of_day)
      else
        generate_slots(params[:date].to_datetime - 4)
      end
    else
      generate_slots(params[:date].to_datetime)
    end

    if params[:booking_id]
      @booking_id = params[:booking_id]
      @slot = Booking.find(params[:booking_id]).slot
    end
    render partial: "slot_calendar"
    skip_authorization
  end

  def destroy
    @booking.destroy
    authorize @booking
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:address, :student_id, slot_attributes: [:id, :start, :teacher_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def generate_slots(start_date)
    @booked_slots = @teacher.slots.order(:start).where('start >= ?', DateTime.now().beginning_of_day)

    @final_slots = []
    starting_date = start_date
    day = DateTime.new(starting_date.year, starting_date.month, starting_date.day)
    5.times do
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
