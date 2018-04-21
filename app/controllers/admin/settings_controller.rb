class Admin::SettingsController < AdminController
  before_action :load_setting, onloy: %i(edit update destroy)

  def index
    @settings = Setting.all.page(params[:page]).per Settings.paginate.per_page
  end

  def new
    @setting = Setting.new
    render json: {content: render_to_string(partial: "form", locals: {setting: @setting})}
  end

  def create
    @setting = Setting.new setting_params

    if @setting.save
      render json: {
        status: "success",
        content: render_to_string(partial: "setting", locals: {setting: @setting})
      }
    else
      render json: {
        status: "error",
        message: render_to_string(partial: "shared/error_messages", locals: {object: @setting})
      }
    end
  end

  def edit
    render json: {
      status: "success",
      content: render_to_string(partial: "form", locals: {setting: @setting})
    }
  end

  def update
    if @setting.update_attributes setting_params
      render json: {
        status: "success",
        setting_id: @setting.id,
        content: render_to_string(partial: "setting", locals: {setting: @setting})
      }
    else
      render json: {
        status: "error",
        message: render_to_string(partial: "shared/error_messages", locals: {object: @setting})
      }
    end
  end

  def destroy
    if @setting.destroy
      render json: {status: "success"}
    else
      render json: {status: "error"}
    end
  end

  def load_setting
    @setting = Setting.find_by id: params[:id]
  end

  def setting_params
    params.require(:setting).permit :key, :value
  end
end
