class Admin::UniposesController < AdminController
  def index
    @uniposes = Unipos.all.includes(:sender, :receiver).page(params[:page]).per Settings.paginate.per_page
    @count = Unipos.count
  end

  def clone_uniposes
    User.all.each do |user|
      CloneUniposService.new(user).perform
    end
  end
end
