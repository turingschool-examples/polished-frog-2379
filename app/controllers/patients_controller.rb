class PatientsController < ApplicationController
  def index
    @adult_patients = Patient.adults
  end
end
