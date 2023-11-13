class DoctorPatientsController < ApplicationController
  def destroy
    @doctor_patient = DoctorPatient.find_by("doctor_id = ? AND patient_id = ?", params[:doctor_id], params[:patient_id])

    @doctor_patient.destroy

    redirect_back(fallback_location: "/doctors/:doctor_id")
  end
end
