class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

 def update
  plant = Plant.find(params[:id])
  plant.update(plant_params)
  if(plant)
    render json: plant, status: :ok
  else
 render_error_response
  end
 end

 def destroy
   plant = Plant.find(params[:id])
   if plant
    plant.destroy
   else
    render_error_response
   end
 end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def render_error_response
    render json: {error: "plant not found"}, status: :not_found
  end
end
