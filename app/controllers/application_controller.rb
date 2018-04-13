class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_admin_email!, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |admin_params|
      admin_params.permit :name, :email, :password, :password_confirmation
    end
  end

  def verify_admin_email!
    if params[:admin]
      redirect_to root_path unless params[:admin][:email] == ENV["ADMIN_EMAIL"]
    end
  end
end
