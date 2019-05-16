class UnitsController < ApplicationController
	before_action :find_unit, only: %i(show)

  def show; end

  private

  def find_unit
  	@unit = Unit.find_by id: params[:id]

  	return if @unit
  	flash[:danger] = "Không tìm thấy mục này"
  end
end