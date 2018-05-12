class Admin::Clones::UniposesController < AdminController
  def index
    User.all.each do |user|
      CloneUniposService.new(user).perform
    end
  end
end
