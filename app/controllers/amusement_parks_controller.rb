class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
    @mechanics = @amusement_park.rides.joins(:mechanics).distinct
  end
end