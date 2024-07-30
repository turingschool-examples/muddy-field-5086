class RideMechanicsController < ApplicationController 
  def new
    @mechanic = Mechanic.find(params[:mechanic_id])
  end

  def create 
    var = RideMechanic.create!(ride_mechanic_params)
    redirect_to mechanic_path(params[:mechanic_id])
  end

  private
    def ride_mechanic_params 
      params.permit(:mechanic_id, :ride_id)
    end
end