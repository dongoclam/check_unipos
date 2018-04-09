class Admin::ChatworkUsersController < AdminController
  before_action :load_new_users, only: :load_users_from_chatwork
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

  def load_users_from_chatwork
    @new_users.each do |user|
      user.save
    end
  end

  private

  def load_new_users
    account_ids = ChatworkUser.all.pluck :account_id

    @new_users = ChatWork::Member.get(room_id: ENV["CHATWORK_ROOM_ID"]).select do |member|
      account_ids.exclude? member.account_id
    end

    @new_users.map! do |user|
      build_user user
    end
  end

  def build_user user
    ChatworkUser.create name: user.name, avatar: user.avatar_image_url,
      department: user.department, account_id: user.account_id , chatwork_id: user.chatwork_id
  end

  def load_user
    @user = ChatworkUser.find_by id: params[:id]

  end
end
