class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @docs = @hospital.docs_ordered_by_patients
  end
end
