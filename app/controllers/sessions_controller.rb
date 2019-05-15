class SessionsController < Devise::SessionsController
	layout "login"
	add_flash_types :success, :danger, :warning, :notice, :alert
end