class Api::SakesController < Api::ApplicationController
  def index
    sakes = paginate Sake.all.order(:id), page: params[:page], per_page: params[:per_page] || 20

    render json: sakes.map{|sake| Resources::Sake.new(sake).as_json(only: [:id, :name, :yomi])}
  end

  def show
    render json: Resources::Sake.new(Sake.find(params[:id]))
  end
end
