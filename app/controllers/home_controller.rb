class HomeController < ApplicationController
  def index; end

  def search
    return unless params[:name].present?
    @users = User.search_by_name(params[:name]).limit Settings.search.limit
    if @users.length == 1
      render js: "window.location = '/users/#{@users.first.id}'" and return
    else
      render json: @users
    end
  end
end
