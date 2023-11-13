class PatientDoctorsController < ApplicationController

def destroy
  PatientDoctor.where(doctor_id: params[:doctor_id], patient_id: params[:patient_id]).first.destroy
  redirect_to "/doctors/#{params[:doctor_id]}"
end

end