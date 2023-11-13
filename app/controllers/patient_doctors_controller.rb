class PatientDoctorsController < ApplicationController

  def destroy
    @doctor = Doctor.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @patient_doctors = PatientDoctor.find_by(patient_id: @patient.id, doctor_id: @doctor.id)
    @patient_doctors.destroy
    redirect_to "/doctors/#{@doctor.id}"
  end
end