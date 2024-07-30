class MechanicRidesController < ApplicationController
  # def show
  #   @mechanic = Mechanic.find(params[:id])
  # end

  def new
  end

  def create 
    binding.pry
    mechanic_id = Mechanic.find(params[:id])
    MechanicRide.create(mechanic_id: params[:id], ride_id: params[:ride_id])

    redirect_to mechanic_path(mechanic_id)
  end
end