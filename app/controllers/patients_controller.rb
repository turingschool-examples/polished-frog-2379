class PatientsController < ApplicationController
  def index
    @patients = Patient.sorted_patients
  end

end