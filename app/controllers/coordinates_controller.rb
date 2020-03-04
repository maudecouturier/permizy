class CoordinatesController < ApplicationController
  def update
    @coordinate = Coordinate.find(params[:id])
    authorize @coordinate
    @coordinate.update(student_answer:  params[:coordinate][:student_answer])

    respond_to do |format|
      format.js
    end
  end
end
