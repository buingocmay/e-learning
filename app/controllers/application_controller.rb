class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :get_categories
	add_flash_types :success, :danger, :warning, :notice, :alert

	def get_categories
    @categories = Category.all
    @q = Course.ransack(params[:q])
    @courses = @q.result
  end
end
