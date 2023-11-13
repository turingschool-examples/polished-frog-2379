class PatientsController < ApplicationController

  def index
    # patients = Patient.all
    # @alphabetized = patients.alphabetize 

    patients = Patient.all.alphabetize
    @adult_list = patients.no_minors
  end
end