class CloneChatworkUserService
  def perform
    load_new_users.each do |user|
      build_user(user).save
    end
  end

  private

  def build_user user
    ChatworkUser.create name: user.name, avatar: user.avatar_image_url,
      department: user.department, chatwork_id: user.account_id , chatwork_name: user.chatwork_id
  end

  def load_new_users
    ChatWork.access_token = Setting.chatwork_access_token
    account_ids = ChatworkUser.all.pluck :chatwork_id
    ChatWork::Member.get(room_id: Setting.chatwork_room_id).select do |member|
      account_ids.exclude? member.account_id
    end
  end
end
