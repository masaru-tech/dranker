class Api::PlacesController < Api::ApplicationController
  def create
    Place.create!(place_params)

    head :created
  end

  private
    def place_params
      params.require(:place).permit(:name, :lat, :lng)
    end
end
