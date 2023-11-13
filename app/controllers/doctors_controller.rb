class DoctorsController < ApplicationController
  def show 
    @doc = Doctor.find(params[:doctor_id])
  end
end