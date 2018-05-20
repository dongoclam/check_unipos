class Admin::UniposesController < AdminController
  def index
    @uniposes = Unipos.includes(:sender, :receiver).page(params[:page]).per Settings.paginate.per_page
    @count = Unipos.count
  end
end
