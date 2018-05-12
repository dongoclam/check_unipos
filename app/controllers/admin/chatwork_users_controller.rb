class Admin::ChatworkUsersController < AdminController
  before_action :load_user, only: %i(show destroy)

  def index
    @users = ChatworkUser.all.page(params[:page]).per Settings.paginate.per_page
  end

  def show
    render json: @user
  end

  def destroy
    @user.destroy
  end

  private

  def load_user
    @user = ChatworkUser.find_by id: params[:id]
  end
end
