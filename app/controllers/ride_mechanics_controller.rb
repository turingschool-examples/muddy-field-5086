class RideMechanicsController < ApplicationController
  def create
    @mechanic = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params[:ride_id])
    @mechanic.rides << ride unless @mechanic.rides.include?(ride)
    redirect_to mechanic_path(@mechanic)
  end
end