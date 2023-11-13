class HospitalsController < ApplicationController

  def show 
    @hospital = Hospital.find(params[:id])
    doctors = @hospital.doctors
    @doctor_list = doctors.busiest_to_least
  end



end