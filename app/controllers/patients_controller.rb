class PatientsController < ApplicationController
  def index
    @patients = Patient.adults_ordered
  end
end
