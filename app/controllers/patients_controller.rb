class PatientsController < ApplicationController

  def index
    @patients = Patient.alphebetized_adults
  end

end