class Admin::UsersController < AdminController
  before_action :load_user, only: %i(show destroy)

  BASE_NAME_REGEX = /([a-z ]+[a-z]{2,})/i

  def index
    @users = User.all.page(params[:page]).per Settings.paginate.per_page
  end

  def show
    render json: @user
  end

  def destroy
    @user.destroy
  end

  def clone_users_from_unipos
    CloneUserService.new.perform
  end

  def update_users_infomation
    User.no_email.each do |user|
      UpdateUserInformationService.new(user).perform
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end
end
