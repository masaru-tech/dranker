class Api::CheckinsController < Api::ApplicationController
  before_action :authenticate_user

  def index
    checkins = paginate Checkin.preload(:user, :alcohols).order('created_at desc'), page: params[:page], per_page: params[:per_page] || 20

    render json: checkins.map{|checkin| Resources::Checkin.new(checkin)}
  end

  def add
    checkin = Checkin.new({google_place_id: checkin_params[:place_id], user_id: current_user.id})
    checkin.checkins_alcohols.build(checkin_params[:alcohols].map{|alcohol_id| {alcohol_id: alcohol_id} })
    checkin.save!

    head :created
  end

  private
    def checkin_params
      params.require(:checkin).permit(:place_id, alcohols: [])
    end
end
