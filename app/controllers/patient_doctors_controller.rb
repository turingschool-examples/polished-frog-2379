class PatientDoctorsController < ApplicationController 
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient_doctor = PatientDoctor.find_by(doctor: doctor, patient: params[:id])

    if patient_doctor 
      patient_doctor.destroy
    end

    redirect_to doctor_path(doctor.id)
  end
end