class Admin::Clones::UsersController < AdminController
  def index
    CloneUserService.new.perform
  end
end
