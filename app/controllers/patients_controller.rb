class PatientsController < ApplicationController
  def index
    @patient = Patient.all
  end
end