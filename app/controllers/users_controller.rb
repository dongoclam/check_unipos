class UsersController < ApplicationController
  before_action :load_user

  def show
    @user_presenter = UserPresenter.new @user
  end

  def load_user
    redirect_to root_path and return unless @user = User.find_by(id: params[:id])
    CloneUniposService.new(@user).perform
  end
end
