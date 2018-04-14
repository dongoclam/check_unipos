class Admin::SettingsController < AdminController
  before_action :load_setting, onloy: %i(edit update destroy)

  def index
    @settings = Setting.all.page(params[:page]).per Settings.paginate.per_page
  end

  def create
    setting = Setting.new setting_params

    if setting.save
      render json: {status: "success", setting: setting, message: "Create successfully"}
    else
      render json: {status: "error", message: setting.errors.full_messages.first}
    end
  end

  def edit
    render json: {status: "error"} and return unless @setting
    render json: {setting: @setting, status: "success"}
  end

  def update
    if @setting.update_attributes setting_params
      render json: {status: "success", message: "Update setting successfully"}
    else
      render json: {status: "error", message: @setting.errors.full_messages.first}
    end
  end

  def destroy
    if @setting.destroy
      render json: {status: "success", message: "Delete setting successfully"}
    else
      render json: {status: "error", message: "Sorry! can't delete"}
    end
  end

  def load_setting
    @setting = Setting.find_by id: params[:id]
  end

  def setting_params
    params.require(:setting).permit :key, :value
  end
end
