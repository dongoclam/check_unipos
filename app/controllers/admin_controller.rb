class AdminController < ApplicationController
  before_action :authenticate_admin!
  layout "layouts/admin"
end
