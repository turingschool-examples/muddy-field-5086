class MechanicsController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    @mechanic = Mechanic.find(params[:id])
    # :add_ride grabs what's entered into text have_field
    # params brings it along
    ride = Ride.find(params[:add_ride])
    RideMechanic.create!(ride: ride, mechanic: @mechanic)
    redirect_to mechanic_path(@mechanic)
  end
end

