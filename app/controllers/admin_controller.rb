class AdminController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout "layouts/admin"
  before_action :authenticate_admin!

end
