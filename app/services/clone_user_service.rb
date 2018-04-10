class CloneUserService
  def perform
    load_new_users.each do |user|
        build_user(user).save
    end
  end

  private

  def build_user user
    User.new name: user["display_name"], unipos_name: user["uname"],
      avatar: user["picture_url"], unipos_id: user["id"]
  end

  def load_new_users
    unipos_user_ids = Unipos.all.pluck :id
    LoadUserService.new.perform.select do |user|
      unipos_user_ids.exclude? user["id"]
    end
  end
end
