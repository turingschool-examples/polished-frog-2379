class DoctorPatientsController < ApplicationController
  def destroy
    DoctorPatient.where(doctor_id: params[:doctor_id], patient_id: params[:id]).destroy_all
    redirect_to doctor_path(params[:doctor_id])
  end
end
