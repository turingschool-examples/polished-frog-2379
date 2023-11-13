class PatientsController < ApplicationController

  def index
    patients = Patient.all
    @alphabetized = patients.alphabetize 
  end
end