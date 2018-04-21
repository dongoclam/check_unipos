class Admin::DashboardsController < AdminController
  def index
    @dashboard = Supports::DashboardsSupport.new
  end
end
