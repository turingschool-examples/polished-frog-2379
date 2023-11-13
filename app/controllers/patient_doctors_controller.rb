class PatientDoctorsController < ApplicationController
  def destroy #originally had this on the DoctorController but it felt more RESTful to have it in the PatientDoctorsController since that is the association to be removed
    doctor = Doctor.find(params[:id])
    patient = doctor.patients.find(params[:patient_id])
    patient_doctor = PatientDoctor.find_by(doctor: doctor, patient: patient)

    if patient_doctor.destroy
      redirect_to doctor_path(doctor.id)
      flash[:alert] = "Patient Successfully Deleted"
    else #this condition isn't being tested.. I wasn't sure how to test but thought it was better to leave in than remove for 100% testing. 
      redirect_to doctor_path(doctor.id)
      flash[:alert] = "Patient Not Deleted"
    end
  end
end
