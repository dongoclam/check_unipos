class Admin::DashboardsController < AdminController
  def index
    start_date = params[:start_date] || Date.today.beginning_of_month
    end_date = params[:end_date] || Date.today
    @dashboard = Supports::DashboardsSupport.new start_date, end_date
  end
end
