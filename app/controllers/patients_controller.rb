class PatientsController < ApplicationController
  def index
    @patients = Patients.all
  end

end