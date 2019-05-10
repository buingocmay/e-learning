class Admin::AdminController < ActionController::Base
  before_action :authenticate_admin!
  layout "admin/layouts/application"
end