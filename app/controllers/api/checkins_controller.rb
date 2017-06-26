class Api::CheckinsController < Api::ApplicationController
  def index
    limit = params[:limit] || 20
    checkins = Checkin.preload(:user, :alcohols).order('checkins.id desc').limit(limit)

    cursor_id = params[:since_id].presence || params[:until_id].presence
    direction = params[:since_id].present? ? 'after' : 'before'

    if cursor_id
      checkins = checkins.where("checkins.id #{direction == 'after' ? '>' : '<'} ?", cursor_id.to_i)
    end

    next_path = api_checkins_url({since_id: checkins.first.id, limit: limit}) unless checkins.blank?
    prev_path = api_checkins_url({until_id: checkins.last.id, limit: limit})  unless checkins.blank?
    set_pagination_headers(next_path, prev_path)

    render json: checkins.map{|checkin| Resources::Checkin.new(checkin)}
  end

  def add
    checkin = Checkin.new({place_id: checkin_params[:place_id], user_id: current_app_user.id})
    checkin.checkins_alcohols.build(checkin_params[:alcohols].map{|alcohol_id| {alcohol_id: alcohol_id} })
    checkin.save!

    head :created
  end

  private
    def checkin_params
      params.require(:checkin).permit(:place_id, alcohols: [])
    end

    def set_pagination_headers(next_path = nil, prev_path = nil)
      links = []
      links << [next_path, [%w(rel next)]] if next_path
      links << [prev_path, [%w(rel prev)]] if prev_path
      response.headers['Link'] = LinkHeader.new(links)
    end
end
