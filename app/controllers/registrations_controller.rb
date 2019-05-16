class RegistrationsController < Devise::RegistrationsController
	layout "login"

	before_action :configure_permitted_parameters, only: :create
	add_flash_types :success, :danger, :warning, :notice, :alert

	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end