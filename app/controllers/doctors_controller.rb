class DoctorsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = @hospital.doctors.find(params[:id])
  end
end
