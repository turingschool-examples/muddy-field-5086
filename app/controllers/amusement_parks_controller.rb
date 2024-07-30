class AmusementParksController < ApplicationController
  def show
    @amuse_park = AmusementPark.find(params[:id])
  end
end