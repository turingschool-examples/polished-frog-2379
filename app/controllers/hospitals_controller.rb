class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @doctors = Doctor.alphabetical
  end
end