class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @doctors = Doctor.patient_count(@hospital.id)
  end
end