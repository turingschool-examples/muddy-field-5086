class AmusementParksController < ApplicationController
  def show
    @amuse_park = AmusementPark.find(params[:id])
    @parks_mechanics = @amuse_park.park_mechanics
  end
end