class Admin::Clones::ChatworkUsersController < AdminController
  def index
    CloneChatworkUserService.new.perform
  end
end
