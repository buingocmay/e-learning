class Admin::AdminController < ActionController::Base
	protect_from_forgery with: :exception

  before_action :authenticate_admin!
  layout "admin/layouts/application"

  add_flash_types :success, :danger, :warning, :notice, :alert
end