class DoctorPatientsController < ApplicationController
  def destroy
    @doctor_patient = DoctorPatient.find(params[:id])
    @doctor_patient.destroy

    redirect_back(fallback_location: "/doctors/:doctor_id")
  end
end
