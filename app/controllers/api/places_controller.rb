class Api::PlacesController < Api::ApplicationController
  def index
    if params[:keyword].blank?
      places = Place.all
    else
      places = Place.where('name like :keyword', {keyword: "%#{params[:keyword]}%"})
    end

    places = paginate places.order(:id), page: params[:page], per_page: params[:per_page] || 20

    render json: places.map{|place| Resources::Place.new(place).as_json(only: [:id, :name, :yomi])}
  end

  def create
    Place.create!(place_params)

    head :created
  end

  private
    def place_params
      params.require(:place).permit(:name, :lat, :lng)
    end
end
