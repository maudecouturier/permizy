class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_bookings
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def set_bookings
    @bookings = current_user ? policy_scope(Booking) : []
  end
end
