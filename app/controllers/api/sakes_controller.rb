class Api::SakesController < Api::ApplicationController
  def index
    if params[:keyword].blank?
      sakes = Sake.all
    else
      sakes = Sake.where('name like :keyword or yomi like :keyword', {keyword: "%#{params[:keyword]}%"})
    end

    sakes = paginate sakes.order(:id), page: params[:page], per_page: params[:per_page] || 20

    render json: sakes.map{|sake| Resources::Sake.new(sake).as_json(only: [:id, :name, :yomi])}
  end

  def show
    render json: Resources::Sake.new(Sake.find(params[:id]))
  end
end
