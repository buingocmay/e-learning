class UnitsController < ApplicationController
	before_action :find_unit, only: %i(show)

  def show
  	@new_courses = Course.order_course.first(4)
  end

  private

  def find_unit
  	@unit = Unit.find_by id: params[:id]

  	return if @unit
  	flash[:danger] = "Không tìm thấy mục này"
  	redirect_back fallback_location: root_path
  end
end