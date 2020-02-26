class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @bookings = policy_scope(Booking)
    authorize @bookings
  end
end
