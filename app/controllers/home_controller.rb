class HomeController < ApplicationController
  def index; end

  def search
    return if params[:name].blank?
    @users = User.search_by_name(params[:name]).limit Settings.search.limit

    if @users.present?
      render json: {content: render_to_string(partial: "user", collection: @users)}
    else
      render json: {content: render_to_string(partial: "message")}
    end
  end
end
