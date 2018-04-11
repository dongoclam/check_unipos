class HomeController < ApplicationController
  def index; end

  def search
    @users = User.search_by_name params[:name]
    render json: @users
  end
end
