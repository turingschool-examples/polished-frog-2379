class DoctorPatientsController < ApplicationController
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])
    @doctorpatient = DoctorPatient.find_by(doctor_id: @doctor.id, patient_id: @patient.id)

    @doctorpatient.destroy
    redirect_to "/doctors/#{@doctor.id}"
    flash[:notice] = "This Patient was successfully removed from the doctor!"
  end
end
