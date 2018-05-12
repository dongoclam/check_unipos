class Admin::Updates::UsersController < AdminController
  def index
    User.no_email.each do |user|
      UpdateUserInformationService.new(user).perform
    end
  end
end
