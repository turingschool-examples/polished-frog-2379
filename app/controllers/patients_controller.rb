class PatientsController < ApplicationController
  def index
    @patients = Patient.alphabetical_adult
  end 
end