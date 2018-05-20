class Admin::UsersController < AdminController
  before_action :load_user, only: %i(show destroy)

  def index
    @users = User.page(params[:page]).per Settings.paginate.per_page
    @count = User.count
  end

  def show
    render json: {content: render_to_string(partial: "user", locals: {user: @user})}
  end

  def destroy
    @user.destroy
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end
end
