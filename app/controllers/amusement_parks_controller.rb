class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
    @mechanics = Mechanic.joins(:rides).where(rides: { amusement_park_id: @amusement_park.id }).distinct
  end
end