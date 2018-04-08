class Admin::ChatworkUsersController < AdminController
  before_action :load_new_chatwork_users

  def create
    @chatwork_users.each do |user| do
      ChatworkUser.create name: user.name, avatar: user.avatar_image_url,
        department: user.department, account_id: user.account_id , chatwork_id: user.chatwork_id
    end
  end

  private

  def load_new_chatwork_users
    account_ids = ChatworkUser.all.pluck :account_id
    @chatwork_users = ChatWork::Member.get(room_id: ENV["CHATWORK_ROOM_ID"]).select do |memeber|
      account_ids.exclude? memeber.account_id
    end
  end
end
