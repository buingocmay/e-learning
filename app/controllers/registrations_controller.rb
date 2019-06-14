class RegistrationsController < Devise::RegistrationsController
	layout "login"

	before_action :configure_permitted_parameters, if: :devise_controller?
	add_flash_types :success, :danger, :warning, :notice, :alert

	def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :remember_me]
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :remember_me, :avatar, :avatar_cache]
  end
end