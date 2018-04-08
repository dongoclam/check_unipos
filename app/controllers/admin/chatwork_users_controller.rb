class Admin::ChatworkUsersController < AdminController
  skip_before_action :verify_authenticity_token
  before_action :load_new_chatwork_users, only: :load_user_from_chatwork
  before_action :load_chatwork_user, only: %i(show destroy)

  def index
    @users = ChatworkUser.all.page(params[:page]).per Settings.paginate.per_page
  end

  def show
    load_chatwork_user
    render json: @user
  end

  def destroy
    load_chatwork_user
    @user.destroy
  end

  def load_users_from_chatwork
    load_new_chatwork_users
    @new_users.each do |user|
      user.save
    end
  end

  private

  def load_chatwork_user
    @user = ChatworkUser.find_by id: params[:id]
  end

  def build_chatwork_user user
    ChatworkUser.create name: user.name, avatar: user.avatar_image_url,
      department: user.department, account_id: user.account_id , chatwork_id: user.chatwork_id
  end

  def load_new_chatwork_users
    account_ids = ChatworkUser.all.pluck :account_id

    @new_users = ChatWork::Member.get(room_id: ENV["CHATWORK_ROOM_ID"]).select do |member|
      account_ids.exclude? member.account_id
    end

    @new_users.map! do |user|
      build_chatwork_user user
    end
  end
end
