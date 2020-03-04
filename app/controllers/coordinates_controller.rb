class CoordinatesController < ApplicationController
  def update
    @coordinate = Coordinate.find(params[:id])
    authorize @coordinate
    @coordinate.update(student_answer:  params[:coordinate][:student_answer])
    redirect_to booking_path(@coordinate.booking)
  end
end
