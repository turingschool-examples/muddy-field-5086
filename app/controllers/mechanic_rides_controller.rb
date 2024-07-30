class MechanicsController < ApplicationController
  # def show
  #   @mechanic = Mechanic.find(params[:id])
  # end

  def new
  end

  def create 
    MechanicRide.create((mechanic_id): params[:id], ride_id: params[:ride_id])

    redirect_to "/customers/#{params[:id]}"
  end
end