class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])

    if doctor_patient
      doctor_patient.destroy
    else
      flash[:error] = "Patient record not found."
    end
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end