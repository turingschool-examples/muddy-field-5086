class MechanicRidesController < ApplicationController
  # def show
  #   @mechanic = Mechanic.find(params[:id])
  # end

  def new
  end

  def create 
    MechanicRide.create(mechanic_id: params[:mechanic_id], ride_id: params[:ride_id])
    mechanic_id = params[:mechanic_id]
    redirect_to mechanic_path(mechanic_id)
  end
end