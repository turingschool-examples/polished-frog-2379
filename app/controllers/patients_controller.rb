class PatientsController < ApplicationController
  def index 
    @patients = Patient.alphabetical
  end
end