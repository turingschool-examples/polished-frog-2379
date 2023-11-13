class PatientsController < ApplicationController
  def index
    @patients = Patient.over_18
  end
end