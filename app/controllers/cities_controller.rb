# The CitiesController is responsible for handling requests for the City model.
class CitiesController < ApplicationController
  def index
    @cities = City.all
    @cities = @cities.where(state_id: params[:state_id]) if params[:state_id]
    @cities = @cities.where('name ILIKE ?', "%#{params[:name]}%") if params[:name]
    respond_to do |format|
      format.html
      format.json { render json: @cities }
    end
  end
end
